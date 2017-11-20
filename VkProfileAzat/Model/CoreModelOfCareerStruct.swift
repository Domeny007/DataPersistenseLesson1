import Foundation

struct CoreModelOfCareer: CoreVariables {
    var companyName: String
    var location: String
    var position: String
    
    var sectionType: CoreSections {
        return .career
    }
    
    var sectionName: String {
        return "Карьера"
    }
    var rowCount: Int {
        return 1
    }
}
