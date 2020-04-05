import UIKit

// 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.

enum Engine: CustomStringConvertible {
    case on, off
        
    var description: String {
        switch self {
        case .on:
            return "двигатель заведен"
        case .off:
            return "двигатель заглушен"
        }
    }
}

enum DoorState: CustomStringConvertible {
    case open, close
        
    var description: String {
        switch self {
        case .open:
            return "двери открыты"
        case .close:
            return "двери закрыты"
        }
    }
}

enum WindowState: CustomStringConvertible {
    case open, close
        
    var description: String {
        switch self {
        case .open:
            return "окна открыты"
        case .close:
            return "окна закрыты"
        }
    }
}

enum Action {
    case switchEngine (Engine)
    case switchDoors (DoorState)
    case switchWindows (WindowState)
}



protocol Car {
    var model: String {get}
    var yearIssue: Int {get}
    var engine: Engine {get set}
    var doorState: DoorState {get set}
    var windowState: WindowState {get set}
    
    func perform (action: Action)
    
}



// 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).

extension Car {
    
    func perform (action: Action) {
        switch action {
            case .switchEngine (_):
                print(self.engine)
            case .switchDoors(_):
                print(self.doorState)
            case .switchWindows(_):
                print(self.windowState)
            }
    }
}


// 3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.

class sportsCar: Car {
    
    var model: String
    var yearIssue: Int
    var engine: Engine
    var doorState: DoorState
    var windowState: WindowState
    var maxSpeed: Int
    var currentSpeed: Int
    
    init (model: String, yearIssue: Int, engine: Engine, doorState: DoorState, windowState: WindowState, maxSpeed: Int, currentSpeed: Int){
        self.model = model
        self.yearIssue = yearIssue
        self.engine = engine
        self.doorState = doorState
        self.windowState = windowState
        self.maxSpeed = maxSpeed
        self.currentSpeed = currentSpeed
        
    }
    
    func perform (action: Action) {
        switch action {
            case .switchEngine (let status):
                engine = status
                print(self.engine)
            case .switchDoors(let status):
                doorState = status
                print(self.doorState)
            case .switchWindows(let status):
                windowState = status
                print(self.windowState)
            }
    }
 
    func switchSpeed (speed: Int) {
        let expectedSpeed = speed + currentSpeed
        switch expectedSpeed{
            case _ where expectedSpeed >= maxSpeed:
                currentSpeed = maxSpeed
                print("Спорткар движется на максимальной скорости \(maxSpeed) км/ч")
            case _ where expectedSpeed <= 0:
                currentSpeed = 0
                print("Спорткар остановлен")
            case _ where expectedSpeed < currentSpeed:
                currentSpeed += speed
                print("Спорткар сбавил скорость до \(currentSpeed) км/ч")
            case _ where expectedSpeed > currentSpeed:
                currentSpeed += speed
                print("Спорткар увеличил скорость до \(currentSpeed) км/ч")
            default:
                break
        }
            
    }
    
}



class trunkCar: Car {
    
    var model: String
    var yearIssue: Int
    var engine: Engine
    var doorState: DoorState
    var windowState: WindowState
    var trunkVolume: Int
    var trunkFilled: Int
    
    init (model: String, yearIssue: Int, engine: Engine, doorState: DoorState, windowState: WindowState, trunkVolume: Int, trunkFilled: Int){
        self.model = model
        self.yearIssue = yearIssue
        self.engine = engine
        self.doorState = doorState
        self.windowState = windowState
        self.trunkVolume = trunkVolume
        self.trunkFilled = trunkFilled
    }
    
   func perform (action: Action) {
        switch action {
            case .switchEngine (let status):
                engine = status
                print(self.engine)
            case .switchDoors(let status):
                doorState = status
                print(self.doorState)
            case .switchWindows(let status):
                windowState = status
                print(self.windowState)
        }
    }
    
    func Loading (load: Int) {
        let expectedLoad = load + trunkFilled
        switch expectedLoad {
            case _ where expectedLoad >= trunkVolume:
                trunkFilled = trunkVolume
                print ("Цистерна загружена полностью на \(trunkVolume) л")
            case _ where expectedLoad <= 0:
                trunkFilled = 0
                print ("Цистерна разгружена полностью")
            case _ where expectedLoad < trunkFilled:
                trunkFilled += load
                print ("Цистерна разгружена до \(trunkFilled) л")
            case _ where expectedLoad > trunkFilled:
                trunkFilled += load
                print ("Цистерна дозагружена до \(trunkFilled) л")
            default:
                break
        }
    }
}



// 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.

extension sportsCar: CustomStringConvertible {

    var description: String {
        return "Спортивный автомобиль \(model), \(yearIssue) года выпуска, \(engine), \(doorState), \(windowState), максимальная скорость \(maxSpeed) км/ч, движется со коростью \(currentSpeed) км/ч"
    }
}

extension trunkCar: CustomStringConvertible {
    
    var description: String {
        return "Автомобиль-цистерна \(model), \(yearIssue) года выпуска, максимальный объем цистерны \(trunkVolume) л, цистерна заполнена на \(trunkFilled) л, \(engine), \(doorState), \(windowState)"
    }
}



// 5.-6. Создать несколько объектов каждого класса. Применить к ним различные действия.  Вывести сами объекты в консоль.


var Porsh = sportsCar (model: "Porsh_911_Speedster", yearIssue: 2019, engine: .on, doorState: .close, windowState: .open, maxSpeed: 294, currentSpeed: 120)

print(Porsh.description)
Porsh.switchSpeed(speed: 45)
Porsh.switchSpeed(speed: 300)
Porsh.switchSpeed(speed: -150)
Porsh.switchSpeed(speed: -150)
Porsh.perform(action: .switchEngine(.off))
Porsh.perform(action: .switchWindows(.close))
Porsh.perform(action: .switchDoors(.open))
print(Porsh.description)


var Pozhmashina = trunkCar (model: "Пожмашина_АЦ-10-43118", yearIssue: 2019, engine: .off, doorState: .open, windowState: .open, trunkVolume: 10000, trunkFilled: 300)

print(Pozhmashina.description)
Pozhmashina.Loading(load: 3000)
Pozhmashina.Loading(load: 3000)
Pozhmashina.Loading(load: 3000)
Pozhmashina.Loading(load: 3000)
Pozhmashina.perform(action: .switchDoors(.close))
Pozhmashina.perform(action: .switchWindows(.close))
Pozhmashina.perform(action: .switchEngine(.on))
Pozhmashina.perform(action: .switchEngine(.off))
Pozhmashina.Loading(load: -5000)
Pozhmashina.Loading(load: -5500)
