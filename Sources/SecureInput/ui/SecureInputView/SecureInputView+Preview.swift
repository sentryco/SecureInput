import SwiftUI
/**
 * Preview (DarkMode / LightMode)
 * - Description: A preview for `SecureInputView` that demonstrates the component in both dark and light mode, allowing developers to see how it looks and behaves with dynamic content. It includes a text field for password input with a customizable placeholder and showcases the secure text entry feature.
 * - Fixme: ⚠️️ Add frame for testing on iPad etc
 */
#Preview(traits: .fixedLayout(width: 400, height: 240)) {
   struct DebugView: View {
      @State var text: String = ""
      var body: some View {
         PreviewContainer {
            SecureInputView(placeholder: "Enter password", text: $text)
               .padding(Measure.margin)
               .background(Color.blackOrWhite)
               .onChange(of: text) { _, new in
                  Swift.print("new:  \(new)")
               }
               #if os(macOS)
               .padding(.horizontal)
               #endif
         }
         .environment(\.colorScheme, .dark)
      }
   }
   return DebugView()
}
