import SwiftUI

class IntroItem {
    
    let title: String
    let subtitle: String
    let abstract: [String]
    let detail: [String]
    
    init(title: String, subtitle: String, abstract: [String], detail: [String]) {
        self.title = title
        self.subtitle = subtitle
        self.abstract = abstract
        self.detail = detail
    }
    
    func abstractView() -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                ForEach(0..<5) { idx in 
                    if idx < self.abstract.count && !self.abstract[idx].isEmpty {
                        HStack {
                            Text("- ")
                                .foregroundColor(.black)
                                .bold()
                            Text(self.abstract[idx])
                                .foregroundColor(.black)
                                .lineLimit(1)
                        }
                    }
                }
                HStack {
                    Group {
                        Image(systemName: "plus")
                        Text("Press")
                        Text("'DETAIL'")
                            .font(.system(size: 18))
                            .bold()
                        Text("to see more")
                    }
                    .foregroundColor(.gray)
                }
                .padding(.top, 11)
            }
            Spacer()
        }
    }
    
    func detailView() -> some View {
        GeometryReader { geometry in 
            VStack {
                Spacer()
                    .frame(height: geometry.size.height * 0.12)
                HStack {
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.8)
                            .foregroundColor(.white)
                        VStack {
                            
                            Text(self.subtitle)
                                .font(.system(size: 34))
                                .foregroundColor(.black)
                                .bold()
                                .padding()
                            RoundedRectangle(cornerRadius: 100)
                                .frame(width: geometry.size.width * 0.72, height: 2.3)
                                .foregroundColor(.gray)
                            
                            ScrollView(showsIndicators: false) {
                                let hasOverview: Bool = !self.detail.isEmpty && !self.detail[0].isEmpty
                                if hasOverview {
                                    HStack {
                                        Text(self.detail[0])
                                            .foregroundColor(.black)
                                            .padding()
                                        Spacer()
                                    }
                                }
                                
                                ForEach(self.abstract.indices) { idx in 
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Group {
                                                if !self.abstract[idx].isEmpty {
                                                    Text(self.abstract[idx])
                                                        .font(.title)
                                                    if idx + 1 < self.detail.count && !self.detail[idx + 1].isEmpty {
                                                        Text(self.detail[idx + 1])
                                                    }
                                                }
                                            }
                                            .foregroundColor(.black)
                                            .padding()
                                        }
                                        Spacer()
                                    }
                                }
                            }
                        }
                        .frame(width: geometry.size.width * 0.75, height: geometry.size.height * 0.75)
                    }
                    Spacer()
                }
            }
        }
    }
}
