import SwiftUI

struct WrongTipView: View {
    @Binding var isPressed: Bool
    
    let title: String
    let description: String
    
    var body: some View {
        ZStack {
            VStack {
                Group {
                    Text(title)
                        .font(.largeTitle)
                        .bold()
                    Text(description)
                }
                .foregroundColor(.gray)
                .padding()
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 68)
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70)
                        .foregroundColor(.red)
                }
                .padding()
                .shadow(radius: 4.3)
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        isPressed = false
                    } label: {
                        Text("TRY AGAIN")
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: 92.6, height: 16)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10.9)
                                .foregroundColor(Color(uiColor: .systemBlue))
                                .shadow(radius: 3.2))
                    }
                    Spacer()
                }
                .padding()
            }
        }
    }
}
