import SwiftUI

struct ContentView: View {
    @State var status = 0
    
    var body: some View {
        ZStack {
            if status == 0 {
                Button("START") {
                    self.status = 1
                }
            } else if status == 1 {
                QuizView()
            }
        }
    }
}
