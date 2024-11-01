import SwiftUI
import MockGen
import TextColorizer
/**
 * Content
 */
extension SecTextContainer {
   /**
    * Defines the body of the SecTextContainer view.
    * - Description: This is the main body of the SecTextContainer view. It consists of a horizontal stack (HStack) with a textField and a button. The textField is a secure text field that hides the input, and the button toggles the visibility of the text.
    */
   public var body: some View {
      HStack(spacing: 4) { // Horizontal alignment
         textField
         button // Reveal icon (eye)
      }
   }
}
/**
 * Components
 */
extension SecTextContainer {
   /**
    * Defines the textField view.
    * - Description: This view represents a secure text field where user input is obscured. It uses the SecText view, which supports a placeholder when the text is empty and uses an AttributedString to allow for rich text presentation. The view is bound to the isSecured state variable, which determines whether the text should be displayed as plain text or obscured, and the str state variable, which represents the content of the text field.
    */
   fileprivate var textField: some View {
      SecText( // Initializes a SecText view
         isSecured: $isSecured, // Binding to the isSecured state variable.
         str: $str, // Binding to the str state variable.
         placeholderStr: placeholderText // Placeholder string to display when the str is empty.
      )
   }
   /**
    * Defines the button view.
    * - Description: This view represents a button that toggles the visibility of the text in the secure text field. When the button is clicked, the 'isSecured' state variable is toggled, which in turn updates the display of the text field. The button's label is an image that changes based on the 'isSecured' state - an 'eye' icon when the text is obscured, and an 'eye.slash' icon when the text is visible.
    */
   fileprivate var button: some View {
      Button {
         isSecured.toggle()
      } label: {
         Image(systemName: isSecured ? "eye" : "eye.slash") // right icon (⚠️️ we cant use constlib here for sfsym etc)
            .readRowIconStyle
      }
      #if os(macOS)
      .buttonStyle(.plain)
      #endif
   }
}
