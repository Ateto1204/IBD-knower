import SwiftUI

struct SelectionView: View {
    @EnvironmentObject var selectStatus: SelectStatus
    
    @State var offset: CGFloat = 0
    @State var selectItem: IntroItem = Definetion()
    let intro: [IntroItem] = [Definetion(), Symptom(), Cause()]
    
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
                            let pickerCount = intro.count
                            let itemWidth: CGFloat = geometry.size.width * 0.45
                            let itemHeight: CGFloat = 60
                            let offsetAngle = sin(75.0 * Double.pi / 180)
                            packButton(geometry: geometry)
                            
                            ZStack {
                                SlidedPicker(pickerCount: pickerCount, itemWidth: itemWidth * offsetAngle * 0.8, itemHeight: itemHeight, offset: $offset, content: {
                                    VStack(spacing: 0) { 
                                        ForEach(intro.indices) { idx in 
                                            Text(intro[idx].title)
                                                .foregroundColor(.white)
                                                .font(.system(size: 24))
                                                .bold()
                                                .padding(.leading, 30)
                                                .frame(width: itemWidth * offsetAngle * 0.8, height: itemHeight, alignment: .leading)
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
                                    VStack(spacing: 5) {
                                        Text(selectItem.title)
                                            .foregroundColor(.white)
                                            .font(.system(size: 24))
                                            .bold()
                                            .frame(width: itemWidth, alignment: .leading)
                                        Text(selectItem.subtitle)
                                            .foregroundColor(.white)
                                            .font(.system(size: 14))
                                            .frame(width: itemWidth, alignment: .leading)
                                    }
                                    .padding(.leading, 200)
                                }
                                .frame(width: itemWidth, height: itemHeight * 1.2)
                                .offset(x: -10, y: 1.6)
                                .onChange(of: offset) { _ in 
                                    let num = Int(offset / itemHeight)
                                    if num < 0 {
                                        self.selectItem = intro[0]
                                    } else if num >= intro.count {
                                        self.selectItem = intro[intro.count - 1]
                                    } else {
                                        self.selectItem = intro[num]
                                    }
                                }
                                .onChange(of: selectItem.title) { _ in 
                                    
                                }
                            }
                            .offset(x: -62, y: -60)
                        }
                        .frame(width: geometry.size.width * 0.36, height: geometry.size.height)
                        
                        packButton(geometry: geometry)
                    }
                    
                    VStack(alignment: .leading) {
                        HStack(spacing: 18) {
                            Color.white
                                .frame(width: 1, height: 50)
                            VStack(alignment: .leading, spacing: 10) {
                                Text(selectItem.title)
                                    .foregroundColor(.white)
                                    .font(.system(size: 24)
                                        .bold())
                                HStack {
                                    Image(systemName: "plus")
                                        .foregroundColor(.white)
                                    Text(selectItem.subtitle)
                                        .foregroundColor(.white)
                                        .font(.system(size: 20))
                                }
                            }
                        }
                        ZStack {
                            Rectangle()
                            selectItem.abstractView()
                        }
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
            HStack {
                backButton(geometry: geometry)
                    .onTapGesture {
                        selectStatus.setStatus(newStatus: .HOME)
                    }
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                detailButton(geometry: geometry)
                    .onTapGesture {
                        
                    }
            }
        }
    }
    
    func backButton(geometry: GeometryProxy) -> some View {
        ZStack(alignment: .trailing) {
            Diamond()
                .foregroundColor(.white)
                .frame(width: geometry.size.width * 0.08, height: geometry.size.height * 0.08)
            Diamond()
                .foregroundColor(.black)
                .frame(width: geometry.size.width * 0.08, height: geometry.size.height * 0.08)
                .offset(x: -10)
            Image(systemName: "arrow.backward")
                .resizable()
                .foregroundColor(.white)
                .frame(width: geometry.size.width * 0.02, height: geometry.size.height * 0.02)
                .offset(x: -geometry.size.width * 0.02)
        }
        .shadow(radius: 20)
        .offset(x: -geometry.size.width * 0.02, y: 20)
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
