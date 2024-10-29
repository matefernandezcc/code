COBOL_SRC = Cobol/binarySearch.cbl
COBOL_BIN = Cobol/binarySearch

COBOL_SRC2 = Cobol/sort.cbl
COBOL_BIN2 = Cobol/sort

COBOL_SRC10 = Cobol/bubbleSort-10.cbl
COBOL_BIN10 = Cobol/bubbleSort-10

COBOL_SRC10MIL = Cobol/bubbleSort-10mil.cbl
COBOL_BIN10MIL = Cobol/bubbleSort-10mil 

TS_SRC = Typescript/binarySearch.ts
TS_BIN = Typescript/binarySearch.js

TS_SRC2 = Typescript/sort.ts
TS_BIN2 = Typescript/sort.js

TS_SRC10 = Typescript/bubbleSort-10.ts
TS_BIN10 = Typescript/bubbleSort-10.js

TS_SRC10MIL = Typescript/bubbleSort-10mil.ts
TS_BIN10MIL = Typescript/bubbleSort-10mil.js

all: binaria sort 

binaria: Cobol-binaria TS-binaria

sort: Cobol-sort TS-sort

Cobol-binaria:
	cobc -free -x -o $(COBOL_BIN) $(COBOL_SRC)

TS-binaria:
	tsc $(TS_SRC)

Cobol-sort:
	cobc -free -x -o $(COBOL_BIN10) $(COBOL_SRC10)
	cobc -free -x -o $(COBOL_BIN10MIL) $(COBOL_SRC10MIL)
	cobc -free -x -o $(COBOL_BIN2) $(COBOL_SRC2)

TS-sort:
	tsc $(TS_SRC10)
	tsc $(TS_SRC10MIL)
	tsc $(TS_SRC2)

clean:
	rm -f $(COBOL_BIN) $(TS_BIN)
	rm -f $(COBOL_BIN10) $(TS_BIN10)
	rm -f $(COBOL_BIN10MIL) $(TS_BIN10MIL)
	rm -f $(COBOL_BIN2) $(TS_BIN2)
