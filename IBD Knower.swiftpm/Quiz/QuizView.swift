import SwiftUI
import Combine
import Pow

struct QuizView: View {
    @EnvironmentObject var selectStatus: SelectStatus
    @State var guidePage: Int = 1
    
    @State private var showQuesA = false
    @State private var showQuesB = false
    @State var nextQuestion = false
    @State private var quesNo = 0
    @State private var quesClear = false
    
    @State private var animating = true
    @State var isCorrect = false
    @State var isWrong = false
    
    let questions = ["What is \"IBD\" ?", 
                     "What exactly causes IBD ?", 
                     "Which of the following is a symptom directly caused by IBD ?", 
                     "Smoking is beneficial for which of the following ?", 
                     "Which one is more effected by IBD ?"]
    let choices = [["Inborn Errors of Bile Metabolism", 
                    "Inflammatory Bowel Disease", 
                    "Inflammatory Bowel Disorder", 
                    "Initial Business Development"], 
                   ["Diet", 
                    "Stress", 
                    "Immune system malfunction", 
                    "Still unknown"], 
                   ["Joint pain", 
                    "Dehydration", 
                    "Bloody stools", 
                    "Bowel obstruction"], 
                   ["Ulcerative colitis (UC)", 
                    "Crohn's disease", 
                    "Both", 
                    "Neither"], 
                   ["Decline in quality of life", 
                    "Depression", 
                    "Huge medical expenses", 
                    "All of the above"]]
    let answers = [1, 3, 2, 0, 3]
    
    var body: some View {
        ZStack {
            Color(selectStatus.themeColor)
            
            if !quesClear {
                Guideline(guidePages: 1, guidePage: $guidePage) {
                    QuizGuideContent()
                }
            }
            
            ZStack(alignment: .bottom) {
                
                if showQuesA {
                    // Appear with move effect from pow package
                    QuestionView(nextQues: $nextQuestion,
                                 correct: $isCorrect, 
                                 wrong: $isWrong, 
                                 animating: $animating, 
                                 question: questions[quesNo], 
                                 choices: choices[quesNo], 
                                 answer: answers[quesNo], 
                                 quesNo: quesNo)
                    .transition(
                        .asymmetric(
                            insertion: .movingParts.move(
                                angle: .degrees(5)
                            ), 
                            removal: .movingParts.poof
                        ).combined(with: .opacity)
                    )
                    .padding()
                    .disabled(animating)
                }
                if showQuesB {
                    QuestionView(nextQues: $nextQuestion,
                                 correct: $isCorrect, 
                                 wrong: $isWrong, 
                                 animating: $animating, 
                                 question: questions[quesNo], 
                                 choices: choices[quesNo], 
                                 answer: answers[quesNo], 
                                 quesNo: quesNo)
                    .transition(
                        .asymmetric(
                            insertion: .movingParts.move(
                                angle: .degrees(5)
                            ), 
                            removal: .movingParts.poof
                        ).combined(with: .opacity)
                    )
                    .padding()
                    .disabled(animating)
                }
                if quesClear {
                    VStack(spacing: 23) {
                        Group {
                            Text("CLEAR !")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(Color(uiColor: .systemGray4))
                            Image(systemName: "hands.clap.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 65)
                                .foregroundColor(.gray)
                            Button {
                                selectStatus.setStatus(newStatus: .LIFE)
                            } label: {
                                Text("NEXT")
                                    .foregroundColor(.white)
                                    .frame(width: 47.3, height: 16)
                                    .bold()
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 18)
                                        .foregroundColor(Color(uiColor: .systemBlue))
                                            .shadow(radius: 3.2))
                            }
                        }
                        .padding()
                    }
                    .background(RoundedRectangle(cornerRadius: 21)
                        .foregroundColor(.white)
                        .frame(width: 450, height: 350)
                        .shadow(radius: 12))
                }
                
                // Show HUD if user has answered
                if isCorrect || isWrong {
                    HUD {
                        if self.isCorrect {
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                                    .background(Circle()
                                        .foregroundColor(.white))
                                Text("That's correct")
                                    .padding(.leading, 5)
                                    .foregroundColor(selectStatus.themeColor)
                            }
                        } else if self.isWrong {
                            HStack {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.red)
                                    .background(Circle()
                                        .foregroundColor(.white))
                                Text("That's wrong, try again")
                                    .padding(.leading, 5)
                                    .foregroundColor(selectStatus.themeColor)
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
                    withAnimation {
                        if tmp {
                            showQuesA.toggle()
                        } else {
                            showQuesB.toggle()
                        }
                    }
                    
                    // Turn off the side which is turned on
                    if isCorrect {
                        isCorrect.toggle()
                    } else if isWrong {
                        isWrong.toggle()
                    }
                    
                    // Wait a minute to make poof effect from pow package not finish so quick
                    DispatchQueue.main.asyncAfter(deadline: .now() + (0.6)) {
                        animating.toggle()
                        
                        // Disable do any operation when move effect from pow package of the problem is animating
                        DispatchQueue.main.asyncAfter(deadline: .now() + (1.1)) {
                            withAnimation {
                                animating.toggle()
                            }
                        }
                        
                        // Turn the move effect from pow package of the problem on going
                        self.quesNo += 1
                        if quesNo < questions.count {
                            withAnimation {
                                if tmp {
                                    showQuesB.toggle()
                                } else {
                                    showQuesA.toggle()
                                }
                            }
                        } else {
                            withAnimation {
                                self.showQuesA = false
                                self.showQuesB = false
                                self.quesClear = true
                            }
                        }
                    }
                }
            }
            .onAppear() {
                DispatchQueue.main.asyncAfter(deadline: .now() + (0.8)) {
                    withAnimation {
                        animating.toggle()
                    }
                }
            }
            .padding()
        }
    }
}

struct HUD<Content: View>: View {
    @Environment(\.colorScheme) public var colorScheme
    @EnvironmentObject private var selectStatus: SelectStatus
    @ViewBuilder let content: Content
    
    var body: some View {
        content
            .padding(.horizontal, 12)
            .padding(16)
            .background(
                Capsule()
                    .foregroundColor(selectStatus.bgColor)
                    .shadow(color: Color(.black).opacity(0.15), radius: 10, x: 0, y: 4)
            )
            .opacity(0.8)
    }
}
