import UIKit

// 1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.


enum Engine: String {
    case on = "двигатель заведен"
    case off = "двигатель заглушен"
}

enum DoorState: String {
    case open = "двери открыты"
    case close = "двери закрыты"
}



class Car {
    let model: String
    let yearIssue: Int
    let trunkVolume: Int
    var engine: Engine
    var doorState: DoorState
    
    init (model: String, yearIssue: Int, trunkVolume: Int, engine: Engine, doorState: DoorState) {
        self.model = model
        self.yearIssue = yearIssue
        self.trunkVolume = trunkVolume
        self.engine = engine
        self.doorState = doorState
   
    }
        
    func actionEngine (action: Engine) {
        switch action {
        case .on:
            self.engine = .on
        case .off:
            self.engine = .off
        }
        print(engine.rawValue)
    }
    
    func actionDoor (action: DoorState) {
        switch action {
        case .open:
            self.doorState = .open
        case .close:
            self.doorState = .close
        }
        print(doorState.rawValue)
    }
            
}



// 2.-3.-4. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.     Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.    В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.




enum HatchState: CustomStringConvertible {
    case open, close
    var description: String {
        switch self {
        case .open:
            return "люк открыт"
        case .close:
            return "люк закрыт"
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

enum LightState: CustomStringConvertible {
    case on, off
        
    var description: String {
        switch self {
        case .on:
            return "фары включены"
        case .off:
            return "фары выключены"
        }
    }
}

enum TrunkLoading: CustomStringConvertible {
    case load, unload
    var description: String {
        switch self {
        case .load:
            return "багажник загружен на "
        case .unload:
            return "багажник разгружен на "
        }
    }
    
}


enum Action {
    case switchHatchState (HatchState)
    case switchLightState (LightState)
}




class sportsCar: Car {
    var hatchState: HatchState
    var lightState: LightState
    init (model: String, yearIssue: Int, trunkVolume: Int, engine: Engine, doorState: DoorState, hatchState: HatchState, lightState: LightState) {
        self.hatchState = hatchState
        self.lightState = lightState
        super.init (model: model, yearIssue: yearIssue, trunkVolume: trunkVolume, engine: engine, doorState: doorState)
    }
    
    func printHatchState () {
        print(self.hatchState)
    }
    
    func description () {
        print ("Спортивный автомобиль \(model), \(yearIssue) года выпуска, \(engine.rawValue), \(doorState.rawValue), \(hatchState)")
    }
    
    func perform (action: Action) {
           switch action {
           case .switchHatchState (let status):
               hatchState = status
               print(self.hatchState)
           case .switchLightState(let status):
                lightState = status
                print(self.lightState)
            
           }
       }

    
    
    override func actionDoor(action: DoorState) {
        super.actionDoor(action: doorState)
        switch action {
            case .open:
                self.doorState = .open
            print("Не забудьте закрыть двери после осмотра")
            case .close:
                self.doorState = .close
            }
            print(doorState.rawValue)
        }

    
}


class trunkCar: Car {
    var windowState: WindowState
    var trunkFilled: Int
    init (model: String, yearIssue: Int, trunkVolume: Int, engine: Engine, doorState: DoorState, windowState: WindowState, trunkFilled: Int) {
        self.windowState = windowState
        self.trunkFilled = trunkFilled
        super.init (model: model, yearIssue: yearIssue, trunkVolume: trunkVolume, engine: engine, doorState: doorState)
    }
    

    
    override func actionEngine(action: Engine) {
        super.actionEngine(action: engine)
        switch action {
            case .on:
                self.engine = .on
                print("Заглушите мотор после осмотра")
            case .off:
                self.engine = .off
            
            }
            print(engine.rawValue)
    }
    

    
    func description () {
        print ("Легковой автомобиль \(model), \(yearIssue) года выпуска, с максимальным объемом багажника \(trunkVolume) л заполнен на \(trunkFilled) л, \(engine.rawValue), \(doorState.rawValue), \(windowState)")
    }
    
}



// 5.-6. Создать несколько объектов каждого класса. Применить к ним различные действия. Вывести значения свойств экземпляров в консоль.

var Porsh = sportsCar (model: "Porsh_911_Speedster", yearIssue: 2019, trunkVolume: 125, engine: .on, doorState: .close, hatchState: .open, lightState: .off)

Porsh.description()
Porsh.printHatchState()
Porsh.actionDoor(action: .open)
Porsh.perform(action: .switchLightState(.on))



var Infiniti = trunkCar (model: "InfinitiQ50", yearIssue: 20019, trunkVolume: 500, engine: .off, doorState: .open, windowState: .open, trunkFilled: 200)
    
Infiniti.description()
Infiniti.actionDoor(action: .open)
Infiniti.actionEngine(action: .on)

