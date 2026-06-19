parser grammar PythonParser;

options {
    tokenVocab = PythonLexer;
}

code
    : (stat | conditional | func | func_call | loop_while | loop_for | blank_line)* EOF
    ;

blank_line
    : NEWLINE
    ;

conditional
    : IF query COLON NEWLINE bloco (ELIF query COLON NEWLINE bloco)* (ELSE COLON NEWLINE bloco)?
    ;

loop_while
    : WHILE query COLON NEWLINE bloco
    ;

loop_for
    : FOR ids IN iteravel COLON NEWLINE bloco
    ;

iteravel
    : ids
    | func_call
    | RANGE LPAREN argumentos? RPAREN
    | list
    | tuple
    | set
    ;

bloco
    : stat
    | conditional
    | func
    | func_call
    | loop_while
    | loop_for
    ;

func
    : DEF ids LPAREN parametros? RPAREN COLON NEWLINE bloco
    ;

parametros
    : ids (COMMA ids)*
    ;

func_call
    : callableName LPAREN argumentos? RPAREN
    ;

callableName
    : ids
    | PRINT
    | INPUT
    | LEN
    | RANGE
    | SUM
    | MAX
    | MIN
    | ABS
    | ROUND
    | SORTED
    | INT_TYPE
    | FLOAT_TYPE
    | STR_TYPE
    | BOOL_TYPE
    | LIST_TYPE
    | TUPLE_TYPE
    | DICT_TYPE
    | SET_TYPE
    ;

argumentos
    : (expr | query) (COMMA (expr | query))*
    ;

stat
    : assignment NEWLINE?
    | return_stmt NEWLINE?
    | expr NEWLINE?
    | query NEWLINE?
    ;

assignment
    : ids ASSIGN (expr | query)
    ;

return_stmt
    : RETURN (expr | query)?
    ;

expr
    : operacoesComExpressoes
    ;

query
    : operacoesBooleanasEntreQuerys
    ;

operacoesBooleanasEntreQuerys
    : queryTermo ((AND | OR) queryTermo)*
    ;

queryTermo
    : valoresBooleanos
    | relacoesEntreExpressoes
    | queryEntreParenteses
    | NOT queryTermo
    | ids
    ;

valoresBooleanos
    : TRUE
    | FALSE
    ;

queryEntreParenteses
    : LPAREN query RPAREN
    ;

relacoesEntreExpressoes
    : expr operadorRelacional expr
    ;

operacoesComExpressoes
    : termo (operadorAritmetico termo)*
    ;

termo
    : func_call
    | estruturaDados
    | ids
    | numeros
    | expressoesEntreParenteses
    ;

estruturaDados
    : string
    | list
    | tuple
    | set
    | dict
    ;

string
    : STRING
    ;

list
    : LBRACKET elementos? RBRACKET
    ;

tuple
    : LPAREN RPAREN
    | LPAREN expr COMMA (expr (COMMA expr)*)? COMMA? RPAREN
    ;

set
    : LBRACE elementos RBRACE
    ;

dict
    : LBRACE paresDict? RBRACE
    ;

elementos
    : expr (COMMA expr)* COMMA?
    ;

paresDict
    : parDict (COMMA parDict)* COMMA?
    ;

parDict
    : expr COLON expr
    ;

ids
    : IDENTIFIER
    ;

numeros
    : INTEGER_LITERAL
    | FLOAT_LITERAL
    ;

expressoesEntreParenteses
    : LPAREN expr RPAREN
    ;

operadorAritmetico
    : PLUS
    | MINUS
    | MULT
    | DIV
    | FLOOR_DIV
    | MOD
    | POWER
    ;

operadorRelacional
    : EQUAL
    | NOT_EQUAL
    | LESS_THAN
    | GREATER_THAN
    | LESS_EQUAL
    | GREATER_EQUAL
    | IS
    | IS NOT
    | IN
    | NOT IN
    ;
