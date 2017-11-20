import Foundation

struct CoreModelOfContacts: CoreVariables {
    var sectionType: CoreSections {
        return .contacts
    }
    var sectionName: String {
        return "Контакты"
    }
    var contacts: [Contacts]
    
    var rowCount: Int {
        return contacts.count
    }
    
}
