import SwiftUI

struct Guideline<Content: View>: View {
    @EnvironmentObject var selectStatus: SelectStatus
    @State var showGuide: Bool = false
    
    @ViewBuilder let content: Content
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    self.showGuide = true
                } label: {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25)
                        Image(systemName: "questionmark.app.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 37)
                            .foregroundColor(.gray)
                            .shadow(radius: 1.3)
                    }
                    .padding()
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
                .onChange(of: showGuide) {
                    selectStatus.setIfGuide(status: selectStatus.status)
                }
            }
            .padding()
            Spacer()
        }
        .onAppear() {
            let ifGuide = selectStatus.getIfGuide(status: selectStatus.status)
            if ifGuide {
                self.showGuide = true
            }
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
                        showGuide = false
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
            
            content
                .padding()
            
        }
        .ignoresSafeArea()
    }
}
