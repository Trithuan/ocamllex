try
 let lexbuf = Lexing.from_channel stdin
 in Parsecalc.statement Lexcalc.token lexbuf
with
| Failure _ -> print_endline "** caractère inconnu"
| Lexcalc.Eof -> print_endline "** fin"
| Parsing.Parse_error -> print_endline "** erreur syntax"
| Not_found -> print_endline "**variable introuvable"
;;
