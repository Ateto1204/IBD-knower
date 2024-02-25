import SwiftUI

struct QuitView: View {
    @EnvironmentObject var selectStatus: SelectStatus
    @State var isAlert: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button {
                        isAlert.toggle()
                    } label: {
                        Image(systemName: "rectangle.portrait.and.arrow.right.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 22)
                            .foregroundColor(.white)
                            .rotationEffect(.degrees(180))
                            .offset(x: -3.1)
                            .background(RoundedRectangle(cornerRadius: 7.2)
                                .foregroundColor(.gray)
                                .frame(width: 40.7, height: 40.7))
                            .padding()
                    }
                    .shadow(radius: 1.5)
                    .padding()
                    .sheet(isPresented: $isAlert) {
                        QuitCheckView(isAlert: $isAlert)
                    }
                    Spacer()
                }
                .padding()
                Spacer()
            }
        }
    }
}


struct QuitCheckView: View {
    @EnvironmentObject var selectStatus: SelectStatus
    @Binding var isAlert: Bool
    
    var body: some View {
        ZStack {
            Color(selectStatus.bgColor)
            
            VStack {
                HStack {
                    Spacer()
                    Button {
                        isAlert = false
                    } label: {
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 28)
                            .foregroundColor(.gray)
                            .shadow(radius: 0.76)
                    }
                    .padding()
                }
                .padding()
                Spacer()
            }
            
            VStack {
                VStack {
                    Text("QUIT the Game ?")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.gray)
                    Text("You have to start over next time.")
                        .foregroundColor(.gray)
                        .padding()
                }
                
                HStack(spacing: 34) {
                    Button {
                        isAlert = false
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: 67.3, height: 16)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10.9)
                                .foregroundColor(Color(uiColor: .systemBlue))
                                .shadow(radius: 3.2))
                    }
                    
                    Button {
                        selectStatus.setStatus(newStatus: .HOME)
                    } label: {
                        Text("Sure")
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: 67.3, height: 16)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10.9)
                                .foregroundColor(Color(uiColor: .systemGray))
                                .shadow(radius: 3.2))
                    }
                }
                .padding()
            }
        }
    }
}
