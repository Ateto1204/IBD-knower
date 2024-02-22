import SwiftUI

struct ContentView: View {
    @State var dietSelect: Bool = false
    @State var dietPhysical: Int = 0
    @State var dietMental: Int = 0
    
    @State var medicineSelect: Bool = false
    @State var medicinePhysical: Int = 0
    @State var medicineMental: Int = 0
    
    @State var routineSelect: Bool = false
    @State var routinePhysical: Int = 0
    @State var routineMental: Int = 0
    
    @State var workSelect: Bool = false
    @State var workPhysical: Int = 0
    @State var workMental: Int = 0
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    BlockView(hasSelect: $dietSelect, 
                              selectedPhysical: $dietPhysical,
                              selectedMental: $dietMental, 
                              title: "Diet", 
                              items: ["Overeating witout restraint, eating whatever you want", 
                                     "Occasionally eat inedible foods, but usually pay attention to your diet", 
                                     "Eat only the food you can eat and don’t eat anything you can’t eat at all", 
                                     "Eat a very light diet or only eat foods with high nutritional value"], 
                              theme: Color.red, 
                              physical: [-60, -20, 10, 20], 
                              mental: [40, 20, -20, -40])
                    BlockView(hasSelect: $medicineSelect, 
                              selectedPhysical: $medicinePhysical,
                              selectedMental: $medicineMental, 
                              title: "Take Medicine", 
                              items: ["Take your medication on time and follow your doctor's instructions and check your physical condition regularly", 
                                     "Occasionally, I forget to take my medicine, but I follow up regularly to check my physical condition.", 
                                     "I often forget to take my medicine but I follow up regularly to check my physical condition.", 
                                     "I will choose to take medicine if I feel something strange or uncomfortable in my body."], 
                              theme: Color.blue, 
                              physical: [40, 30, -10, -30], 
                              mental: [-5, 0, 0, 0])
                }
                HStack {
                    BlockView(hasSelect: $routineSelect, 
                              selectedPhysical: $routinePhysical,
                              selectedMental: $routineMental, 
                              title: "Routine", 
                              items: ["I will always go to bed early and get up early.", 
                                     "I will always maintain a normal regular schedule.", 
                                     "I will always maintain a normal schedule but occasionally go to bed late.", 
                                     "I often stay up late or have irregular routine."], 
                              theme: Color.green, 
                              physical: [25, 15, 0, -30], 
                              mental: [-20, 0, 10, 20])
                    BlockView(hasSelect: $workSelect, 
                              selectedPhysical: $workPhysical, 
                              selectedMental: $workMental, 
                              title: "Work or Study", 
                              items: ["I would lie completely flat and do nothing.", 
                                     "I will still work but try not to put as much pressure on myself.", 
                                     "I will still take part in challenging work but try to put as little pressure on myself as possible.", 
                                     "In order to make more money, I will work hard to make money."], 
                              theme: Color.yellow, 
                              physical: [0, 0, 0, -20], 
                              mental: [20, 15, 15, -20])
                }
                
                HStack {
                    Spacer()
                    Text("RUN")
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 21)
                                .foregroundColor(runable() ? .green : .gray))
                        .onTapGesture() {
                            
                        }
                        .disabled(runable())
                    Text("Physical: \(physicalSum()); Mental: \(mentalSum())")
                    Spacer()
                }
            }
        }
    }
    
    func physicalSum() -> Int {
        return dietPhysical + medicinePhysical + routinePhysical + workPhysical
    }
    
    func mentalSum() -> Int {
        return dietMental + medicineMental + routineMental + workMental
    }
    
    func runable() -> Bool {
        return dietSelect && medicineSelect && routineSelect && workSelect
    }
}

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
                            VStack(alignment: .leading) {
                                Text(items[idx])
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
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
