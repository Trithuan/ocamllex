%{
(*préambule*)
(* output message *)
let string_of_numeric n = "# float:"^string_of_float n ;;
(*symbole table*)
let tabsymbol = Hashtbl.create 10;;

%}

%token ADD SUB MUL DIV EXP
%token PARO PARF
%token EQU
%token SEP
%token <int> INT
%token <float> FLOAT
%token <string> VAR

%right EQU
%left ADD SUB
%left MUL
%left DIV
%right EXP

%start statement
%type <unit> statement 

%%

statement:
statement SEP expr{print_endline (string_of_numeric $3)}
| expr {print_endline (string_of_numeric $1)}

expr:
 expr ADD expr    {$1 +. $3} 
| expr SUB expr   {$1 -. $3}
| expr MUL expr   {$1 *. $3}
| expr DIV expr   {$1 /. $3}
| expr EXP expr   {$1 ** $3}
| PARO expr PARF  {$2}
| INT             {float_of_int $1}
| FLOAT           {$1}
| VAR EQU expr    {Hashtbl.add tabsymbol $1 $3; $3}
| VAR             {Hashtbl.find tabsymbol $1}


%%
