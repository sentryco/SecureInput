import SwiftUI
/**
 * Content
 * - Fixme: ⚠️️ move eye icon inside rounded stroke
 */
extension PasswordTextField {
   /**
    * body
    * - Description: The body of the `PasswordTextField` 
    *               which contains a `HStack` with a 
    *               `passwordTextField` and an `icon`. 
    *               The `passwordTextField` displays 
    *               either a secure or insecure text field 
    *               based on the `isPasswordVisible` state. 
    *               The `icon` is a visual representation 
    *               for the password field.
    */
   public var body: some View {
      HStack(spacing: .zero) { // Initializes a horizontal stack with no spacing between elements.
         passwordTextField // passwordTextField: Displays either a secure or insecure text field based on isPasswordVisible state
         // .background(Color.orange) // debug
         iconView // Displays the icon for the password field
         // .background(Color.green) // debug
      }
   }
}
