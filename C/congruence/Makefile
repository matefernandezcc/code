# Globales
CC = gcc
OUTFILE = congruencia.out
BINDIR = bin

### Reglas ###

SRC = $(wildcard src/*.c)
OBJ = $(SRC:src/%.c=obj/%.o)

CFLAGS = -Iinclude -c
LDFLAGS = -lreadline -lgmp -lm # Link against readline library and GNU Multiple Precision Arithmetic

build: makefolder $(OBJ)
	$(CC) -o $(BINDIR)/$(OUTFILE) $(OBJ) $(LDFLAGS)

debug: CFLAGS += -g
debug: build

obj/%.o: src/%.c
	$(CC) $(CFLAGS) $< -o $@

makefolder:
	mkdir -p obj $(BINDIR)

clean:
	rm -rf obj
	rm -rf $(BINDIR)
	rm -f *.out
