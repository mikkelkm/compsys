
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | TYPE
    | RPAR
    | REG of (
# 25 "parser.mly"
       (string)
# 13 "parser.ml"
  )
    | QUAD
    | PUPO of (
# 8 "parser.mly"
       (Ast.opcode)
# 19 "parser.ml"
  )
    | OBJECT
    | NUM of (
# 26 "parser.mly"
       (string)
# 25 "parser.ml"
  )
    | MOVE of (
# 7 "parser.mly"
       (Ast.opcode)
# 30 "parser.ml"
  )
    | LPAR
    | LINE
    | IGN of (
# 23 "parser.mly"
       (string)
# 37 "parser.ml"
  )
    | ID of (
# 24 "parser.mly"
       (string)
# 42 "parser.ml"
  )
    | FUN_START
    | FUNCTION
    | EOF
    | DOLLAR
    | DIR of (
# 22 "parser.mly"
       (string)
# 51 "parser.ml"
  )
    | CTL3 of (
# 12 "parser.mly"
       (Ast.opcode)
# 56 "parser.ml"
  )
    | CTL2 of (
# 11 "parser.mly"
       (Ast.opcode)
# 61 "parser.ml"
  )
    | CTL1 of (
# 10 "parser.mly"
       (Ast.opcode)
# 66 "parser.ml"
  )
    | CTL0 of (
# 9 "parser.mly"
       (Ast.opcode)
# 71 "parser.ml"
  )
    | COMMA
    | COMM
    | COLON
    | ALU2 of (
# 6 "parser.mly"
       (Ast.opcode)
# 79 "parser.ml"
  )
    | ALIGN
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState151
  | MenhirState149
  | MenhirState114
  | MenhirState61
  | MenhirState8

# 1 "parser.mly"
  

# 107 "parser.ml"

let rec _menhir_reduce40 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 25 "parser.mly"
       (string)
# 112 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s (s : (
# 25 "parser.mly"
       (string)
# 117 "parser.ml"
  )) ->
    let _v : (Ast.op_spec) = 
# 75 "parser.mly"
            ( Ast.Reg(s) )
# 122 "parser.ml"
     in
    _menhir_goto_arg _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce27 : _menhir_env -> (('ttv_tail * _menhir_state * (
# 26 "parser.mly"
       (string)
# 129 "parser.ml"
))) * (
# 25 "parser.mly"
       (string)
# 133 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let ((_menhir_stack, _menhir_s, (s : (
# 26 "parser.mly"
       (string)
# 139 "parser.ml"
    ))), (s1 : (
# 25 "parser.mly"
       (string)
# 143 "parser.ml"
    ))) = _menhir_stack in
    let _4 = () in
    let _2 = () in
    let _v : (Ast.op_spec) = 
# 62 "parser.mly"
                              ( if s1 = "%rip" then Ast.EaD(s) else Ast.EaDS(s, s1) )
# 150 "parser.ml"
     in
    _menhir_goto_arg _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce30 : _menhir_env -> (((('ttv_tail * _menhir_state * (
# 26 "parser.mly"
       (string)
# 157 "parser.ml"
))) * (
# 25 "parser.mly"
       (string)
# 161 "parser.ml"
))) * (
# 25 "parser.mly"
       (string)
# 165 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (((_menhir_stack, _menhir_s, (s : (
# 26 "parser.mly"
       (string)
# 171 "parser.ml"
    ))), (s1 : (
# 25 "parser.mly"
       (string)
# 175 "parser.ml"
    ))), (s2 : (
# 25 "parser.mly"
       (string)
# 179 "parser.ml"
    ))) = _menhir_stack in
    let _6 = () in
    let _4 = () in
    let _2 = () in
    let _v : (Ast.op_spec) = 
# 65 "parser.mly"
                                             ( Ast.EaDZS(s,s1,s2,"1") )
# 187 "parser.ml"
     in
    _menhir_goto_arg _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce31 : _menhir_env -> (((((('ttv_tail * _menhir_state * (
# 26 "parser.mly"
       (string)
# 194 "parser.ml"
))) * (
# 25 "parser.mly"
       (string)
# 198 "parser.ml"
))) * (
# 25 "parser.mly"
       (string)
# 202 "parser.ml"
))) * (
# 26 "parser.mly"
       (string)
# 206 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let ((((_menhir_stack, _menhir_s, (s : (
# 26 "parser.mly"
       (string)
# 212 "parser.ml"
    ))), (s1 : (
# 25 "parser.mly"
       (string)
# 216 "parser.ml"
    ))), (s2 : (
# 25 "parser.mly"
       (string)
# 220 "parser.ml"
    ))), (i : (
# 26 "parser.mly"
       (string)
# 224 "parser.ml"
    ))) = _menhir_stack in
    let _8 = () in
    let _6 = () in
    let _4 = () in
    let _2 = () in
    let _v : (Ast.op_spec) = 
# 66 "parser.mly"
                                                           ( Ast.EaDZS(s,s1,s2,i) )
# 233 "parser.ml"
     in
    _menhir_goto_arg _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce34 : _menhir_env -> ((('ttv_tail * _menhir_state * (
# 26 "parser.mly"
       (string)
# 240 "parser.ml"
)))) * (
# 25 "parser.mly"
       (string)
# 244 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let ((_menhir_stack, _menhir_s, (s : (
# 26 "parser.mly"
       (string)
# 250 "parser.ml"
    ))), (s2 : (
# 25 "parser.mly"
       (string)
# 254 "parser.ml"
    ))) = _menhir_stack in
    let _5 = () in
    let _3 = () in
    let _2 = () in
    let _v : (Ast.op_spec) = 
