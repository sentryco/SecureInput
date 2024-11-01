import SwiftUI
/**
 * Style
 * - Description: A text field style that provides a secure 
 *                input field with a custom appearance, typically 
 *                used for password or sensitive data entry. It 
 *                features a rounded border and subtle shading 
 *                to indicate interactivity while maintaining a 
 *                sleek and minimalistic design.
 * - Note: Used in `secure-text-field-view` and `text-field-view`
 */
internal struct PassTextFieldStyle: TextFieldStyle {
   /**
    * - Description: Constructs the visual representation of 
    *               the text field, applying custom styling 
    *               and layout modifications.
    */
   internal func _body(configuration: TextField<Self._Label>) -> some View {
      configuration
         #if os(macOS)
         .textFieldStyle(.plain) // ⚠️️ Remove the default macOS styling from a TextField, this will remove all styling, including padding and background color. You may need to add additional modifiers to achieve the desired look.
         #endif
         .padding(12) // ⚠️️ was 20, but seemed too tall // Measure.defaultMargin
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
 * Convenient
 */
extension View {
   /**
    * Style
    */
   internal var passTextFieldStyle: some View {
      let tfStyle = PassTextFieldStyle()
      return self.textFieldStyle(tfStyle)
   }
}
/**
 * Preview
 */
#Preview(traits: .fixedLayout(width: 340, height: 200)) {
   PreviewContainer {
      TextField("Placeholder", text: .constant("abc123"))
         .passTextFieldStyle
         .padding()
         .background(Color.blackOrWhite.opacity(1))
         #if os(macOS)
         .padding(.horizontal)
         #endif
   }
}
