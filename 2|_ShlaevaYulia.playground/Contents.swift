import UIKit

// 1. Функция, которая определяет, четное число или нет

func evenNumber(Number n: Int) -> String {
    let a = n % 2
    if a == 0{
      return "Четное"
    } else {
    return "Нечетное"
    }
}
for i in 0...4 {
print("Число " + String(i) + " " + evenNumber(Number: i))
}

print("  ")




// 2. Функция, которая определяет, делится ли число на 3 без остатка

func NumberDevidedByThree(Number n: Int) -> String {
    let a = n % 3
    if a == 0{
      return "кратное 3"
    } else {
    return "не кратное 3"
    }
}
for i in 2...6 {
print("Число " + String(i) + " " + NumberDevidedByThree(Number: i))
}

print("  ")




// 3. Возрастающий массив из 100 чисел

var Array: [Int] = []
for i in 1...100 {
Array.append(i)
}
print("Возрастающий массив из 100 чисел:   \(Array)")

print("  ")




// 4. Удалить из массива все четные и не кратные 3

for (_, value) in Array.enumerated() {
    if evenNumber(Number: value) == "Четное"{
        Array.remove(at: Array.firstIndex(of: value)!)
    }
    else if NumberDevidedByThree(Number: value) == "не кратное 3" {
        Array.remove(at: Array.firstIndex(of: value)!)
    }
}
print("Исходный массив без четных и не кратных 3 чисел: \(Array)")

print("  ")




// 5*. функция, которая добавляет в массив числа Фибоначчи (в регении почему-то выдает массив максимум из 93 чисел Фибоначчи)

func FibonacciArray(Quantity q: Int) -> [Int] {
    var ArrayFibonacci: [Int] = [0, 1]
    
    while ArrayFibonacci.count < q {
        let newElement = ArrayFibonacci[ArrayFibonacci.count-1] + ArrayFibonacci[ArrayFibonacci.count-2]
        ArrayFibonacci.append(newElement)
    }
 return ArrayFibonacci
}
print("Массив, состоящий из чисел Фибоначчи: \(FibonacciArray(Quantity: 93))")

print("   ")




// 6*. Массив из 100 простых чисел

var ArraySimple: [Int] = [2,3,5,7,11,13,17,19,23]
for number in 2...545{
    
    if number % 2 > 0 && number % 3 > 0 && number % 5 > 0 && number % 7 > 0 && number % 11 > 0 && number % 13 > 0 && number % 17 > 0 && number % 19 > 0 && number % 23 > 0{
        ArraySimple.append(number)
    }
}
ArraySimple.count

print("Массив из 100 простых чисел: \(ArraySimple)")
