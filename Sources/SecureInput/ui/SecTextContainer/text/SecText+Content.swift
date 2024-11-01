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
   /**
    * Setting str might need to be rebinded to
    * - Description: This is a computed property that 
    *               returns a SwiftUI Text view. The 
    *               text displayed is the current value 
    *               of the 'attrStr' property. The text 
    *               color is set to either white or 
    *               black with 80% opacity, and the 
    *               font is set to a password style.
    * - Note: We can probably just use Text. it's 
    *         multiline and support attributedstring
    * - Fixme: ⚠️️ Try to move binding into onChange or in the scope of this struct etc
    */
   fileprivate var text: some View {
      let passwordFont: Font = .system(size: 18, weight: .regular, design: .monospaced) // .password
      return Text($attrStr.wrappedValue)
         .foregroundColor(Color.whiteOrBlack.opacity(0.8))
         .font(passwordFont)
   }
}
