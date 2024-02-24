import SwiftUI
import TipKit
import Pow

struct SelectionView: View {
    @EnvironmentObject var selectStatus: SelectStatus
    
    @State var offset: CGFloat = 0
    @State var selectItem: IntroItem = Definition()
    
    let intro: [IntroItem] = [Definition(), 
                              Symptom(), 
                              Cause(), 
                              Risk(), 
                              Complications(), 
                              Diagnosis(), 
                              Treatment(), 
                              Lifestyle(), 
                              Coping()
                            ]
    
    var body: some View {
        GeometryReader { geometry in
            if selectStatus.status == .INTRO {
                ZStack {
                    Color(selectStatus.bgColor)
                        .blur(radius: 4)
                    
                    Guideline() {
                        Text("INTRO DEMO")
                            .foregroundColor(.gray)
                    }
                    
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
                                                    .foregroundColor(.gray)
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
                                            .foregroundColor(.gray)
                                            .opacity(0.1)
                                            .frame(height: geometry.size.height * 1.4)
                                    )
                                    .frame(width: itemWidth * offsetAngle * 0.8)
                                    .rotationEffect(.degrees(15))
                                    .onAppear {
                                        update(itemHeight: itemHeight)
                                    }
                                    
                                    ZStack {
                                        ZStack(alignment: .center) { 
                                            RoundedRectangle(cornerRadius: 80)
                                                .foregroundColor(.white)
                                                .frame(width: geometry.size.width * 0.338, height: geometry.size.height * 0.09)
                                            RoundedRectangle(cornerRadius: 80)
                                                .foregroundColor(selectStatus.themeColor)
                                                .frame(width: geometry.size.width * 0.33, height: geometry.size.height * 0.0785)
                                            
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
                                    .offset(x: -4, y: 9)
                                    .onChange(of: offset) { _ in 
                                        update(itemHeight: itemHeight)
                                    }
                                    .onChange(of: selectItem.title) { _ in 
                                        
                                    }
                                }
                                .offset(x: -27, y: -60)
                            }
                            .frame(width: geometry.size.width * 0.36, height: geometry.size.height)
                            
                            packButton(geometry: geometry)
                        }
                        
                        VStack(alignment: .leading) {
                            Spacer()
                                .frame(height: geometry.size.height * 0.19)
                            HStack(spacing: 18) {
                                RoundedRectangle(cornerRadius: 100)
                                    .foregroundColor(.gray)
                                    .frame(width: 3.7, height: 75)
                                VStack(alignment: .leading, spacing: 10) {
                                    Text(selectItem.title)
                                        .foregroundColor(.gray)
                                        .font(.system(size: 30))
                                        .bold()
                                    HStack {
                                        Image(systemName: "doc.fill.badge.plus")
                                            .foregroundColor(.gray)
                                        Text(selectItem.subtitle)
                                            .foregroundColor(.gray)
                                            .font(.system(size: 20))
                                    }
                                }
                            }
                            Spacer()
                                .foregroundColor(.white)
                                .frame(height: geometry.size.height * 0.044)
                            ZStack {
                                RoundedRectangle(cornerRadius: 25.0)
                                    .foregroundColor(.white)
                                selectItem.abstractView()
                                    .frame(width: geometry.size.width * 0.26, height: geometry.size.width * 0.26)
                            }
                            .frame(width: geometry.size.width * 0.3, height: geometry.size.width * 0.3)
                            .shadow(radius: 20)
                            Spacer()
                        }
                        .frame(width: geometry.size.width * 0.54)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    
                    interactView(geometry: geometry)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                    
                }
                .transition(.asymmetric(insertion: .opacity, removal: .opacity))
            } else if selectStatus.status == .DETAIL {
                ZStack {
                    Color(selectStatus.bgColor)
                        .blur(radius: 0.3)
                    
                    selectItem.detailView()
                        .shadow(radius: 12)
                    
                    VStack {
                        HStack {
                            backButton(geometry: geometry)
                                .onTapGesture {
                                    selectStatus.setStatus(newStatus: .INTRO)
                                }
                            Spacer()
                        }
                        Spacer()
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                }
            }
        }
    }
    
    func update(itemHeight: CGFloat) {
        let num = Int(offset / itemHeight)
        if num < 0 {
            self.selectItem = intro[0]
        } else if num >= intro.count {
            self.selectItem = intro[intro.count - 1]
        } else {
            self.selectItem = intro[num]
        }
    }
    
    func packButton(geometry: GeometryProxy) -> some View {
        ZStack {
            Diamond()
                .foregroundColor(selectStatus.themeColor)
                .frame(width: geometry.size.width * 0.36, height: geometry.size.height * 0.08)
            Text("INTRODUCTION")
                .foregroundColor(.white)
                .font(.system(size: 24))
                .bold()
        }
        .shadow(radius: 20)
        .offset(x: 47)
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
                borderPattern(geometry: geometry)
                Spacer()
                detailButton(geometry: geometry)
                    .onTapGesture {
                        selectStatus.setStatus(newStatus: .DETAIL)
                    }
                    .conditionalEffect(
                        .repeat(
                            .glow(color: .white, radius: 85), 
                            every: 1.4
                        ), 
                        condition: true
                    )
            }
        }
    }
    
    func backButton(geometry: GeometryProxy) -> some View {
        ZStack(alignment: .trailing) {
            Diamond()
                .foregroundColor(.white)
                .frame(width: geometry.size.width * 0.08, height: geometry.size.height * 0.08)
            Diamond()
                .foregroundColor(selectStatus.themeColor)
                .frame(width: geometry.size.width * 0.08, height: geometry.size.height * 0.08)
                .offset(x: -10)
            Image(systemName: "arrowshape.left")
                .resizable()
                .foregroundColor(.white)
                .frame(width: geometry.size.width * 0.023, height: geometry.size.height * 0.025)
                .offset(x: -geometry.size.width * 0.018)
        }
        .shadow(radius: 20)
        .offset(x: -geometry.size.width * 0.02, y: 20)
    }
    
    func detailButton(geometry: GeometryProxy) -> some View {
        ZStack {
            Diamond()
                .foregroundColor(selectStatus.themeColor)
                .frame(width: geometry.size.width * 0.13, height: geometry.size.height * 0.12)
            Text("DETAIL")
                .foregroundColor(.white)
                .font(.system(size: 24))
                .bold()
                .offset(x: 8)
        }
        .shadow(radius: 20)
        .offset(y: -20)
    }
    
    func borderPattern(geometry: GeometryProxy) -> some View {
        ZStack(alignment: .leading) {
            Triangle()
                .foregroundColor(.white)
                .frame(width: geometry.size.width * 0.415, height: geometry.size.height * 0.21)
            Triangle()
                .foregroundColor(.black)
                .frame(width: geometry.size.width * 0.415, height: geometry.size.height * 0.21)
                .offset(x: -25)
        }
    }
}
