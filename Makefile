CXX = gcc
BIN = gpm

all: lex parse libio compile

lex: lexer.l
	lex lexer.l

parse: parse.y
	yacc -d parse.y

libio: libio.c
	$(CXX) -c -o libio.o libio.c

compile: lex.yy.c y.tab.c gpm.c libio.o
	$(CXX) $^ -o $(BIN)

clean:
	rm -f *yy.c y.tab* *.o $(BIN)

