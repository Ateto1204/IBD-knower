import SwiftUI

struct HomeView: View {
    @EnvironmentObject var selectStatus: SelectStatus
    
    @State var guidePage: Int = 1
    
    var body: some View {
        GeometryReader { geometry in 
            ZStack {
                Color(selectStatus.bgColor)
                    .blur(radius: 6)
                
                Guideline(guidePages: 2, guidePage: $guidePage) {
                    HomeGuideContent(guideStep: $guidePage)
                }
                
                VStack {
                    Spacer()
                        .frame(height: geometry.size.height * 0.21)
                    Image(systemName: "house.fill")
                        .foregroundColor(.gray)
                    Text("IBD KNOWER")
                        .foregroundColor(.gray)
                        .font(.system(size: 41))
                        .bold()
                    Spacer()
                        .frame(height: geometry.size.height * 0.13)
                    HStack {
                        Spacer()
                        Button {
                            selectStatus.setStatus(newStatus: .INTRO)
                        } label: {
                            VStack(spacing: 16) {
                                ZStack {
                                    Rectangle()
                                        .frame(width: geometry.size.height * 0.28, height: geometry.size.height * 0.28)
                                        .cornerRadius(15)
                                    Image(systemName: "books.vertical")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: geometry.size.height * 0.14)
                                        .foregroundColor(.white)
                                }
                                Text("INTRODUCTION")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 26))
                                    .bold()
                            }
                        }
                        .shadow(radius: 7.2)
                        .buttonStyle(PushDownButtonStyle())
                        
                        Spacer()
                            .frame(width: geometry.size.width * 0.1)
                        
                        Button {
                            selectStatus.setStatus(newStatus: .QUIZ)
                        } label: {
                            VStack(spacing: 16) {
                                ZStack {
                                    Rectangle()
                                        .frame(width: geometry.size.height * 0.28, height: geometry.size.height * 0.28)
                                        .cornerRadius(15)
                                    Image(systemName: "figure.cooldown")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: geometry.size.width * 0.08)
                                        .foregroundColor(.white)
                                }
                                Text("WARM UP")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 26))
                                    .bold()
                            }
                        }
                        .shadow(radius: 7.2)
                        .buttonStyle(PushDownButtonStyle())
                        
                        Spacer()
                    }
                    Spacer()
                }
            }
        }
    }
}


