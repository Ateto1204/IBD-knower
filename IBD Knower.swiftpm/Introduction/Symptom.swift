import SwiftUI

class Symptom: IntroItem {
    
    init() {
        super.init(title: "Symptom", 
                   subtitle: "Symptom of IBD", 
                   abstract: ["Diarrhea", 
                              "Fatigue", 
                              "Abdominal pain", 
                              "Abdominal cramping", 
                              "Blood in your stool", 
                              "Reduced appetite", 
                              "Unintended weight loss", 
                              "", 
                              "", 
                              "", 
                              "", 
                              "" ], 
                   detail: [])
    }
}
