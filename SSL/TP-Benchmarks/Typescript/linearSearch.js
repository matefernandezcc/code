(function () {
    function linearSearch(arr, key) {
        for (var i = 0; i < arr.length; i++) {
            if (arr[i] === key) {
                return i; // Retorna la posición encontrada
            }
        }
        return -1; // Retorna -1 si no se encuentra el valor
    }
    function shuffleArray(arr) {
        var _a;
        for (var i = arr.length - 1; i > 0; i--) {
            var j = Math.floor(Math.random() * (i + 1));
            _a = [arr[j], arr[i]], arr[i] = _a[0], arr[j] = _a[1]; // Intercambia los elementos
        }
    }
    // Obtener el valor de la clave desde los argumentos de la línea de comandos
    var key = parseInt(process.argv[2], 10);
    if (isNaN(key)) {
        console.error('Por favor, proporciona un número válido como clave a buscar.');
        process.exit(1);
    }
    // Inicializar el array con valores del 1 al 100,000
    var array = Array.from({ length: 100000 }, function (_, i) { return i + 1; });
    // Desordenar el array
    shuffleArray(array);
    console.time('linearSearch');
    var position = linearSearch(array, key);
    console.timeEnd('linearSearch');
    if (position !== -1) {
        console.log("Key found at position ".concat(position));
    }
    else {
        console.log('Key not found');
    }
})();
