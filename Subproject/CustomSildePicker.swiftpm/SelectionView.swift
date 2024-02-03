import SwiftUI
import Kingfisher

struct SelectionView: View {
    
    @State var offset: CGFloat = 0
    @State var selectTitle: String = ""
    
    var body: some View {
        GeometryReader { geometry in 
            ZStack {
                Color(.gray)
                ZStack(alignment: .top) {
                    VStack(spacing: 0) {
                        let pickerCount = 10
                        let itemWidth: CGFloat = geometry.size.width * 0.45
                        let itemHeight: CGFloat = 60
                        let offsetAngle = sin(75.0 * Double.pi / 180)
                        packButton(geometry: geometry)
                            .onTapGesture {
                                
                            }
                        
                        ZStack {
                            SlidedPicker(pickerCount: pickerCount, itemWidth: itemWidth * offsetAngle, itemHeight: itemHeight, offset: $offset, content: {
                                VStack(spacing: 0) { 
                                    ForEach(0..<10) { i in 
                                        Text("abc")
                                            .foregroundColor(.white)
                                            .font(.system(size: 24))
                                            .bold()
                                            .padding(.leading, 30)
                                            .frame(width: itemWidth * offsetAngle, height: itemHeight, alignment: .leading)
                                            .rotationEffect(.degrees(-15))
                                    }
                                }
                            })
                            .background(
                                Rectangle()
                                    .foregroundColor(.black)
                                    .opacity(0.1)
                                    .frame(height: geometry.size.height * 1.4)
                            )
                            .frame(width: itemWidth * offsetAngle)
                            .rotationEffect(.degrees(15))
                            
                            ZStack {
                                ZStack(alignment: .trailing) {
                                    Diamond()
                                        .foregroundColor(.black)
                                        .frame(width: itemWidth)
                                    Diamond()
                                        .foregroundColor(.white)
                                        .frame(width: 10)
                                }
                                VStack {
                                    HStack(spacing: 10) {
                                        Image(systemName: "star")
                                            .resizable()
                                            .scaledToFit()
                                            .foregroundColor(.white)
                                            .frame(width: 15)
                                        Text("Title")
                                            .foregroundColor(.white)
                                            .font(.system(size: 24))
                                            .bold()
                                    }
                                    .frame(width: itemWidth, alignment: .leading)
                                    .offset(x: -25)
                                    Text("Subtitle")
                                        .foregroundColor(.white)
                                        .font(.system(size: 14))
                                        .frame(width: itemWidth, alignment: .leading)
                                }
                                .padding(.leading, 100)
                            }
                            .frame(width: itemWidth, height: itemHeight * 1.2)
                            .offset(x: -10, y: 1.6)
                            .onChange(of: offset) { _ in 
                                
                            }
                            .onChange(of: selectTitle) { _ in 
                                
                            }
                            .onTapGesture(count: 2, perform: {
                                
                            })
                        }
                        .offset(x: -62, y: -60)
                    }
                    .frame(width: geometry.size.width * 0.45, height: geometry.size.height)
                    
                    packButton(geometry: geometry)
                        .onTapGesture {
                            
                        }
                }
            }
            .transition(.asymmetric(insertion: .opacity, removal: .opacity))
        }
    }
    
    func packButton(geometry: GeometryProxy) -> some View {
        ZStack {
            Diamond()
                .foregroundColor(.black)
                .frame(width: geometry.size.width * 0.45, height: geometry.size.height * 0.08)
            Text("Introduction")
                .foregroundColor(.white)
                .font(.system(size: 24))
                .bold()
        }
        .shadow(radius: 20)
    }
}
