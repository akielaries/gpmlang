CC 		= gcc
CXX		= g++
BIN 	= gpm

all: lex parse compile

lex: lexer.l
	lex lexer.l

parse: parse.y
	yacc -v -d parse.y

libio: libio.c
	$(CC) -c -o libio.o libio.c

syntax_table: syntax_table.c
	$(CC) -o syntax_table.o s_table.c

syntax_tree: syntax_tree.c
	$(CC) -o syntax_tree.o syntax_tree.c

compile: lex.yy.c y.tab.c gpm.c
	$(CC) $^ -o $(BIN)

clean:
	rm -f *.output *yy.c y.tab* *.o $(BIN)

