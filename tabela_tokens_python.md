# Tabela de Símbolos e Palavras-chave Python

Este documento regista os principais símbolos, operadores, 
palavras-chave, tipos de dados e funções built-in do Python, 
com o objetivo de servir como base para a construção de um mini compilador/lexer.

---

# 1. Símbolos

## 1.1 Operadores Aritméticos

| Símbolo | Nome | Exemplo |
|---|---|---|
| `+` | Adição | `a + b` |
| `-` | Subtração | `a - b` |
| `*` | Multiplicação | `a * b` |
| `/` | Divisão | `a / b` |
| `//` | Divisão inteira | `a // b` |
| `%` | Resto da divisão / módulo | `a % b` |
| `**` | Exponenciação | `a ** b` |
| `@` | Multiplicação de matrizes | `a @ b` |
| `+` | Mais unário | `+a` |
| `-` | Menos unário | `-a` |

---

## 1.2 Operadores Relacionais

| Símbolo | Nome | Exemplo |
|---|---|---|
| `==` | Igualdade | `a == b` |
| `!=` | Diferença | `a != b` |
| `>` | Maior que | `a > b` |
| `<` | Menor que | `a < b` |
| `>=` | Maior ou igual | `a >= b` |
| `<=` | Menor ou igual | `a <= b` |

---

## 1.3 Operadores Booleanos

| Palavra | Nome | Exemplo |
|---|---|---|
| `and` | E lógico | `a > 0 and b > 0` |
| `or` | Ou lógico | `a > 0 or b > 0` |
| `not` | Negação lógica | `not ativo` |

---

## 1.4 Operadores de Pertença e Identidade

| Palavra | Nome | Exemplo |
|---|---|---|
| `in` | Pertence a | `x in lista` |
| `not in` | Não pertence a | `x not in lista` |
| `is` | Mesma identidade | `x is None` |
| `is not` | Identidade diferente | `x is not None` |

---

## 1.5 Operadores Bit a Bit

| Símbolo | Nome | Exemplo |
|---|---|---|
| `&` | E bit a bit | `a & b` |
| `\|` | Ou bit a bit | `a \| b` |
| `^` | XOR bit a bit | `a ^ b` |
| `~` | Negação bit a bit | `~a` |
| `<<` | Deslocamento à esquerda | `a << 1` |
| `>>` | Deslocamento à direita | `a >> 1` |

---

## 1.6 Símbolos de Atribuição

| Símbolo | Nome | Exemplo |
|---|---|---|
| `=` | Atribuição simples | `x = 5` |
| `+=` | Adição e atribuição | `x += 3` |
| `-=` | Subtração e atribuição | `x -= 2` |
| `*=` | Multiplicação e atribuição | `x *= 4` |
| `/=` | Divisão e atribuição | `x /= 2` |
| `//=` | Divisão inteira e atribuição | `x //= 2` |
| `%=` | Resto e atribuição | `x %= 3` |
| `**=` | Exponenciação e atribuição | `x **= 2` |
| `@=` | Multiplicação de matrizes e atribuição | `x @= y` |
| `&=` | E bit a bit e atribuição | `x &= y` |
| `\|=` | Ou bit a bit e atribuição | `x \|= y` |
| `^=` | XOR bit a bit e atribuição | `x ^= y` |
| `>>=` | Deslocamento à direita e atribuição | `x >>= 1` |
| `<<=` | Deslocamento à esquerda e atribuição | `x <<= 1` |
| `:=` | Expressão de atribuição / walrus operator | `if (n := len(lista)) > 0:` |

---

## 1.7 Símbolos Identificadores de Tipos de Dados

