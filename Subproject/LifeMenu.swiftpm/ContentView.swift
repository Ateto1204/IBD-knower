import SwiftUI

struct ContentView: View {
    @EnvironmentObject var selectStatus: SelectStatus
    
    var body: some View {
        switch selectStatus.status {
        case .HOME:
            HomeView()
        case .LIFE:
            LifeMenuView()
        }
    }
}

class SelectStatus: ObservableObject {
    enum APPStatus {
        case HOME
        case LIFE
    }
    
    @Published var status: APPStatus = .HOME
    
    func setStatus(newStatus: APPStatus) {
        withAnimation {
            self.status = newStatus
        }
    }
}

struct HomeView: View {
    @EnvironmentObject var selectStatus: SelectStatus
    
    var body: some View {
        Button("START") {
            selectStatus.setStatus(newStatus: .LIFE)
        }
    }
}
