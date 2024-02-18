import SwiftUI

class Risk: IntroItem {
    
    init() {
        super.init(title: "Risk", 
                   subtitle: "Risk factors for IBD", 
                   abstract: ["Age", 
                              "Race or ethnicity", 
                              "Family history", 
                              "Cigarette smoking", 
                              "Nonsteroidal anti-inflammatory medications", 
                              "", 
                              "", 
                              "", 
                              "", 
                              "", 
                              "", 
                              "" ], 
                   detail: ["", 
                            "Most people who develop IBD are diagnosed before they're 30 years old. But some people don't develop the disease until their 50s or 60s.", 
                           "Although IBD is more common in white people, it can occur in any race. Cases are also increasing in other races and ethnicities.", 
                           "You're at higher risk if you have a close relative — such as a parent, sibling or child — with the disease.", 
                           "Cigarette smoking is the most important controllable risk factor for developing Crohn's disease. \n\nSmoking may help prevent ulcerative colitis. However, its harm to overall health outweighs any benefit, and quitting smoking can improve the general health of your digestive tract, as well as provide many other health benefits.", 
                           "These include ibuprofen (Advil, Motrin IB, others), naproxen sodium (Aleve), diclofenac sodium and others. These medications may increase the risk of developing IBD or worsen the disease in people who have IBD."])
    }
}
