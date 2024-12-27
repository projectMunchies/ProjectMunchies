//
//  BottomSheetHelper.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 5/30/24.
//

import SwiftUI

extension View {
    @ViewBuilder
    /// Default Tab Bar height = 49
    func bottomMaskForSheet(mask: Bool = true, _ height: CGFloat = 49) -> some View {
        self
            .background(SheetRootViewFinder(mask: mask, height: height))
    }
}

fileprivate struct SheetRootViewFinder: UIViewRepresentable {
    var mask: Bool
    var height: CGFloat
    
    func makeUIView(context: Context) -> UIView {
        return .init()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if let rootView = uiView.viewBeforeWindow, let window = rootView.window {
                let safeArea = window.safeAreaInsets
                /// Updating it's Height SO that it will create a empty space in the bottom
                rootView.frame = .init(
                    origin: .zero,
                    size: .init(
                        width: window.frame.width,
                        height: window.frame.height - ( mask ? (height + safeArea.bottom) : 0)
                    )
                )
                
                rootView.clipsToBounds = true
                for view in rootView.subviews {
                    /// Removing Shadows
                    view.layer.shadowColor = UIColor.clear.cgColor
                    
                    if view.layer.animationKeys() != nil {
                        if let cornerRadiusView = view.allSubViews.first(where: {
                            $0.layer.animationKeys()?.contains("cornerRadius") ?? false }) {
                            cornerRadiusView.layer.maskedCorners = []
                        }
                    }
                }
            }
        }
    }
}

fileprivate extension UIView {
    /// This will return the container view that is holding the sheet so we can modify its sheet view
    var viewBeforeWindow: UIView? {
        if let superview, superview is UIWindow {
            return self
        }
        
        return superview?.viewBeforeWindow
    }
    
    /// Retrieving All subviews from an UiView
    var allSubViews: [UIView] {
        return subviews.flatMap { [$0] + $0.subviews }
    }
}

#Preview {
    MainView()
}
