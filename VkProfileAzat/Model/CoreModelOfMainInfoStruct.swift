import Foundation

struct CoreModelOfMainInfo: CoreVariables {
    var sectionType: CoreSections {
        return .mainInfo
    }
    var mainInfo:[MainInfo]
    
    var rowCount: Int {
        return mainInfo.count
    }
    
    var sectionName: String {
        return " "
        
    }
    
}
