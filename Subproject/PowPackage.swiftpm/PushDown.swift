import SwiftUI
import Pow

struct PushDown: View {
    @EnvironmentObject var selectStatus: SelectStatus
    
    var body: some View {
        ZStack {
            Button("Push Down") {
                selectStatus.setStatus(newStatus: .DEMO)
            }
            .buttonStyle(PushDownButtonStyle())
        }
    }
}

struct PushDownButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .bold()
            .foregroundColor(.white)
            .padding(.vertical, 12)
            .padding(.horizontal, 64)
            .background(.tint, in: Capsule())
            .opacity(configuration.isPressed ? 0.75 : 1)
            .conditionalEffect(
                .pushDown, 
                condition: configuration.isPressed
            )
    }
}