# 69 "parser.mly"
                                    ( Ast.EaDZ(s,s2,"1") )
# 262 "parser.ml"
     in
    _menhir_goto_arg _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce35 : _menhir_env -> ((((('ttv_tail * _menhir_state * (
# 26 "parser.mly"
       (string)
# 269 "parser.ml"
)))) * (
# 25 "parser.mly"
       (string)
# 273 "parser.ml"
))) * (
# 26 "parser.mly"
       (string)
# 277 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (((_menhir_stack, _menhir_s, (s : (
# 26 "parser.mly"
       (string)
# 283 "parser.ml"
    ))), (s2 : (
# 25 "parser.mly"
       (string)
# 287 "parser.ml"
    ))), (i : (
# 26 "parser.mly"
       (string)
# 291 "parser.ml"
    ))) = _menhir_stack in
    let _7 = () in
    let _5 = () in
    let _3 = () in
    let _2 = () in
    let _v : (Ast.op_spec) = 
# 70 "parser.mly"
                                                  ( Ast.EaDZ(s,s2,i) )
# 300 "parser.ml"
     in
    _menhir_goto_arg _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce21 : _menhir_env -> ('ttv_tail * _menhir_state) * (
# 25 "parser.mly"
       (string)
# 307 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let ((_menhir_stack, _menhir_s), (s1 : (
# 25 "parser.mly"
       (string)
# 313 "parser.ml"
    ))) = _menhir_stack in
    let _3 = () in
    let _1 = () in
    let _v : (Ast.op_spec) = 
# 56 "parser.mly"
                      ( Ast.EaS(s1) )
# 320 "parser.ml"
     in
    _menhir_goto_arg _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce22 : _menhir_env -> ((('ttv_tail * _menhir_state) * (
# 25 "parser.mly"
       (string)
# 327 "parser.ml"
))) * (
# 25 "parser.mly"
       (string)
# 331 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (((_menhir_stack, _menhir_s), (s1 : (
# 25 "parser.mly"
       (string)
# 337 "parser.ml"
    ))), (s2 : (
# 25 "parser.mly"
       (string)
# 341 "parser.ml"
    ))) = _menhir_stack in
    let _5 = () in
    let _3 = () in
    let _1 = () in
    let _v : (Ast.op_spec) = 
# 57 "parser.mly"
                                     ( Ast.EaZS(s1,s2,"1") )
# 349 "parser.ml"
     in
    _menhir_goto_arg _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce24 : _menhir_env -> ((((('ttv_tail * _menhir_state) * (
# 25 "parser.mly"
       (string)
# 356 "parser.ml"
))) * (
# 25 "parser.mly"
       (string)
# 360 "parser.ml"
))) * (
# 26 "parser.mly"
       (string)
# 364 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let ((((_menhir_stack, _menhir_s), (s1 : (
# 25 "parser.mly"
       (string)
# 370 "parser.ml"
    ))), (s2 : (
# 25 "parser.mly"
       (string)
# 374 "parser.ml"
    ))), (i : (
# 26 "parser.mly"
       (string)
# 378 "parser.ml"
    ))) = _menhir_stack in
    let _7 = () in
    let _5 = () in
    let _3 = () in
    let _1 = () in
    let _v : (Ast.op_spec) = 
# 59 "parser.mly"
                                                   ( Ast.EaZS(s1,s2,i) )
# 387 "parser.ml"
     in
    _menhir_goto_arg _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce23 : _menhir_env -> (('ttv_tail * _menhir_state)) * (
# 25 "parser.mly"
       (string)
# 394 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let ((_menhir_stack, _menhir_s), (s2 : (
# 25 "parser.mly"
       (string)
# 400 "parser.ml"
    ))) = _menhir_stack in
    let _4 = () in
    let _2 = () in
    let _1 = () in
    let _v : (Ast.op_spec) = 
# 58 "parser.mly"
                            ( Ast.EaZ(s2,"1") )
# 408 "parser.ml"
     in
    _menhir_goto_arg _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce25 : _menhir_env -> (((('ttv_tail * _menhir_state)) * (
# 25 "parser.mly"
       (string)
# 415 "parser.ml"
))) * (
# 26 "parser.mly"
       (string)
# 419 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (((_menhir_stack, _menhir_s), (s2 : (
# 25 "parser.mly"
       (string)
# 425 "parser.ml"
    ))), (i : (
# 26 "parser.mly"
       (string)
# 429 "parser.ml"
    ))) = _menhir_stack in
    let _6 = () in
    let _4 = () in
    let _2 = () in
    let _1 = () in
    let _v : (Ast.op_spec) = 
# 60 "parser.mly"
                                          ( Ast.EaZ(s2,i) )
# 438 "parser.ml"
     in
    _menhir_goto_arg _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_arg : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.op_spec) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState8 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, (i : (
# 8 "parser.mly"
       (Ast.opcode)
# 452 "parser.ml"
        ))), _, (v1 : (Ast.op_spec))) = _menhir_stack in
        let _v : (
# 30 "parser.mly"
       (Ast.line)
# 457 "parser.ml"
        ) = 
