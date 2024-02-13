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
                   detail: ["Depending on the severity of inflammation and where it occurs and you are likely to have periods of active illness followed by peroids of remission."])
    }
}
