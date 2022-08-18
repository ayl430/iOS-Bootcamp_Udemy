protocol CanFly {
    func fly()
}

class Bird {
    
    var isFemale = true
    
    func layEgg() {
        if isFemale {
            print("The bird makes a new bird in a shell")
        }
    }
    
//    func fly() {
//        print("The bird flaps its wings and lifts off into the sky.")
//    }
}

class Eagle: Bird, CanFly {
    func fly() {
        print("The eagle flaps its wings and lifts off into the sky.")
    }
    
    func soar() {
        print("The eagle glides in the air using air currents.")
    }
}

class Penguin: Bird {
    func swim() {
        print("The penguin paddle through th water.")
    }
}

struct FlyingMuseum {
    func flyingDemo(flyingObject: CanFly) {
        flyingObject.fly()
    }
}

struct AirPlane: CanFly {
    func fly() {
        print("The airplane uses its engine to lift off into the air. ")
    }
}

let myEagle = Eagle()

let myPenguin = Penguin()

let myPlane = AirPlane()

myEagle.fly()
//myPenguin.fly()
myPlane.fly()

let museum = FlyingMuseum()
museum.flyingDemo(flyingObject: myPlane)
museum.flyingDemo(flyingObject: myPenguin)


