import SwiftUI

class Treatment: IntroItem {
    
    init() {
        super.init(title: "Treatment", 
                   subtitle: "Treating IBD", 
                   abstract: ["Colon cancer", 
                              "Skin, eye and joint inflammation", 
                              "Medication side effects", 
                              "Primary sclerosing cholangitis", 
                              "Blood clots", 
                              "Severe dehydration", 
                              "Bowel obstruction", 
                              "Malnutrition", 
                              "Fistulas", 
                              "Anal fissure", 
                              "Toxic megacolon", 
                              "Perforated colon"], 
                   detail: [])
    }
}
