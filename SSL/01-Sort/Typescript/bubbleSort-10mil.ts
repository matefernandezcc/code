// Tamaño del array
const ARRAY_SIZE = 10000;
// Limite de elementos a mostrar
const DISPLAY_LIMIT = 5;

// Inicializar array
let array: number[] = [];
for (let i = 1; i <= ARRAY_SIZE; i++) {
    array.push(i);
}

// Función para desordenar el array (Shuffle)
function shuffleArray(arr: number[]): void {
    for (let i = arr.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [arr[i], arr[j]] = [arr[j], arr[i]]; // Intercambiar elementos
    }
}

// Función Bubble Sort
function bubbleSort(arr: number[]): void {
    let n = arr.length;
    for (let i = 0; i < n - 1; i++) {
        for (let j = 0; j < n - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                [arr[j], arr[j + 1]] = [arr[j + 1], arr[j]]; // Intercambiar elementos
            }
        }
    }
}

// Función para mostrar el array
function displayArray(arr: number[], limit: number): void {
    for (let i = 0; i < limit; i++) {
        console.log(`Elemento ${i + 1}: ${arr[i]}`);
    }
}

// Desordenar el array
shuffleArray(array);

// Mostrar los primeros 5 elementos desordenados
console.log("Array Desordenado (Primeros 5 Elementos):");
displayArray(array, DISPLAY_LIMIT);

// Ordenar el array usando Bubble Sort
bubbleSort(array);

// Mostrar los primeros 5 elementos ordenados
console.log("Array Ordenado (Primeros 5 Elementos):");
displayArray(array, DISPLAY_LIMIT);
