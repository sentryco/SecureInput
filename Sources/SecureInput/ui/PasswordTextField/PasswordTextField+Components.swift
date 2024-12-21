import SwiftUI
/**
 * Components
 */
extension PasswordTextField {
   /**
    * The main view of the password text field.
    * - Description: This view contains a horizontal stack with the password text field and an icon for toggling password visibility.
    */
   var stack: some View {
      HStack(spacing: .zero) { // Initializes a horizontal stack with no spacing between elements.
         passwordTextField // passwordTextField: Displays either a secure or insecure text field based on isPasswordVisible state
         // .background(Color.orange) // debug
         iconView // Displays the icon for the password field
         // .background(Color.green) // debug
      }
      .padding(12) // ⚠️️ was 20, but seemed too tall // Measure.defaultMargin
      .outlineViewModifier
   }
   /**
    * Displays either a secure or insecure text field based on the `isPasswordVisible` state.
    * - Description: This view component represents the 
    *               password text field. It dynamically 
    *               displays either a secure or an insecure 
    *               text field based on the `isPasswordVisible` 
    *               state. When `isPasswordVisible` is true, it 
    *               displays an insecure text field, allowing 
    *               the user to see the entered password. 
    *               When `isPasswordVisible` is false, it 
    *               displays a secure text field, obscuring 
    *               the entered password for security.
    * - Fixme: ⚠️️ psw overlapping icon somewhow, elaborate?
    */
   @ViewBuilder internal var passwordTextField: some View {
      if isPasswordVisible { // ⚠️️ We can't use or operator here, we can but then we must use AnyView, so not worth it
         // Displays the insecure text field when isPasswordVisible is true
         textFieldView
      } else {
         // Displays the secure text field when isPasswordVisible is false
         secureTextField
      }
   }
   /**
    * This view displays an icon that toggles the visibility of the password text field.
    * - Description: The icon serves as a visual toggle 
    *               for the password visibility state. 
    *               When the password is visible, the icon 
    *               shows an eye with a slash, indicating 
    *               that tapping the icon will obscure the 
    *               password. Conversely, when the password 
    *               is obscured, the icon shows an open eye, 
    *               suggesting that tapping it will reveal 
    *               the password. This provides an intuitive 
    *               way for users to control the security of 
    *               their password input.
    */
   internal var iconView: some View {
      // Creates an image view with the system eye icon. If isPasswordVisible is true, the icon is filled with a slash, indicating that the password is not visible. If isPasswordVisible is false, the icon is filled with an eye, indicating that the password is visible.
      Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill") // ⚠️️ we cant use constlib here for sfsym etc
         .padding(.leading, 12) // - Fixme: ⚠️️ doc this line
         .onTapGesture { // Adds a tap gesture to the image
            isPasswordVisible.toggle() // Toggles the isPasswordVisible state variable
         }
   }
}
/**
 * Private
 */
extension PasswordTextField {
   /**
    * TextField
    * - Description: A view component that creates a 
    *               standard text field for password 
    *               entry when the password is visible. 
    *               It binds to the `text` state variable 
    *               and applies the necessary platform-specific 
    *               modifiers to ensure the correct keyboard 
    *               behavior and appearance.
    * - Fixme: ⚠️️ Make tfview a viewmodifier and add tf style as an external tf style, maybe worth a later effort later
    */
   fileprivate var textFieldView: some View {
      TextFieldView(
         hint: hint, // Passes the placeholder text to the TextFieldView
         text: $text // Passes a binding to the text state variable to the TextFieldView
         // isTextChanged: isTextChanged
      )
      .disabled(!isEditable)
      // - Fixme: ⚠️️⚠️️ move the bellow into a viewmodifer or style etc?
      #if os(macOS)
      .textFieldStyle(.plain) // ⚠️️ Remove the default macOS styling from a TextField, this will remove all styling, including padding and background color. You may need to add additional modifiers to achieve the desired look.
      #endif
      // - Fixme: ⚠️️ use vanilla modifier here to disable keyboard features etc
      #if os(iOS)
      .autocapitalization(.none) // Sets the autocapitalization type to none
      #endif
      .disableAutocorrection(true) // Disables autocorrection for the text field
   }
   /**
    * Displays a secure text field for password input.
    * - Description: A view component that creates a 
    *               secure text field for password entry. 
    *               It obscures the text entered by the 
    *               user, providing an additional layer of 
    *               security. The field binds to the `text` 
    *               state variable and displays the placeholder 
    *               text when the field is empty.
    */
   fileprivate var secureTextField: some View {
      SecuredTextFieldView( // Initializes a SecuredTextFieldView
         hint: hint, // Passes the placeholder text to the SecuredTextFieldView
         text: $text // Passes a binding to the text state variable to the SecuredTextFieldView
      )
   }
}
