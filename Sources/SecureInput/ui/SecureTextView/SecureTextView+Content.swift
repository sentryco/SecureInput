import SwiftUI
/**
 * Content
 * - Note: For ref: Using a formater to process the text: https://forums.developer.apple.com/forums/thread/659775
 */
extension SecureTextView {
   /**
    * The body of the `SecureTextView` composes a horizontal stack containing the text field and a button to toggle the visibility of the input text. The spacing between these elements is set to 4 points.
    * - Fixme: ⚠️️ Use constant for the spacing? 👈
    */
   public var body: some View {
      HStack(spacing: 4) { // Horizontal alignment
         textField
         button // reveal icon (eye)
      }
   }
}
