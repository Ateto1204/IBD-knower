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
}
