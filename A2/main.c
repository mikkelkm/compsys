#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>

#include "support.h"
#include "wires.h"
#include "arithmetic.h"
#include "memory.h"
#include "registers.h"
#include "ip_reg.h"
#include "compute.h"

// major opcodes
#define RETURN         0x0
#define REG_ARITHMETIC 0x1

#define REG_MOVQ       0x2
#define REG_MOVQ_MEM   0x3

#define CFLOW_CALL_JMP 0x4
#define IMM_ARITHMETIC 0x5

#define IMM_MOVQ       0x6
#define IMM_MOVQ_MEM   0x7

// LEAQ..nr refer to length of instruction
#define LEAQ2          0x8
#define LEAQ3          0x9
#define LEAQ6          0xA
#define LEAQ7          0xB
#define IMM_CBRANCH    0xF

// MOVQ minor opcodes
#define MIN_MOVQ_MEM_OR_REG_REG 0x1
#define MIN_MOVQ_IMM_REG        0x4
#define MIN_MOVQ_IMM_MEM_REG    0x5
#define MIN_MOVQ_REG_MEM        0x9
#define MIN_MOVQ_REG_IMM_MEM    0xD

// CALL and JUMP minor opcodes
#define MIN_CALL       0xE
#define MIN_JMP        0xF

// LEAQ minor opcodes
#define MIN_LEAQ_1     0x1
#define MIN_LEAQ_2     0x2
#define MIN_LEAQ_3     0x3
#define MIN_LEAQ_4     0x4
#define MIN_LEAQ_5     0x5
#define MIN_LEAQ_6     0x6
#define MIN_LEAQ_7     0x7

// EXTRA MACROS

// load write store operations
#define WRITE_TO_REG   (is_movq_reg_to_reg || is_movq_mem_to_reg || is_movq_imm_to_reg)
#define STORE_IN_MEM   (is(MIN_MOVQ_REG_MEM , minor_op) || is(MIN_MOVQ_REG_IMM_MEM, minor_op))
#define LOAD_FROM_MEM  ((LEAQ && !(is(MIN_LEAQ_4, minor_op))) || (is(IMM_MOVQ_MEM, major_op) && is(MIN_MOVQ_IMM_MEM_REG, minor_op)) || (is(IMM_MOVQ_MEM, major_op) && is(MIN_MOVQ_IMM_MEM_REG, minor_op)))

// immediate range
#define IMM_IN_2_5     (is(0x5, major_op) || is(0x6, major_op) || is(0x7, major_op) || is(0xA, major_op) || is(0xF, major_op))
#define IMM_IN_3_6     is(LEAQ7, major_op)

// target address range
#define TARGET_IN_2_5  is(CFLOW_CALL_JMP, major_op)
#define TARGET_IN_3_6  is(COND, major_op)

#define Z_VAL          (is(0x9, major_op) || is(0xB, major_op))
#define LEAQ_DZ        (Z_VAL || is(0x8, major_op) || is(0xA, major_op))
#define LEAQ           (is(0x8, major_op) || is(0x9, major_op) || is(0xA, major_op) || is(0xB, major_op))
#define LEAQ_S         (LEAQ && (is(MIN_LEAQ_1, minor_op) || is( MIN_LEAQ_3, minor_op) || is( MIN_LEAQ_5, minor_op) || is( MIN_LEAQ_7, minor_op)))

#define LEGAL_SHIFT    (is(0x0, shift_amount1) || is(0x1, shift_amount1) || is(0x2, shift_amount1) || is(0x3, shift_amount1))
#define COND           (is(0xF, major_op) || (is(CFLOW_CALL_JMP, major_op) && !(is(MIN_JMP,minor_op) || is(MIN_CALL, minor_op))))

