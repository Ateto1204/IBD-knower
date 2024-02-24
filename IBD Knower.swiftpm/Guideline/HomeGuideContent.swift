import SwiftUI

struct HomeGuideContent: View {
    let content = "Inflammatory bowel disease (IBD) is an example of a complex, multi-factorial, chronic condition with urgent and unmet needs. \n\nOn August 8, 2022, I was hospitalized due to severe diarrhea and bloody stools, and was diagnosed with ulcerative colitis. After that, I continued to suffer from severe abdominal cramps and diarrhea, and spent almost all of my time in the hospital; other serious complications arose during the treatment. \n\nDuring the year and a half of treatment, even though I faced my condition with a very positive attitude, the unbearable and constant pain still brought me to the brink of collapse countless times. \n\nHowever, IBD is not rare in Europe and the United States, but patients with this disease are still relatively few in Asia. Therefore, I want to use this APP to let more people know more about IBD. \n\nSecondly, in the process of my treatment, most of the treatments only focus on my physical pain and symptoms, and often ignore my mental state and stress. Therefore, I want to use this APP to let more people know how to help patients regulate mood and stress."
    
    var body: some View {
        VStack {
            Text("ABOUT")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.gray)
                .padding()
            ScrollView() {
                Text(content)
                    .font(.system(size: 18))
                    .foregroundColor(.gray)
                    .padding()
            }
            .padding()
        }
    }
}
