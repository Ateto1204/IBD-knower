import SwiftUI
import Pow

struct Glow: View {
    @EnvironmentObject var selectStatus: SelectStatus
    
    var body: some View {
        
        Button {
            selectStatus.setStatus(newStatus: .DEMO)
        } label: {
            ZStack {
                
                Text("Glow")
                    .foregroundColor(.white)
                    .padding()
                    .background(Capsule())
            }
        }
        .conditionalEffect(
            .repeat(
                .glow(color: .blue, radius: 50), 
                every: 1.5
            ), 
            condition: true
        )
    }
}
