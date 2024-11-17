import SwiftUI

struct SecureContentView<Content: View>: View {
    let content: Content
    @State private var hostingController: UIHostingController<Content>?

    var body: some View {
        ScreenCaptureBlockerView(hostingController: $hostingController)
            .onAppear {
                if hostingController == nil {
                    let contentWrapper = UIHostingController(rootView: content)
                    contentWrapper.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                    contentWrapper.view.backgroundColor = .clear
                    hostingController = contentWrapper
                }
            }
    }
}
