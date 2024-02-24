import SwiftUI

struct IntroGuideContent: View {
    var body: some View {
        VStack {
            Text("ABOUT")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.gray)
                .padding()
            ScrollView {
                HStack {
                    Image("introGuide1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 360)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .shadow(radius: 4.57)
                        .padding()
                    VStack {
                        Spacer()
                        HStack {
                            Image(systemName: "hand.draw.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 46)
                                .foregroundColor(.gray)
                            Text("SWIPE the List.")
                                .font(.title)
                                .bold()
                                .foregroundColor(.gray)
                                .padding()
                        }
                        .padding()
                    }
                    Spacer()
                }
                HStack {
                    Image("introGuide2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 360)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .shadow(radius: 4.57)
                        .padding()
                    VStack {
                        Spacer()
                        HStack {
                            
                            Image(systemName: "hand.tap.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 41)
                                .foregroundColor(.gray)
                            Text("Press the DETAIL.")
                                .font(.title)
                                .bold()
                                .foregroundColor(.gray)
                                .padding()
                        }
                        .padding()
                    }
                    Spacer()
                }
            }
        }
    }
}
