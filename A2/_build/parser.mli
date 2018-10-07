
(* The type of tokens. *)

type token = 
  | TYPE
  | RPAR
  | REG of (string)
  | QUAD
  | PUPO of (Ast.opcode)
  | OBJECT
  | NUM of (string)
  | MOVE of (Ast.opcode)
  | LPAR
  | LINE
  | IGN of (string)
  | ID of (string)
  | FUN_START
  | FUNCTION
  | EOF
  | DOLLAR
  | DIR of (string)
  | CTL3 of (Ast.opcode)
  | CTL2 of (Ast.opcode)
  | CTL1 of (Ast.opcode)
  | CTL0 of (Ast.opcode)
  | COMMA
  | COMM
  | COLON
  | ALU2 of (Ast.opcode)
  | ALIGN

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val aline: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.line)
