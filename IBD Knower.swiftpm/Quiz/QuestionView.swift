import SwiftUI
import Pow

struct QuestionView: View {
    @EnvironmentObject var selectStatus: SelectStatus
    
    @Binding var nextQues: Bool
    @Binding var correct: Bool
    @Binding var wrong: Bool
    
    @State private var animateShake: Int = 0
    
    let question: String
    let choices: [String]
    let answer: Int
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            HStack {
                Spacer()
                VStack {
                    Text(question)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.gray)
                        .font(.system(size: 42))
                        .transition(.scale)
                        .lineSpacing(1.5)
                        .modifier(ShakeEffect(animatableData: CGFloat(animateShake)))
                }
                .padding()
                Spacer()
            }
            .frame(height: 250)
            .background(Color(selectStatus.bgColor))
            .cornerRadius(10)
            .padding()
            
            ForEach(choices.indices) { idx in 
                Button {
                    if idx == answer {
                        
                        // Call the HUD to display correct hint
                        withAnimation {
                            correct.toggle()
                        }
                        
                        // Wait a minute because of we do not have to display next problem right away
                        DispatchQueue.main.asyncAfter(deadline: .now() + (1.35)) {
                            nextQues.toggle()
                        }
                    } else {
                        
                        // Call the HUD to display wrong hint
                        withAnimation {
                            wrong.toggle()
                            self.animateShake += 1
                        }
                        
                        // Wait a minute and turn off HUD displaying
                        DispatchQueue.main.asyncAfter(deadline: .now() + (1.35)) {
                            withAnimation {
                                wrong.toggle()
                            } 
                        }
                    }
                } label: {
                    HStack {
                        Text(choices[idx])
                            .font(.system(size: 22))
                            .foregroundColor(Color(uiColor: .white))
                        Spacer()
                    }
                    .padding(12)
                    .background(Color(selectStatus.bgColor).opacity(0.41))
                    .cornerRadius(12)
                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                }
                .padding()
                .changeEffect(
                    .spray(origin: UnitPoint(x: 0.25, y: 0.5)) {
                        Image(systemName: "checkmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                            .foregroundColor(.green)
                    }, value: correct)
            }
            .disabled(correct || wrong)
            Spacer()
        }
    }
}

struct ShakeEffect: GeometryEffect {
    var animatableData: CGFloat
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX: 10 * sin(animatableData * .pi * CGFloat(3)), y: 0))
    }
}
