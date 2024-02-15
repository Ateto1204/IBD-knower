import SwiftUI
import Pow

struct PushDownButtonStyle: ButtonStyle {
    @EnvironmentObject var selectStatus: SelectStatus
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(selectStatus.themeColor)
            .padding(.vertical, 12)
            .padding(.horizontal, 64)
            .opacity(configuration.isPressed ? 0.75 : 1)
            .conditionalEffect(
                .pushDown, 
                condition: configuration.isPressed
            )
    }
}
