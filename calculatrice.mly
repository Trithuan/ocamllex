%{
(*préambule*)
(* output message *)
let streing_of_numeric n = "# float:"^string_of_float n ;;
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
| expr {print_endline (string_of numeric $1)}

expr:
 expr ADD expr    {$1 +. $3} 
| expr SUB expr   {}
| expr MUL expr   {}
| expr DIV expr   {}
| expr EXP expr   {}
| VAR EQU expr    {}
| PARO expr PARF  {}
| INT             {}
| FLOAT           {$1}
| VAR             {}


%%
