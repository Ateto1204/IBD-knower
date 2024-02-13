import SwiftUI

class IntroItem {
    
    let title: String
    let subtitle: String
    var abstract: [String]
    let detail: [String]
    
    init(title: String, subtitle: String, abstract: [String], detail: [String]) {
        self.title = title
        self.subtitle = subtitle
        self.abstract = abstract
        self.detail = detail
    }
    
    func abstractView() -> some View {
        VStack {
            ForEach(abstract.indices) { idx in 
                Text(self.abstract[idx])
                    .foregroundColor(.black)
            }
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
