#!/bin/bash

yacc -d -v *.y
lex *.l
gcc *.c -g -lm -c
gcc *.o -lm -g -o x
