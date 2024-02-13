import SwiftUI

struct HomeView: View {
    @EnvironmentObject var selectStatus: SelectStatus
    
    var body: some View {
        GeometryReader { geometry in 
            VStack {
                Spacer()
                    .frame(height: geometry.size.height * 0.21)
                Text("IBD KNOWER")
                    .foregroundColor(.white)
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
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                                .bold()
                        }
                    }
                    Spacer()
                        .frame(width: geometry.size.width * 0.1)
                    
                    Button {
                        
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
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                                .bold()
                        }
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}
