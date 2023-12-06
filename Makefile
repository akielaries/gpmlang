CXX = g++
BIN = gpm

all: lex parse compile

lex: lexer.l
	lex lexer.l

parse: parse.y
	yacc -d parse.y

compile: lex.yy.c y.tab.c gpm.c
	$(CXX) $^ -o $(BIN)

clean:
	rm -f *yy.c y.tab* $(BIN)

