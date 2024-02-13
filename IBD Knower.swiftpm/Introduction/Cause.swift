import SwiftUI

class Cause: IntroItem {
    
    init() {
        super.init(title: "Cause", 
                   subtitle: "Why you get IBD", 
                   abstract: ["Immune system malfunction", 
                              "Heredity", 
                              "", 
                              "", 
                              "", 
                              "", 
                              "", 
                              "", 
                              "", 
                              "", 
                              "", 
                              "" ], 
                   detail: ["The exact cause of inflammatory bowel disease remains unknown. Previously, diet and stress were suspected, but now doctors know that these factors may aggravate but aren't the cause of IBD.", 
                           "One possible cause is an immune system malfunction. When your immune system tries to fight off an invading virus or bacterium, an atypical immune response causes the immune system to attack the cells in the digestive tract, too.", 
                           "Several gene mutations have been associated with IBD. Heredity also seems to play a role in that IBD is more common in people who have family members with the disease. However, most people with IBD don't have this family history."])
    }
}
