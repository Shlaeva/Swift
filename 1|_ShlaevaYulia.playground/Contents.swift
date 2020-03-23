import UIKit

// 1. Решение квадратного уравнения

let a: Double = 5
let b: Double = -2
let c: Double = -9
var D: Double
var x1: Double
var x2: Double

D = b*b - 4*a*c

if D < 0 {
    print("Уравнение \(a)x^2 + \(b)x + \(c) = 0 не имеет корней")
} else {
    if D == 0 {
        x1 = -b/(2*a)
        print("Уравнение \(a)x^2 + \(b)x + \(c) = 0 имеет один корень \(x1)")
    } else {
        x1 = (-b + sqrt(D))/(2*a)
        x2 = (-b - sqrt(D))/(2*a)
        print("Уравнение \(a)x^2 + \(b)x + \(c) = 0 имеет два корня x1 = \(x1) и x2 = \(x2)")
    }
}


// 2. Площадь, периметр и гипотенуза прямоугольного треугольника по заданным двум катетам

let katetA: Double = 3
let katetB: Double = 4
var gipotenuzaC: Double
var S: Double
var P: Double

gipotenuzaC = pow(katetA,2) + pow(katetB,2)
gipotenuzaC = sqrt(gipotenuzaC)
    
S = katetA*katetB/2
P = katetA + katetB + gipotenuzaC

print("В прямоугольном треугольнике с катетами \(Int(katetA)) и \(Int(katetB)) площадь = \(Int(S)), периметр = \(Int(P)) и гипотенуза = \(Int(gipotenuzaC))")


//3* Сумма вклада через 5 лет

let deposit: Double = 1000000
let interest: Double = 9
var newdeposit: Double

newdeposit = deposit*pow((1+interest/100),5)

print("Размер вклада через 5 лет составит \(newdeposit) рублей")

