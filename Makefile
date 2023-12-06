CXX = g++

BIN = gpm

lex:
	lex lex.l

parse:
	yacc -d parse.y

compile:
	$(CXX) lex.yy.c y.tab.c -o $(BIN)

clean:
	rm -f *.c *.h $(BIN)
