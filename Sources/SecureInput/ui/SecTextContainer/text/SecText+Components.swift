import SwiftUI
import TextColorizer

extension SecText {
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
    * - Fixme: ⚠️️ move font to a TextFieldstyle etc? 👈
    */
   internal var text: some View {
      return Text($attrStr.wrappedValue)
         .secTextStyle
   }
}
