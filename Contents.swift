//: Playground - noun: a place where people can play

import UIKit

// creating a protocol for a vehicle:
protocol Vehicle: CustomStringConvertible { // we can also combine protocols: here we can use CustomStringConvertible . This means all types implementing this protocol also have to implement the functions and properties of that protocol as well. We can also add this Protocol to any structs or classes as well, instead of placing them here, but the point is is that protocols can be defined.
    
    // using a get, set allows us to define whether a propert is a read only property - or read-write:
    var isRunning: Bool { get set }
    
    var make: String { get set }
    var model: String { get set }
    
    // use 'mutating' if a property is likely to be mutates inside of the structure.
    mutating func start()
    mutating func stop()
}

// Make an extension implementing the Vehicle protocol:
extension Vehicle {
    
}


struct SportsCar: Vehicle {
    var isRunning: Bool = false
    
    var make: String
    var model: String
    
    var description: String {
        if isRunning {
            return "Sports car currently running"
        } else {
            return "Sports car is currently off"
        }
    }
    
    mutating func start() {
        if isRunning {
            print("already started")
        } else {
            print("Vrooom!")
        }
    }
    
    mutating func stop() {
        if isRunning {
            isRunning = false
            print("Crickets")
        } else {
            print("already turned off")
        }
    }
}

// any type can conform to a protocol:
// - using a class:

class SemiTruck: Vehicle {
    var isRunning: Bool = false
    
    var make: String
    var model: String
    
    // use an initializer to initialize the make and model properties when this class is used:
    init(isRunning: Bool, make: String, model: String) {
        self.isRunning = isRunning
        self.make = make
        self.model = model
    }
    
    var description: String {
        if isRunning {
            return "Sports car currently running"
        } else {
            return "Sports car is currently off"
        }
    }
    
    // mutating key word is not necessary because properties in a class are already mutable:
    func start() {
        if isRunning {
            print("already started")
        } else {
            print("Rumble")
        }
    }
    
    func stop() {
        if isRunning {
            isRunning = false
            print("BA BA BA!!")
        } else {
            print("already turned off")
        }
    }
    
    func blowAirHorn() {
        print("TOOOOOT :)")
    }
}

// make some instances:
var car1 = SportsCar()
var truck1 = SemiTruck()

car1.start()
truck1.start()
truck1.blowAirHorn()

car1.stop()
truck1.stop()

// make an array of vehicles:
var vehicleArray: Array<Vehicle> = [car1, truck1]

for vehicle in vehicleArray {
    // print("\(vehicle.blowAirHorn())") - unable to do this since the vehicle protool doesnt have this defined. It is ofcourse defined in the SemiTruck class. We can show how this can be done below:
    if let vehicle = vehicle as? SemiTruck {
        vehicle.blowAirHorn()
        
        // Use the protocol CustomStringConvertible that was combined with Vehicle here too:
        print(vehicle.description)
    }
    
}

