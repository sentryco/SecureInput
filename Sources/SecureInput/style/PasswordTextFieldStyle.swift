import SwiftUI
/**
 * Password textfield style
 * - Description: A text field style that provides a secure 
 *                input field for password entry, featuring a 
 *                monospaced font and custom opacity for text 
 *                color to enhance readability and focus on 
 *                security.
 * - Note: Used in `SecureInputView` and `SecTextView`
 */
fileprivate struct PasswordTextFieldStyle: TextFieldStyle {
   /**
    * Body
    * - Description: This function is responsible for styling 
    *               the password text field.
    * - Fixme: ⚠️️ there is also: $0.font = .label
    * - Parameters:
    *   - configuration: The configuration of the text field.
    * - Returns: A view representing the body of the password 
    *           text field.
    */
   fileprivate func _body(configuration: TextField<Self._Label>) -> some View {
      let passwordFont: Font = .system(size: 18, weight: .regular, design: .monospaced) // .password
      return configuration
         #if os(macOS)
         .textFieldStyle(.plain) // ⚠️️ Removes the default macOS styling from a TextField, this will remove all styling, including padding and background color. You may need to add additional modifiers to achieve the desired look.
         #endif
         .vanillaTextFieldStyle // Turns of uneccesary textfield features
         .foregroundColor(Color.whiteOrBlack.opacity(0.8)) // Sets the text color to a semi-transparent white or black, depending on the environment, with an opacity of 0.8
         .font(passwordFont) // Sets the font style to a monospaced font with size 18 and regular weight
         // system(size: 18, weight: .regular, design: .monospaced)
   }
}
/**
 * Convenient
 * - Fixme: ⚠️️ Revert this to textfield so we can chain again, elaborate?
 */
extension View { // We use view as we have to support SecureTextField and TextField
   /**
    * Style
    */
   internal var passwordTextFieldStyle: some View {
      let tfStyle = PasswordTextFieldStyle()
      return self.textFieldStyle(tfStyle)
   }
}
/**
 * Preview
 * - Fixme: ⚠️️ use @state, add code to a debugcontainer
 */
#Preview(traits: .fixedLayout(width: 340, height: 300))  {
   PreviewContainer {
      TextField("test-text-field", text: .constant("Hello world"))
         .passwordTextFieldStyle
         .padding()
         .background(Color.blackOrWhite)
         #if os(macOS)
         .padding(.horizontal)
         #endif
   }
}
