import SwiftUI
import MockGen
import TextColorizer
/**
 * SecTextContainer is a SwiftUI view that encapsulates a `secure-text-field` with a `toggle-button`. 
 * - Note: The secure text field obscures the input text, making it suitable for password input.
 * - Note: The toggle button allows the user to switch between obscured and plain text display. 
 * - Note: This view is designed to be reusable and can be integrated into any SwiftUI view hierarchy.
 * - Fixme: ⚠️️ For now this is just for previewing, but will be used with OnGesture btn later
 * - Fixme: ⚠️️ Not in use atm, but we might use it later, some ideas here that we can repurpouse as well. 
 */
public struct SecTextContainer: View {
   /**
    * State variable for the isSecured state.
    * - Description: A boolean value that determines whether the text should be displayed as plain text or obscured as a password.
    */
   @State internal var isSecured: Bool
   /**
    * Binding to the str state variable.
    * - Description: A string value that represents the content of the text field. This can be plain text or obscured text based on the `isSecured` state.
    */
   @Binding internal var str: String
   /**
    * Placeholder string to display when the str is empty.
    * - Description: A string that is displayed when the text field is empty, providing a hint to the user about what information is expected to be entered.
    */
   internal let placeholderText: String
   /**
    * Initializes the SecTextContainer struct with the given bindings and placeholder string.
    * - Description: This initializer sets up the SecTextContainer view with the necessary bindings and placeholder string. The `isSecured` state determines whether the text should be displayed as plain text or obscured. The `str` binding represents the content of the text field. The `placeholderText` is displayed when the text field is empty, providing a hint to the user about what information is expected to be entered.
    * - Parameters:
    *   - isSecured: The initial state of the isSecured property.
    *   - str: A binding to the string state variable.
    *   - placeholderText: The placeholder string to display when the str is empty.
    */
   public init(isSecured: Bool, str: Binding<String>, placeholderText: String) {
      self._isSecured = State(initialValue: isSecured)
      self._str = str
      self.placeholderText = placeholderText
   }
}
