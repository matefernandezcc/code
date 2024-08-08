(function() {
    function binarySearch(arr: number[], key: number): number {
        let low = 0;
        let high = arr.length - 1;

        while (low <= high) {
            const mid = Math.floor((low + high) / 2);
            if (arr[mid] === key) {
                return mid; // Retorna la posición encontrada
            } else if (arr[mid] > key) {
                high = mid - 1;
            } else {
                low = mid + 1;
            }
        }
        return -1; // Retorna -1 si no se encuentra el valor
    }

    // Obtener el valor de la clave desde los argumentos de la línea de comandos
    const key = parseInt(process.argv[2], 10);

    if (isNaN(key)) {
        console.error('Por favor, proporciona un número válido como clave a buscar.');
        process.exit(1);
    }

    // Inicializar el array con valores del 1 al 100000
    const array = Array.from({ length: 100000 }, (_, i) => i + 1);

    console.time('binarySearch');
    const position = binarySearch(array, key);
    console.timeEnd('binarySearch');
    
    if (position !== -1) {
        console.log(`Key found at position ${position}`);
    } else {
        console.log('Key not found');
    }
})();
