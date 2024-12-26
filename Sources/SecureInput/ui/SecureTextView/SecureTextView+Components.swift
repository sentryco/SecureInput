import SwiftUI
/**
 * Components
 */
extension SecureTextView {
   /**
    * - Description: This property represents a view component that 
    *               creates a `SecTextView`. It binds the `isSecured` 
    *               and `visibleInput` state variables to the 
    *               `SecTextView`, allowing it to toggle between 
    *               secure and non-secure text display based on user 
    *               interaction. The `placeholderText` is used as a 
    *               hint for the user when the input field is empty.
    * - Fixme: ⚠️️ Rename to secureTextView?
    */
   internal var textField: some View {
      SecTextView( // Creates a secure text view that can toggle between hidden and visible text states.
         isSecured: $isSecured, // Binding to the isSecured state variable
         visibleInput: $visibleInput, // Binding to the visibleInput state variable
         placeholderText: placeholderText // Placeholder text displayed when input is empty
      )
   }
   /**
    * Create `Toggle-icon-button` (Right side eye icon)
    * - Fixme: ⚠️️ Could we use a button style here? see other similar code etc,
    * - Fixme: ⚠️️ Make a button style: `.toggleButton(img1: "", img2: "")` see similar code or use, try to see similar buttonstyle code elese where and replecate that
    * - Fixme: ⚠️️ Get icon names from const etc 👈
    */
   internal var button: some View {
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
