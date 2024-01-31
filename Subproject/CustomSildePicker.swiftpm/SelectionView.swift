import SwiftUI

struct SelectionView: View {
    
    @State var offset: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in 
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
                        Text("abc")
                            .font(.system(size: 24))
                            .bold()
                            .padding(.leading, 30)
                            .frame(width: itemWidth * offsetAngle, height: itemHeight, alignment: .leading)
                            .rotationEffect(.degrees(-15))
                    })
                }
            }
        }
    }
    
    func packButton(geometry: GeometryProxy) -> some View {
        ZStack {
            Diamond()
                .foregroundColor(.black)
                .frame(width: geometry.size.width * 0.45, height: geometry.size.height * 0.88)
            Text("demo")
                .font(.system(size: 24))
                .bold()
        }
        .shadow(radius: 20)
    }
}
