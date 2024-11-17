import SwiftUI

private struct SizeReader: ViewModifier {
    var onNewSize: (CGSize) -> Void = { _ in }

    func body(content: Content) -> some View {
        content.background(
            GeometryReader {
                Color.clear .preference(key: NewSizePreferenceKey.self, value: $0.size )
            }
        )
        .onPreferenceChange(NewSizePreferenceKey.self, perform: onNewSize)
    }
}

extension View {
    func onNewSize(
        perform: @escaping (NewSizePreferenceKey.Value) -> Void
    ) -> some View {
        modifier(SizeReader(onNewSize: perform))
    }
}

struct NewSizePreferenceKey: PreferenceKey {
    public typealias Value = CGSize
    public static let defaultValue: Value = .zero
    public static func reduce(value: inout Value, nextValue: () -> Value) { value = nextValue() }
}
