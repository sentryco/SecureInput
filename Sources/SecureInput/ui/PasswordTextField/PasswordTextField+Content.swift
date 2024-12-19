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
      stack
         .onChange(of: text) { (_ old: String, _ new: String) in
            // Applies the restrict function to the new text and updates the text state variable
            text = restrict(new)
         }
   }
}
