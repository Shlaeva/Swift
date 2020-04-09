import UIKit

// 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.

struct queue<T: Comparable> {
    var elements: [T] = []
    mutating func push(_ element: T){
        elements.append(element)
    }
    mutating func pop() -> T? {
        print(elements[0])
        return elements.removeFirst()
    }
    
}

var foodQueue = queue<String>()
    foodQueue.push("Orange")
    foodQueue.push("Pineapple")
    foodQueue.push("Banana")
    foodQueue.push("Pomegranate")
    foodQueue.pop()
    foodQueue.pop()
    foodQueue.push("Mandarin")
    foodQueue.push("Coconut")
    foodQueue.push("Mango")
    foodQueue.pop()
    foodQueue.pop()
    foodQueue.push("Rospberry")
    foodQueue.push("Sweet Lime")
    foodQueue.push("Pineapple")
    foodQueue.push("Pomegranate")
    foodQueue.push("Banana")
    foodQueue.push("Strawberry")
    foodQueue.push("Orange")
print(foodQueue)


// 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)

extension queue {
    func filter(element: T) {
        print("it is \(elements.filter{$0 == element})")
    }
    
    mutating func propertySort() -> [T] {
        return elements.sorted(by: > )
    }
    
}

foodQueue.filter(element: "Mango")
foodQueue.propertySort()
print(foodQueue.propertySort())
foodQueue.pop()                      // почему после сортировки первый в очереди остался Мандарин?


// 3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.


extension queue {
    subscript(index: Int) -> T? {
        switch index{
        case _ where index < elements.count:
            return elements[index]
        default:
            return nil
        }
    }
}

print(foodQueue[6]!)
print(foodQueue[1]!)
print(foodQueue[9])