# 36 "parser.mly"
                                     ( Ast.PuPo(i, v1) )
# 461 "parser.ml"
         in
        _menhir_goto_aline _menhir_env _menhir_stack _v
    | MenhirState61 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | DOLLAR ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState114
            | ID _v ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _v
            | LPAR ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState114
            | NUM _v ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _v
            | REG _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState114)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState114 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, (i : (
# 7 "parser.mly"
       (Ast.opcode)
# 500 "parser.ml"
        ))), _, (v1 : (Ast.op_spec))), _, (v2 : (Ast.op_spec))) = _menhir_stack in
        let _3 = () in
        let _v : (
# 30 "parser.mly"
       (Ast.line)
# 506 "parser.ml"
        ) = 
# 35 "parser.mly"
                                     ( Ast.Move2(i, v1, v2) )
# 510 "parser.ml"
         in
        _menhir_goto_aline _menhir_env _menhir_stack _v
    | MenhirState149 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | DOLLAR ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | ID _v ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState151 _v
            | LPAR ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | NUM _v ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState151 _v
            | REG _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState151 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState151)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState151 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, (i : (
# 6 "parser.mly"
       (Ast.opcode)
# 549 "parser.ml"
        ))), _, (v1 : (Ast.op_spec))), _, (v2 : (Ast.op_spec))) = _menhir_stack in
        let _3 = () in
        let _v : (
# 30 "parser.mly"
       (Ast.line)
# 555 "parser.ml"
        ) = 
# 34 "parser.mly"
                                     ( Ast.Alu2(i, v1, v2) )
# 559 "parser.ml"
         in
        _menhir_goto_aline _menhir_env _menhir_stack _v

and _menhir_reduce26 : _menhir_env -> (('ttv_tail * _menhir_state * (
# 24 "parser.mly"
       (string)
# 566 "parser.ml"
))) * (
# 25 "parser.mly"
       (string)
# 570 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let ((_menhir_stack, _menhir_s, (s : (
# 24 "parser.mly"
       (string)
# 576 "parser.ml"
    ))), (s1 : (
# 25 "parser.mly"
       (string)
# 580 "parser.ml"
    ))) = _menhir_stack in
    let _4 = () in
    let _2 = () in
    let _v : (Ast.op_spec) = 
# 61 "parser.mly"
                             ( if s1 = "%rip" then Ast.EaD(s) else Ast.EaDS(s, s1) )
# 587 "parser.ml"
     in
    _menhir_goto_arg _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce28 : _menhir_env -> (((('ttv_tail * _menhir_state * (
# 24 "parser.mly"
       (string)
# 594 "parser.ml"
))) * (
# 25 "parser.mly"
       (string)
# 598 "parser.ml"
))) * (
# 25 "parser.mly"
       (string)
# 602 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (((_menhir_stack, _menhir_s, (s : (
# 24 "parser.mly"
       (string)
# 608 "parser.ml"
    ))), (s1 : (
# 25 "parser.mly"
       (string)
# 612 "parser.ml"
    ))), (s2 : (
# 25 "parser.mly"
       (string)
# 616 "parser.ml"
    ))) = _menhir_stack in
    let _6 = () in
    let _4 = () in
    let _2 = () in
    let _v : (Ast.op_spec) = 
# 63 "parser.mly"
                                            ( Ast.EaDZS(s,s1,s2,"1") )
# 624 "parser.ml"
     in
    _menhir_goto_arg _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce29 : _menhir_env -> (((((('ttv_tail * _menhir_state * (
# 24 "parser.mly"
       (string)
# 631 "parser.ml"
))) * (
# 25 "parser.mly"
       (string)
# 635 "parser.ml"
))) * (
# 25 "parser.mly"
       (string)
# 639 "parser.ml"
))) * (
# 26 "parser.mly"
       (string)
# 643 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let ((((_menhir_stack, _menhir_s, (s : (
# 24 "parser.mly"
       (string)
# 649 "parser.ml"
    ))), (s1 : (
# 25 "parser.mly"
       (string)
# 653 "parser.ml"
    ))), (s2 : (
# 25 "parser.mly"
       (string)
# 657 "parser.ml"
    ))), (i : (
# 26 "parser.mly"
       (string)
# 661 "parser.ml"
    ))) = _menhir_stack in
    let _8 = () in
    let _6 = () in
    let _4 = () in
    let _2 = () in
    let _v : (Ast.op_spec) = 
# 64 "parser.mly"
                                                          ( Ast.EaDZS(s,s1,s2,i) )
# 670 "parser.ml"
     in
    _menhir_goto_arg _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce32 : _menhir_env -> ((('ttv_tail * _menhir_state * (
# 24 "parser.mly"
       (string)
# 677 "parser.ml"
)))) * (
# 25 "parser.mly"
       (string)
# 681 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let ((_menhir_stack, _menhir_s, (s : (
# 24 "parser.mly"
       (string)
# 687 "parser.ml"
    ))), (s2 : (
# 25 "parser.mly"
       (string)
# 691 "parser.ml"
    ))) = _menhir_stack in
    let _5 = () in
    let _3 = () in
    let _2 = () in
    let _v : (Ast.op_spec) = 
# 67 "parser.mly"
                                   ( Ast.EaDZ(s,s2,"1") )
