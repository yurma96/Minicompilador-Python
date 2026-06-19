parser grammar PythonParser;

options {
    tokenVocab = PythonLexer;
}

code
    : stat* EOF
    ;

stat
    : expr NEWLINE
    ;

expr
    : operacoesComExpressoes
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
