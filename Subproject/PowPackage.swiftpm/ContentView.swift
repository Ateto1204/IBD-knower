import SwiftUI
import Pow

struct ContentView: View {
    @EnvironmentObject var selectStatus: SelectStatus
    @State var num = 0
    
    var body: some View {
        switch selectStatus.status {
        case .HOME:
            HomeView()
        case .DEMO:
            demoView()
        }
    }
}

struct demoView: View {
    @EnvironmentObject var selectStatus: SelectStatus
    
    var body: some View {
        ZStack {
            Button("Back") {
                selectStatus.setStatus(newStatus: .HOME)
            }
            .buttonStyle(PushDownButtonStyle())
        }
    }
}