# 699 "parser.ml"
     in
    _menhir_goto_arg _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce33 : _menhir_env -> ((((('ttv_tail * _menhir_state * (
# 24 "parser.mly"
       (string)
# 706 "parser.ml"
)))) * (
# 25 "parser.mly"
       (string)
# 710 "parser.ml"
))) * (
# 26 "parser.mly"
       (string)
# 714 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (((_menhir_stack, _menhir_s, (s : (
# 24 "parser.mly"
       (string)
# 720 "parser.ml"
    ))), (s2 : (
# 25 "parser.mly"
       (string)
# 724 "parser.ml"
    ))), (i : (
# 26 "parser.mly"
       (string)
# 728 "parser.ml"
    ))) = _menhir_stack in
    let _7 = () in
    let _5 = () in
    let _3 = () in
    let _2 = () in
    let _v : (Ast.op_spec) = 
# 68 "parser.mly"
                                                 ( Ast.EaDZ(s,s2,i) )
# 737 "parser.ml"
     in
    _menhir_goto_arg _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce37 : _menhir_env -> 'ttv_tail * _menhir_state -> (
# 26 "parser.mly"
       (string)
# 744 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack (i : (
# 26 "parser.mly"
       (string)
# 749 "parser.ml"
  )) ->
    let (_menhir_stack, _menhir_s) = _menhir_stack in
    let _1 = () in
    let _v : (Ast.op_spec) = 
# 72 "parser.mly"
                   ( Ast.Imm(i) )
# 756 "parser.ml"
     in
    _menhir_goto_arg _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce36 : _menhir_env -> 'ttv_tail * _menhir_state -> (
# 24 "parser.mly"
       (string)
# 763 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack (s : (
# 24 "parser.mly"
       (string)
# 768 "parser.ml"
  )) ->
    let (_menhir_stack, _menhir_s) = _menhir_stack in
    let _1 = () in
    let _v : (Ast.op_spec) = 
# 71 "parser.mly"
                   ( Ast.Imm(s) )
# 775 "parser.ml"
     in
    _menhir_goto_arg _menhir_env _menhir_stack _menhir_s _v

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 25 "parser.mly"
       (string)
# 782 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    _menhir_reduce40 _menhir_env (Obj.magic _menhir_stack) _menhir_s _v

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 26 "parser.mly"
       (string)
