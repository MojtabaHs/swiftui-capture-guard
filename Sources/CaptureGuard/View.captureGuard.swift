import SwiftUI

public extension View {
    @ViewBuilder
    func captureGuard<Placeholder: View>(
        _ secure: Bool = true,
        @ViewBuilder _ placeholder: () -> Placeholder = EmptyView.init
    ) -> some View {
        if secure {
            modifier(CaptureGuardModifier(placeholder: placeholder))
        } else {
            self
        }
    }
}

private struct CaptureGuardModifier<Placeholder: View>: ViewModifier {
    @State private var contentSize: CGSize?
    @ViewBuilder let placeholder: Placeholder

    func body(content: Content) -> some View {
        SecureContentView {
            content.onNewSize { contentSize = $0 }
        } placeholder: {
            placeholder
        }
        .frame(width: contentSize?.width, height: contentSize?.height)
    }
}
