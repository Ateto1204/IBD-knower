import SwiftUI

struct BlockView: View {
    @Binding var hasSelect: Bool
    @State private var isSelect: Bool = false
    
    @State var selectedTitle: String = ""
    @Binding var selectedPhysical: Int
    @Binding var selectedMental: Int
    
    let title: String
    let items: [String]
    let theme: Color
    
    let physical: [Int]
    let mental: [Int]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .foregroundColor(.white)
                .bold()
                .padding()
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.gray, lineWidth: 2)
                    .padding()
                Button {
                    isSelect.toggle()
                } label: {
                    if !hasSelect {
                        Text("+")
                            .foregroundColor(.gray)
                            .font(.system(size: 42))
                    } else {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .foregroundColor(theme)
                                .padding()
                            Text(selectedTitle)
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                }
                .sheet(isPresented: $isSelect) {
                    BlockItemView(selectedTitle: $selectedTitle, 
                                  selectedPhysical: $selectedPhysical, 
                                  selectedMental: $selectedMental,
                                  hasSelected: $hasSelect, 
                                  isSelected: $isSelect, 
                                  title: title, 
                                  items: items, 
                                  theme: theme, 
                                  physical: physical, 
                                  mental: mental)
                }
            }
            .frame(height: 200)
        }
    }
}
