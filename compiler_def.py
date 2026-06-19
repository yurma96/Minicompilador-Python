import ast
import operator

from grammar.PythonParser import PythonParser
from grammar.PythonParserVisitor import PythonParserVisitor


class Compiler(PythonParserVisitor):
    def __init__(self, debug=False):
        super().__init__()
        self.vars = {}
        self.funcs = {}
        self.debug = debug
        self._debug_level = 0

    class ReturnValue(Exception):
        def __init__(self, value):
            self.value = value

    def visit(self, tree):
        if self.debug and hasattr(tree, "getText"):
            indent = "  " * self._debug_level
            print(
                f"{indent}{tree.__class__.__name__} "
                f"children={tree.getChildCount()} "
                f"text={tree.getText()!r}"
            )
        self._debug_level += 1
        try:
            return super().visit(tree)
        finally:
            self._debug_level -= 1

    def visitCode(self, ctx: PythonParser.CodeContext):
        result = None
        for child in ctx.children or []:
            if child.getText() != "<EOF>":
                result = self.visit(child)
        return result

    def visitBloco(self, ctx: PythonParser.BlocoContext):
        result = None
        for child in ctx.children or []:
            result = self.visit(child)
        return result

    def visitStat(self, ctx: PythonParser.StatContext):
        return self.visit(ctx.getChild(0))

    def visitAssignment(self, ctx):
        name = ctx.ids().getText()
        value = self.visit(ctx.getChild(2))
        self.vars[name] = value
        return value

    def visitReturn_stmt(self, ctx):
        value = self.visit(ctx.getChild(1)) if ctx.getChildCount() > 1 else None
        raise self.ReturnValue(value)

    def visitExpr(self, ctx: PythonParser.ExprContext):
        return self.visit(ctx.getChild(0))

    def visitOperacoesComExpressoes(self, ctx: PythonParser.OperacoesComExpressoesContext):
        result = self.visit(ctx.termo(0))
        for i, op_ctx in enumerate(ctx.operadorAritmetico(), start=1):
            right = self.visit(ctx.termo(i))
            result = self._apply_arithmetic(result, op_ctx.getText(), right)
        return result

    def visitTermo(self, ctx: PythonParser.TermoContext):
        return self.visit(ctx.getChild(0))

    def visitIds(self, ctx: PythonParser.IdsContext):
        name = ctx.getText()
        return self.vars.get(name, name)

    def visitNumeros(self, ctx: PythonParser.NumerosContext):
        text = ctx.getText()
        return float(text) if "." in text else int(text)

    def visitExpressoesEntreParenteses(self, ctx: PythonParser.ExpressoesEntreParentesesContext):
        return self.visit(ctx.expr())

    def visitQuery(self, ctx: PythonParser.QueryContext):
        return self.visit(ctx.operacoesBooleanasEntreQuerys())

    def visitOperacoesBooleanasEntreQuerys(self, ctx: PythonParser.OperacoesBooleanasEntreQuerysContext):
        result = self.visit(ctx.queryTermo(0))
        termos = list(ctx.queryTermo())
        for index in range(1, len(termos)):
            op = ctx.getChild((index * 2) - 1).getText()
            right = self.visit(termos[index])
            if op == "and":
                result = bool(result) and bool(right)
            elif op == "or":
                result = bool(result) or bool(right)
        return result

    def visitQueryTermo(self, ctx: PythonParser.QueryTermoContext):
        if ctx.NOT():
            return not bool(self.visit(ctx.queryTermo()))
        return self.visit(ctx.getChild(0))

    def visitValoresBooleanos(self, ctx: PythonParser.ValoresBooleanosContext):
        return ctx.getText() == "True"

    def visitQueryEntreParenteses(self, ctx: PythonParser.QueryEntreParentesesContext):
        return self.visit(ctx.query())

    def visitRelacoesEntreExpressoes(self, ctx: PythonParser.RelacoesEntreExpressoesContext):
        left = self.visit(ctx.expr(0))
        right = self.visit(ctx.expr(1))
        op = ctx.operadorRelacional().getText()
        return self._apply_relation(left, op, right)

    def visitConditional(self, ctx: PythonParser.ConditionalContext):
        if self.visit(ctx.query(0)):
            return self.visit(ctx.bloco(0))

        elif_count = len(ctx.ELIF())
        for index in range(elif_count):
            if self.visit(ctx.query(index + 1)):
                return self.visit(ctx.bloco(index + 1))

        if ctx.ELSE():
            return self.visit(ctx.bloco(elif_count + 1))
        return None

    def visitLoop_while(self, ctx: PythonParser.Loop_whileContext):
        result = None
        guard = 0
        while self.visit(ctx.query()):
            result = self.visit(ctx.bloco())
            guard += 1
            if guard >= 100:
                raise RuntimeError("while interrompido apos 100 iteracoes")
        return result

    def visitLoop_for(self, ctx: PythonParser.Loop_forContext):
        name = ctx.ids().getText()
        result = None
        for value in self.visit(ctx.iteravel()):
            self.vars[name] = value
            result = self.visit(ctx.bloco())
        return result

    def visitIteravel(self, ctx: PythonParser.IteravelContext):
        if ctx.RANGE():
            args = self.visit(ctx.argumentos()) if ctx.argumentos() else []
            return range(*args)
        return self.visit(ctx.getChild(0))

    def visitFunc(self, ctx: PythonParser.FuncContext):
        name = ctx.ids().getText()
        params = self.visit(ctx.parametros()) if ctx.parametros() else []
        self.funcs[name] = {"params": params, "body": ctx.bloco()}
        self.vars[name] = f"<function {name}>"
        return None

    def visitParametros(self, ctx: PythonParser.ParametrosContext):
        return [item.getText() for item in ctx.ids()]

    def visitFunc_call(self, ctx: PythonParser.Func_callContext):
        name = ctx.callableName().getText()
        args = self.visit(ctx.argumentos()) if ctx.argumentos() else []

        func = self.funcs.get(name)
        if func is not None:
            previous_vars = self.vars.copy()
            for param, value in zip(func["params"], args):
                self.vars[param] = value
            try:
                result = self.visit(func["body"])
            except self.ReturnValue as returned:
                result = returned.value
            self.vars = previous_vars
            return result

        builtin = self._get_builtin(name)
        if builtin is not None:
            return builtin(*args)

        raise NameError(f"Funcao '{name}' nao definida")

    def visitCallableName(self, ctx):
        return ctx.getText()

    def visitArgumentos(self, ctx: PythonParser.ArgumentosContext):
        values = []
        for child in ctx.children or []:
            if child.getText() != ",":
                values.append(self.visit(child))
        return values

    def visitEstruturaDados(self, ctx: PythonParser.EstruturaDadosContext):
        return self.visit(ctx.getChild(0))

    def visitString(self, ctx: PythonParser.StringContext):
        return ast.literal_eval(ctx.getText())

    def visitList(self, ctx: PythonParser.ListContext):
        return self.visit(ctx.elementos()) if ctx.elementos() else []

    def visitTuple(self, ctx: PythonParser.TupleContext):
        if not ctx.expr():
            return tuple()
        return tuple(self.visit(expr) for expr in ctx.expr())

    def visitSet(self, ctx: PythonParser.SetContext):
        return set(self.visit(ctx.elementos()))

    def visitDict(self, ctx: PythonParser.DictContext):
        return dict(self.visit(ctx.paresDict())) if ctx.paresDict() else {}

    def visitElementos(self, ctx: PythonParser.ElementosContext):
        return [self.visit(expr) for expr in ctx.expr()]

    def visitParesDict(self, ctx: PythonParser.ParesDictContext):
        return [self.visit(par) for par in ctx.parDict()]

    def visitParDict(self, ctx: PythonParser.ParDictContext):
        return self.visit(ctx.expr(0)), self.visit(ctx.expr(1))

    def _apply_arithmetic(self, left, op, right):
        operations = {
            "+": operator.add,
            "-": operator.sub,
            "*": operator.mul,
            "/": operator.truediv,
            "//": operator.floordiv,
            "%": operator.mod,
            "**": operator.pow,
        }
        return operations[op](left, right)

    def _apply_relation(self, left, op, right):
        operations = {
            "==": operator.eq,
            "!=": operator.ne,
            "<": operator.lt,
            ">": operator.gt,
            "<=": operator.le,
            ">=": operator.ge,
            "is": operator.is_,
            "isnot": operator.is_not,
            "in": lambda a, b: a in b,
            "notin": lambda a, b: a not in b,
        }
        return operations[op.replace(" ", "")](left, right)

    def _get_builtin(self, name):
        if isinstance(__builtins__, dict):
            return __builtins__.get(name)
        return getattr(__builtins__, name, None)
