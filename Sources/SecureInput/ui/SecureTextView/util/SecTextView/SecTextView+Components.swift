import SwiftUI
import MockGen
/**
 * Components
 */
extension SecTextView {
   /**
    * - Description: A TextField view that allows the user
    *               to input text. The text can be toggled
    *               between visible and obscured states for
    *               secure input, such as passwords. The
    *               TextField also supports vertical alignment
    *               of text.
    * - Fixme: ⚠️️ use a constant for the placholder font color
    */
   @ViewBuilder
   internal var textField: some View {
      let tf: some View = TextField( // This line initializes a TextField view component.
         "secure-text-input", // Just accessibility, not important, not related to ui testing
         text: $visibleInput, // Binding to the visibleInput state variable
         prompt: Text(placeholderText).foregroundStyle(Color.gray), // When there is no content
         axis: .vertical // Sets the axis of the text field to vertical
      )
         .secureTextModifier(
            visibleInput: $visibleInput, // Binding to the visibleInput state variable
            isSecured: $isSecured, // Binding to the isSecured state variable
            inputValue: $inputValue // Binding to the inputValue state variable
         )
         .passwordTextFieldStyle // Adds the look and feel
      // InterfaceID.passwordTextField
         .accessibilityIdentifier("passwordTextField") // Adds ui-testing capabilities
      #if os(macOS)
      // Check if the text field is disabled
      if isDisabled {
         // Display the text field without interaction capabilities
         tf
            .focusable(false) // needed, or else there is a bug for macOS where text is selected after interaction wit menu
            .allowsHitTesting(false) // disables interaction on textfield, so we can avoid setting default disabled opacity  .disabled(true)
      } else {
         tf // This line returns the configured TextField view for macOS when it is not disabled.
      }
      #else
      tf // ios
      #endif
   }
}
