# 🐍 Mini-Compilador com ANTLR4 e Python

Este projeto consiste no desenvolvimento de um mini-compilador pedagógico, criado com o objetivo de compreender melhor as principais fases de funcionamento de um compilador.

O compilador utiliza ANTLR4 para a definição da gramática e geração automática do Lexer e do Parser, enquanto a lógica de análise, interpretação e/ou geração de código é implementada em Python.

## 🎯 Objetivo do Projeto

O principal objetivo deste trabalho é construir um compilador simples capaz de reconhecer uma linguagem própria, validar a sua sintaxe e executar ou traduzir instruções básicas.

Através deste projeto, é possível compreender melhor conceitos como:

Análise léxica;
Análise sintática;
Árvore de parsing;
Análise semântica;
Interpretação ou geração de código;
Funcionamento de gramáticas formais com ANTLR.

---

## 🏗️ Estrutura do Compilador

O funcionamento do compilador segue as etapas clássicas de um pipeline de compilação:

1. Análise Léxica

Nesta fase, o código-fonte é dividido em tokens, como identificadores, números, operadores, palavras-chave e símbolos.

O Lexer é gerado automaticamente pelo ANTLR a partir das regras definidas no ficheiro da gramática.

2. Análise Sintática

O Parser recebe os tokens gerados pelo Lexer e verifica se estes seguem corretamente as regras sintáticas da linguagem.

Caso o código esteja correto, é construída uma Parse Tree, que representa a estrutura do programa.

3. Análise Semântica

Nesta etapa, são feitas validações adicionais para garantir que o programa faz sentido do ponto de vista lógico.

Por exemplo, podem ser verificadas situações como o uso correto de variáveis, expressões e instruções.

4. Execução / Geração de Código

A lógica principal é implementada em Python, utilizando as classes geradas pelo ANTLR.

Através de um visitor ou listener, o programa percorre a árvore sintática e executa as instruções ou gera código intermédio/final.

---

## ⚙️ Tecnologias Utilizadas
ANTLR4 — ferramenta utilizada para gerar automaticamente o Lexer e o Parser a partir da gramática.
Python — linguagem utilizada para implementar a lógica do compilador.
Gramática .g4 — ficheiro onde são definidas as regras da linguagem criada.

---

## 🧩 Funcionalidades da Linguagem

A linguagem criada suporta várias funcionalidades básicas, tais como:

Declaração e atribuição de variáveis

Operações aritméticas básicas

Expressões com parênteses

Estruturas condicionais if / else

Ciclos while

Função de output print

Interpretação de instruções sequenciais

### 🧪 Exemplo de Código

Exemplo de um programa escrito na linguagem desenvolvida:

x = 10
y = 5
resultado = (x + y) * 2

print resultado

Neste exemplo, são declaradas duas variáveis, é calculado um resultado através de uma expressão aritmética e, no final, esse valor é apresentado no output.

## ▶️ Como Executar

Para executar o projeto, é necessário ter o Python e o ANTLR4 instalados.

1. Instalar as dependências
pip install antlr4-python3-runtime
2. Gerar os ficheiros do ANTLR
antlr4 -Dlanguage=Python3 NomeDaGramatica.g4
3. Executar o compilador
python main.py

Nota: os nomes dos ficheiros podem variar consoante a estrutura do projeto.

## 📁 Organização do Projeto

Uma possível organização dos ficheiros do projeto é:

.
├── NomeDaGramatica.g4
├── main.py
├── visitor.py
├── exemplos/
│   └── exemplo.txt
└── README.md

## 📌 Conclusão

Este projeto permitiu aplicar, de forma prática, os conceitos fundamentais de compiladores.

Com a utilização do ANTLR4, foi possível automatizar a criação do Lexer e do Parser, focando o desenvolvimento na interpretação da linguagem e na implementação da lógica em Python.

O mini-compilador desenvolvido demonstra, de forma simples, como uma linguagem pode ser analisada, validada e executada a partir de uma gramática formal.

## 👥 Autores

* Yurma Afonso
* Rodrigo Pires
* João Neves
