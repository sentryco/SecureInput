import SwiftUI
import TextColorizer
/**
 * Preview
 * - Description: This is a preview of the SecText 
 *               SwiftUI view. It creates a debug 
 *               container with a SecText view that 
 *               displays a string of characters. The 
 *               string can be toggled between plain 
 *               text and obscured text.
 * - Fixme: ⚠️️ doesnt seem to work atm, all chars get the same color etc, might be because its macOS and it for some reason only works for iOS
 */
#Preview(traits: .fixedLayout(width: 400, height: 300)) {
   struct DebugContainer: View {
      @State var str: String = "abc123#$@"
      @State var isSecure: Bool = false
      var body: some View {
         SecText(isSecured: $isSecure, str: $str, placeholderStr: "Password")
      }
   }
   return PreviewContainer {
      DebugContainer()
         .padding() // .padding(16)
         .background(Color.blackOrWhite)
         #if os(macOS)
         .padding(.horizontal)
         #endif
   }
   .environment(\.colorScheme, .dark)
}
