import SwiftUI

struct SecureContentView<Content: View, Placeholder: View>: UIViewRepresentable {
    private let content: () -> Content
    private let placeholder: () -> Placeholder
    private let hostingController: UIHostingController<Content>
    private let placeholderHostingController: UIHostingController<Placeholder>
    
    init(
        @ViewBuilder content: @escaping () -> Content,
        @ViewBuilder placeholder: @escaping () -> Placeholder
    ) {
        self.content = content
        self.placeholder = placeholder
        self.hostingController = UIHostingController(rootView: content())
        self.placeholderHostingController = UIHostingController(rootView: placeholder())
    }
    
    func makeUIView(context: Context) -> UIView {
        let secureTextField = UITextField()
        secureTextField.isSecureTextEntry = true
        secureTextField.isUserInteractionEnabled = false
        
        guard let secureView = secureTextField.subviews.first else {
            return UIView()
        }
        
        secureView.removeFromSuperview()
        secureView.subviews.forEach { subview in
            subview.removeFromSuperview()
        }
        
        secureView.addSubview(hostingController.view)
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        let placeholderController = placeholderHostingController
        let containerView = UIView()
        containerView.addSubview(placeholderController.view)
        containerView.addSubview(secureView)

        placeholderController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        secureView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        return containerView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        hostingController.rootView = content()
        placeholderHostingController.rootView = placeholder()
    }
}
