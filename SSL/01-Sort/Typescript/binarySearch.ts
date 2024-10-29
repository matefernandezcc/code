// Crear un array con 1 millón de números impares
const arraySize = 1000000;
const oddNumbers: number[] = [];
let currentOddNumber = 1;

for (let i = 0; i < arraySize; i++) {
    oddNumbers.push(currentOddNumber);
    currentOddNumber += 2;
}

// Función para realizar búsqueda binaria
function binarySearch(arr: number[], target: number): number {
    let left = 0;
    let right = arr.length - 1;

    while (left <= right) {
        const mid = Math.floor((left + right) / 2);
        if (arr[mid] === target) {
            return mid; // Retorna el índice si se encuentra el objetivo
        } else if (arr[mid] < target) {
            left = mid + 1;
        } else {
            right = mid - 1;
        }
    }
    return -1; // Retorna -1 si no se encuentra el objetivo
}

// Número a buscar
const targetNumber = 777777;

// Realizar la búsqueda binaria
const index = binarySearch(oddNumbers, targetNumber);

if (index !== -1) {
    console.log(`Número ${targetNumber} encontrado en la posición ${index}.`);
} else {
    console.log(`Número ${targetNumber} no encontrado.`);
}
