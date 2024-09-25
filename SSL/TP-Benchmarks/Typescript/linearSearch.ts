(function() {
    function linearSearch(arr: number[], key: number): number {
        for (let i = 0; i < arr.length; i++) {
            if (arr[i] === key) {
                return i; // Retorna la posición encontrada
            }
        }
        return -1; // Retorna -1 si no se encuentra el valor
    }

    function shuffleArray(arr: number[]): void {
        for (let i = arr.length - 1; i > 0; i--) {
            const j = Math.floor(Math.random() * (i + 1));
            [arr[i], arr[j]] = [arr[j], arr[i]]; // Intercambia los elementos
        }
    }

    // Obtener el valor de la clave desde los argumentos de la línea de comandos
    const key = parseInt(process.argv[2], 10);

    if (isNaN(key)) {
        console.error('Por favor, proporciona un número válido como clave a buscar.');
        process.exit(1);
    }

    // Inicializar el array con valores del 1 al 100,000
    const array = Array.from({ length: 100000 }, (_, i) => i + 1);

    // Desordenar el array
    shuffleArray(array);

    console.time('linearSearch');
    const position = linearSearch(array, key);
    console.timeEnd('linearSearch');
    
    if (position !== -1) {
        console.log(`Key found at position ${position}`);
    } else {
        console.log('Key not found');
    }
})();
