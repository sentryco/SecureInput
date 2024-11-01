import SwiftUI
import MockGen
import TextColorizer
/**
 * Content
 */
extension SecTextContainer {
   /**
    * Defines the body of the SecTextContainer view.
    * - Description: This is the main body of the 
    *               SecTextContainer view. It consists 
    *               of a horizontal stack (HStack) 
    *               with a textField and a button. The 
    *               textField is a secure text field 
    *               that hides the input, and the button 
    *               toggles the visibility of the text.
    */
   public var body: some View {
      HStack(spacing: 4) { // Horizontal alignment
         textField
         button // Reveal icon (eye)
      }
   }
}
