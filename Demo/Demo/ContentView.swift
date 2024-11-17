import SwiftUI
import CaptureGuard

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .captureGuard {
            Text("Hello darkness my old friend")
        }
    }
}

#Preview {
    ContentView()
}
