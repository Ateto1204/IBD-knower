import SwiftUI
import TipKit

struct SwipeTip: Tip {
    var title: Text {
        Text("Swipe")
            .foregroundColor(.white)
    }
    
    var message: Text? {
        Text("Swipe up and down")
            .foregroundColor(.white)
    }
    
    var image: Image? {
        Image(systemName: "hand.draw")
    }
}

struct DetailTip: Tip {
    var title: Text {
        Text("Press")
            .foregroundColor(.white)
    }
    
    var message: Text? {
        Text("Press to see detail")
            .foregroundColor(.white)
    }
    
    var image: Image? {
        Image(systemName: "hand.tap")
    }
}
