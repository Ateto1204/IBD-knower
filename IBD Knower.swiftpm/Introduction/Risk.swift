import SwiftUI

class Risk: IntroItem {
    
    init() {
        super.init(title: "Risk", 
                   subtitle: "Risk groups and factors for IBD", 
                   abstract: ["Age", 
                              "Race or ethnicity", 
                              "Family history", 
                              "Cigarette smoking", 
                              "Nonsteroidal anti-inflammatory medications", 
                              "", 
                              ""], 
                   detail: [])
    }
}
