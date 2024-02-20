import SwiftUI
import Pow

struct HomeView: View {
    @EnvironmentObject var selectStatus: SelectStatus
    
    var body: some View {
        VStack {
            Group {
                PushDown()
                Glow()
                Move()
                Spray()
            }
            .padding()
        }
    }
}
