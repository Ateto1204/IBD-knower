import SwiftUI

struct BlockItemView: View {
    @Binding var selectedTitle: String
    @Binding var selectedPhysical: Int
    @Binding var selectedMental: Int
    @Binding var hasSelected: Bool
    @Binding var isSelected: Bool
    
    let title: String
    let items: [String]
    let theme: Color
    
    let physical: [Int]
    let mental: [Int]
    
    var body: some View {
        GeometryReader { geometry in 
            VStack {
                Text(title)
                    .font(.system(size: 42))
                    .foregroundColor(.white)
                    .padding()
                ScrollView() {
                    ForEach(items.indices) { idx in 
                        Button {
                            selectedTitle = items[idx]
                            selectedPhysical = physical[idx]
                            selectedMental = mental[idx]
                            hasSelected = true
                            isSelected.toggle()
                        } label: {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(items[idx])
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.leading)
                                        .padding()
                                    HStack {
                                        Group {
                                            Text("Physical \(physical[idx] < 0 ? "" : "+") \(physical[idx])")
                                            Text("Mental \(mental[idx] < 0 ? "" : "+") \(mental[idx])")
                                        }
                                        .foregroundColor(.white)
                                        .padding()
                                    }
                                }
                                Spacer()
                            }
                            .padding()
                        }
                        .frame(width: geometry.size.width * 0.9)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(theme)
                                .frame(width: geometry.size.width * 0.9))
                        .padding()
                    }
                }
            }
        }
    }
}
