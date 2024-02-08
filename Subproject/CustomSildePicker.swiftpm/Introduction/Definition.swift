import SwiftUI

class Definetion: IntroItem {
    
    init() {
        
        var abstract: some View {
            GeometryReader { geometry in 
                VStack {
                    Group {
                        Text("Ulcerative colitis")
                        Text("Crohn's disease")
                    }
                }
            }
        }
        
        var detail: some View {
            GeometryReader { geometry in 
                ZStack {
                    
                }
            }
        }
        
        super.init(title: "Definetion", subtitle: "What is IBD", abstract: abstract, detail: detail)
    }
}

class IntroItem {
    
    let title: String
    let subtitle: String
    var abstract: some View
    var detail: some View
    
    init(title: String, subtitle: String, abstract: some View, detail: some View) {
        self.title = title
        self.subtitle = subtitle
        
        self.abstract = abstract
        self.detail = detail
    }
}
