%{



%}

%token ADD SUB MUL DIV EXP
%token PARO PARF
%token EQU
%token SEP
%token <int> INT
%token <float> FLOAT
%token <string> VAR

%start statement
%type <unit> statement 

%%

statement:
expr SEP statement{}
| expr {}

expr:
 expr ADD expr  {} 
| expr SUB expr {}
| expr MUL expr {}
| expr DIV expr {}
| expr EXP expr {}
| expr EQU expr {}
| PARO expr PARF{}
| INT           {}
| FLOAT         {}
| VAR           {}


%%
