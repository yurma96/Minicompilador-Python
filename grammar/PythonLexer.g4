lexer grammar PythonLexer;

// Palavras reservadas
FALSE: 'False';
NONE: 'None';
TRUE: 'True';
AND: 'and';
AS: 'as';
ASSERT: 'assert';
ASYNC: 'async';
AWAIT: 'await';
BREAK: 'break';
CLASS: 'class';
CONTINUE: 'continue';
DEF: 'def';
DEL: 'del';
ELIF: 'elif';
ELSE: 'else';
EXCEPT: 'except';
FINALLY: 'finally';
FOR: 'for';
FROM: 'from';
GLOBAL: 'global';
IF: 'if';
IMPORT: 'import';
IN: 'in';
IS: 'is';
LAMBDA: 'lambda';
NONLOCAL: 'nonlocal';
NOT: 'not';
OR: 'or';
PASS: 'pass';
RAISE: 'raise';
RETURN: 'return';
TRY: 'try';
WHILE: 'while';
WITH: 'with';
YIELD: 'yield';

// Soft keywords
MATCH: 'match';
CASE: 'case';

// Tipos de dados e built-ins comuns
INT_TYPE: 'int';
FLOAT_TYPE: 'float';
STR_TYPE: 'str';
BOOL_TYPE: 'bool';
LIST_TYPE: 'list';
TUPLE_TYPE: 'tuple';
DICT_TYPE: 'dict';
SET_TYPE: 'set';
COMPLEX_TYPE: 'complex';
BYTES_TYPE: 'bytes';
TYPE_BUILTIN: 'type';

PRINT: 'print';
INPUT: 'input';
LEN: 'len';
RANGE: 'range';
SUM: 'sum';
MAX: 'max';
MIN: 'min';
ABS: 'abs';
ROUND: 'round';
OPEN: 'open';
ENUMERATE: 'enumerate';
ZIP: 'zip';
MAP: 'map';
FILTER: 'filter';
SORTED: 'sorted';

// Operadores aritmeticos
POWER: '**';
FLOOR_DIV: '//';
PLUS: '+';
MINUS: '-';
MULT: '*';
DIV: '/';
MOD: '%';
MATRIX_MULT: '@';

// Operadores relacionais
EQUAL: '==';
NOT_EQUAL: '!=';
LESS_EQUAL: '<=';
GREATER_EQUAL: '>=';
LESS_THAN: '<';
GREATER_THAN: '>';

// Simbolos de atribuicao
POWER_ASSIGN: '**=';
FLOOR_DIV_ASSIGN: '//=';
PLUS_ASSIGN: '+=';
MINUS_ASSIGN: '-=';
MULT_ASSIGN: '*=';
DIV_ASSIGN: '/=';
MOD_ASSIGN: '%=';
AND_ASSIGN: '&=';
OR_ASSIGN: '|=';
XOR_ASSIGN: '^=';
LEFT_SHIFT_ASSIGN: '<<=';
RIGHT_SHIFT_ASSIGN: '>>=';
MATRIX_ASSIGN: '@=';
WALRUS: ':=';
ASSIGN: '=';

// Operadores bit a bit
LEFT_SHIFT: '<<';
RIGHT_SHIFT: '>>';
BIT_AND: '&';
BIT_OR: '|';
BIT_XOR: '^';
BIT_NOT: '~';

// Delimitadores e pontuacao
LPAREN: '(';
RPAREN: ')';
LBRACKET: '[';
RBRACKET: ']';
LBRACE: '{';
RBRACE: '}';
COMMA: ',';
COLON: ':';
DOT: '.';
SEMI: ';';
ARROW: '->';
ELLIPSIS: '...';

// Literais
FLOAT_LITERAL: DIGIT+ '.' DIGIT* | '.' DIGIT+;
INTEGER_LITERAL: DIGIT+;
STRING_LITERAL: '"' (~["\\] | '\\' .)* '"' | '\'' (~['\\] | '\\' .)* '\'';

// Comentarios
COMMENT: '#' ~[\r\n]* -> skip;

// As regras finais devem ficar nesta ordem: identificadores, letras, digitos e espacos.
IDENTIFIER: LETTER (LETTER | DIGIT)*;
LETTER: [a-zA-Z_];
DIGIT: [0-9];
WS: [ \t\r\n]+ -> skip;
