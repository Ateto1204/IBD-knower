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
                ForEach(self.abstract.indices) { idx in 
                    if idx < self.abstract.count {
                        HStack {
                            if !self.abstract[idx].isEmpty {
                                Text("- ")
                                    .foregroundColor(.black)
                                    .bold()
                            }
                            Text(self.abstract[idx])
                                .foregroundColor(.black)
                                .lineLimit(1)
                        }
                    }
                }
            }
            Spacer()
        }
    }
}
