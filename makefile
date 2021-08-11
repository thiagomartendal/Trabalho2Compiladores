instalar-flex-bison:
	sudo apt-get install flex bison

compilar:
	flex lexico.l
	bison -d sintatico.y
	g++ main.cpp entrada.cpp analise_lexica.cpp sintatico.tab.c lex.yy.c -lfl -o Main

programa1_lexico:
	./Main -l programas/programa-lcc-1.lcc

programa2_lexico:
	./Main -l programas/programa-lcc-2.lcc

programa3_lexico:
	./Main -l programas/programa-lcc-3.lcc

programa1_sintatico:
	./Main -s programas/programa-lcc-1.lcc

programa2_sintatico:
	./Main -s programas/programa-lcc-2.lcc

programa3_sintatico:
	./Main -s programas/programa-lcc-3.lcc
