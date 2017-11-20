import Foundation

struct CoreModelOfStatus: CoreVariables {
    var sectionType: CoreSections {
        return .status
    }
    
    var sectionName: String {
        return " "
    }
    
    var rowCount: Int {
        return 1
    }
    var status: String
}
