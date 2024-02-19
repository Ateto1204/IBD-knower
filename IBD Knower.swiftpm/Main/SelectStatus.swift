import SwiftUI

class SelectStatus: ObservableObject {
    enum APPstatus {
        case HOME
        case INTRO
        case DETAIL
        case QUIZ
    }
    
    @Published var status: APPstatus = .HOME
    @Published var themeColor = Color(red: 184/255, green: 154/255, blue: 130/255)
    @Published var bgColor = Color(red: 255/255, green: 255/255, blue: 234/255)
    
    func setStatus(newStatus: APPstatus) {
        withAnimation {
            self.status = newStatus
        }
    }
}
