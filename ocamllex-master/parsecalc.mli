type token =
  | ADD
  | SUB
  | MUL
  | DIV
  | EXP
  | PARO
  | PARF
  | EQU
  | SEP
  | INT of (int)
  | FLOAT of (float)
  | VAR of (string)

val statement :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> unit
