@echo off
:: ==============================================================================
:: Add env var PATH to "Scripts" Python for this to work
:: without needing to specify the full path to the antlr4-parse command.
:: ==============================================================================

:: Set ANTLR version to avoid connection errors
set ANTLR4_TOOLS_ANTLR_VERSION=4.13.2

:: Navigate into the grammar folder
cd grammar

echo === Starting the Parser (Visual Test) ===
echo Enter the code you want to test.
echo When finished, press Ctrl+Z and then Enter.
echo.

:: Execute the graphical test tool
antlr4-parse *.g4 code -gui

:: Return to the root folder when finished
cd ..