import SwiftUI

struct Guideline<Content: View>: View {
    @EnvironmentObject var selectStatus: SelectStatus
    @State var showGuide: Bool = true
    
    @ViewBuilder let content: Content
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    showGuide.toggle()
                } label: {
                    Image(systemName: "questionmark.app.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 37)
                        .foregroundColor(.gray)
                        .opacity(0.76)
                        .padding()
                        .shadow(radius: 1.3)
                }
                .padding()
                .sheet(isPresented: $showGuide) {
                    ZStack {
                        Color(selectStatus.bgColor)
                        GuidelineView(showGuide: $showGuide) {
                            content
                        }
                    }
                }
            }
            .padding()
            Spacer()
        }
    }
}

struct GuidelineView<Content: View>: View {
    @EnvironmentObject var selectStatus: SelectStatus
    @Binding var showGuide: Bool
    
    @ViewBuilder let content: Content
    
    var body: some View {
        ZStack {
            Color(selectStatus.bgColor)
            
            VStack {
                HStack {
                    Spacer()
                    Button {
                        showGuide.toggle()
                    } label: {
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 28)
                            .foregroundColor(.gray)
                            .padding()
                            .shadow(radius: 0.76)
                    }
                    .padding()
                }
                .padding()
                Spacer()
            }
            
            content
                .padding()
            
        }
        .ignoresSafeArea()
    }
}
