import SwiftUI
import MockGen
/**
 * Content
 */
extension SecTextView {
   /**
    * - Description: The main view structure of the 
    *               `SecTextView` which contains a text 
    *               field that can toggle between secure 
    *               and non-secure modes. This view also 
    *               manages the changes in the text field 
    *               when the secure mode is toggled.
    */
   public var body: some View {
      textField
         .onChange(of: isSecured) { _, _ in // Callback for when text changes
            // set scrambled text or real value (keep this as a oneliner, makes the entire method use less vertical space etc)
            visibleInput = isSecured ? String(inputValue.map { _ in Character("●") }) : inputValue
         }
   }
}

