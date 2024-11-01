import SwiftUI
/**
 * Content
 * - Note: For ref: Using a formater to process the text: https://forums.developer.apple.com/forums/thread/659775
 */
extension SecureTextView {
   /**
    * The body of the `SecureTextView` composes a horizontal stack containing the text field and a button to toggle the visibility of the input text. The spacing between these elements is set to 4 points.
    * - Fixme: ⚠️️ Use constant for the spacing? 👈
    */
   public var body: some View {
      HStack(spacing: 4) { // Horizontal alignment
         textField
         button // reveal icon (eye)
      }
   }
}
/**
 * Components
 */
extension SecureTextView {
   /**
    * This property represents a view component that creates a `SecTextView`. It binds the `isSecured` and `visibleInput` state variables to the `SecTextView`, allowing it to toggle between secure and non-secure text display based on user interaction. The `placeholderText` is used as a hint for the user when the input field is empty.
    * - Fixme: ⚠️️ Rename to secureTextView?
    */
   fileprivate var textField: some View {
      SecTextView( // Creates a secure text view that can toggle between hidden and visible text states.
         isSecured: $isSecured, // Binding to the isSecured state variable
         visibleInput: $visibleInput, // Binding to the visibleInput state variable
         placeholderText: placeholderText // Placeholder text displayed when input is empty
      )
   }
   /**
    * Create `Toggle-icon-button` (Right side eye icon)
    * - Fixme: ⚠️️ Could we use a button style here? see other similar code etc,
    * - Fixme: ⚠️️ make a button style: `.toggleButton(img1: "", img2: "")` see similar code or use, try to see similar buttonstyle code elese where and replecate that
    * - Fixme: ⚠️️ Get icon names from const etc 👈
    */
   fileprivate var button: some View {
      Button {
         isSecured.toggle() // set scrambled text or real value
      } label: {
         Image(systemName: isSecured ? "eye" : "eye.slash") // right icon ( ⚠️️ we cant use constlib here for sfsym etc)
            .readRowIconStyle
      }
      #if os(macOS)
      .buttonStyle(.plain)
      #endif
   }
}
