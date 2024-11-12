import SwiftUI
import TextColorizer
/**
 * Init
 */
extension SecText {
   /**
    * - Description: This is the main body of the SecText 
    *                SwiftUI view. It listens for changes 
    *                in the 'str' and 'isSecured' properties 
    *                and updates the 'attrStr' property 
    *                accordingly. The text is displayed with 
    *                a white or black color and a password 
    *                font.
    * - Fixme: ⚠️️ Ideally we should not have two onChange. try to solve the same way as we do SecTextView with a modifier
    */
   internal var body: some View {
      text
         .onChange(of: str) { _, _ in
            // This closure is triggered when the 'str' property changes. 
            // It updates the 'attrStr' property with the new attributed string.
            attrStr = attributedString
         }
         .onChange(of: isSecured) { _, _ in
            // This closure is triggered when the 'isSecured' property changes. 
            // It updates the 'attrStr' property with the new attributed string.
            attrStr = attributedString
         }
   }
}