# 790 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAR ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | REG _v ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | COMMA ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    (match _tok with
                    | NUM _v ->
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let _menhir_stack = (_menhir_stack, _v) in
                        let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        (match _tok with
                        | RPAR ->
                            let _menhir_stack = Obj.magic _menhir_stack in
                            _menhir_reduce35 _menhir_env (Obj.magic _menhir_stack)
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            let _menhir_stack = Obj.magic _menhir_stack in
                            let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                | RPAR ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    _menhir_reduce34 _menhir_env (Obj.magic _menhir_stack)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | REG _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | COMMA ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | REG _v ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_stack = (_menhir_stack, _v) in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    (match _tok with
                    | COMMA ->
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        (match _tok with
                        | NUM _v ->
                            let _menhir_stack = Obj.magic _menhir_stack in
                            let _menhir_stack = (_menhir_stack, _v) in
                            let _menhir_env = _menhir_discard _menhir_env in
                            let _tok = _menhir_env._menhir_token in
                            (match _tok with
                            | RPAR ->
                                let _menhir_stack = Obj.magic _menhir_stack in
                                _menhir_reduce31 _menhir_env (Obj.magic _menhir_stack)
                            | _ ->
                                assert (not _menhir_env._menhir_error);
                                _menhir_env._menhir_error <- true;
                                let _menhir_stack = Obj.magic _menhir_stack in
                                let ((((_menhir_stack, _menhir_s, _), _), _), _) = _menhir_stack in
                                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            let _menhir_stack = Obj.magic _menhir_stack in
                            let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                    | RPAR ->
                        let _menhir_stack = Obj.magic _menhir_stack in
                        _menhir_reduce30 _menhir_env (Obj.magic _menhir_stack)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | RPAR ->
                let _menhir_stack = Obj.magic _menhir_stack in
                _menhir_reduce27 _menhir_env (Obj.magic _menhir_stack)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run26 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMMA ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | REG _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | COMMA ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | NUM _v ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_stack = (_menhir_stack, _v) in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    (match _tok with
                    | RPAR ->
                        let _menhir_stack = Obj.magic _menhir_stack in
                        _menhir_reduce25 _menhir_env (Obj.magic _menhir_stack)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | RPAR ->
                let _menhir_stack = Obj.magic _menhir_stack in
                _menhir_reduce23 _menhir_env (Obj.magic _menhir_stack)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | REG _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | REG _v ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | COMMA ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    (match _tok with
                    | NUM _v ->
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let _menhir_stack = (_menhir_stack, _v) in
                        let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        (match _tok with
                        | RPAR ->
                            let _menhir_stack = Obj.magic _menhir_stack in
                            _menhir_reduce24 _menhir_env (Obj.magic _menhir_stack)
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            let _menhir_stack = Obj.magic _menhir_stack in
                            let ((((_menhir_stack, _menhir_s), _), _), _) = _menhir_stack in
                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                | RPAR ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    _menhir_reduce22 _menhir_env (Obj.magic _menhir_stack)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | RPAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            _menhir_reduce21 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run41 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 24 "parser.mly"
       (string)
# 1069 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAR ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | REG _v ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | COMMA ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    (match _tok with
                    | NUM _v ->
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let _menhir_stack = (_menhir_stack, _v) in
                        let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        (match _tok with
                        | RPAR ->
                            let _menhir_stack = Obj.magic _menhir_stack in
                            _menhir_reduce33 _menhir_env (Obj.magic _menhir_stack)
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            let _menhir_stack = Obj.magic _menhir_stack in
                            let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                | RPAR ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    _menhir_reduce32 _menhir_env (Obj.magic _menhir_stack)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | REG _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | COMMA ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | REG _v ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_stack = (_menhir_stack, _v) in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    (match _tok with
                    | COMMA ->
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        (match _tok with
                        | NUM _v ->
                            let _menhir_stack = Obj.magic _menhir_stack in
                            let _menhir_stack = (_menhir_stack, _v) in
                            let _menhir_env = _menhir_discard _menhir_env in
                            let _tok = _menhir_env._menhir_token in
                            (match _tok with
                            | RPAR ->
                                let _menhir_stack = Obj.magic _menhir_stack in
                                _menhir_reduce29 _menhir_env (Obj.magic _menhir_stack)
                            | _ ->
                                assert (not _menhir_env._menhir_error);
                                _menhir_env._menhir_error <- true;
                                let _menhir_stack = Obj.magic _menhir_stack in
                                let ((((_menhir_stack, _menhir_s, _), _), _), _) = _menhir_stack in
                                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            let _menhir_stack = Obj.magic _menhir_stack in
                            let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                    | RPAR ->
                        let _menhir_stack = Obj.magic _menhir_stack in
                        _menhir_reduce28 _menhir_env (Obj.magic _menhir_stack)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | RPAR ->
                let _menhir_stack = Obj.magic _menhir_stack in
                _menhir_reduce26 _menhir_env (Obj.magic _menhir_stack)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run57 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        _menhir_reduce36 _menhir_env (Obj.magic _menhir_stack) _v
    | NUM _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        _menhir_reduce37 _menhir_env (Obj.magic _menhir_stack) _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState151 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState149 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR
    | MenhirState114 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState61 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR
    | MenhirState8 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR

and _menhir_run62 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 25 "parser.mly"
       (string)
# 1256 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce40 _menhir_env (Obj.magic _menhir_stack) _menhir_s _v

and _menhir_run63 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 26 "parser.mly"
       (string)
# 1265 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAR ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | REG _v ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | COMMA ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    (match _tok with
                    | NUM _v ->
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let _menhir_stack = (_menhir_stack, _v) in
                        let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        (match _tok with
                        | RPAR ->
                            let _menhir_stack = Obj.magic _menhir_stack in
                            let _menhir_env = _menhir_discard _menhir_env in
                            _menhir_reduce35 _menhir_env (Obj.magic _menhir_stack)
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            let _menhir_stack = Obj.magic _menhir_stack in
                            let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                | RPAR ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_env = _menhir_discard _menhir_env in
                    _menhir_reduce34 _menhir_env (Obj.magic _menhir_stack)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | REG _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | COMMA ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | REG _v ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_stack = (_menhir_stack, _v) in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    (match _tok with
                    | COMMA ->
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        (match _tok with
                        | NUM _v ->
                            let _menhir_stack = Obj.magic _menhir_stack in
                            let _menhir_stack = (_menhir_stack, _v) in
                            let _menhir_env = _menhir_discard _menhir_env in
                            let _tok = _menhir_env._menhir_token in
                            (match _tok with
                            | RPAR ->
                                let _menhir_stack = Obj.magic _menhir_stack in
                                let _menhir_env = _menhir_discard _menhir_env in
                                _menhir_reduce31 _menhir_env (Obj.magic _menhir_stack)
                            | _ ->
                                assert (not _menhir_env._menhir_error);
                                _menhir_env._menhir_error <- true;
                                let _menhir_stack = Obj.magic _menhir_stack in
                                let ((((_menhir_stack, _menhir_s, _), _), _), _) = _menhir_stack in
                                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            let _menhir_stack = Obj.magic _menhir_stack in
                            let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                    | RPAR ->
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let _menhir_env = _menhir_discard _menhir_env in
                        _menhir_reduce30 _menhir_env (Obj.magic _menhir_stack)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | RPAR ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                _menhir_reduce27 _menhir_env (Obj.magic _menhir_stack)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | COMMA ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (i : (
# 26 "parser.mly"
       (string)
# 1412 "parser.ml"
        ))) = _menhir_stack in
        let _v : (Ast.op_spec) = 
# 74 "parser.mly"
            ( Ast.EaD(i) )
# 1417 "parser.ml"
         in
        _menhir_goto_arg _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run79 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMMA ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | REG _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | COMMA ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | NUM _v ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_stack = (_menhir_stack, _v) in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    (match _tok with
                    | RPAR ->
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let _menhir_env = _menhir_discard _menhir_env in
                        _menhir_reduce25 _menhir_env (Obj.magic _menhir_stack)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | RPAR ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                _menhir_reduce23 _menhir_env (Obj.magic _menhir_stack)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | REG _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | REG _v ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | COMMA ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    (match _tok with
                    | NUM _v ->
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let _menhir_stack = (_menhir_stack, _v) in
                        let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        (match _tok with
                        | RPAR ->
                            let _menhir_stack = Obj.magic _menhir_stack in
                            let _menhir_env = _menhir_discard _menhir_env in
                            _menhir_reduce24 _menhir_env (Obj.magic _menhir_stack)
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            let _menhir_stack = Obj.magic _menhir_stack in
                            let ((((_menhir_stack, _menhir_s), _), _), _) = _menhir_stack in
                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                | RPAR ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_env = _menhir_discard _menhir_env in
                    _menhir_reduce22 _menhir_env (Obj.magic _menhir_stack)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | RPAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            _menhir_reduce21 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run94 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 24 "parser.mly"
       (string)
# 1567 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAR ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | REG _v ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | COMMA ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    (match _tok with
                    | NUM _v ->
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let _menhir_stack = (_menhir_stack, _v) in
                        let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        (match _tok with
                        | RPAR ->
                            let _menhir_stack = Obj.magic _menhir_stack in
                            let _menhir_env = _menhir_discard _menhir_env in
                            _menhir_reduce33 _menhir_env (Obj.magic _menhir_stack)
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            let _menhir_stack = Obj.magic _menhir_stack in
                            let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                | RPAR ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_env = _menhir_discard _menhir_env in
                    _menhir_reduce32 _menhir_env (Obj.magic _menhir_stack)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | REG _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | COMMA ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | REG _v ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_stack = (_menhir_stack, _v) in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    (match _tok with
                    | COMMA ->
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        (match _tok with
                        | NUM _v ->
                            let _menhir_stack = Obj.magic _menhir_stack in
                            let _menhir_stack = (_menhir_stack, _v) in
                            let _menhir_env = _menhir_discard _menhir_env in
                            let _tok = _menhir_env._menhir_token in
                            (match _tok with
                            | RPAR ->
                                let _menhir_stack = Obj.magic _menhir_stack in
                                let _menhir_env = _menhir_discard _menhir_env in
                                _menhir_reduce29 _menhir_env (Obj.magic _menhir_stack)
                            | _ ->
                                assert (not _menhir_env._menhir_error);
                                _menhir_env._menhir_error <- true;
                                let _menhir_stack = Obj.magic _menhir_stack in
                                let ((((_menhir_stack, _menhir_s, _), _), _), _) = _menhir_stack in
                                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            let _menhir_stack = Obj.magic _menhir_stack in
                            let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                    | RPAR ->
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let _menhir_env = _menhir_discard _menhir_env in
                        _menhir_reduce28 _menhir_env (Obj.magic _menhir_stack)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | RPAR ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                _menhir_reduce26 _menhir_env (Obj.magic _menhir_stack)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | COMMA ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (s : (
# 24 "parser.mly"
       (string)
# 1714 "parser.ml"
        ))) = _menhir_stack in
        let _v : (Ast.op_spec) = 
# 73 "parser.mly"
            ( Ast.EaD(s) )
# 1719 "parser.ml"
         in
        _menhir_goto_arg _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run110 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce36 _menhir_env (Obj.magic _menhir_stack) _v
    | NUM _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce37 _menhir_env (Obj.magic _menhir_stack) _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_aline : _menhir_env -> 'ttv_tail -> (
# 30 "parser.mly"
       (Ast.line)
# 1753 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (_1 : (
# 30 "parser.mly"
       (Ast.line)
# 1761 "parser.ml"
    )) = _v in
    Obj.magic _1

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and aline : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 30 "parser.mly"
       (Ast.line)
# 1780 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = let _tok = Obj.magic () in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    } in
    Obj.magic (let _menhir_stack = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ALIGN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | NUM _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (i : (
# 26 "parser.mly"
       (string)
# 1805 "parser.ml"
            )) = _v in
            let _1 = () in
            let _v : (
# 30 "parser.mly"
       (Ast.line)
# 1811 "parser.ml"
            ) = 
# 45 "parser.mly"
                                     ( Ast.Align(i) )
# 1815 "parser.ml"
             in
            _menhir_goto_aline _menhir_env _menhir_stack _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            raise _eRR)
    | ALU2 _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DOLLAR ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | ID _v ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState149 _v
        | LPAR ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | NUM _v ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState149 _v
        | REG _v ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState149 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState149)
    | COMM ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | COMMA ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | NUM _v ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_stack = (_menhir_stack, _v) in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    (match _tok with
                    | COMMA ->
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        (match _tok with
                        | NUM _v ->
                            let _menhir_stack = Obj.magic _menhir_stack in
                            let _menhir_stack = Obj.magic _menhir_stack in
                            let (aln : (
# 26 "parser.mly"
       (string)
# 1876 "parser.ml"
                            )) = _v in
                            let ((_menhir_stack, (s : (
# 24 "parser.mly"
       (string)
# 1881 "parser.ml"
                            ))), (sz : (
# 26 "parser.mly"
       (string)
# 1885 "parser.ml"
                            ))) = _menhir_stack in
                            let _5 = () in
                            let _3 = () in
                            let _1 = () in
                            let _v : (
# 30 "parser.mly"
       (Ast.line)
# 1893 "parser.ml"
                            ) = 
# 44 "parser.mly"
                                               ( Ast.Comm(s, int_of_string sz, int_of_string aln) )
# 1897 "parser.ml"
                             in
                            _menhir_goto_aline _menhir_env _menhir_stack _v
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            let _menhir_stack = Obj.magic _menhir_stack in
                            raise _eRR)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let _menhir_stack = Obj.magic _menhir_stack in
                        raise _eRR)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    raise _eRR)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                raise _eRR)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            raise _eRR)
    | CTL0 _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (i : (
# 9 "parser.mly"
       (Ast.opcode)
# 1931 "parser.ml"
        )) = _v in
        let _v : (
# 30 "parser.mly"
       (Ast.line)
# 1936 "parser.ml"
        ) = 
# 42 "parser.mly"
                                     ( Ast.Ctl0(i) )
# 1940 "parser.ml"
         in
        _menhir_goto_aline _menhir_env _menhir_stack _v
    | CTL1 _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (v1 : (
# 24 "parser.mly"
       (string)
# 1955 "parser.ml"
            )) = _v in
            let (_menhir_stack, (i : (
# 10 "parser.mly"
       (Ast.opcode)
# 1960 "parser.ml"
            ))) = _menhir_stack in
            let _v : (
# 30 "parser.mly"
       (Ast.line)
# 1965 "parser.ml"
            ) = 
# 39 "parser.mly"
                                     ( Ast.Ctl1(i, EaD(v1)) )
# 1969 "parser.ml"
             in
            _menhir_goto_aline _menhir_env _menhir_stack _v
        | REG _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (ri : (
# 25 "parser.mly"
       (string)
# 1978 "parser.ml"
            )) = _v in
            let (_menhir_stack, (i : (
# 10 "parser.mly"
       (Ast.opcode)
# 1983 "parser.ml"
            ))) = _menhir_stack in
            let _v : (
# 30 "parser.mly"
       (Ast.line)
# 1988 "parser.ml"
            ) = 
# 40 "parser.mly"
                                     ( Ast.Ctl1(i, Reg(ri)) )
# 1992 "parser.ml"
             in
            _menhir_goto_aline _menhir_env _menhir_stack _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            raise _eRR)
    | CTL2 _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | COMMA ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | REG _v ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (ri : (
# 25 "parser.mly"
       (string)
# 2023 "parser.ml"
                    )) = _v in
                    let ((_menhir_stack, (i : (
# 11 "parser.mly"
       (Ast.opcode)
# 2028 "parser.ml"
                    ))), (im : (
# 24 "parser.mly"
       (string)
# 2032 "parser.ml"
                    ))) = _menhir_stack in
                    let _3 = () in
                    let _v : (
# 30 "parser.mly"
       (Ast.line)
# 2038 "parser.ml"
                    ) = 
# 41 "parser.mly"
                                     ( Ast.Ctl2(i, EaD(im), Reg(ri)) )
# 2042 "parser.ml"
                     in
                    _menhir_goto_aline _menhir_env _menhir_stack _v
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    raise _eRR)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                raise _eRR)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            raise _eRR)
    | CTL3 _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DOLLAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | NUM _v ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | COMMA ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    (match _tok with
                    | REG _v ->
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let _menhir_stack = (_menhir_stack, _v) in
                        let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        (match _tok with
                        | COMMA ->
                            let _menhir_stack = Obj.magic _menhir_stack in
                            let _menhir_env = _menhir_discard _menhir_env in
                            let _tok = _menhir_env._menhir_token in
                            (match _tok with
                            | ID _v ->
                                let _menhir_stack = Obj.magic _menhir_stack in
                                let _menhir_stack = Obj.magic _menhir_stack in
                                let (t : (
# 24 "parser.mly"
       (string)
# 2099 "parser.ml"
                                )) = _v in
                                let (((_menhir_stack, (i : (
# 12 "parser.mly"
       (Ast.opcode)
# 2104 "parser.ml"
                                ))), (v1 : (
# 26 "parser.mly"
       (string)
# 2108 "parser.ml"
                                ))), (v2 : (
# 25 "parser.mly"
       (string)
# 2112 "parser.ml"
                                ))) = _menhir_stack in
                                let _6 = () in
                                let _4 = () in
                                let _2 = () in
                                let _v : (
# 30 "parser.mly"
       (Ast.line)
# 2120 "parser.ml"
                                ) = 
# 37 "parser.mly"
                                                         ( Ast.Ctl3(i, Ast.Imm(v1), Ast.Reg(v2), Ast.EaD(t)) )
# 2124 "parser.ml"
                                 in
                                _menhir_goto_aline _menhir_env _menhir_stack _v
                            | _ ->
                                assert (not _menhir_env._menhir_error);
                                _menhir_env._menhir_error <- true;
                                let _menhir_stack = Obj.magic _menhir_stack in
                                raise _eRR)
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            let _menhir_stack = Obj.magic _menhir_stack in
                            raise _eRR)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let _menhir_stack = Obj.magic _menhir_stack in
                        raise _eRR)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    raise _eRR)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                raise _eRR)
        | REG _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | COMMA ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | REG _v ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_stack = (_menhir_stack, _v) in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    (match _tok with
                    | COMMA ->
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        (match _tok with
                        | ID _v ->
                            let _menhir_stack = Obj.magic _menhir_stack in
                            let _menhir_stack = Obj.magic _menhir_stack in
                            let (t : (
# 24 "parser.mly"
       (string)
# 2180 "parser.ml"
                            )) = _v in
                            let (((_menhir_stack, (i : (
# 12 "parser.mly"
       (Ast.opcode)
# 2185 "parser.ml"
                            ))), (v1 : (
# 25 "parser.mly"
       (string)
# 2189 "parser.ml"
                            ))), (v2 : (
# 25 "parser.mly"
       (string)
# 2193 "parser.ml"
                            ))) = _menhir_stack in
                            let _5 = () in
                            let _3 = () in
                            let _v : (
# 30 "parser.mly"
       (Ast.line)
# 2200 "parser.ml"
                            ) = 
# 38 "parser.mly"
                                                  ( Ast.Ctl3(i, Ast.Reg(v1), Ast.Reg(v2), Ast.EaD(t)) )
# 2204 "parser.ml"
                             in
                            _menhir_goto_aline _menhir_env _menhir_stack _v
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            let _menhir_stack = Obj.magic _menhir_stack in
                            raise _eRR)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let _menhir_stack = Obj.magic _menhir_stack in
                        raise _eRR)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    raise _eRR)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                raise _eRR)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            raise _eRR)
    | DIR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (s : (
# 22 "parser.mly"
       (string)
# 2238 "parser.ml"
        )) = _v in
        let _v : (
# 30 "parser.mly"
       (Ast.line)
# 2243 "parser.ml"
        ) = 
# 46 "parser.mly"
                                     ( Ast.Directive(s) )
# 2247 "parser.ml"
         in
        _menhir_goto_aline _menhir_env _menhir_stack _v
    | EOF ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let _1 = () in
        let _v : (
# 30 "parser.mly"
       (Ast.line)
# 2257 "parser.ml"
        ) = 
# 52 "parser.mly"
                                     ( Ast.Ignored("") )
# 2261 "parser.ml"
         in
        _menhir_goto_aline _menhir_env _menhir_stack _v
    | FUN_START ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let _1 = () in
        let _v : (
# 30 "parser.mly"
       (Ast.line)
# 2271 "parser.ml"
        ) = 
# 50 "parser.mly"
                                     ( Ast.Fun_start )
# 2275 "parser.ml"
         in
        _menhir_goto_aline _menhir_env _menhir_stack _v
    | ID _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, (k : (
# 24 "parser.mly"
       (string)
# 2290 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 30 "parser.mly"
       (Ast.line)
# 2296 "parser.ml"
            ) = 
# 33 "parser.mly"
                                     ( Ast.Label(k) )
# 2300 "parser.ml"
             in
            _menhir_goto_aline _menhir_env _menhir_stack _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            raise _eRR)
    | IGN _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (s : (
# 23 "parser.mly"
       (string)
# 2314 "parser.ml"
        )) = _v in
        let _v : (
# 30 "parser.mly"
       (Ast.line)
# 2319 "parser.ml"
        ) = 
# 47 "parser.mly"
                                     ( Ast.Ignored(s) )
# 2323 "parser.ml"
         in
        _menhir_goto_aline _menhir_env _menhir_stack _v
    | LINE ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let _1 = () in
        let _v : (
# 30 "parser.mly"
       (Ast.line)
# 2333 "parser.ml"
        ) = 
# 51 "parser.mly"
                                     ( Ast.Ignored("") )
# 2337 "parser.ml"
         in
        _menhir_goto_aline _menhir_env _menhir_stack _v
    | MOVE _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DOLLAR ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | ID _v ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
        | LPAR ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | NUM _v ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
        | REG _v ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState61)
    | PUPO _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DOLLAR ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState8
        | ID _v ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
        | LPAR ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState8
        | NUM _v ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
        | REG _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState8)
    | QUAD ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | NUM _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (i : (
# 26 "parser.mly"
       (string)
# 2391 "parser.ml"
            )) = _v in
            let _1 = () in
            let _v : (
# 30 "parser.mly"
       (Ast.line)
# 2397 "parser.ml"
            ) = 
# 43 "parser.mly"
                                     ( Ast.Quad(i) )
# 2401 "parser.ml"
             in
            _menhir_goto_aline _menhir_env _menhir_stack _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            raise _eRR)
    | TYPE ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | COMMA ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | FUNCTION ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (_menhir_stack, (s : (
# 24 "parser.mly"
       (string)
# 2431 "parser.ml"
                    ))) = _menhir_stack in
                    let _4 = () in
                    let _3 = () in
                    let _1 = () in
                    let _v : (
# 30 "parser.mly"
       (Ast.line)
# 2439 "parser.ml"
                    ) = 
# 48 "parser.mly"
                                     ( Ast.Function(s) )
# 2443 "parser.ml"
                     in
                    _menhir_goto_aline _menhir_env _menhir_stack _v
                | OBJECT ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (_menhir_stack, (s : (
# 24 "parser.mly"
       (string)
# 2452 "parser.ml"
                    ))) = _menhir_stack in
                    let _4 = () in
                    let _3 = () in
                    let _1 = () in
                    let _v : (
# 30 "parser.mly"
       (Ast.line)
# 2460 "parser.ml"
                    ) = 
# 49 "parser.mly"
                                     ( Ast.Object(s) )
# 2464 "parser.ml"
                     in
                    _menhir_goto_aline _menhir_env _menhir_stack _v
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    raise _eRR)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                raise _eRR)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            raise _eRR)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR)

# 233 "/home/niklas/.opam/4.07.0/lib/menhir/standard.mly"
  

# 2491 "parser.ml"
