import UIKit

// 1. Придумать класс, методы которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.
// 2. Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием Error.

enum ATMMachineError: Error {
    case invalidName
    case invalidPIN
    case insufficientFunds(balance: Double)
}

struct Account {
    var pin: Int
    var money: Double
}

class ATMMachine {
    var Holder = [
        "Mary O": Account(pin: 3564, money: 7000.00),
        "Leon J": Account(pin: 9078, money: 3001.77),
        "Kate M": Account(pin: 1451, money: 2658.98)
    ]
    var cashWithdraw = 0.0
    
    func withdraw(HolderNamed name: String, PINNamed pin: Int) throws {
        guard let holder = Holder[name] else{
            throw ATMMachineError.invalidName
        }
        guard pin == holder.pin else{
            throw ATMMachineError.invalidPIN
               }
        guard holder.money >= cashWithdraw else{
            throw ATMMachineError.insufficientFunds(balance: holder.money)
               }
        var newHolder = holder
        newHolder.money -= cashWithdraw
        Holder[name] = newHolder
        
        print("Withdrawing  \(cashWithdraw) from \(name) account. New balance is \(newHolder.money)")
    }
}



let attempt = ATMMachine()
attempt.cashWithdraw = 2000.00

try attempt.withdraw(HolderNamed: "Leon J", PINNamed: 9078)

do{
    try attempt.withdraw(HolderNamed: "Leon J", PINNamed: 9098)
}
catch ATMMachineError.invalidName{
    print("By this name account isn't available")
}
catch ATMMachineError.invalidPIN{
    print("You input incorrect PIN-code")
}
catch ATMMachineError.insufficientFunds(let balance){
    print("On your account insufficient funds to complete operation. Check your balance \(balance)")
}
catch{
    print("Unexpected error: \(error)")
}


try attempt.withdraw(HolderNamed: "Kate M", PINNamed: 1451)
try attempt.withdraw(HolderNamed: "Mary O", PINNamed: 3564)


do{
    try attempt.withdraw(HolderNamed: "Kate I", PINNamed: 9008)
}
catch ATMMachineError.invalidName{
    print("By this name account isn't available")
}
catch ATMMachineError.invalidPIN{
    print("You input incorrect PIN-code")
}
catch ATMMachineError.insufficientFunds(let balance){
    print("On your account insufficient funds to complete operation. Check your balance \(balance)")
}
catch{
    print("Unexpected error: \(error)")
}


do{
    try attempt.withdraw(HolderNamed: "Kate M", PINNamed: 9008)
}
catch ATMMachineError.invalidName{
    print("By this name account isn't available")
}
catch ATMMachineError.invalidPIN{
    print("You input incorrect PIN-code")
}
catch ATMMachineError.insufficientFunds(let balance){
    print("On your account insufficient funds to complete operation. Check your balance \(balance)")
}
catch{
    print("Unexpected error: \(error)")
}

attempt.cashWithdraw = 2000.00

do{
    try attempt.withdraw(HolderNamed: "Kate M", PINNamed: 1451)
}
catch ATMMachineError.invalidName{
    print("By this name account isn't available")
}
catch ATMMachineError.invalidPIN{
    print("You input incorrect PIN-code")
}
catch ATMMachineError.insufficientFunds(let balance){
    print("On your account insufficient funds to complete operation. Check your balance \(balance)")
}
catch{
    print("Unexpected error: \(error)")
}

try? attempt.withdraw(HolderNamed: "Kate M", PINNamed: 9008)
