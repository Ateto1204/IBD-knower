import SwiftUI

struct BlockView: View {
    @EnvironmentObject var selectStatus: SelectStatus
    
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
                .font(.title)
                .foregroundColor(.gray)
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
                                .shadow(radius: 13)
                            HStack {
                                Text(selectedTitle)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.leading)
                                    .padding()
                                Spacer()
                            }
                            .padding()
                        }
                    }
                }
                .sheet(isPresented: $isSelect) {
                    ZStack {
                        Color(selectStatus.bgColor)
                        
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
            }
            .frame(height: 200)
        }
    }
}