int main(int argc, char* argv[]) {
    // Check command line parameters.
    if (argc < 2)
        error("missing name of programfile to simulate");

    if (argc < 3)
        error("Missing starting address (in hex notation)");

    /*** SETUP ***/
    // We set up global state through variables that are preserved between
    // cycles.

    // Program counter / Instruction Pointer
    ip_reg_p ip = ip_reg_create();

    // Register file:
    reg_p regs = regs_create();

    // Memory:
    // Shared memory for both instructions and data.
    mem_p mem = memory_create();
    memory_read_from_file(mem, argv[1]);

    int start;
    int scan_res = sscanf(argv[2],"%x", &start);
    if (scan_res != 1)
        error("Unable to interpret starting address");

    if (argc == 4) { // tracefile specified
        memory_tracefile(mem, argv[3]);
        regs_tracefile(regs, argv[3]);
        ip_reg_tracefile(ip, argv[3]);
    }
    ip_write(ip, from_int(start), true);

    // a stop signal for stopping the simulation.
    bool stop = false;

    while (!stop) { // for each cycle:
        val pc = ip_read(ip);

        // NO CHANGES BEFORE THIS LINE

        /*** FETCH ***/

        // We're fetching 10 bytes in the form of 10 vals with one byte each
        val inst_bytes[10];
        memory_read_unaligned(mem, pc, inst_bytes, true);


        /*** DECODE ***/
        // read 4 bit values
        val major_op = pick_bits(4,  4, inst_bytes[0]);
        val minor_op = pick_bits(0,  4, inst_bytes[0]);

        val reg_d = pick_bits(4, 4, inst_bytes[1]);
        val reg_s = pick_bits(0, 4, inst_bytes[1]);
        val reg_z = pick_bits(4, 4, inst_bytes[2]);
        val condition = use_if(COND, minor_op);
        val shift_amount1 = pick_bits(0, 4, inst_bytes[2]);
        // test if shift amount is legal (1-4)
        val shift_amount = use_if(LEGAL_SHIFT, shift_amount1);

        // read immediate bits
        val immByte2 = pick_bits(0, 8, inst_bytes[2]);
        val immByte3 = pick_bits(0, 8, inst_bytes[3]);
        val immByte4 = pick_bits(0, 8, inst_bytes[4]);
        val immByte5 = pick_bits(0, 8, inst_bytes[5]);
        val immByte6 = pick_bits(0, 8, inst_bytes[6]);

        val imm2_5 = or(
                        or(put_bits(24, 8, immByte5),
                           put_bits(16, 8, immByte4)),
                        or(put_bits(8, 8, immByte3),
                           put_bits(0, 8, immByte2)));

        val imm3_6 = or(
                        or(put_bits(24, 8, immByte6),
                           put_bits(16, 8, immByte5)),
                        or(put_bits(8, 8, immByte4),
                           put_bits(0, 8, immByte3)));

        // read bit target adress (PP..32..PP in encoding.txt)
        val target2_5 = or(
                        or(put_bits(24, 8, immByte5),
                           put_bits(16, 8, immByte4)),
                        or(put_bits(8, 8, immByte3),
                           put_bits(0, 8, immByte2)));

        val target3_6 = or(
                        or(put_bits(24, 8, immByte6),
                           put_bits(16, 8, immByte5)),
                        or(put_bits(8, 8, immByte4),
                           put_bits(0, 8, immByte3)));

        // TODO
        // #hvor skal target address bruges?
        val target_adress = or(use_if(TARGET_IN_2_5, target2_5),
                               (use_if(TARGET_IN_3_6, target3_6)));

        // decode instruction type

        // read major operation code
        bool is_return = is(RETURN, major_op);
        bool is_arithmetic = is(IMM_ARITHMETIC, major_op) || is(REG_ARITHMETIC, major_op);

        bool is_cflow_call_jump = is(CFLOW_CALL_JMP, major_op);
        bool is_imm_cbranch = is(IMM_CBRANCH, major_op);

        bool is_movq = is(REG_MOVQ, major_op);
        bool is_movq_mem = is(REG_MOVQ_MEM, major_op);

        bool is_movq_reg_to_reg = is(MIN_MOVQ_MEM_OR_REG_REG, minor_op) && is_movq_mem;
        bool is_movq_mem_to_reg = is(MIN_MOVQ_MEM_OR_REG_REG, minor_op) && is_movq_mem;
        //bool is_movq_reg_to_mem = is(MIN_MOVQ_REG_MEM, minor_op) && is_movq_mem;

        bool is_imm_movq = is(IMM_MOVQ, major_op);
        bool is_movq_imm_to_reg = is(MIN_MOVQ_IMM_REG, minor_op) && is_imm_movq;
        bool is_imm_movq_mem = is(IMM_MOVQ_MEM, major_op);
        //bool is_imm_movq_mem_reg = is(MIN_MOVQ_IMM_MEM_REG, minor_op) &&  is_imm_movq_mem;
        //bool is_imm_reg_imm_mem = is(MIN_MOVQ_REG_IMM_MEM, minor_op) && is_imm_movq_mem;

        bool is_leaq2 = is(LEAQ2, major_op);
        bool is_leaq3 = is(LEAQ3, major_op);
        //bool is_leaq3_2 = is(MIN_LEAQ_2, minor_op) && is_leaq3;
        //bool is_leaq3_3 = is(MIN_LEAQ_3, minor_op) && is_leaq3;

        bool is_leaq6 = is(LEAQ6, major_op);
        //bool is_leaq6_4 = is(MIN_LEAQ_4, minor_op) && is_leaq6;
        //bool is_leaq6_5 = is(MIN_LEAQ_5, minor_op) && is_leaq6;

        bool is_leaq7 = is(LEAQ7, major_op);
        //bool is_leaq7_6 = is(MIN_LEAQ_6, minor_op) && is_leaq7;
        //bool is_leaq7_7 = is(MIN_LEAQ_7, minor_op) && is_leaq7;

        // minor encoding "flags"

        //bool is_jmp = is(MIN_JMP, minor_op);
        //bool is_call = is(MIN_CALL, minor_op);

        // definite codes for arithmetic
        bool is_imm_arimetic= is(IMM_ARITHMETIC, major_op);
        bool is_add = (is_arithmetic && is(0x0, minor_op));
        // alu_op needs to be sub if we use a condition
        bool is_sub = ((is_arithmetic && is(0x1, minor_op)) || COND) ;
        bool is_and = (is_arithmetic && is(0x2, minor_op));
        bool is_or  = (is_arithmetic && is(0x3, minor_op));
        bool is_xor = (is_arithmetic && is(0x4, minor_op));
        bool is_mul = (is_arithmetic && is(0x5, minor_op));

        val alu_op = or(
                        or(
                           or(
                               use_if(is_add, from_int(0x0)),
                               use_if(is_sub, from_int(0x1))),
                            or(
                               use_if(is_and, from_int(0x2)),
                               use_if(is_or, from_int(0x3)))),
                        or(
                           use_if(is_xor, from_int(0x4)),
                           use_if(is_mul, from_int(0x5))));

        // determine instruction size
        val ins_size = or(use_if(( is_return || is_arithmetic || is_leaq2 || is_movq || is_movq_mem), from_int(2)),
                          or(use_if(( is_cflow_call_jump || is_imm_arimetic || is_imm_movq || is_imm_movq_mem || is_leaq6),  from_int(6)),
                             or(use_if(( is_leaq3), from_int(3)), // LEAQ3
                                or(use_if(( is_leaq7), from_int(7)),  //LEAQ7
                                   (use_if(( is_imm_cbranch), from_int(10)) )))));

        // immediate without sign extension
        val imm = or(
                       use_if(IMM_IN_2_5,
                              imm2_5),
                       use_if(IMM_IN_3_6,
                              imm3_6));

        // extend sign bit in immediate
        // #USIKKERT OM VI SKAL DETTE!? se https://absalon.instructure.com/courses/28624/discussion_topics/145619
        // val imm = sign_extend(31, immUS);

        // control signals for memory access - you will want to change these
        bool is_load  = LOAD_FROM_MEM;   // 8 forskellige load cases
        bool is_store = STORE_IN_MEM;    // 2 forskellige store cases

        // setting up register read and write - you will want to change these
        val reg_read_dz = or(
                             use_if(Z_VAL, reg_z),
                             use_if(!Z_VAL, reg_d));

        // - other read port is always reg_s
        // - write is always to reg_d
        bool reg_wr_enable = WRITE_TO_REG;

        /*** EXECUTE ***/
        // read registers
        val reg_out_a = reg_read(regs, reg_read_dz);
        val reg_out_b = reg_read(regs, reg_s);

        // perform calculations - Return needs no calculation. you will want to change this.
        // Here you should hook up a call to compute_execute with all the proper parameters

        val compute_result = compute_execute(reg_out_a,         // val op_z_or_d
                                             reg_out_b,         // val op_s
                                             imm,               // val imm
                                             LEAQ_DZ,           // bool sel_z_or_d
                                             LEAQ_S,            // bool sel_s
                                             (IMM_IN_2_5 || IMM_IN_3_6), // bool sel_imm
                                             shift_amount,      // val shift_amount
                                             LEAQ,              // bool use_agen, dvs. leaq eller ej
                                             alu_op,            // val alu_op
                                             condition).result; // val condition)

        // succeeding instruction in memory
        val pc_inc  = add(pc, ins_size);

        // determine the next position of the program counter - you'll want to change this
        // to handle more instructions. Here we only distinguish between return and all other instructions
        // TODO
        // #skal vi bruge TARGET ADDRESS her?
        val pc_next = or(use_if(is_return, reg_out_b),
                         use_if(!is_return, pc_inc));


        /*** MEMORY ***/
        // read from memory if needed
        // (Not used for simulating return, so "mem_out" will be unused initially)
        // #Er det ikke forkert at denne er sat mad compute_result!?
        val mem_out = memory_read(mem, compute_result, is_load);


        /*** WRITE ***/
        // TODO
        // choose result to write back to register
        val datapath_result = or(
                                 or(use_if(is_movq_reg_to_reg, reg_out_b),
                                    use_if(is_movq_mem_to_reg, mem_out)),
                                 use_if(is(MIN_CALL, minor_op), reg_out_b)); // skal være call !?



        // NO CHANGES NEEDED AFTER THIS LINE

        // write to register if needed
        reg_write(regs, reg_d, datapath_result, reg_wr_enable);

        // write to memory if needed
        memory_write(mem, compute_result, reg_out_a, is_store);

        // update program counter
        ip_write(ip, pc_next, true);

        // terminate when setting pc to 0
        if (pc_next.val == 0) stop = true;
    }
    memory_destroy(mem);
    regs_destroy(regs);

    printf("Done\n");
}
