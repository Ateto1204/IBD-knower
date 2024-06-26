import SwiftUI

struct LifeMenuView: View {
    @EnvironmentObject var selectStatus: SelectStatus
    
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
    
    @State var isPressed: Bool = false
    
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
                    Button {
                        withAnimation {
                            self.isPressed = true
                        }
                    } label: {
                        Text("RUN")
                            .foregroundColor(.white)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 21)
                                    .foregroundColor(runable() ? .green : .gray))
                    }
                    .sheet(isPresented: $isPressed) {
                        if physicalSum() >= 30 && mentalSum() >= 30 {
                            VStack {
                                Text("Successful!")
                                Button("Got it") {
                                    selectStatus.setStatus(newStatus: .HOME)
                                }
                            }
                        } else if physicalSum() < 30 {
                            Text("GG")
                        } else if mentalSum() < 30 {
                            Text("EMO")
                        }
                    }
                    .disabled(!runable())
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
