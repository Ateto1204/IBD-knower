import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    BlockView(title: "Diet", 
                              items: ["Overeating witout restraint, eating whatever you want", 
                                     "Occasionally eat inedible foods, but usually pay attention to your diet", 
                                     "Eat only the food you can eat and don’t eat anything you can’t eat at all", 
                                     "Eat a very light diet or only eat foods with high nutritional value"], 
                              theme: Color.red)
                    BlockView(title: "Take Medicine", 
                              items: ["Take your medication on time and follow your doctor's instructions and check your physical condition regularly", 
                                     "Occasionally, I forget to take my medicine, but I follow up regularly to check my physical condition.", 
                                     "I often forget to take my medicine but I follow up regularly to check my physical condition.", 
                                     "I will choose to take medicine if I feel something strange or uncomfortable in my body."], 
                              theme: Color.blue)
                }
                HStack {
                    BlockView(title: "Routine", 
                              items: ["I will always go to bed early and get up early.", 
                                     "I will always maintain a normal regular schedule.", 
                                     "I will always maintain a normal schedule but occasionally go to bed late.", 
                                     "I often stay up late or have irregular routine."], 
                              theme: Color.green)
                    BlockView(title: "Work or Study", 
                              items: ["I would lie completely flat and do nothing.", 
                                     "I will still work but try not to put as much pressure on myself.", 
                                     "I will still take part in challenging work but try to put as little pressure on myself as possible.", 
                                     "In order to make more money, I will work hard to make money."], 
                              theme: Color.yellow)
                }
            }
        }
    }
}

struct BlockView: View {
    @State private var hasSelect: Bool
    @State private var isSelect: Bool
    
    let title: String
    let items: [String]
    let theme: Color
    
    init(title: String, items: [String], theme: Color) {
        self.hasSelect = false
        self.isSelect = false
        
        self.title = title
        self.items = items
        self.theme = theme
    }
    
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
                if !hasSelect {
                    Button {
                        isSelect.toggle()
                    } label: {
                        Text("+")
                            .foregroundColor(.gray)
                            .font(.system(size: 42))
                    }
                    .sheet(isPresented: $isSelect) {
                        Button {
                            hasSelect.toggle()
                        } label: {
                            BlockItemView(title: title, items: items, theme: theme)
                        }
                    }
                }
            }
            .frame(height: 200)
        }
    }
}

struct BlockItemView: View {
    let title: String
    let items: [String]
    let theme: Color
    
    var body: some View {
        GeometryReader { geometry in 
            VStack {
                Text(title)
                    .font(.system(size: 42))
                    .foregroundColor(.white)
                    .padding()
                ScrollView() {
                    ForEach(items.indices) { idx in 
                        VStack {
                            ZStack(alignment: .leading) {
                                HStack {
                                    Text(items[idx])
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                .padding()
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(theme)
                                .frame(width: geometry.size.width * 0.9, height: 120))
                            Spacer()
                                .frame(height: 60)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}
