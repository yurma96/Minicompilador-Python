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
py -m pip install -r requirements.txt
```

### 2. Automação de Compilação (build.bat)

Para facilitar o desenvolvimento, disponibilizamos um script (`build.bat`) que compila rapidamente a gramática do ANTLR4 para Python. Deve correr este script sempre que fizer alterações aos ficheiros `.g4`.

**Como utilizar:**
No terminal (na pasta raiz do projeto), execute:
```powershell
.\build.bat
```

### 3. Executar o compilador

Após compilar a gramática com o `build.bat`, pode executar o interpretador na raiz do projeto:

```powershell
py compiler.py _sourceCode.txt
```

*(Opcional) Executar em modo debug para visualizar os contextos visitados:*
```powershell
py compiler.py _sourceCode.txt --debug
```

### 4. Teste Visual da Árvore Sintática (gui.bat)

Se precisar de visualizar a árvore de parsing gráfica para efeitos de depuração, utilize o script de interface gráfica (`gui.bat`).

**Como utilizar:**
1. No terminal (na pasta raiz do projeto), execute:
   ```powershell
   .\gui.bat
   ```
2. Escreva o código que pretende testar na consola.
3. Quando terminar, pressione `Ctrl+Z` e de seguida `Enter` para gerar a árvore.

### 5. Gerar os ficheiros do ANTLR4 (Manualmente)

Caso não queira usar o `build.bat`, execute dentro da pasta `grammar`:

```powershell
cd grammar
& "C:\Users\<NOME_UTILIZADOR>\AppData\Roaming\Python\Python<VERSAO>\Scripts\antlr4.exe" -Dlanguage=Python3 -no-listener -visitor *.g4
```

### 4. Executar o compilador

Na raiz do projeto:

```powershell
py compiler.py _sourceCode.txt
```

### 5. Executar em modo debug

Para visualizar os contextos `ctx` visitados:

```powershell
py compiler.py _sourceCode.txt --debug
```

---

## 📁 Organização do Projeto

```txt
Minicompilador-Python/
├── README.md
├── requirements.txt
├── compiler.py
├── compiler_def.py
├── build.bat
├── gui.bat
├── _sourceCode.txt
├── docs/
│   └── python_lexer_elements.md
└── grammar/
    ├── PythonLexer.g4
    └── PythonParser.g4
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