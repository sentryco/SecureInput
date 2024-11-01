import SwiftUI
import MockGen
/**
 * We need this, because we use this without the reveal button as well
 * - Abstract: A normal TextField that switch between concealed and and visible psw
 * - Description: A SwiftUI view that toggles between a concealed and visible password field. It is designed for displaying passwords securely with the option to reveal the content for verification purposes. It is not intended for inline editing of passwords but rather for secure presentation and controlled visibility in user interfaces.
 * - Note: Grows in the vertical space
 * - Note: Uses mono font
 * - Note: Is suitable for showing passwords. Not editing them inline
 * - Note: Used in `PassRowView` in `ReadList` and `PassGenRow` that is used in "PassGenView"
 * - Fixme: ⚠️️ Clean up and re-add the comments etc, from legacy or?
 * - Fixme: ⚠️️ Rename to `SecTextField`? if not occupied by something else?
 * - Note: This component is used in `PassRowView` in `ReadList` and `PassGenRow` that is used in "PassGenView".
 */
internal struct SecTextView: View {
   /**
    * The input value
    * - Description: The current value of the text field which the user can edit. This value is displayed in either concealed or visible form based on the `isSecured` state.
    */
   @State var inputValue: String
   /**
    * The isSecured state
    * - Description: A boolean state that determines whether the text in the text field is obscured. When true, the text is displayed as dots or asterisks to hide the actual characters, providing a secure way to enter sensitive information such as passwords.
    */
   @Binding var isSecured: Bool
   /**
    * The visible input
    * - Description: A string that reflects the current visible state of the password. When `isSecured` is false, this string is updated with the password input by the user, allowing it to be visible for verification purposes.
    */
   @Binding internal var visibleInput: String
   /**
    * The placeholder text
    * - Description: A string that is displayed when there is no text entered in the text field. It provides a hint to the user about what type of information is expected to be entered.
    */
   internal let placeholderText: String
   /**
    * The isDisabled state
    * - Description: Indicates whether the view is interactive or not. When true, user input is ignored and the view appears in a disabled state.
    */
   let isDisabled: Bool
   /**
    * This initializer creates an instance of SecTextView. It takes a binding to a boolean that determines whether the text field is in secure text entry mode, a binding to a string that reflects the current visible state of the password, a placeholder string for when the input field is empty, and a boolean that indicates whether the view is interactive or not.
    * - Parameters:
    *   - isSecured: Toggle revealed or concealed
    *   - visibleInput: Temp storeage and init text
    *   - placeholderText: A placeholder text, if there is no content
    *   - isDisabled: Needed to make popover work for macOS
    */
   internal init(isSecured: Binding<Bool>, visibleInput: Binding<String>, placeholderText: String = "Password", isDisabled: Bool = false) {
      self.inputValue = visibleInput.wrappedValue
      self._isSecured = isSecured
      // - Fixme: ⚠️️ Bind hidden or shown bellow somehow
      self._visibleInput = visibleInput
      self.placeholderText = placeholderText
      self.isDisabled = isDisabled
   }
}
