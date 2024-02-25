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
    @State var guidePage: Int = 1
    
    var body: some View {
        ZStack {
            Color(selectStatus.bgColor)
            
            QuitView()
            
            Guideline(guidePages: 2, guidePage: $guidePage) {
                LifeGuideContent(guideStep: $guidePage)
            }
            
            VStack {
                Spacer()
                HStack {
                    BlockView(hasSelect: $dietSelect, 
                              selectedPhysical: $dietPhysical,
                              selectedMental: $dietMental, 
                              title: "Diet", 
                              items: ["Overeating witout restraint, eating whatever you want.", 
                                      "Occasionally eat inedible foods, but usually pay attention to your diet.", 
                                      "Eat only the food you can eat and don’t eat anything you can’t eat at all.", 
                                      "Eat a very light diet or only eat foods with high nutritional value."], 
                              theme: Color.red, 
                              physical: [-60, -20, 10, 20], 
                              mental: [40, 20, -20, -40])
                    BlockView(hasSelect: $medicineSelect, 
                              selectedPhysical: $medicinePhysical,
                              selectedMental: $medicineMental, 
                              title: "Take Medicine", 
                              items: ["Take your medication on time and follow your doctor's instructions and check your physical condition regularly.", 
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
                              mental: [-5, 0, 10, 20])
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
                
                Spacer()
                
                HStack {
                    Spacer()
                    Button {
                        withAnimation {
                            self.isPressed = true
                        }
                    } label: {
                        Text("TRY IT")
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: 56.6)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 19)
                                    .foregroundColor(runable() ? selectStatus.themeColor : .gray)
                                    .shadow(radius: 2.6))
                    }
                    .sheet(isPresented: $isPressed) {
                        ZStack {
                            Color(selectStatus.bgColor)
                            if physicalSum() >= 30 && mentalSum() >= 30 {
                                VStack {
                                    Group {
                                        Text("Successful !")
                                            .font(.largeTitle)
                                            .bold()
                                        Text("You successfully find a balance that stabilizes your condition and maintains a happy mood.")
                                            .multilineTextAlignment(.center)
                                    }
                                    .foregroundColor(.gray)
                                    .padding()
                                    Button {
                                        selectStatus.setStatus(newStatus: .HOME)
                                    } label: {
                                        Text("DONE")
                                            .foregroundColor(.white)
                                            .frame(width: 53.6, height: 16)
                                            .bold()
                                            .padding()
                                            .background(RoundedRectangle(cornerRadius: 18)
                                                .foregroundColor(Color(uiColor: .systemBlue))
                                                .shadow(radius: 3.2))
                                    }
                                }
                            } else if physicalSum() < 30 {
                                WrongTipView(isPressed: $isPressed, 
                                             title: "Worsening of Condition...", 
                                             description: "This decision will make your condition worse.")
                            } else if mentalSum() < 30 {
                                WrongTipView(isPressed: $isPressed, 
                                             title: "Depression...", 
                                             description: "This choice can make you feel depressed or stressed out.")
                            }
                        }
                    }
                    .disabled(!runable())
                    //Text("Physical: \(physicalSum()); Mental: \(mentalSum())")
                     //   .foregroundColor(.gray)
                    Spacer()
                }
                .padding()
            }
            .padding()
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
