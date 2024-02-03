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
        let swiftUIView = UIHostingController(rootView: content).view!
        
        let width = itemWidth
        let height = CGFloat(pickerCount - 2) * itemHeight + (646 + itemHeight - 50)
        
        swiftUIView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        swiftUIView.backgroundColor = UIColor(white: 0, alpha: 0)
        
        scrollView.contentSize = swiftUIView.frame.size
        scrollView.addSubview(swiftUIView)
        scrollView.setContentOffset(CGPoint(x: 0, y: offset), animated: false)
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.delegate = context.coordinator
        
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
            parent.offset = scrollView.contentOffset.y
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
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
