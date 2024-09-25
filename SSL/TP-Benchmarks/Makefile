COBOL_SRC = Cobol/binarySearch.cbl
COBOL_BIN = Cobol/binarySearch
COBOL_SRC2 = Cobol/linearSearch.cbl
COBOL_BIN2 = Cobol/linearSearch

TS_SRC = Typescript/binarySearch.ts
TS_BIN = Typescript/binarySearch.js
TS_SRC2 = Typescript/linearSearch.ts
TS_BIN2 = Typescript/linearSearch.js

all: binaria lineal

lineal: Cobol-lineal TS-lineal

binaria: Cobol-binaria TS-binaria

Cobol-binaria:
	cobc -free -x -o $(COBOL_BIN) $(COBOL_SRC)

TS-binaria:
	tsc $(TS_SRC)

Cobol-lineal:
	cobc -free -x -o $(COBOL_BIN2) $(COBOL_SRC2)

TS-lineal:
	tsc $(TS_SRC2)

clean:
	rm -f $(COBOL_BIN) $(TS_BIN)
	rm -f $(COBOL_BIN2) $(TS_BIN2)

list:
	@echo "COBOL Executable: $(COBOL_BIN) and $(COBOL_BIN2)"
	@echo "TypeScript Output: $(TS_BIN) and $(TS_BIN2)"
