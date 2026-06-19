# Generated from PythonParser.g4 by ANTLR 4.13.2
from antlr4 import *
if "." in __name__:
    from .PythonParser import PythonParser
else:
    from PythonParser import PythonParser

# This class defines a complete generic visitor for a parse tree produced by PythonParser.

class PythonParserVisitor(ParseTreeVisitor):

    # Visit a parse tree produced by PythonParser#code.
    def visitCode(self, ctx:PythonParser.CodeContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PythonParser#conditional.
    def visitConditional(self, ctx:PythonParser.ConditionalContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PythonParser#loop_while.
    def visitLoop_while(self, ctx:PythonParser.Loop_whileContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PythonParser#loop_for.
    def visitLoop_for(self, ctx:PythonParser.Loop_forContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PythonParser#iteravel.
    def visitIteravel(self, ctx:PythonParser.IteravelContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PythonParser#bloco.
    def visitBloco(self, ctx:PythonParser.BlocoContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PythonParser#func.
    def visitFunc(self, ctx:PythonParser.FuncContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PythonParser#parametros.
    def visitParametros(self, ctx:PythonParser.ParametrosContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PythonParser#func_call.
    def visitFunc_call(self, ctx:PythonParser.Func_callContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PythonParser#argumentos.
    def visitArgumentos(self, ctx:PythonParser.ArgumentosContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PythonParser#stat.
    def visitStat(self, ctx:PythonParser.StatContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PythonParser#expr.
    def visitExpr(self, ctx:PythonParser.ExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PythonParser#query.
    def visitQuery(self, ctx:PythonParser.QueryContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PythonParser#operacoesBooleanasEntreQuerys.
    def visitOperacoesBooleanasEntreQuerys(self, ctx:PythonParser.OperacoesBooleanasEntreQuerysContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PythonParser#queryTermo.
    def visitQueryTermo(self, ctx:PythonParser.QueryTermoContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PythonParser#valoresBooleanos.
    def visitValoresBooleanos(self, ctx:PythonParser.ValoresBooleanosContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PythonParser#queryEntreParenteses.
    def visitQueryEntreParenteses(self, ctx:PythonParser.QueryEntreParentesesContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PythonParser#relacoesEntreExpressoes.
    def visitRelacoesEntreExpressoes(self, ctx:PythonParser.RelacoesEntreExpressoesContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PythonParser#operacoesComExpressoes.
    def visitOperacoesComExpressoes(self, ctx:PythonParser.OperacoesComExpressoesContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PythonParser#termo.
    def visitTermo(self, ctx:PythonParser.TermoContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PythonParser#estruturaDados.
    def visitEstruturaDados(self, ctx:PythonParser.EstruturaDadosContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PythonParser#string.
    def visitString(self, ctx:PythonParser.StringContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PythonParser#list.
    def visitList(self, ctx:PythonParser.ListContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PythonParser#tuple.
    def visitTuple(self, ctx:PythonParser.TupleContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PythonParser#set.
    def visitSet(self, ctx:PythonParser.SetContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PythonParser#dict.
    def visitDict(self, ctx:PythonParser.DictContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PythonParser#elementos.
    def visitElementos(self, ctx:PythonParser.ElementosContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PythonParser#paresDict.
    def visitParesDict(self, ctx:PythonParser.ParesDictContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PythonParser#parDict.
    def visitParDict(self, ctx:PythonParser.ParDictContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PythonParser#ids.
    def visitIds(self, ctx:PythonParser.IdsContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PythonParser#numeros.
    def visitNumeros(self, ctx:PythonParser.NumerosContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PythonParser#expressoesEntreParenteses.
    def visitExpressoesEntreParenteses(self, ctx:PythonParser.ExpressoesEntreParentesesContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PythonParser#operadorAritmetico.
    def visitOperadorAritmetico(self, ctx:PythonParser.OperadorAritmeticoContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PythonParser#operadorRelacional.
    def visitOperadorRelacional(self, ctx:PythonParser.OperadorRelacionalContext):
        return self.visitChildren(ctx)



del PythonParser