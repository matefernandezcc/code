all:
	cd ./compilador && \
	flex *.lex && \
	bison -d *.y && \
	gcc lex.yy.c parser.tab.c -lfl -o ./../parser.out

clean:
	cd ./compilador && rm *.c *.h ./../*.out

comp:
	make clean && make
