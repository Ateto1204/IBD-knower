import SwiftUI
import Pow

struct Move: View {
    @State var isAdded = false
    
    var body: some View {
        VStack {
            Button {
                isAdded.toggle()
            } label: {
                Text("MOVE")
            }
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
