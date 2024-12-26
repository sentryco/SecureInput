import SwiftUI
/**
 * Great for single-line-password-fields
 * - Fixme: ⚠️️ add abstract
 * - Description: A SwiftUI view for secure single-line password fields,
 *               suitable for authentication and grant purposes. It does 
 *               not work with vertical axis text fields and may clear 
 *               text when toggling from unsecured to secure mode. This 
 *               view is used in `MasterPassView` and provides notes on 
 *               secure input, cursor management, and potential 
 *               improvements.
 * - Important: ⚠️️ Suitable for auth / grant. Not for storing passwords
 * - Important: ⚠️️ This does not work with vertical axis textfield
 * - Important: ⚠️️ The text will be cleared if the user continue to 
 *               write in secure mode after toggeling from unsecured 
 *               mode. This isnt such an issue when used in auth / 
 *               verify prompts, but can be if this field is to store 
 *               a password etc.
 * - Note: Used in: `MasterPassView`
 * - Note: Discusses secure input: 
 *         https://stackoverflow.com/questions/63095851/show-hide-password-how-can-i-add-this-feature
 * - Note: using opacity avoids resetting text when toggle, but cursor 
 *         pointer is lost, minor annoyance
 * - Note: Using `focusState` avoids cursor loss, but resets input, no go
 * - Note: To avoid keyboard loss between toggles see: 
 *         https://softwareanders.com/swiftui-password-show-and-hide/
 * - Note: Supports showing the last chracter you type: (very advance 
 *         solution) https://github.com/perfaram/TogglableSecureField
 * - Note: This component is utilized in views requiring secure text 
 *         entry, such as login, registration, and password update 
 *         forms within the ExampleApp.
 * - Fixme: ⚠️️ It might be possible to fix the clear issue, by storing text temp, and detect if text is cleared etc, try to fix this later etc
 * - Fixme: ⚠️️ Maybe us if else with focused instead of using opacity, see the stackoverflow discussion etc
 * - Fixme: ⚠️️⚠️️ We can also use UIPresentable and use the old secure-text-field code from legacy etc 👈
 * - Fixme: ⚠️️ describe how the isSecure value toggles the focus bools?
 */
public struct SecureInputView: View {
   /**
    * Placeholder string to display when the text is empty.
    * - Description: This string is shown in the text field 
    *               when there is no user input. It provides 
    *               a hint to the user about what type of 
    *               information is expected in the field.
    */
   internal let placeholder: String
   /**
    * Binding to the text state variable.
    * - Description: This binding allows the SecureInputView 
    *               to read and write the text state variable, 
    *               enabling two-way data binding between the 
    *               view and the underlying data model.
    */
   @Binding internal var text: String
   /**
    * State variable for the isSecure state.
    * - Description: Indicates whether the text field is in 
    *               secure text entry mode, which obscures 
    *               the text input.
    */
   @State internal var isSecure: Bool = true
   /**
    * Focus state for the isSecure state.
    * - Description: This is a focus state variable that is 
    *               used to manage the focus of the secured 
    *               text field. When the 'isSecure' state is 
    *               true, this focus state is activated, 
    *               allowing the user to interact with the 
    *               secured text field.
    */
   @FocusState internal var focus1: Bool
   /**
    * Focus state for the isSecure state.
    * - Description: This is a focus state variable that is 
    *               used to manage the focus of the unsecured 
    *               text field. When the 'isSecure' state is 
    *               false, this focus state is activated, 
    *               allowing the user to interact with the 
    *               unsecured text field.
    */
   @FocusState internal var focus2: Bool
   /**
    * Initializes the SecureInputView with a placeholder, 
    * text binding, and isSecure state.
    * - Description: This initializer creates an instance 
    *               of SecureInputView. It takes a placeholder 
    *               string, a binding to a text state variable, 
    *               and an optional boolean to set the initial 
    *               state of the secure input field. The 
    *               placeholder is displayed when the input 
    *               field is empty. The text binding allows 
    *               the SecureInputView to read and write 
    *               the text state variable. The isSecure 
    *               boolean determines whether the input 
    *               field should initially obscure the text 
    *               (true) or display it as plain text (false).
    * - Parameters:
    *   - placeholder: The placeholder text to display when the input is empty.
    *   - text: A binding to the text state variable.
    *   - isSecure: The initial state of the secure input field.
    */
   public init(placeholder: String, text: Binding<String>, isSecure: Bool = true) {
      self.placeholder = placeholder
      self._text = text
      self._isSecure = State(initialValue: isSecure)
   }
}
