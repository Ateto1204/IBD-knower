import SwiftUI

struct LifeGuideContent: View {
    @EnvironmentObject var selectStatus: SelectStatus
    @Binding var guideStep: Int
    
    let content: String = "As a patient with IBD, you have to choose your lifestyle from the menu in this part. \n\nWhat important is you must find a point which is best for your physical and mental. \n\nAs a patient suffering from a disease, others can only see the patient's physical pain, and the psychological pressure is often ignored."
    
    var body: some View {
        VStack {
            Text("GUIDE")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.gray)
                .padding()
            TabView(selection: $guideStep) {
                ZStack {
                    Color(selectStatus.bgColor)
                    ScrollView {
                        Text(content)
                            .font(.system(size: 20.5))
                            .foregroundColor(.gray)
                            .padding()
                    }
                    .padding()
                }
                .background(Color(selectStatus.bgColor))
                .tag(1)
                
                ScrollView {
                    HStack {
                        Image("lifeGuide1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 360)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .shadow(radius: 4.12)
                            .padding()
                        VStack {
                            Spacer()
                            HStack {
                                Image(systemName: "plus.square.on.square")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 46)
                                    .foregroundColor(.gray)
                                Text("PRESS to Select Items.")
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
                        Image("lifeGuide2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 360)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .shadow(radius: 4.12)
                            .padding()
                        VStack {
                            Spacer()
                            HStack {
                                Image(systemName: "hand.point.up.left.and.text.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 46)
                                    .foregroundColor(.gray)
                                Text("SELECT your Item.")
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
                        Text("(")
                            .font(.title)
                            .bold()
                            .foregroundColor(.gray)
                            .padding(.trailing, 11)
                        Image(systemName: "dumbbell.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 46)
                            .foregroundColor(.gray)
                        Text("Physical")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.gray)
                            .padding(.trailing, 22)
                        Image(systemName: "brain.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 46)
                            .foregroundColor(.gray)
                            .padding(.leading, 22)
                        Text("Mental")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.gray)
                        Text(")")
                            .font(.title)
                            .bold()
                            .foregroundColor(.gray)
                            .padding(.leading, 11)
                    }
                    .padding()
                    
                    HStack(spacing: 8.3) {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 47)
                            .foregroundColor(.gray)
                        Text("You Must Fill Every Block to Perform.")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.gray)
                    }
                    .padding()
                        
                    HStack {
                        Image("lifeGuide3")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 360)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .shadow(radius: 4.12)
                            .padding()
                        VStack {
                            Spacer()
                            HStack {
                                Image(systemName: "hand.tap.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 46)
                                    .foregroundColor(.gray)
                                Text("Press to JUDGE.")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(.gray)
                                    .padding()
                            }
                            .padding()
                        }
                        Spacer()
                    }
                    
                    Spacer()
                        .frame(height: 65)
                }
                .background(Color(selectStatus.bgColor))
                .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        }
    }
}
