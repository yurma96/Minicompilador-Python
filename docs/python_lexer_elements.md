# Elementos Lexicos do Python

Esta fase regista operadores, simbolos e palavras importantes para a construcao do lexer do mini compilador de Python.

## 1. Simbolos

### 1.1 Operadores Aritmeticos

| Simbolo | Significado |
|---|---|
| `+` | soma |
| `-` | subtracao |
| `*` | multiplicacao |
| `/` | divisao |
| `//` | divisao inteira |
| `%` | modulo/resto |
| `**` | exponenciacao |
| `@` | multiplicacao de matrizes |

### 1.2 Operadores Relacionais

| Simbolo | Significado |
|---|---|
| `==` | igual a |
| `!=` | diferente de |
| `<` | menor que |
| `>` | maior que |
| `<=` | menor ou igual |
| `>=` | maior ou igual |

Tambem existem operadores relacionais escritos como palavras:

| Palavra | Significado |
|---|---|
| `is` | identidade |
| `is not` | nao identidade |
| `in` | pertence a |
| `not in` | nao pertence a |

### 1.3 Operadores Booleanos

| Palavra | Significado |
|---|---|
| `and` | E logico |
| `or` | OU logico |
| `not` | NAO logico |

### 1.4 Simbolos de Atribuicao

| Simbolo | Significado |
|---|---|
| `=` | atribuicao simples |
| `+=` | soma e atribui |
| `-=` | subtrai e atribui |
| `*=` | multiplica e atribui |
| `/=` | divide e atribui |
| `//=` | divisao inteira e atribui |
| `%=` | modulo e atribui |
| `**=` | exponenciacao e atribui |
| `&=` | AND bit a bit e atribui |
| `|=` | OR bit a bit e atribui |
| `^=` | XOR bit a bit e atribui |
| `<<=` | deslocamento a esquerda e atribui |
| `>>=` | deslocamento a direita e atribui |
| `@=` | multiplicacao de matrizes e atribui |
| `:=` | operador walrus, atribuicao em expressao |

### 1.5 Simbolos Identificadores de Tipos de Dados

Em Python, os tipos geralmente sao identificados por nomes/classes built-in, nao por simbolos especiais.

| Tipo | Exemplo |
|---|---|
| `int` | `10` |
| `float` | `3.14` |
| `str` | `"texto"` |
| `bool` | `True`, `False` |
| `list` | `[1, 2, 3]` |
| `tuple` | `(1, 2)` |
| `dict` | `{"nome": "Ana"}` |
| `set` | `{1, 2, 3}` |
| `NoneType` | `None` |

### 1.6 Simbolo Identificador de Inicio de Bloco

| Simbolo | Uso |
|---|---|
| `:` | indica o inicio de um bloco |

Exemplo:

```python
if x > 0:
    print(x)
```

Em Python, o bloco tambem depende da indentacao. Por isso, um lexer de Python pode gerar tokens como `INDENT` e `DEDENT`.

## 2. Palavras

### 2.1 Palavras Identificadoras de Blocos

| Palavra | Uso |
|---|---|
| `if` | bloco condicional |
| `elif` | condicao alternativa |
| `else` | caso contrario |
| `for` | repeticao |
| `while` | repeticao |
| `def` | definicao de funcao |
| `class` | definicao de classe |
| `try` | tratamento de erro |
| `except` | captura de erro |
| `finally` | bloco final |
| `with` | bloco de contexto |
| `match` | selecao por padrao |
| `case` | caso dentro de `match` |

### 2.2 Tipos de Dados

Estes nomes representam tipos de dados comuns em Python.

Importante: `int`, `float`, `str`, `list`, `dict`, entre outros, nao sao palavras reservadas. Eles sao nomes built-in.

| Palavra | Tipo |
|---|---|
| `int` | inteiro |
| `float` | decimal |
| `str` | texto |
| `bool` | booleano |
| `list` | lista |
| `tuple` | tupla |
| `dict` | dicionario |
| `set` | conjunto |
| `complex` | numero complexo |
| `bytes` | sequencia de bytes |

### 2.3 Funcoes Built-in

Built-ins sao funcoes, tipos e objetos que o Python disponibiliza automaticamente, sem precisar de `import`.

Exemplo:

```python
print("Ola")
nome = input("Nome: ")
tamanho = len(nome)
numero = int("10")
```

No exemplo acima, `print`, `input`, `len` e `int` sao built-ins.

Algumas funcoes built-in importantes para o mini compilador:

```txt
print, input, len, range, type, int, float, str, bool,
list, tuple, dict, set, sum, max, min, abs, round,
open, enumerate, zip, map, filter, sorted
```

Lista mais completa de built-ins:

```txt
abs, aiter, all, anext, any, ascii, bin, bool, breakpoint,
bytearray, bytes, callable, chr, classmethod, compile, complex,
delattr, dict, dir, divmod, enumerate, eval, exec, filter,
float, format, frozenset, getattr, globals, hasattr, hash,
help, hex, id, input, int, isinstance, issubclass, iter,
len, list, locals, map, max, memoryview, min, next, object,
oct, open, ord, pow, print, property, range, repr, reversed,
round, set, setattr, slice, sorted, staticmethod, str, sum,
super, tuple, type, vars, zip, __import__
```

Para o lexer, os built-ins podem ser classificados como `IDENTIFIER` ou como um tipo proprio, por exemplo `BUILTIN_FUNCTION`, dependendo da decisao do grupo.

### 2.4 Operadores Booleanos

```txt
and
or
not
```

Tambem relacionados com comparacao logica:

```txt
is
in
```

### 2.5 Demais Palavras-chave

Palavras reservadas do Python:

```txt
False, None, True, and, as, assert, async, await, break,
class, continue, def, del, elif, else, except, finally,
for, from, global, if, import, in, is, lambda, nonlocal,
not, or, pass, raise, return, try, while, with, yield
```

Palavras contextuais, tambem chamadas soft keywords:

```txt
match, case, type, _
```

Elas so funcionam como palavras especiais em certos contextos.

## 3. Diferenca Entre Palavra Reservada e Built-in

Uma palavra reservada nao pode ser usada como nome de variavel.

Exemplo invalido:

```python
if = 10
```

Um built-in pode aparecer como nome conhecido do Python, mas tecnicamente ainda e um identificador.

Exemplo valido, mas nao recomendado:

```python
print = "texto"
```

Neste caso, o nome `print` deixa de apontar para a funcao built-in original naquele escopo.

Para o mini compilador, uma decisao simples e:

| Categoria | Exemplos | Token sugerido |
|---|---|---|
| Palavra reservada | `if`, `while`, `def` | `KEYWORD` |
| Built-in | `print`, `len`, `int` | `BUILTIN` ou `IDENTIFIER` |
| Nome criado pelo programador | `idade`, `total` | `IDENTIFIER` |

## 4. Fontes

- Documentacao oficial do Python: Lexical Analysis
- Documentacao oficial do Python: Built-in Functions

