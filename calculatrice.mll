{

}
let digit = ['0'-'9']
exp = ['e' 'E'] ['-' '+']?


rule token = parse
|'-'? digit+                  {INT}
|'-'? digit* (exp digit+)?    {FLOAT}
|'+'                          {ADD}
|'-'                          {SUB}
|'*'                          {MUL}
|'/'                          {DIV}
|'='                          {EQU}
|'('                          {PARO}
|')'                          {PARF}
|';'                          {SEP}

