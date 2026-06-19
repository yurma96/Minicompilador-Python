if "." in __name__:
    from .PythonParser import PythonParser
    from .PythonParserVisitor import PythonParserVisitor
else:
    from PythonParser import PythonParser
    from PythonParserVisitor import PythonParserVisitor

class Compiler(PythonParserVisitor):

    def __init__(self):
        super(Compiler, self).__init__()
        self.vars = {}
        return None
    
    # Paste here all methods in PythonParserVisitor.py file

del (PythonParser, PythonParserVisitor)
