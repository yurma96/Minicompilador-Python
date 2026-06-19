@echo off
:: ==============================================================================
:: Add env var PATH to "Scripts" Python for this to work
:: without needing to specify the full path to the antlr4-parse command.
:: ==============================================================================

:: Set ANTLR version to avoid connection errors
set ANTLR4_TOOLS_ANTLR_VERSION=4.13.2

:: Navigate into the grammar folder
cd grammar

echo.
echo === Compiling grammar to Python ===
antlr4 -Dlanguage=Python3 -no-listener -visitor *.g4
echo Files generated successfully!
echo.

:: Return to the root folder when finished
cd ..