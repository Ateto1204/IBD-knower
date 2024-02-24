import SwiftUI

struct ContentView: View {
    @State var status: Int = 0
    @State private var isGuiding: Bool = true
    
    var body: some View {
        ZStack {
            Color.white
            
            if status == 0 {
                Button("START") {
                    self.status = 1
                }
                .disabled(isGuiding)
            } else if status == 1 {
                QuizView(status: $status)
            }
            
            if isGuiding {
                ZStack {
                    Rectangle()
                        .foregroundColor(.red)
                        .opacity(0.25)
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 250, height: 250)
                    VStack {
                        Text("GUIDE")
                            .foregroundColor(.black)
                            .padding()
                        Button("Got it ") {
                            withAnimation {
                                isGuiding.toggle()
                            }
                        }
                        
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}
