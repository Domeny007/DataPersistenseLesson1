import Foundation

struct CoreModelofThreeButtons: CoreVariables {
    var sectionType: CoreSections {
        return .threeButtons
    }
    
    var sectionName: String {
        return " "
    }
    var threeButtons:[ThreeButtons]
    
    var rowCount: Int {
        return threeButtons.count
    }
}
