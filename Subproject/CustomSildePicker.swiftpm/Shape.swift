import SwiftUI

struct Diamond: Shape {
    static let offset = (1 / tan(75.0 * Double.pi / 180))
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addLines([
            CGPoint(x: rect.maxY * Diamond.offset, y: 0), 
            CGPoint(x: rect.maxX + rect.maxY * Diamond.offset, y: 0), 
            CGPoint(x: rect.maxX, y: rect.maxY), 
            CGPoint(x: 0, y: rect.maxY)
        ])
        
        return path
    }
}
