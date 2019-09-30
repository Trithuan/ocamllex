{
open Parsecalc;;
exception Eof;;
}
let white = [' ' '\t']+
let newline = '\r' | '\n' | "\r\n"
let digit = ['0'-'9']
let frac = '.' digit*
let exp = ['e' 'E'] ['-' '+']?
let identifier = ['a'-'z' 'A'-'Z'] ['a'-'z' 'A'-'Z' '0'-'9' '_']*

rule token = parse
| '-'? digit+   as lexeme                {INT(int_of_string lexeme)}
| '-'? digit* (exp digit+)?  as lexeme   {FLOAT (float_of_string lexeme)}
| '+'                          {ADD}
| '-'                          {SUB}
| '*'                          {MUL}
| '/'                          {DIV}
| '='                          {EQU}
| '('                          {PARO}
| ')'                          {PARF}
| ';'                          {SEP}
| identifier as lexeme         {VAR lexeme}
|newline                       {token lexbuf}
|white                         {token lexbuf}
|eof                           {raise Eof}
|"#quit"                       {raise Eof}
