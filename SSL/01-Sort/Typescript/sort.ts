function initializeArray(): number[] {
    const arr: number[] = [];
    for (let i = 100; i >= 1; i--) {
        arr.push(i);
    }
    return arr;
}

function displayFirst5Elements(arr: number[], message: string): void {
    console.log(message);
    for (let i = 0; i < 5; i++) {
        console.log(arr[i].toString().padStart(3, '0'));
    }
}

function sortArray(arr: number[]): number[] {
    return arr.sort((a, b) => a - b);
}

// Main program
const numbers = initializeArray();

displayFirst5Elements(numbers, "First 5 elements before sorting:");

const sortedNumbers = sortArray(numbers);

displayFirst5Elements(sortedNumbers, "First 5 elements after sorting:");
