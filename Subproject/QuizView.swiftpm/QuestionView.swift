import SwiftUI
import Pow

struct QuestionView: View {
    @Binding var nextQues: Bool
    @State var isAnimating = false
    
    let question: String
    let choices: [String]
    let answer: Int
    
    var body: some View {
        VStack {
            Text(question)
                .font(.title)
                .padding()
            ForEach(choices.indices) { idx in 
                Button {
                    if idx == answer {
                        isAnimating.toggle()
                        Task {
                            await nextQuestion()
                        }
                    }
                } label: {
                    Text(choices[idx])
                }
                .padding()
                .changeEffect(
                    .spray(origin: UnitPoint(x: 0.25, y: 0.5)) {
                        Image(systemName: "checkmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                            .foregroundColor(.green)
                    }, value: isAnimating)
            }
        }
    }
    
    func nextQuestion() async {
        do {
            try await Task.sleep(nanoseconds: 13 * 100_000_000)
        } catch {
            print(error)
        }
        nextQues.toggle()
    }
}
