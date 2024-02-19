import SwiftUI

struct QuestionView: View {
    @Binding var nextQues: Bool
    
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
                        nextQues.toggle()
                    }
                } label: {
                    Text(choices[idx])
                }
                .padding()
            }
        }
    }
}
