import SwiftUI

struct IntroView: View {
    @EnvironmentObject var selectStatus: SelectStatus
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                VStack {
                    Button {
                        selectStatus.setStatus(newStatus: .HOME)
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 100, height: 70)
                                .cornerRadius(10)
                            Text("BACK")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                    .padding()
                    Spacer()
                }
                
                Spacer()
                VStack {
                    Spacer()
                    Text("Intro Demo")
                        .font(.system(size: 36))
                        .bold()
                    Spacer()
                }
                Spacer()
            }
        }
    }
}
