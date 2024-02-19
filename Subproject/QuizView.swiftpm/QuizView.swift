import SwiftUI
import Pow

struct QuizView: View {
    @State private var showQuesA: Bool
    @State private var showQuesB: Bool
    @State var nextQuestion: Bool
    @State private var quesNo: Int
    
    init() {
        self.showQuesA = false
        self.showQuesB = false
        self.nextQuestion = false
        self.quesNo = 0
    }
    
    let questions = ["A", "B", "C", "D", "E"]
    let choices = [["a1", "a2", "a3", "a4"], 
                    ["b1", "b2", "b3", "b4"], 
                    ["c1", "c2", "c3", "c4"], 
                    ["d1", "d2", "d3", "d4"], 
                    ["e1", "e2", "e3", "e4"]]
    let answers = [0, 0, 0, 0, 0]
    
    var body: some View {
        ZStack {
            if showQuesA {
                QuestionView(nextQues: $nextQuestion, 
                             question: questions[quesNo], 
                             choices: choices[quesNo], 
                             answer: answers[quesNo])
                    .transition(
                        .asymmetric(
                            insertion: .movingParts.move(
                                angle: .degrees(5)
                            ), 
                            removal: .movingParts.move(
                                angle: .degrees(-175)
                            )
                        ).combined(with: .opacity)
                    )
            }
            if showQuesB {
                QuestionView(nextQues: $nextQuestion, 
                             question: questions[quesNo], 
                             choices: choices[quesNo], 
                             answer: answers[quesNo])
                .transition(
                    .asymmetric(
                        insertion: .movingParts.move(
                            angle: .degrees(5)
                        ), 
                        removal: .movingParts.move(
                            angle: .degrees(-175)
                        )
                    ).combined(with: .opacity)
                )
            }
        }
        .onAppear() {
            withAnimation {
                showQuesA.toggle()
            }
        }
        .onChange(of: nextQuestion) {
            withAnimation {
                showQuesA.toggle()
                showQuesB.toggle()
            }
            if quesNo + 1 < questions.count {
                self.quesNo += 1
            }
        }
    }
}
