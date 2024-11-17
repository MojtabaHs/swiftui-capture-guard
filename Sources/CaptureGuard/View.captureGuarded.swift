import SwiftUI

public extension View {
    @ViewBuilder
    func captureGuard(_ secure: Bool = true) -> some View {
        if secure {
            modifier(SecureViewModifier())
        } else {
            self
        }
    }
}

struct SecureViewModifier: ViewModifier {
    @State private var contentSize: CGSize?

    func body(content: Content) -> some View {
        SecureContentView(content: content.onNewSize { contentSize = $0 })
            .frame(width: contentSize?.width, height: contentSize?.height)
    }
}
