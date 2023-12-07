CXX = gcc
BIN = gpm

all: lex parse compile

lex: lexer.l
	lex lexer.l

parse: parse.y
	yacc -v -d parse.y

libio: libio.c
	$(CXX) -c -o libio.o libio.c

compile: lex.yy.c y.tab.c gpm.c
	$(CXX) $^ -o $(BIN)

clean:
	rm -f *.output *yy.c y.tab* *.o $(BIN)

