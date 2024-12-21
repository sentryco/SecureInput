import SwiftUI
/**
 * Password and toggle button
 * - Description: A view component that combines a 
 *               text field with a toggle button to 
 *               control the visibility of the entered 
 *               password. It allows the user to securely 
 *               enter a password, with the option to 
 *               reveal the text for verification purposes.
 * - Note: Used in `PasswordView`
 */
public struct PasswordTextField: View {
   /**
    * A binding to a boolean indicating if the password is visible.
    * - Description: A state variable that determines 
    *               whether the password entered in the 
    *               text field is visible as plain text or 
    *               obscured for security. When `true`, the 
    *               password is shown as plain text; when 
    *               `false`, it is obscured.
    */
   @Binding internal var isPasswordVisible: Bool
   /**
    * The placeholder text for the text field.
    * - Description: The text that is displayed within 
    *               the text field when it is empty, 
    *               providing a hint to the user about 
    *               the expected input for the password.
    * - Note: Alternate name: `placeholdertext`
    */
   internal var hint: String
   /**
    * A binding to the text in the text field.
    * - Description: A binding to the string value that 
    *               represents the password entered by 
    *               the user. This value is updated as 
    *               the user types into the password 
    *               field.
    * - Note: resets in secure mode if user continue to type
    */
   @Binding internal var text: String
   /**
    * A boolean indicating if the text field is editable.
    * - Description: This property determines whether the user can modify the text in the text field.
    *                When set to `true`, the text field is editable; when set to `false`, it is not.
    *                The default value is `true`.
    */
   let isEditable: Bool
   /**
    * A closure that restricts the input text. The default implementation allows all text.
    * - Note: This property is intended to be overridden to implement custom text restrictions.
    * - Fixme: ⚠️️ Store default restrict in a static let 👈 (it doesnt have to be a var tied to the instance etc)
    * - Description: A closure that restricts the input text. 
    *               The default implementation allows all 
    *               text. This property is intended to be 
    *               overridden to implement custom text 
    *               restrictions.
    */
   internal var restrict: Restrict = { (_ text: String) in text }
   /**
    * Initializes a `PasswordTextField` with the specified properties.
    * - Description: This initializer creates a new instance of 
    *               `PasswordTextField` with the provided 
    *               parameters. The `isPasswordVisible` parameter 
    *               determines the visibility of the password, 
    *               `hint` provides placeholder text for the text 
    *               field, `text` is a binding to the text in the 
    *               text field, and `restrict` is a closure that 
    *               can be used to restrict the input text.
    * - Parameters:
    *   - isPasswordVisible: A binding to a boolean indicating if the password is visible.
    *   - hint: The placeholder text for the text field.
    *   - text: A binding to the text in the text field.
    *   - restrict: A closure that restricts the input text, defaulting to no restriction.
    *   - isEditable: A boolean indicating if the text field is editable.
    */
   public init(isPasswordVisible: Binding<Bool>, hint: String, text: Binding<String>, isEditable: Bool = true, restrict: @escaping Restrict = { (_ text: String) in text }) {
      self._isPasswordVisible = isPasswordVisible
      self.hint = hint
      self._text = text
      self.isEditable = isEditable
      self.restrict = restrict
   }
}
// var isTextChanged: (Bool) -> Void
