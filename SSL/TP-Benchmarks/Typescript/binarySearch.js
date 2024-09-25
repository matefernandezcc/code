(function () {
    function binarySearch(arr, key) {
        var low = 0;
        var high = arr.length - 1;
        while (low <= high) {
            var mid = Math.floor((low + high) / 2);
            if (arr[mid] === key) {
                return mid; // Retorna la posición encontrada
            }
            else if (arr[mid] > key) {
                high = mid - 1;
            }
            else {
                low = mid + 1;
            }
        }
        return -1; // Retorna -1 si no se encuentra el valor
    }
    // Obtener el valor de la clave desde los argumentos de la línea de comandos
    var key = parseInt(process.argv[2], 10);
    if (isNaN(key)) {
        console.error('Por favor, proporciona un número válido como clave a buscar.');
        process.exit(1);
    }
    // Inicializar el array con valores del 1 al 100000
    var array = Array.from({ length: 100000 }, function (_, i) { return i + 1; });
    console.time('binarySearch');
    var position = binarySearch(array, key);
    console.timeEnd('binarySearch');
    if (position !== -1) {
        console.log("Key found at position ".concat(position));
    }
    else {
        console.log('Key not found');
    }
})();
