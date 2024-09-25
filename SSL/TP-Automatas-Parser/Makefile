all:
	gcc main.c ./utils/structs.c ./utils/automata.c -o automata.out
	gcc parser.c ./utils/structs.c -o parser.out
	gcc descentParser.c ./utils/structs.c -o descentParser.out

debug:
	gcc main.c ./utils/structs.c ./utils/automata.c -o automata.out -g
	gcc parser.c ./utils/structs.c -o parser.out -g
	gcc descentParser.c ./utils/structs.c -o descentParser.out -g

clean:
	rm -rf main
	rm -rf *.out