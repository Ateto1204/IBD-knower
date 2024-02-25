import SwiftUI

struct Guideline<Content: View>: View {
    @EnvironmentObject var selectStatus: SelectStatus
    @State var showGuide: Bool = false
    let guidePages: Int
    @Binding var guidePage: Int
    
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
                        GuidelineView(showGuide: $showGuide, guidePages: guidePages, guidePage: $guidePage) {
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
    let guidePages: Int
    @Binding var guidePage: Int
    
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
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        withAnimation {
                            if guidePage < guidePages {
                                guidePage += 1
                            } else {
                                guidePage = 1
                                showGuide = false
                            }
                        }
                    } label: {
                        Text(guidePage < guidePages ? "CONTINUE" : "GOT IT")
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: 95.6, height: 16)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10.9)
                                .foregroundColor(Color(uiColor: .systemBlue))
                                .shadow(radius: 3.2))
                    }
                    Spacer()
                }
                .padding()
                .background(Color(selectStatus.bgColor))
            }
            
        }
        .background(Color(selectStatus.bgColor))
        .ignoresSafeArea()
        .onAppear() {
            guidePage = 1
        }
    }
}
