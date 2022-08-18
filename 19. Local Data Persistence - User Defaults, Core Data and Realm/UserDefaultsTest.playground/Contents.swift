import UIKit
import Foundation

// 유저디폴트
/*
let defaults = UserDefaults.standard

defaults.set(0.24, forKey: "Volume")
defaults.set(true, forKey: "MusicOn")
defaults.set("Angela", forKey: "PlayerName")
defaults.set(Date(), forKey: "AppLastOpenedByUser")

let array = [1, 2, 3]
defaults.set(array, forKey: "myArray")

let dictionary = ["name": "Angela"]
defaults.set(dictionary, forKey: "myDictionary")


let volume = defaults.float(forKey: "Volume")
let appLastOpen = defaults.object(forKey: "AppLastOpenedByUser")
// optional of any data type (Any?) 를 넣을 때는 .object

let myArray = defaults.array(forKey: "myArray") as! [Int]
// .array의 리턴타입은 [Any]? - 배열 안에 어떤 타입이 오는지 모른다 - downcast 해주자(as! [Int] 처럼...)

let myDictionary = defaults.dictionary(forKey: "myDictionary")
*/




// 싱글톤


let defaults = UserDefaults.standard
let sharedURLSession = URLSession.shared

// what's special about singleton is that there is only one copy of it that can be shared across all of your classes and objects

class Car {
    var colour = "Red"
}

let myCar = Car()
myCar.colour = "Blue"

let yourCar = Car()
print(yourCar.colour) //"Red"
// yourCar와 myCar는 관련이 없다.



class Phone {
    var colour = "Red"
    
    static let singletonPhone = Phone() // 싱글톤
}

// to create a new constant that holds a reference to our singleton
let myPhone = Phone.singletonPhone
myPhone.colour = "Blue"

// to create another reference to our singleton
let youPhone = Phone.singletonPhone
print(youPhone.colour) //"Blue"

// It doesn't matter how many constants or variables, or different ways that we point towards this singletonPhone, it's always going to be the same copy.


// 다른 objects와 다른 class 안에서도 사용할 수 있다.
class A {
    init() {
        Phone.singletonPhone.colour = "Brown"
    }
}

class B {
    init() {
        print(Phone.singletonPhone.colour) //"Brown"
    }
}

let a = A()
let b = B()


