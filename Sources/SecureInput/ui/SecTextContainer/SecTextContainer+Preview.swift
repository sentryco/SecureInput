import SwiftUI
import MockGen
import TextColorizer
/**
 * Preview
 * - Description: This is a preview of the 
 *               SecTextContainer SwiftUI view. It 
 *               generates a random password string 
 *               and displays it in a SecTextContainer. 
 *               The password can be toggled between 
 *               plain text and obscured text.
 */
#Preview(traits: .fixedLayout(width: 400, height: 300)) {
   struct ContentView: View {
      @State var str = String.randomPassword(pwdLength: Int.random(in: 24...148)) // ?? "xyz123" // SecRan.randomSecret(/*min: 24, max: 128*/)
      var body: some View {
         PreviewContainer {
            SecTextContainer(isSecured: false, str: $str, placeholderText: "Password")
               .padding()
               .background(Color.blackOrWhite)
               #if os(macOS)
               .padding(.horizontal)
               #endif
         }
      }
   }
   return ContentView()
      .environment(\.colorScheme, .dark)
}
