import SwiftUI

class Treatment: IntroItem {
    
    init() {
        super.init(title: "Treatment", 
                   subtitle: "Treating IBD", 
                   abstract: ["Anti-inflammatory drugs", 
                              "Immune system suppressors", 
                              "Biologics", 
                              "Antibiotics", 
                              "Other medications and supplements", 
                              "Surgery", 
                              "", 
                              "", 
                              "", 
                              "", 
                              "", 
                              "" ], 
                   detail: [])
    }
}
