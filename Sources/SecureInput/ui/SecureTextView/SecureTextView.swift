import SwiftUI
/**
 * Suitable for storing passwords etc (Supports multi-line)
 * - Description: Has `SecTextView` (left-aligned) and a `Button` with eye icon (right aligned)
 * - Important: ⚠️️ `secure-text-field` doesn't support axis: vertical, so we have to do it this way
 * - Remark: Not for auth / grant etc (for auth / grant we use the native secure textfield, it will reset on visibility change, but thats an acceptable drawback for more security etc)
 * - Note: Used in `EditPassRow` in "EditList", `PassGenRow` in "PassGenView"
 * - Note: Has no outline around password, - Fixme: ⚠️️ elaborate?
 * - Note: here is a version in UIKIT embedded in swiftUI: https://stackoverflow.com/a/77050041/5389500
 * - Fixme: ⚠️️ Reset cursor position, see legacy code for how
 * - Fixme: ⚠️️ Some issues with cursor etc, we need to update input state from slider as well
 * - Fixme: ⚠️️ See legacy code for how to fix this completly. good enough for now
 * - Fixme: ⚠️️ Rename to `SecTextContainerView`? maybe not? keep as is? or something else etc?
 * fix: add where this is used. use copilot. 
 */
public struct SecureTextView: View {
   /**
    * A state variable to temporarily store the secured state of the text view.
    * - Fixme: ⚠️️ should this be a binding? explore
    * - Description: Determines whether the text in the view is displayed in a secure (obscured) format. When true, the text appears as dots or asterisks to conceal the content, suitable for sensitive information like passwords.
    */
   @State var isSecured: Bool
   /**
    * - Description: One source of truth
    * - Description: This is a binding to the visible input string. It represents the text that is currently visible in the text field. If the text is secured, this string will consist of placeholder characters (like '●') instead of the actual input.
    */
   @Binding public var visibleInput: String
   /**
    * Placeholder text displayed when the input is empty.
    * - Description: This is a placeholder text that is displayed when there is no text entered in the text field. It provides a hint to the user about what type of information is expected to be entered.
    */
   public let placeholderText: String
   /**
    * Initializes a new SecureTextView.
    * - Description: The initializer sets up the SecureTextView with the specified security state, visible text, and placeholder text. It configures the view to either show the password as plain text or conceal it with a secure representation based on the `isSecured` parameter.
    * - Fixme: ⚠️️ Get the default placeholder text from const?
    * - Parameters:
    *   - isSecured: A boolean indicating whether the text is secured or not.
    *   - visibleInput: A binding to the visible input string.
    *   - placeholderText: The placeholder text to display when the input is empty.
    */
   public init(isSecured: Bool, visibleInput: Binding<String>, placeholderText: String = "Password"/*, isDisabled: Bool = false*/) {
      self.isSecured = isSecured
      self._visibleInput = visibleInput
      self.placeholderText = placeholderText
   }
}
