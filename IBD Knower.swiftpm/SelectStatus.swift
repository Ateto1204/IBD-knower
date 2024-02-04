import SwiftUI

class SelectStatus: ObservableObject {
    enum APPstatus {
        case HOME
        case INTRO
//        case DETAIL
//        case TEST
    }
    
    @Published var status: APPstatus = .HOME
    
    func setStatus(newStatus: APPstatus) {
        self.status = newStatus
    }
}
