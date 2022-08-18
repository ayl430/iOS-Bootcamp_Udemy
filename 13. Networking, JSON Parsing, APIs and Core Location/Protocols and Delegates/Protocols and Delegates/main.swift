

protocol AdvancedLifeSupport {
    func perfromCPR()
}

class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport?
    
    func assessSituation() {
        print("Can you tell me what happened?")
    }
    
    func medicalEmergency() {
        delegate?.perfromCPR()
    }
}

struct Paramedic: AdvancedLifeSupport {
    func perfromCPR() {
        print("The paramedic does chest compressions, 30 per second.")
    }
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
}


let emilio = EmergencyCallHandler()
//let pete = Paramedic(handler: emilio)


class Doctor: AdvancedLifeSupport {
    func perfromCPR() {
        print("The doctor does chest compressions, 30 per second.")
    }
    
    func useStethescope() {
        print("Listening for heart sounds")
    }
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
}

class Surgeon: Doctor {
    override func perfromCPR() {
        super.perfromCPR()
        print("Sings staying alive by the BeeGees")
    }
    
    func useElectricDrill() {
        print("whirr...")
    }
}

let angela = Surgeon(handler: emilio)

emilio.assessSituation()
emilio.medicalEmergency()


