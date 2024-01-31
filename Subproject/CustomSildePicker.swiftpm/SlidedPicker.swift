import SwiftUI
import UIKit


struct SlidedPicker<Content: View>: UIViewRepresentable {
    
    var content: Content
    
    var pickerCount: Int
    var itemWidth: CGFloat
    var itemHeight: CGFloat
    @Binding var offset: CGFloat
    
    init(pickerCount: Int, itemWidth: CGFloat, itemHeight: CGFloat, offset: Binding<CGFloat>, content: @escaping () -> Content) {
        self.content = content()
        self.pickerCount = pickerCount
        self.itemWidth = itemWidth
        self.itemHeight = itemHeight
        self._offset = offset
    }
    
    func makeCoordinator() -> Coordinator {
        return SlidedPicker.Coordinator(parent: self, itemHeight: itemHeight)
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        
        return scrollView
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
    }
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        
        var parent: SlidedPicker
        var itemHeight: CGFloat
        
        init(parent: SlidedPicker, itemHeight: CGFloat) {
            self.parent = parent
            self.itemHeight = itemHeight
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let offset = scrollView.contentOffset.y
            
            let value = (offset / itemHeight).rounded(.toNearestOrAwayFromZero)
            
            scrollView.setContentOffset(CGPoint(x: 0, y: value * itemHeight), animated: false)
        }
        
        func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
            if !decelerate {
                let offset = scrollView.contentOffset.y
                
                let value = (offset / itemHeight).rounded(.toNearestOrAwayFromZero)
                
                scrollView.setContentOffset(CGPoint(x: 0, y: value * itemHeight), animated: false)
            }
        }
    }
}
