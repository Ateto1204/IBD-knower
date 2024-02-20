import SwiftUI

class SelectStatus: ObservableObject {
    enum APPStatus {
        case HOME
        case DEMO
        case SPRAY
    }
    
    @Published var status: APPStatus = .HOME
    
    func setStatus(newStatus: APPStatus) {
//        withAnimation {
            self.status = newStatus
//        }
    }
}
