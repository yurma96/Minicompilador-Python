import json
import sys
import os

from antlr4 import CommonTokenStream, FileStream
from grammar.PythonLexer import PythonLexer as Lexer
from grammar.PythonParser import PythonParser as Parser
from compiler_def import Compiler


def main(argv):
    input_stream = FileStream(argv[1], encoding="utf-8")
    lexer = Lexer(input_stream)
    stream = CommonTokenStream(lexer)
    parser = Parser(stream)
    tree = parser.code()

    if parser.getNumberOfSyntaxErrors() > 0:
        print("syntax errors")
        return {}

    debug = "--debug" in argv or os.environ.get("COMPILER_DEBUG") == "1"
    compiler = Compiler(debug=debug)
    compiler.visit(tree)
    return compiler.vars


if __name__ == "__main__":
    vars = main(sys.argv)
    print("Source code vars: ", json.dumps(vars, indent=4, separators=(",", " = "), default=str))
