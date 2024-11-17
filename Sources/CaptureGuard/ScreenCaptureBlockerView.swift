import SwiftUI

struct ScreenCaptureBlockerView<Content: View>: UIViewRepresentable {
    @Binding var hostingController: UIHostingController<Content>?

    func makeUIView(context: Context) -> UIView {
        let secureTextField = UITextField()
        secureTextField.isSecureTextEntry = true

        guard let secureView = secureTextField.subviews.first else {
            let errorView = UIView()
            errorView.backgroundColor = .red
            return errorView
        }

        return secureView
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        guard let hostingControllerView = hostingController?.view else { return }
        guard !uiView.subviews.contains(hostingControllerView) else { return }
        uiView.addSubview(hostingControllerView)
    }
}
