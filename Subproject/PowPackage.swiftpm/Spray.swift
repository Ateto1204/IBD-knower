import SwiftUI
import Pow

struct Spray: View {
    @EnvironmentObject var selectStatus: SelectStatus
    
    var body: some View {
        Button {
            selectStatus.setStatus(newStatus: .SPRAY)
        } label: {
            Text("Spray")
                .foregroundColor(.white)
                .background(Capsule().frame(width: 150, height: 50))
        }
    }
}

struct SprayView: View {
    @State var isLiked = false
    var body: some View {
        ZStack {
            Color.clear
            
            Button {
                isLiked.toggle()
            } label: {
                Label("test", systemImage: "heart.fill")
            }
            .changeEffect(
                .spray(origin: UnitPoint(x: 0.25, y: 0.5)) {
                    Image(systemName: "heart.fill")
                        .foregroundStyle(.red)
                }, value: isLiked)
            .tint(isLiked ? .red: .gray)
        }
    }
}
