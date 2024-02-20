import SwiftUI
import Pow


struct Move: View {
    @State var isAdded = false
    @State private var isAnimating = false
    
    var body: some View {
        VStack {
            Button {
                self.isAnimating = true
                withAnimation {
                    isAdded.toggle()
                }
                self.isAnimating = false
            } label: {
                Text("MOVE")
            }
            .disabled(isAnimating)
            MoveView(isAdded: $isAdded)
        }
    }
}

struct MoveView: View {
    @Binding var isAdded: Bool
    
    var body: some View {
        ZStack {
            Color.clear
            
            if isAdded {
                MoveDemo()
                    .transition(
                        .asymmetric(
                            insertion: .movingParts.move(
                                angle: .degrees(-45)
                            ), 
                            removal: .movingParts.move(
                                angle: .degrees(135)
                            )
                        ).combined(with: .opacity)
                    )
            }
        }
        .contentShape(Rectangle())
        .onTapGesture{
            withAnimation {
                isAdded.toggle()
            }
        }
    }
}

struct MoveDemo: View {
    var body: some View {
        Text("Move Demo")
            .foregroundColor(.blue)
    }
}
