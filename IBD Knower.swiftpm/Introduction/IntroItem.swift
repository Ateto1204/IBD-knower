import SwiftUI

class IntroItem {
    
    let title: String
    let subtitle: String
    var abstract: [String]
    var detail: [String]
    
    init(title: String, subtitle: String, abstract: [String], detail: [String]) {
        self.title = title
        self.subtitle = subtitle
        self.abstract = abstract
        self.detail = detail
    }
}
