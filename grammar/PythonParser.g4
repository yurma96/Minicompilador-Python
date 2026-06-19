parser grammar PythonParser;

options {
    tokenVocab = PythonLexer;
}

code
    : stat* EOF
    ;

stat
    : expr NEWLINE?
    | query NEWLINE?
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
    : ids
    | numeros
    | expressoesEntreParenteses
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

