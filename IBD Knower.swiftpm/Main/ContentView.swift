import SwiftUI

struct ContentView: View {
    @EnvironmentObject var selectStatus: SelectStatus
    
    var body: some View {
        GeometryReader { geometry in 
            switch selectStatus.status {
            case .HOME:
                HomeView()
            case .INTRO:
                SelectionView()
            }
        }
        .ignoresSafeArea()
    }
}
