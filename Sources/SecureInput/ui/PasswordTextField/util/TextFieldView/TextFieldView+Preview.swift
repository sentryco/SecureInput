import SwiftUI
import HybridColor
import MockGen
/**
 * Preview (Dark / Light mode)
 * - Description: Provides a SwiftUI preview of the `TextFieldView` in both dark and light mode, showcasing the appearance and behavior of the text field with a randomly generated password as placeholder text.
 *  - Fixme: ⚠️️ add debugcontainer + state var to test binding etc 👈
 */
#Preview(traits: .fixedLayout(width: 400, height: 240)) {
   PreviewContainer {
      let psw = String.randomPassword(pwdLength: Int.random(in: 2...48)) // Generates a random password of length between 2 and 48 characters
      TextFieldView(
         hint: "text goes here", // Placeholder text for the text field
         text: .constant(psw) // Binding to the generated password
         // isTextChanged: isTextChanged
      )
      .padding()
      .background(Color(light: .white, dark: .black)) // - Fixme: ⚠️️ use .whiteBlack here
      #if os(macOS)
      .padding(.horizontal)
      #endif
   }
   .environment(\.colorScheme, .dark)
}
