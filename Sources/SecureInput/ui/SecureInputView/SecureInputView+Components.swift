import SwiftUI
/**
 * Components
 */
extension SecureInputView {
   /**
    * Overlapping textfields that we toggle between
    * - Description: A ZStack that layers two text fields, 
    *               one secure and one not, which can be 
    *               toggled to show or hide the password.
    * - Fixme: ⚠️️ move accessID to some const etc
    */
   internal var textFieldsStack: some View {
      ZStack {
         secureTextField
         textField
      }
      .accessID("pwsZStack") // InterfaceID.pwsZStack
   }
   /**
    * Toggle button
    * - Description: A button that toggles the visibility 
    *               of the password. When the password is 
    *               obscured, the button shows an 'eye' icon, 
    *               indicating that clicking it will reveal 
    *               the password. Conversely, when the 
    *               password is visible, the button shows an 
    *               'eye.slash' icon, indicating that 
    *               clicking it will obscure the password.
    * - Note: alt icons: "lock.fill" : "lock.open"
    * - Fixme: ⚠️️ Use consts for the icons
    * - Fixme: ⚠️️ move accessID to some const etc
    * - Fixme: ⚠️️ Should we use an iconImageModifier here? see other similar code in the code-base?
    */
   internal var toggleButton: some View {
      Button {
         isSecure.toggle() // Toggles the isSecure state variable
         if isSecure { focus1 = true } else { focus2 = true } // Sets focus based on isSecure state
      } label: {
         Image(systemName: isSecure ? "eye" : "eye.slash") // Displays the appropriate icon based on isSecure state (⚠️️ we cant use constlib here for sfsym etc)
            .readRowIconStyle // Applies a style to the icon
      }
      #if os(macOS)
      .buttonStyle(.plain) // Resets default macOS button styling for macOS
      #endif
      // InterfaceID.passwordToggleButton
      .accessibilityIdentifier("passwordToggleButton") // Sets accessibility identifier for the button
   }
}
/**
 * Private
 */
extension SecureInputView {
   /**
    * Secure textfield
    * - Description: A secure text field for password input 
    *               that obscures the characters entered by 
    *               the user. It uses a placeholder text when 
    *               the field is empty and provides a visual 
    *               cue to the user that the input is secure.
    * - Note: The prompt is the placeholder text
    * - Note: sometimes  .textContentType(.password) prompts autofill for some reason
    * - Fixme: ⚠️️ move accessID to some const etc
    */
   fileprivate var secureTextField: some View {
      let placeholderText = Text(placeholder) // Placeholder text with foreground color
         .foregroundStyle(Color(light: .gray, dark: .gray).opacity(0.8)) // Set foreground color
      return SecureField("stf", text: $text, prompt: placeholderText) // Secure text field with placeholder text
      // InterfaceID.securePasswordTextField
         .accessibilityIdentifier("securePasswordTextField") // Set accessibility identifier
         .passwordTextFieldStyle // Apply password text field style
         .textContentType(.init(rawValue: "")) // Set text content type
         .opacity(isSecure ? 1 : 0) // Set opacity based on isSecure state
         .focused($focus1) // Set focus based on isSecure state

   }
   /**
    * Textfield
    * - Description: A non-secure text field for password 
    *               input that allows the characters 
    *               entered by the user to be visible. It 
    *               uses a placeholder text when the field 
    *               is empty and provides a visual cue to 
    *               the user that the input is not obscured.
    * - Note: the prompt is the placeholder text
    * - Note: ⚠️️ sometimes  .textContentType(.password) prompts autofill for some reason
    * - Fixme: ⚠️️ move accessID to some const etc
    */
   fileprivate var textField: some View {
      let placeholderText: Text = {
         let color = Color(light: .gray, dark: .gray).opacity(0.8)
         return .init(placeholder)
            .foregroundStyle(color)
      }()
      return TextField(
         "test-text-field",  // Placeholder text
         text: $text,  // Binding to the text state variable
         prompt: placeholderText // Set prompt text with foreground color
      )
      // InterfaceID.passwordTextField
      .accessibilityIdentifier("passwordTextField") // Set accessibility identifier
      .passwordTextFieldStyle // Apply password text field style
      .textContentType(.init(rawValue: "")) // Set text content type
      .focused($focus2) // Set focus based on isSecure state
      .opacity(isSecure ? 0 : 1) // Set opacity based on isSecure state
   }
}
