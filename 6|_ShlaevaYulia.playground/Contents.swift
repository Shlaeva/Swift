import UIKit

// 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.

struct queue<T> {
    var elements: [T] = []
    mutating func push(_ element: T){
        elements.append(element)
    }
    mutating func pop() -> T? {
        return elements.removeFirst()
    }
    
}

var foodQueue = queue<String>()
foodQueue.push("Orange")
foodQueue.push("Pineapple")
foodQueue.push("Banana")
foodQueue.push("Pomegranate")
print(foodQueue)
foodQueue.pop()
print(foodQueue)
foodQueue.pop()
print(foodQueue)
foodQueue.push("Mandarin")
print(foodQueue)
foodQueue.push("Coconut")
foodQueue.push("Mango")
print(foodQueue)
foodQueue.pop()
print(foodQueue)
foodQueue.pop()
print(foodQueue)
foodQueue.push("Rospberry")
foodQueue.push("Sweet Lime")
foodQueue.push("Pineapple")
foodQueue.push("Pomegranate")
foodQueue.push("Banana")
foodQueue.push("Strawberry")
foodQueue.push("Orange")
print(foodQueue)


// 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)






// 3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.




