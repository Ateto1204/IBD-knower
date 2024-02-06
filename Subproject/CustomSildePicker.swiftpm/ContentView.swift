import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in 
            SelectionView()
                .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .ignoresSafeArea()
    }
}
