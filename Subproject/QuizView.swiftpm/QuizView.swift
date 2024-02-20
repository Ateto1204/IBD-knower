import SwiftUI
import Combine
import Pow

struct QuizView: View {
    @State private var showQuesA: Bool
    @State private var showQuesB: Bool
    @State var nextQuestion: Bool
    @State private var quesNo: Int
    
    @State private var animating: Bool
    @State var isCorrect: Bool
    @State var isWrong: Bool
    
    init() {
        self.showQuesA = false
        self.showQuesB = false
        self.nextQuestion = false
        self.quesNo = 0
        
        self.animating = true
        self.isCorrect = false
        self.isWrong = false
    }
    
    let questions = ["A", "B", "C", "D", "E"]
    let choices = [["a1", "a2", "a3", "a4"], 
                    ["b1", "b2", "b3", "b4"], 
                    ["c1", "c2", "c3", "c4"], 
                    ["d1", "d2", "d3", "d4"], 
                    ["e1", "e2", "e3", "e4"]]
    let answers = [0, 0, 0, 0, 0]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            if showQuesA {
                // Appear with move effect from pow package
                QuestionView(nextQues: $nextQuestion,
                             correct: $isCorrect, 
                             wrong: $isWrong, 
                             question: questions[quesNo], 
                             choices: choices[quesNo], 
                             answer: answers[quesNo])
                    .transition(
                        .asymmetric(
                            insertion: .movingParts.move(
                                angle: .degrees(5)
                            ), 
                            removal: .movingParts.poof
                        ).combined(with: .opacity)
                    )
                    .disabled(animating)
            }
            if showQuesB {
                QuestionView(nextQues: $nextQuestion,
                             correct: $isCorrect, 
                             wrong: $isWrong, 
                             question: questions[quesNo], 
                             choices: choices[quesNo], 
                             answer: answers[quesNo])
                .transition(
                    .asymmetric(
                        insertion: .movingParts.move(
                            angle: .degrees(5)
                        ), 
                        removal: .movingParts.poof
                    ).combined(with: .opacity)
                )
                .disabled(animating)
            }
            
            // Show HUD if user has answered
            if isCorrect || isWrong {
                HUD {
                    if self.isCorrect {
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                            Text("That's correct")
                                .padding(.leading, 5)
                                .foregroundColor(Color.primary)
                        }
                    } else if self.isWrong {
                        HStack {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.red)
                            Text("That's wrong, try again")
                                .padding(.leading, 5)
                        }
                    }
                }
                .zIndex(1)
                .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
                .padding(.bottom)
            }
        }
        .onAppear() {
            withAnimation {
                showQuesA.toggle()
            }
        }
        .onChange(of: nextQuestion) {
            withAnimation {

                // However turn off the side which is true
                let tmp = showQuesA ? true : false
                if tmp {
                    showQuesA.toggle()
                } else {
                    showQuesB.toggle()
                }

                // Turn off the side which is turned on
                if isCorrect {
                    isCorrect.toggle()
                } else if isWrong {
                    isWrong.toggle()
                }

                // Wait a minute to make poof effect from pow package not finish so quick
                DispatchQueue.main.asyncAfter(deadline: .now() + (0.4)) {
                    animating.toggle()

                    // Disable operating when move effect from pow package of the problem is animating
                    DispatchQueue.main.asyncAfter(deadline: .now() + (0.8)) {
                        withAnimation {
                            animating.toggle()
                        }
                    }

                    // Turn the move effect from pow package of the problem on going
                    withAnimation {
                        if tmp {
                            showQuesB.toggle()
                        } else {
                            showQuesA.toggle()
                        }
                    }
                }
            }
            if quesNo + 1 < questions.count {
                self.quesNo += 1
            }
        }
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + (0.8)) {
                withAnimation {
                    animating.toggle()
                }
            }
        }
    }
}

struct HUD<Content: View>: View {
    @Environment(\.colorScheme) private var colorScheme
    
    @ViewBuilder let content: Content
    
    var body: some View {
        content
            .padding(.horizontal, 12)
            .padding(16)
            .background(
                Capsule()
                    .foregroundColor(colorScheme == .dark ? Color(UIColor.secondarySystemBackground) : Color(UIColor.systemBackground))
                    .shadow(color: Color(.black).opacity(0.15), radius: 10, x: 0, y: 4)
            )
    }
}
