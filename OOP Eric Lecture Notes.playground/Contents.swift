//: Playground - noun: a place where people can play

import UIKit

class Home {
    var streetNumber: Int
    var streetName: String
    
    init(streetNumber: Int, streetName: String) {
        self.streetNumber = streetNumber  //"self." refers to the "var" inside "class"
        self.streetName = streetName
    }
    
    func receivesMail(timeOfDay: String) {
        print("\(self.streetNumber) \(self.streetName) receives mail in the \(timeOfDay).")
    }
}

let myHome = Home(streetNumber: 210, streetName: "Hong Kong Way")
let yourHome = Home(streetNumber: 123, streetName: "Kowloon Street")

myHome.receivesMail(timeOfDay: "morning")
yourHome.receivesMail(timeOfDay: "afternoon")

yourHome.streetNumber = 9999
yourHome.receivesMail(timeOfDay: "afternoon")
