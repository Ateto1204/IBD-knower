import SwiftUI

struct HomeView: View {
    @EnvironmentObject var selectStatus: SelectStatus
    
    var body: some View {
        GeometryReader { geometry in 
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        selectStatus.setStatus(newStatus: .INTRO)
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: geometry.size.height * 0.28, height: geometry.size.height * 0.28)
                                .cornerRadius(15)
                            Text("Introduction")
                                .foregroundColor(.white)
                                .font(.system(size: 28))
                                .bold()
                        }
                    }
                    Spacer()
                        .frame(width: geometry.size.width * 0.1)
                    
                    Button {
                        
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: geometry.size.height * 0.28, height: geometry.size.height * 0.28)
                                .cornerRadius(15)
                            Text("Warm up")
                                .foregroundColor(.white)
                                .font(.system(size: 28))
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
