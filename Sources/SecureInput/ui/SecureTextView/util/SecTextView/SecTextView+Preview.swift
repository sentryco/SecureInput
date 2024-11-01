import SwiftUI
import MockGen
/**
 * Preview
 * - Description: This section provides a preview of the `SecTextView` component. It demonstrates the component's functionality and appearance in a controlled environment, which is useful for development and testing purposes.
 */
#Preview(traits: .fixedLayout(width: 400, height: 300)) {
   /**
    * - Fixme: ⚠️️ has issue with init if input has content and isSecure is true, figure it out
    */
   struct ContentView: View {
      @State var visibleInput1: String = SecRan.randomSecret() ?? "xyz123" // "abc123\n123abc" // temp storage
      // @State var visibleInput2: String = "abc123\n123abc"
      @State var isSecure: Bool = false // Indicates whether the text in SecTextView should be obscured.
      var body: some View {
         PreviewContainer {
            SecTextView( // A secure text view that toggles between hidden and visible text
               isSecured: $isSecure, // Binds the isSecure state variable to the SecTextView
               visibleInput: $visibleInput1 // Binds the visibleInput1 state variable to the SecTextView
            )
               .padding() // Applies padding to the SecTextView
               .background(Color.blackOrWhite) // Sets the background color of the SecTextView to either black or white based on the color scheme
               #if os(macOS)
               .padding(.horizontal) // Applies horizontal padding to the SecTextView for macOS
               #endif
         }
      }
   }
   return ContentView()
      // .padding()
//      .background(.gray.opacity(0.2))
//      .background(Color.blackOrWhite)
      .environment(\.colorScheme, .dark)
}
