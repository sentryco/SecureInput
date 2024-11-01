import SwiftUI
import MockGen
/**
 * Content
 */
extension SecTextView {
   /**
    * The main view structure of the `SecTextView` which contains a text field that can toggle between secure and non-secure modes. This view also manages the changes in the text field when the secure mode is toggled.
    */
   public var body: some View {
      textField
         .onChange(of: isSecured) { _, _ in // Callback for when text changes
            // set scrambled text or real value (keep this as a oneliner, makes the entire method use less vertical space etc)
            visibleInput = isSecured ? String(inputValue.map { _ in Character("●") }) : inputValue
         }
   }
}
/**
 * Components
 */
extension SecTextView {
   /**
    * A TextField view that allows the user to input text. The text can be toggled between visible and obscured states for secure input, such as passwords. The TextField also supports vertical alignment of text.
    * - Fixme: ⚠️️ use a constant for the placholder font color
    */
   @ViewBuilder
   fileprivate var textField: some View {
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
