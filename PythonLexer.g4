lexer grammar PythonLexer;

// =======================================================
// PALAVRAS-CHAVE DO PYTHON
// =======================================================

FALSE       : 'False';
NONE        : 'None';
TRUE        : 'True';

AND         : 'and';
AS          : 'as';
ASSERT      : 'assert';
ASYNC       : 'async';
AWAIT       : 'await';
BREAK       : 'break';
CLASS       : 'class';
CONTINUE    : 'continue';
DEF         : 'def';
DEL         : 'del';
ELIF        : 'elif';
ELSE        : 'else';
EXCEPT      : 'except';
FINALLY     : 'finally';
FOR         : 'for';
FROM        : 'from';
GLOBAL      : 'global';
IF          : 'if';
IMPORT      : 'import';
IN          : 'in';
IS          : 'is';
LAMBDA      : 'lambda';
NONLOCAL    : 'nonlocal';
NOT         : 'not';
OR          : 'or';
PASS        : 'pass';
RAISE       : 'raise';
RETURN      : 'return';
TRY         : 'try';
WHILE       : 'while';
WITH        : 'with';
YIELD       : 'yield';

// Soft keywords
MATCH       : 'match';
CASE        : 'case';

// =======================================================
// TIPOS DE DADOS / CLASSES BUILT-IN
// =======================================================

INT_TYPE        : 'int';
FLOAT_TYPE      : 'float';
STR_TYPE        : 'str';
BOOL_TYPE       : 'bool';
LIST_TYPE       : 'list';
TUPLE_TYPE      : 'tuple';
DICT_TYPE       : 'dict';
SET_TYPE        : 'set';
FROZENSET_TYPE  : 'frozenset';
COMPLEX_TYPE    : 'complex';
BYTES_TYPE      : 'bytes';
BYTEARRAY_TYPE  : 'bytearray';
MEMORYVIEW_TYPE : 'memoryview';

// =======================================================
// FUNÇÕES BUILT-IN
// =======================================================

PRINT       : 'print';
INPUT       : 'input';
LEN         : 'len';
TYPE        : 'type';
RANGE       : 'range';
ABS         : 'abs';
SUM         : 'sum';
MIN         : 'min';
MAX         : 'max';
ROUND       : 'round';
SORTED      : 'sorted';
OPEN        : 'open';
ENUMERATE   : 'enumerate';
ZIP         : 'zip';
MAP         : 'map';
FILTER      : 'filter';
ALL         : 'all';
ANY         : 'any';
ISINSTANCE  : 'isinstance';
ID          : 'id';
DIR         : 'dir';
HELP        : 'help';

// =======================================================
// OPERADORES DE ATRIBUIÇÃO
// Devem vir antes dos operadores simples.
// =======================================================

POW_ASSIGN        : '**=';
FLOOR_DIV_ASSIGN  : '//=';
PLUS_ASSIGN       : '+=';
MINUS_ASSIGN      : '-=';
MULT_ASSIGN       : '*=';
DIV_ASSIGN        : '/=';
MOD_ASSIGN        : '%=';
MATMUL_ASSIGN     : '@=';
AND_ASSIGN        : '&=';
OR_ASSIGN         : '|=';
XOR_ASSIGN        : '^=';
RSHIFT_ASSIGN     : '>>=';
LSHIFT_ASSIGN     : '<<=';
WALRUS            : ':=';
ASSIGN            : '=';

// =======================================================
// OPERADORES RELACIONAIS
// =======================================================

EQUAL       : '==';
NOT_EQUAL   : '!=';
GREATER_EQ  : '>=';
LESS_EQ     : '<=';
GREATER     : '>';
LESS        : '<';

// =======================================================
// OPERADORES ARITMÉTICOS
// =======================================================

POWER       : '**';
FLOOR_DIV   : '//';
PLUS        : '+';
MINUS       : '-';
MULT        : '*';
DIV         : '/';
MOD         : '%';
MATMUL      : '@';

// =======================================================
// OPERADORES BIT A BIT
// =======================================================

BIT_AND     : '&';
BIT_OR      : '|';
BIT_XOR     : '^';
BIT_NOT     : '~';
LSHIFT      : '<<';
RSHIFT      : '>>';

// =======================================================
// SÍMBOLOS / DELIMITADORES
// =======================================================

LPAREN      : '(';
RPAREN      : ')';
LBRACKET    : '[';
RBRACKET    : ']';
LBRACE      : '{';
RBRACE      : '}';

COLON       : ':';
COMMA       : ',';
DOT         : '.';
SEMI        : ';';
ARROW       : '->';
ELLIPSIS    : '...';

QUOTE_DOUBLE : '"';
QUOTE_SINGLE : '\'';

UNDERSCORE  : '_';

// =======================================================
// SÍMBOLOS IDENTIFICADORES DE TIPOS DE DADOS
// =======================================================

STRING_LITERAL
    : '"'  (~["\\] | '\\' .)* '"'
    | '\'' (~['\\] | '\\' .)* '\''
    ;

BYTES_LITERAL
    : 'b' STRING_LITERAL
    | 'B' STRING_LITERAL
    ;

FSTRING_LITERAL
    : 'f' STRING_LITERAL
    | 'F' STRING_LITERAL
    ;

RAW_STRING_LITERAL
    : 'r' STRING_LITERAL
    | 'R' STRING_LITERAL
    ;

FLOAT_NUMBER
    : DIGITO+ '.' DIGITO*
    | '.' DIGITO+
    ;

INTEGER_NUMBER
    : DIGITO+
    ;

COMPLEX_NUMBER
    : DIGITO+ 'j'
    | DIGITO+ 'J'
    | FLOAT_NUMBER 'j'
    | FLOAT_NUMBER 'J'
    ;

// =======================================================
// COMENTÁRIOS E QUEBRA DE LINHA
// =======================================================

COMMENT
    : '#' ~[\r\n]* -> skip
    ;

NEWLINE
    : '\r'? '\n'
    ;

// =======================================================
// DEFINIÇÕES FINAIS OBRIGATÓRIAS
// A ordem pedida é:
// 1. identificadores
// 2. letras
// 3. dígitos
// 4. WS -> skip
// =======================================================

IDENTIFICADOR
    : LETRA (LETRA | DIGITO | '_')*
    ;

fragment LETRA
    : [a-zA-Z_]
    ;

fragment DIGITO
    : [0-9]
    ;

WS
    : [ \t\r\n]+ -> skip
    ;