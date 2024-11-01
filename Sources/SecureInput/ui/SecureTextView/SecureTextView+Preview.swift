import SwiftUI
import MockGen
/**
 * Preview (DarkMode / LightMode)
 * - Description: This preview showcases the SecureTextView component in both DarkMode and LightMode, allowing developers to visually inspect and interact with the component in different color schemes.
 */
#Preview(traits: .fixedLayout(width: 400, height: 300)) {
   /**
    * - Fixme: ⚠️️ Has issue with init if input has content and isSecure is true, figure it out, elaborate more?, still relevant?
    */
   struct ContentView: View {
      @State var visibleInput1: String = SecRan.randomSecret() ?? "xyz123" //"abc123\n123abc" // temp storage
      var body: some View {
         PreviewContainer {
            SecureTextView(isSecured: false, visibleInput: $visibleInput1) // Creates a SecureTextView with isSecured set to false and binds visibleInput to $visibleInput1
               .padding() // Applies padding to the SecureTextView
               .background(Color.blackOrWhite) // Sets the background color of the SecureTextView to either black or white based on the color scheme
               #if os(macOS)
               .padding(.horizontal) // Applies horizontal padding to the SecureTextView for macOS
               #endif
         }
      }
   }
   return ContentView()
      .environment(\.colorScheme, .dark)
}
