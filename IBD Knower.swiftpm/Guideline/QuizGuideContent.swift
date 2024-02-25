import SwiftUI

struct QuizGuideContent: View {
    var body: some View {
        VStack {
            Text("GUIDE")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.gray)
                .padding()
            Text("In this part, you have to choose the correct choices for the questions.")
                .font(.title2)
                .foregroundColor(.gray)
                .padding()
            ScrollView {
                HStack {
                    Image("quizGuide")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 360)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .shadow(radius: 4.12)
                        .padding()
                    VStack {
                        Spacer()
                        HStack {
                            Image(systemName: "hand.point.up.left.and.text.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 46)
                                .foregroundColor(.gray)
                            Text("PRESS the Correct Choice.")
                                .font(.title)
                                .bold()
                                .foregroundColor(.gray)
                                .padding()
                        }
                        .padding()
                    }
                    Spacer()
                }
            }
        }
    }
}
