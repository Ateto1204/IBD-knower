import SwiftUI

struct QuizDemo: View {
    @EnvironmentObject var selectStatus: SelectStatus
    
    var body: some View {
        ZStack {
            Color(selectStatus.bgColor)
                .shadow(radius: 10)
            
            Text("Quiz Demo")
                .foregroundColor(.gray)
        }
    }
}
