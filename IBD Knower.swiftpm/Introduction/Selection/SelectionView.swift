import SwiftUI

struct SelectionView: View {
    
    @State var offset: CGFloat = 0
    @State var selectTitle: String = ""
    
    var body: some View {
        GeometryReader { geometry in 
            ZStack {
                Color(.gray)
                    .blur(radius: 0.3)
                
                interactView(geometry: geometry)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                
                HStack(spacing: 0) {
                    Spacer()
                        .frame(width: geometry.size.width * 0.1)
                    ZStack(alignment: .top) {
                        VStack(spacing: 0) {
                            let pickerCount = 10
                            let itemWidth: CGFloat = geometry.size.width * 0.45
                            let itemHeight: CGFloat = 60
                            let offsetAngle = sin(75.0 * Double.pi / 180)
                            packButton(geometry: geometry)
                            //                                .offset(x: -30)
                                .onTapGesture {
                                    
                                }
                            
                            ZStack {
                                SlidedPicker(pickerCount: pickerCount, itemWidth: itemWidth * offsetAngle, itemHeight: itemHeight, offset: $offset, content: {
                                    VStack(spacing: 0) { 
                                        ForEach(0..<10) { i in 
                                            Text("demo \(i)")
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
                                .frame(width: itemWidth * offsetAngle * 0.8)
                                .rotationEffect(.degrees(15))
                                
                                ZStack {
                                    ZStack(alignment: .trailing) {
                                        Diamond()
                                            .foregroundColor(.black)
                                            .frame(width: itemWidth * 0.8)
                                        Diamond()
                                            .foregroundColor(.white)
                                            .frame(width: 8)
                                    }
                                    VStack {
                                        HStack(spacing: 10) {
                                            Image(systemName: "star")
                                                .resizable()
                                                .scaledToFit()
                                                .foregroundColor(.white)
                                                .frame(width: 15)
                                            Text(selectTitle)
                                                .foregroundColor(.white)
                                                .font(.system(size: 24))
                                                .bold()
                                        }
                                        .frame(width: itemWidth, alignment: .leading)
                                        .offset(x: -20)
                                        Text("Subtitle")
                                            .foregroundColor(.white)
                                            .font(.system(size: 14))
                                            .frame(width: itemWidth, alignment: .leading)
                                    }
                                    .padding(.leading, 180)
                                }
                                .frame(width: itemWidth, height: itemHeight * 1.2)
                                .offset(x: -10, y: 1.6)
                                .onChange(of: offset) { _ in 
                                    let num = Int(offset / itemHeight)
                                    self.selectTitle = "DEMO \(num)"
                                }
                                .onChange(of: selectTitle) { _ in 
                                    
                                }
                                .onTapGesture(count: 2, perform: {
                                    
                                })
                            }
                            .offset(x: -62, y: -60)
                        }
                        .frame(width: geometry.size.width * 0.36, height: geometry.size.height)
                        
                        packButton(geometry: geometry)
                            .onTapGesture {
                                
                            }
                    }
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Color.white
                                .frame(width: 1, height: 50)
                            VStack(alignment: .leading, spacing: 10) {
                                Text(selectTitle)
                                    .foregroundColor(.white)
                                    .font(.system(size: 24)
                                        .bold())
                                HStack {
                                    Image(systemName: "music.note")
                                    Text("Subtitle")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20))
                                }
                            }
                            //                            Spacer()
                        }
                        Rectangle()
                            .frame(width: geometry.size.width * 0.3, height: geometry.size.width * 0.3)
                            .shadow(radius: 20)
                        Spacer()
                    }
                    .frame(width: geometry.size.width * 0.54)
                    .padding(.top, 100)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
            .transition(.asymmetric(insertion: .opacity, removal: .opacity))
        }
    }
    
    func packButton(geometry: GeometryProxy) -> some View {
        ZStack {
            Diamond()
                .foregroundColor(.black)
                .frame(width: geometry.size.width * 0.36, height: geometry.size.height * 0.08)
            Text("Introduction")
                .foregroundColor(.white)
                .font(.system(size: 24))
                .bold()
        }
        .shadow(radius: 20)
    }
    
    func interactView(geometry: GeometryProxy) -> some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                detailButton(geometry: geometry)
                    .onTapGesture {
                        
                    }
            }
        }
    }
    
    func detailButton(geometry: GeometryProxy) -> some View {
        ZStack {
            Diamond()
                .foregroundColor(.white)
                .frame(width: geometry.size.width * 0.12, height: geometry.size.height * 0.12)
            Text("Detail")
                .foregroundColor(.gray)
                .font(.system(size: 24))
                .bold()
        }
        .shadow(radius: 20)
        .offset(y: -20)
    }
}
