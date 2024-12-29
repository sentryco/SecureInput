import SwiftUI
import MockGen
/**
 * - Description: This file defines a view modifier that applies an outline style to SwiftUI views.
 * - Fixme: ⚠️️ add preview?
 */
fileprivate struct OutlineViewModifier: ViewModifier {
   /**
    * Applies the outline style to a view.
    * - Description: This method is used to modify the view by adding an outline with a rounded rectangle border.
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
 * Provides a view modifier that applies an outline style to the view.
 */
extension View {
   /**
    * Provides a view modifier that applies an outline style to the view.
    * - Returns: A modified view with an outline border.
    */
   internal var outlineViewModifier: some View {
      let modifier = OutlineViewModifier()
      return self.modifier(modifier)
   }
}
