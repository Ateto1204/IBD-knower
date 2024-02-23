import SwiftUI

class SelectStatus: ObservableObject {
    enum APPstatus {
        case HOME
        case INTRO
        case DETAIL
        case QUIZ
        case LIFE
    }
    
    @Published var status: APPstatus = .HOME
    @Published var themeColor = Color(red: 184/255, green: 154/255, blue: 130/255)
    @Published var bgColor = Color(red: 255/255, green: 255/255, blue: 234/255)
    var firstDisplay: [Bool] = [true, true, true, true, true]
    
    func getStatusID(status: APPstatus) -> Int {
        switch status {
        case .HOME: 
            return 0
        case .INTRO: 
            return 1
        case .DETAIL: 
            return 2
        case .QUIZ: 
            return 3
        case .LIFE: 
            return 4
        }
    }
    
    func getIfGuide(status: APPstatus) -> Bool {
        let statusID: Int = getStatusID(status: status)
        return firstDisplay[statusID]
    }
    
    func setIfGuide(status: APPstatus) {
        let statusID: Int = getStatusID(status: status)
        self.firstDisplay[statusID] = false
    }
    
    func setStatus(newStatus: APPstatus) {
        withAnimation {
            self.status = newStatus
        }
    }
}
