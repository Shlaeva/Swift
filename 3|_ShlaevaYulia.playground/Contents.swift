import UIKit

// 1.-2. Описать несколько структур – любой легковой автомобиль и любой грузовик. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.

struct Vehicle0 {
    let type: VehicleType
    let model: String
    let yearIssue: Int
    let trunkVolume: Int
    let motorState: MotorState
    let windowState: WindowState
    let trunkVolFilled: Int
}


// 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

enum VehicleType {
    case car, truck
}

enum MotorState {
    case start, turnoff
}

enum WindowState {
    case open, close
}

enum TrunkLoading {
    case load, unload
}


// 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.

struct Vehicle {
    let type: VehicleType
    let model: String
    let yearIssue: Int
    let trunkVolume: Int
        func printtrunkVolume() {
            print("автомобиль \(model) с объемом багажника \(trunkVolume) литров")
        }
    
    var motorState: MotorState
    
        mutating func startMotor() {
            self.motorState = .start
        }
        mutating func turnoffMotor() {
            self.motorState = .turnoff
        }
        func printmotorState() {
            if motorState == MotorState.start {
                print ("в автомобиле \(model) двигатель запущен")
            } else {
                print ("в автомобиле \(model) двигатель выключен")
            }
        }
    
    var windowState: WindowState
    
        mutating func openWindow() {
            self.windowState = .open
        }
        mutating func closeWindow() {
            self.windowState = .close
        }
        func printwindowState() {
            if windowState == WindowState.close {
                print ("в автомобиле \(model) окна закрыты")
            } else {
                print ("в автомобиле \(model) окна открыты")
            }
        }
    
    var trunkVolFilled: Int {
        didSet {
            let load = trunkVolFilled - oldValue
            if trunkVolFilled >= trunkVolume {
                trunkVolFilled = trunkVolume
                print("Автомобиль \(model) загружен полностью на \(trunkVolume) литров")
            } else{
                if load > 0 {
                    print ("автомобиль \(model) дозагружен еще на \(load) литров")
                } else {
                 print ("автомобиль \(model) разгружен на \(-load) литров")
                }
            }
        }
    }
    
    func printdescription() {
        if type == VehicleType.car {
            print ("легковой автомобиль \(model), \(yearIssue) года выпуска, с максимальным объемом багажника \(trunkVolume) л заполнен на \(trunkVolFilled) л")
        } else {
            print ("грузовой автомобиль \(model), \(yearIssue) года выпуска, с максимальным объемом загруженности \(trunkVolume) л заполнен на \(trunkVolFilled) л")
        }
    }
}



// 5.-6. Инициализировать несколько экземпляров структур. Применить к ним различные действия. Вывести значения свойств экземпляров в консоль.


var Volvo = Vehicle(type: .car, model: "VolvoS90", yearIssue: 2019, trunkVolume: 500, motorState: .turnoff, windowState: .close, trunkVolFilled: 100)
Volvo.printdescription()
Volvo.openWindow()
Volvo.printwindowState()
Volvo.startMotor()
Volvo.printmotorState()



var Infiniti = Vehicle(type: .car, model: "InfinitiQ50", yearIssue: 2019, trunkVolume: 500, motorState: .start, windowState: .close, trunkVolFilled: 0)
Infiniti.printdescription()
Infiniti.trunkVolFilled = 250
Infiniti.openWindow()
Infiniti.printwindowState()



var Mercedes = Vehicle(type: .truck, model: "Mercedes-Benz_Atego_818_8t", yearIssue: 2019, trunkVolume: 4360, motorState: .turnoff, windowState: .open, trunkVolFilled: 4360)

Mercedes.trunkVolFilled = 3600
Mercedes.trunkVolFilled = 5600
Mercedes.printmotorState()
Mercedes.printdescription()






