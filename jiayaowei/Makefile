all:
	yacc -o calc1.tab.c -vd calc1.y
	lex -o calc1.lex.c -l calc1.lex
	g++ -o calc1 calc1.lex.c calc1.tab.c -lm -ll