| Símbolo | Nome | Exemplo |
|---|---|---|
| `"` ou `'` | String | `"Olá"` ou `'Olá'` |
| `"""` ou `'''` | String multilinha | `"""texto"""` |
| `[]` | Lista | `[1, 2, 3]` |
| `()` | Tupla | `(1, 2, 3)` |
| `{}` | Dicionário vazio | `{}` |
| `{}` | Conjunto | `{1, 2, 3}` |
| `:` | Separador chave/valor em dicionário | `{"nome": "Ana"}` |
| `,` | Separador de elementos | `[1, 2, 3]` |
| `j` | Número complexo | `3 + 2j` |
| `b""` | Bytes | `b"abc"` |
| `f""` | F-string | `f"Olá {nome}"` |
| `r""` | Raw string | `r"C:\pasta\ficheiro"` |

---

## 1.8 Símbolos de Bloco e Estrutura

| Símbolo/Token | Nome | Exemplo |
|---|---|---|
| `:` | Indica início de bloco | `if x > 0:` |
| `NEWLINE` | Mudança de linha lógica | Fim de uma instrução |
| `INDENT` | Início de bloco indentado | Linha com espaços à esquerda |
| `DEDENT` | Fim de bloco indentado | Volta à indentação anterior |
| `#` | Comentário | `# Isto é um comentário` |
| `\` | Continuação de linha | `x = 1 + \` |
| `;` | Separador de instruções na mesma linha | `x = 1; y = 2` |

---

# 2. Palavras

## 2.1 Palavras Identificadoras de Blocos

| Palavra | Nome | Exemplo |
|---|---|---|
| `if` | Início de bloco condicional | `if x > 0:` |
| `elif` | Condição alternativa | `elif x == 0:` |
| `else` | Caso contrário | `else:` |
| `for` | Ciclo for | `for i in range(5):` |
| `while` | Ciclo while | `while x < 10:` |
| `def` | Definição de função | `def soma(a, b):` |
| `class` | Definição de classe | `class Pessoa:` |
| `try` | Bloco de tentativa | `try:` |
| `except` | Bloco de exceção | `except ValueError:` |
| `finally` | Bloco final | `finally:` |
| `with` | Bloco de contexto | `with open("ficheiro.txt") as f:` |
| `async` | Bloco ou função assíncrona | `async def main():` |
| `match` | Estrutura de pattern matching | `match valor:` |
| `case` | Caso dentro de match | `case 1:` |

---

## 2.2 Tipos de Dados / Classes Built-in

Estas palavras não são palavras-chave reservadas, mas são nomes built-in usados para representar ou converter tipos de dados.

| Palavra | Nome | Exemplo |
|---|---|---|
| `int` | Número inteiro | `x = int(3.5)` |
| `float` | Número real | `x = float("3.14")` |
| `str` | Texto/string | `x = str(10)` |
| `bool` | Booleano | `x = bool(1)` |
| `list` | Lista | `x = list([1, 2, 3])` |
| `tuple` | Tupla | `x = tuple([1, 2])` |
| `dict` | Dicionário | `x = dict(nome="Ana")` |
| `set` | Conjunto | `x = set([1, 2, 3])` |
| `frozenset` | Conjunto imutável | `x = frozenset([1, 2])` |
| `complex` | Número complexo | `x = complex(1, 2)` |
| `bytes` | Sequência de bytes | `x = bytes([65, 66])` |
| `bytearray` | Array de bytes modificável | `x = bytearray(b"abc")` |
| `memoryview` | Visualização de memória | `x = memoryview(b"abc")` |
| `None` | Ausência de valor | `x = None` |
| `True` | Valor booleano verdadeiro | `ativo = True` |
| `False` | Valor booleano falso | `ativo = False` |

---

## 2.3 Funções Built-in

| Palavra | Nome | Exemplo |
|---|---|---|
| `print` | Imprime valores | `print("Olá")` |
| `input` | Lê entrada do utilizador | `nome = input("Nome: ")` |
| `len` | Retorna o tamanho | `len(lista)` |
| `type` | Retorna o tipo do objeto | `type(x)` |
| `range` | Cria uma sequência numérica | `range(5)` |
| `abs` | Valor absoluto | `abs(-3)` |
| `sum` | Soma elementos | `sum([1, 2, 3])` |
| `min` | Menor valor | `min(lista)` |
| `max` | Maior valor | `max(lista)` |
| `round` | Arredonda valor | `round(3.1415, 2)` |
| `sorted` | Ordena elementos | `sorted(lista)` |
| `open` | Abre ficheiros | `open("ficheiro.txt")` |
| `enumerate` | Enumera elementos | `enumerate(lista)` |
| `zip` | Junta iteráveis | `zip(lista1, lista2)` |
| `map` | Aplica função a elementos | `map(int, lista)` |
| `filter` | Filtra elementos | `filter(funcao, lista)` |
| `all` | Verifica se todos são verdadeiros | `all(lista)` |
| `any` | Verifica se algum é verdadeiro | `any(lista)` |
| `isinstance` | Verifica o tipo de um objeto | `isinstance(x, int)` |
| `id` | Retorna o identificador do objeto | `id(x)` |
| `dir` | Lista atributos de um objeto | `dir(objeto)` |
| `help` | Mostra ajuda | `help(print)` |

---

## 2.4 Operadores Booleanos em Forma de Palavra

| Palavra | Nome | Exemplo |
|---|---|---|
| `and` | E lógico | `x > 0 and y > 0` |
| `or` | Ou lógico | `x > 0 or y > 0` |
| `not` | Negação lógica | `not ativo` |

---

## 2.5 Demais Palavras-chave

| Palavra | Nome | Exemplo |
|---|---|---|
| `import` | Importa um módulo | `import math` |
| `from` | Importa algo específico de um módulo | `from math import pi` |
| `as` | Define um alias | `import numpy as np` |
| `in` | Verifica pertença | `x in lista` |
| `is` | Verifica identidade | `x is None` |
| `lambda` | Cria função anónima | `f = lambda x: x + 1` |
| `pass` | Instrução vazia | `pass` |
| `return` | Retorna valor de uma função | `return x` |
| `yield` | Gera valor em generator | `yield x` |
| `global` | Declara variável global | `global x` |
| `nonlocal` | Declara variável de escopo externo | `nonlocal y` |
| `assert` | Testa uma condição | `assert x > 0` |
| `break` | Interrompe um ciclo | `break` |
| `continue` | Continua para a próxima iteração | `continue` |
| `del` | Remove referência ou elemento | `del lista[0]` |
| `raise` | Lança uma exceção | `raise ValueError()` |
| `await` | Espera resultado assíncrono | `await tarefa` |

---

## 2.6 Soft Keywords

Soft keywords são palavras que só têm significado especial em certos contextos. Fora desses contextos, podem funcionar como identificadores normais.

| Palavra | Nome | Exemplo |
|---|---|---|
| `match` | Inicia pattern matching | `match valor:` |
| `case` | Define caso dentro de match | `case 1:` |
| `_` | Wildcard em pattern matching | `case _:` |
| `type` | Declara alias de tipo | `type Nome = str` |

---

# 3. Lista Completa de Palavras-chave Python

| Palavra-chave |
|---|
| `False` |
| `None` |
| `True` |
| `and` |
| `as` |
| `assert` |
| `async` |
| `await` |
| `break` |
| `class` |
| `continue` |
| `def` |
| `del` |
| `elif` |
| `else` |
| `except` |
| `finally` |
| `for` |
| `from` |
| `global` |
| `if` |
| `import` |
| `in` |
| `is` |
| `lambda` |
| `nonlocal` |
| `not` |
| `or` |
| `pass` |
| `raise` |
| `return` |
| `try` |
| `while` |
| `with` |
| `yield` |

---

# 4. Conclusão

Para a construção de um mini compilador de Python, é importante reconhecer:

- operadores aritméticos;
- operadores relacionais;
- operadores booleanos;
- operadores bit a bit;
- símbolos de atribuição;
- delimitadores de tipos de dados;
- palavras-chave;
- funções built-in;
- tokens de indentação, como `NEWLINE`, `INDENT` e `DEDENT`.

Em Python, a indentação é especialmente importante, porque define o início e o fim dos blocos de código.