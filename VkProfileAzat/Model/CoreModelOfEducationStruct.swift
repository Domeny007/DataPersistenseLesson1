import Foundation

struct CoreModelOfEducation: CoreVariables {
    var sectionType: CoreSections {
        return .education
    }
    
    var sectionName: String {
        return "Образование"
    }
    var educationArray:[Education]
    
    var rowCount: Int {
        return educationArray.count
    }
}
