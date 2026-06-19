# 🐍 Mini-Compilador com ANTLR4 e Python
# 🐍 Mini-Compilador com ANTLR4 e Python

Este projeto consiste no desenvolvimento de um **mini-compilador pedagógico inspirado em Python**, criado com o objetivo de compreender melhor as principais fases de funcionamento de um compilador.

O compilador utiliza **ANTLR4** para a definição da gramática e geração automática do Lexer e do Parser. A lógica de interpretação e execução é implementada em **Python**, através da classe `Compiler` no ficheiro `compiler_def.py`.

---

## 🎯 Objetivo do Projeto

O principal objetivo deste trabalho é construir um compilador simples capaz de reconhecer um subconjunto da linguagem Python, validar a sua sintaxe e executar instruções básicas.

Através deste projeto, é possível compreender conceitos como:

* Análise léxica
* Análise sintática
* Árvore de parsing
* Análise semântica
* Interpretação de código
* Funcionamento de gramáticas formais com ANTLR4
* Uso do padrão Visitor para percorrer a árvore sintática

---

## 🏗️ Estrutura do Compilador

O funcionamento do compilador segue um pipeline dividido em etapas.

### 1. Análise Léxica

Nesta fase, o código-fonte é dividido em tokens, como identificadores, números, strings, operadores, palavras-chave e símbolos.

O Lexer é gerado automaticamente pelo ANTLR4 a partir das regras definidas em:

```txt
grammar/PythonLexer.g4
```

### 2. Análise Sintática

O Parser recebe os tokens gerados pelo Lexer e verifica se estes seguem corretamente as regras sintáticas da linguagem.

Caso o código esteja correto, é construída uma Parse Tree, que representa a estrutura do programa.

O Parser é definido em:

```txt
grammar/PythonParser.g4
```

### 3. Síntese / Interpretação

A classe `Compiler`, definida em `compiler_def.py`, herda de `PythonParserVisitor` e percorre a árvore sintática.

Durante essa visita, o compilador avalia expressões, guarda variáveis, executa condicionais, loops, funções e chamadas built-in como `print`, `len`, `sum` e `range`.

O fluxo geral é:

```txt
_sourceCode.txt
      ↓
PythonLexer
      ↓
PythonParser
      ↓
Parse Tree
      ↓
Compiler.visit(tree)
      ↓
Execução em Python
```

---

## ⚙️ Tecnologias Utilizadas

* Python
* ANTLR4
* antlr4-python3-runtime
* Visual Studio Code
* Git e GitHub

---

## 🧩 Funcionalidades da Linguagem

A linguagem suporta as seguintes funcionalidades:

* Atribuição de variáveis
* Expressões aritméticas
* Expressões entre parênteses
* Inteiros e floats
* Strings
* Listas
* Tuplos
* Sets
* Dicionários
* Expressões booleanas
* Relações entre expressões
* Estruturas condicionais `if`, `elif` e `else`
* Ciclos `while`
* Ciclos `for`
* Definição de funções com `def`
* Chamadas de função
* `return`
* Built-ins como `print`, `len`, `sum` e `range`

---

## 🧪 Exemplo de Código

Exemplo de programa em `_sourceCode.txt`:

```python
x = 10
y = 3.5
z = x + y

def square(n):
    return n ** 2

result = square(x)

if result > 50:
    print(result)
else:
    print(z)

i = 0
while i < 3:
    i = i + 1

for k in range(5):
    print(k)
```

Saída esperada:

```txt
100
0
1
2
3
4
```

---

## ▶️ Como Executar

### 1. Instalar dependências

```powershell
py -m pip install antlr4-python3-runtime
py -m pip install antlr4-tools
```

### 2. Gerar os ficheiros do ANTLR4

Dentro da pasta `grammar`:

```powershell
cd grammar
& "C:\Users\rodri\AppData\Roaming\Python\Python314\Scripts\antlr4.exe" -Dlanguage=Python3 -no-listener -visitor *.g4
```

Este comando gera ficheiros como:

```txt
PythonLexer.py
PythonParser.py
PythonParserVisitor.py
PythonLexer.tokens
PythonParser.tokens
```

### 3. Executar o compilador

Na raiz do projeto:

```powershell
py compiler.py _sourceCode.txt
```

### 4. Executar em modo debug

Para visualizar os contextos `ctx` visitados:

```powershell
py compiler.py _sourceCode.txt --debug
```

---

## 📁 Organização do Projeto

```txt
Minicompilador-Python/
├── README.md
├── compiler.py
├── compiler_def.py
├── _sourceCode.txt
├── docs/
│   └── python_lexer_elements.md
└── grammar/
    ├── PythonLexer.g4
    ├── PythonParser.g4
    ├── PythonLexer.py
    ├── PythonParser.py
    └── PythonParserVisitor.py
```

---

## 📌 Conclusão

Este projeto permitiu aplicar, de forma prática, os conceitos fundamentais de compiladores.

Com a utilização do ANTLR4, foi possível automatizar a criação do Lexer e do Parser, focando o desenvolvimento na interpretação da linguagem através de Python.

O mini-compilador desenvolvido demonstra, de forma simples, como uma linguagem pode ser analisada, validada e executada a partir de uma gramática formal.

---

## 👥 Autores

* Yurma Afonso
* Rodrigo Pires
* João Neves