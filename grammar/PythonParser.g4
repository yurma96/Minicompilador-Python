parser grammar PythonParser;

options {
    tokenVocab = PythonLexer;
}

code
    : (stat | conditional | func | func_call)* EOF
    ;

conditional
    : IF query COLON NEWLINE bloco (ELIF query COLON NEWLINE bloco)* (ELSE COLON NEWLINE bloco)?
    ;

bloco
    : (stat | conditional | func | func_call)+
    ;

func
    : DEF ids LPAREN parametros? RPAREN COLON NEWLINE bloco
    ;

parametros
    : ids (COMMA ids)*
    ;

func_call
    : ids LPAREN argumentos? RPAREN
    ;

argumentos
    : (expr | query) (COMMA (expr | query))*
    ;

stat
    : expr NEWLINE?
    | query NEWLINE?
    ;

expr
    : func_call
    | operacoesComExpressoes
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
    | ids
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
