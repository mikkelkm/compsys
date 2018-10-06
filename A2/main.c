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
// der indgår et register og memeory
#define RETURN         0x0
#define REG_ARITHMETIC 0x1

#define REG_MOVQ       0x2
#define REG_MOVQ_MEM   0x3

#define CFLOW          0x4
#define IMM_ARITHMETIC 0x5

#define IMM_MOVQ       0x6
#define IMM_MOVQ_MEM   0x7

#define LEAQ2          0x8
#define LEAQ3          0x9
#define LEAQ6          0xA
#define LEAQ7          0xB
#define IMM_CBRANCH    0xF

// minor opcodes
#define MIN_REG_REG    0x1
#define MIN_REG_IMM    0x2
#define MIN_REG_MEM    0x9

#define MIN_MEM_REG    0x1
#define MIN_MEM_IMM    0x5

#define MIN_IMM_REG    0x6
#define MIN_IMM_IMM    0x7
#define MIM_IMM_MEM    0x8
#define MIN_IMM_MEM_REG 0x5
#define MIN_REG_IMM_MEM 0xD



/*
#define LEAQ3          0x9
#define LEAQ6          0xA
#define LEAQ7          0xB
#define IMM_CBRANCH    0xF
*/
#define JMP 0xF
#define CALL 0xE

// write to reg or to mem
#define WRITE_TO_REG   (is_movq_reg_to_reg || is_movq_mem_to_reg || is_movq_imm_to_reg)
#define STORE_IN_MEM   (is_movq_reg_to_mem || is_movq_imm_to_mem)

// use immediate
#define IMMEDIATE_USE  (is_movq_imm_to_reg || is_movq_imm_to_mem)

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

        //printf("%lx\n", pc.val);  // <---- You may want to silence this










        /*** FETCH ***/

        // We're fetching 10 bytes in the form of 10 vals with one byte each
        val inst_bytes[10];
        memory_read_unaligned(mem, pc, inst_bytes, true);



        /*** DECODE ***/
        // read 4 bit values
        val major_op = pick_bits(4,  4, inst_bytes[0]);
        val minor_op = pick_bits(0,  4, inst_bytes[0]); // not actually used yet

        val reg_d = pick_bits(4, 4, inst_bytes[1]);
        val reg_s = pick_bits(0, 4, inst_bytes[1]);

        // decode instruction type
        // read major operation code
        bool is_return = is(RETURN, major_op);
        bool is_arithmetic = is(IMM_ARITHMETIC, major_op) || is(REG_ARITHMETIC, major_op);

        // TO USE FOR WHAT?
        bool is_movq_from_reg = is(REG_MOVQ, major_op);
        bool is_movq_from_mem = is(REG_MOVQ_MEM, major_op);

        // Minor encoding "flags"
        bool is_movq_reg_to_reg = is(MIN_REG_REG, minor_op);
        bool is_movq_reg_to_mem = is(MIN_REG_MEM, minor_op);
        bool is_movq_mem_to_reg = is(MIN_MEM_REG, minor_op);
        bool is_movq_imm_to_reg = is(MIN_IMM_REG, minor_op);
        bool is_movq_imm_to_mem = is(MIN_REG_MEM, minor_op);
        bool is_movq_reg_to_imm_mem = is(MIN_REG_IMM_MEM, minor_op);
        bool is_movq_imm_mem_to_reg = is(MIN_IMM_MEM_REG, minor_op);

        // determine instruction size - we only understand return, so fix it at 2
        val ins_size = or(use_if(( is_return || is_arithmetic || is_movq_mem_to_reg || is_movq_reg_to_reg || is_movq_reg_to_mem), from_int(2)),
                         or(use_if(( is_cflow || is_call || is_movq_imm_to_reg || is_movq_reg_to_imm_mem || is_movq_imm_mem_to_reg),  from_int(6)),
                          or(use_if(( ), from_int(3)), // LEAQ3
                           or(use_if(( ), from_int(7)),  //LEAQ7
                            or(use_if((), from_int(10)) )))));

        // control signals for memory access - you will want to change these
        bool is_load = is_movq_mem_to_reg;
        bool is_store= STORE_IN_MEM;

        // setting up register read and write - you will want to change these
        val reg_read_dz = reg_d;
        reg_read_dz = use_if(is_movq_reg_to_reg ,reg_d); // for return we just need reg_d

        // - other read port is always reg_s
        // - write is always to reg_d
        bool reg_wr_enable = false;



        /*** EXECUTE ***/
        // read registers
        val reg_out_a = reg_read(regs, reg_read_dz);
        val reg_out_b = reg_read(regs, reg_s);

        // perform calculations - Return needs no calculation. you will want to change this.
        // Here you should hook up a call to compute_execute with all the proper

       

        // determine the next position of the program counter - you'll want to change this
        // to handle more instructions. Here we only distinguish between return and all other insns
        val pc_next = or(use_if(is_return, reg_out_b),
                         use_if(!is_return, pc_inc));




        /*** MEMORY ***/
        // read from memory if needed
        // (Not used for simulating return, so "mem_out" will be unused initially)
        val mem_out = memory_read(mem, compute_result, is_load);





        /*** WRITE ***/
        // choose result to write back to register
        //val datapath_result = from_int(0); // no result for return - you will want to change this
        val datapath_result = or(
                                 or(use_if(is_movq_reg_to_reg, reg_out_b),
                                    use_if(is_movq_mem_to_reg, mem_out)),
                                 use_if(is_movq_imm_to_reg, reg_out_b)); // skal være call



        reg_wr_enable = WRITE_TO_REG;









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
