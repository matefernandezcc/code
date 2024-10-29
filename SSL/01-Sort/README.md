# 📝 Trabajo Práctico N°2: Benchmark de Ordenamiento

**Comparación de rendimiento entre COBOL y TypeScript**

---

## 🛠️ Makefile
- **`make all`**: Compila los ejecutables y los guarda en las carpetas de TypeScript y COBOL respectivamente.
- **`make clean`**: Elimina todos los ejecutables.

---

## ⏱️ Tiempos de Ejecución
Para medir el tiempo de ejecución se utilizó la función `time` de Ubuntu.

> **Nota**: El comando `time` en Linux se utiliza para determinar la duración de ejecución de un comando específico. Se usa prefijando tu comando con `time`, es decir: `time [comando]`.

---

## 📊 Resultados de Ejecución

| **Operación**                     | **Lenguaje**   | **Real**        | **User**        | **Sys**         |
|-----------------------------------|----------------|-----------------|-----------------|-----------------|
| **Sort**                          | COBOL          | `0m0.010s`       | `0m0.004s`       | `0m0.000s`       |
|                                   | TypeScript     | `0m0.049s`       | `0m0.031s`       | `0m0.010s`       |
| **Bubble Sort con 150 elementos** | COBOL          | `0m0.014s`       | `0m0.006s`       | `0m0.000s`       |
|                                   | TypeScript     | `0m0.055s`       | `0m0.033s`       | `0m0.013s`       |
| **Bubble Sort con 10 mil elementos** | COBOL       | `0m28.079s`      | `0m28.073s`      | `0m0.000s`       |
|                                   | TypeScript     | `0m0.216s`       | `0m0.203s`       | `0m0.011s`       |

---

### 🎯 Observaciones
- COBOL muestra un rendimiento significativamente más lento en operaciones con grandes volúmenes de datos, como el Bubble Sort con 10,000 elementos.
- TypeScript, aunque generalmente más lento en operaciones pequeñas, supera a COBOL en tareas más complejas.

---

💡 **Conclusión**: El lenguaje y la naturaleza del algoritmo juegan un papel crucial en el rendimiento. COBOL es más eficiente para tareas simples y pequeñas, mientras que TypeScript maneja mejor grandes volúmenes de datos.
