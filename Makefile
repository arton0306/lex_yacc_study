all:
	lex test.lex && g++ lex.yy.c -o lex_testor

run:
	./lex_testor < lex_test_input
