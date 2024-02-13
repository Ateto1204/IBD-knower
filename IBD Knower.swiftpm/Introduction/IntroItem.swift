import SwiftUI

class IntroItem {
    
    let title: String
    let subtitle: String
    let abstract: [String]
    let detail: [String]
    
    init(title: String, subtitle: String, abstract: [String], detail: [String]) {
        self.title = title
        self.subtitle = subtitle
        self.abstract = abstract
        self.detail = detail
    }
    
    func abstractView() -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                ForEach(0..<5) { idx in 
                    if idx < self.abstract.count && !self.abstract[idx].isEmpty {
                        HStack {
                            Text("- ")
                                .foregroundColor(.black)
                                .bold()
                            Text(self.abstract[idx])
                                .foregroundColor(.black)
                                .lineLimit(1)
                        }
                    }
                }
                HStack {
                    Group {
                        Image(systemName: "plus")
                        Text("Press")
                        Text("'DETAIL'")
                            .font(.system(size: 18))
                            .bold()
                        Text("to see more")
                    }
                    .foregroundColor(.gray)
                }
                .padding(.top, 11)
            }
            Spacer()
        }
    }
    
    func detailView() -> some View {
        GeometryReader { geometry in 
            ZStack {
                Color.white
                
                ScrollView(showsIndicators: false) {
                    ForEach(self.abstract.indices) { idx in 
                        Group {
                            Text(self.abstract[idx])
                                .font(.title)
                            if idx < self.detail.count && !self.detail[idx].isEmpty {
                                Text(self.detail[idx])
                            }
                        }
                        .foregroundColor(.black)
                        .padding()
                    }
                }
            }
        }
    }
}
