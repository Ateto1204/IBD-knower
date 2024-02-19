import SwiftUI

class Diagnosis: IntroItem {
    
    init() {
        super.init(title: "Diagnosis", 
                   subtitle: "How to check IBD", 
                   abstract: ["Tests for anemia or infection", 
                              "Stool studies", 
                              "Colonoscopy", 
                              "Flexible sigmoidoscopy", 
                              "Upper endoscopy", 
                              "Caspule endoscopy", 
                              "X-ray", 
                              "Computerized tomography (CT) scan", 
                              "Magnetic resonance imaging (MRI)", 
                              "", 
                              "" ], 
                   detail: ["Your provider may suggest blood tests to check for anemia — a condition in which there aren't enough red blood cells to carry adequate oxygen to your tissues — or to check for signs of infection from bacteria or viruses.", 
                           "You may need to provide a stool sample so that your provider can test for hidden (occult) blood or organisms, such as parasites, in your stool.", 
                           "This exam allows your provider to view your entire colon using a thin, flexible, lighted tube with a camera at the end. During the procedure, small samples of tissue (biopsy) may be taken for laboratory analysis. A biopsy is the way to make the diagnosis of IBD versus other forms of inflammation.", 
                           "Your provider uses a slender, flexible, lighted tube to examine the rectum and sigmoid, the last portion of your colon. If your colon is severely inflamed, your provider may perform this test instead of a full colonoscopy.", 
                           "In this procedure, your provider uses a slender, flexible, lighted tube to examine the esophagus, stomach and first part of the small intestine (duodenum). While it is rare for these areas to be involved with Crohn's disease, this test may be recommended if you are having nausea and vomiting, difficulty eating, or upper abdominal pain.", 
                           "This test is sometimes used to help diagnose Crohn's disease involving your small intestine. You swallow a capsule that has a camera in it. The images are transmitted to a recorder you wear on your belt, after which the capsule exits your body painlessly in your stool. You may still need an endoscopy with a biopsy to confirm a diagnosis of Crohn's disease. Capsule endoscopy should not be performed if a bowel obstruction is suspected.", 
                           "For this test, a scope is used in conjunction with a device called an overtube. This enables the technician to look further into the small bowel where standard endoscopes don't reach. This technique is useful when a capsule endoscopy shows abnormalities, but the diagnosis is still in question.", 
                           "If you have severe symptoms, your provider may use a standard X-ray of your abdominal area to rule out serious complications, such as megacolon or a perforated colon.", 
                           "You may have a CT scan — a special X-ray technique that provides more detail than a standard X-ray does. This test looks at the entire bowel as well as at tissues outside the bowel. CT enterography is a special CT scan that provides better images of the small bowel. This test has replaced barium X-rays in most medical centers.", 
                           "An MRI scanner uses a magnetic field and radio waves to create detailed images of organs and tissues. An MRI is particularly useful for evaluating a fistula around the anal area (pelvic MRI) or the small intestine (MR enterography). Unlike CT, there is no radiation exposure with MRI."])
    }
}
