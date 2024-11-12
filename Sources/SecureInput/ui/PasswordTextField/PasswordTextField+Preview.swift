import SwiftUI
import HybridColor
import MockGen
/**
 * Preview (dark and light mode)
 * - Description: A preview for `PasswordTextField` that 
 *               shows the component in both dark and 
 *               light mode, allowing developers to see 
 *               how it looks and behaves with dynamic 
 *               content.
 * - Fixme: ⚠️️ Make this less tall or perfect now?
 * - Fixme: ⚠️️ DoC the lines a bit
 */
#Preview(traits: .fixedLayout(width: 400, height: 240)) {
   struct DebugView: View {
      @State var isPasswordVisible: Bool = false
      @State var password = String.randomPassword(pwdLength: Int.random(in: 2...48)) // ?? "xyz123"
      var body: some View {
         PasswordTextField(isPasswordVisible: $isPasswordVisible, hint: "Password goes here", text: $password)
            .padding()
            .background(Color.blackOrWhite)
            #if os(macOS)
            .padding(.horizontal)
            #endif
         // - Fixme: ⚠️️ remove default style for macoS?
      }
   }
   return PreviewContainer {
      DebugView()
   }
   .environment(\.colorScheme, .dark) // adds dark background in the preview
}
