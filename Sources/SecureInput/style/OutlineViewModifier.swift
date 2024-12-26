import SwiftUI
import MockGen
/**
 * - Fixme: ⚠️️ add doc
 * - Fixme: ⚠️️ add preview?
 */
fileprivate struct OutlineViewModifier: ViewModifier {
   /**
    * - Fixme: ⚠️️ add doc
    */
   fileprivate func body(content: Content) -> some View {
      content
         .overlay( // Applies an overlay view to the text field
            RoundedRectangle(cornerRadius: 8) // Creates a rounded rectangle with a corner radius of 8
               .strokeBorder( // Strokes the border of the rounded rectangle
                  Color.whiteOrBlack.opacity(0.3), // Sets the color of the border to a semi-transparent white or black, depending on the environment
                  style: StrokeStyle(lineWidth: 1.0) // Defines the style of the border, including its width
            )
         )
   }
}
/**
 * - Fixme: ⚠️️ add doc
 */
extension View {
   /**
    * - Fixme: ⚠️️ add doc
    */
   internal var outlineViewModifier: some View {
      let modifier = OutlineViewModifier()
      return self.modifier(modifier)
   }
}
