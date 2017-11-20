import Foundation

struct CoreModelOfGifts: CoreVariables {
    var sectionType: CoreSections {
        return .gifts
    }
    var sectionName: String {
        return "Подарки"
    }
    
    var rowCount: Int {
        return 1
    }
    var numberOfPresets = 20
}
