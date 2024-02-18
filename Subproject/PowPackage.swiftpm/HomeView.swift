import SwiftUI

struct HomeView: View {
    @EnvironmentObject var selectStatus: SelectStatus
    
    var body: some View {
        VStack {
            Group {
                PushDown()
                Glow()
            }
            .padding()
        }
    }
}
