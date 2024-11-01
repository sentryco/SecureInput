import SwiftUI
/**
 * Textfield style
 * - Description: A text field style that visually represents the strength of an input, typically used in conjunction with a strength indicator or slider.
 * - Note: Used in StrengthSlider
 * - Fixme: ⚠️️ Maybe add some kind of restrictor? or do that else-where?
 * - Fixme: ⚠️️ Use TextView? or multiline textfield, do research, if so why?
 */
public struct StrengthTextFieldStyle: TextFieldStyle {
   /**
    * - Description: The color to use for the strength text field style.
    */
   public let color: Color
   /**
    * - Description: The body of the strength text field style.
    * - Fixme: ⚠️️ fixedSize makes it dynamic try that
    */
   public func _body(configuration: TextField<Self._Label>) -> some View {
      configuration
         #if os(macOS)
         .textFieldStyle(.plain) // ⚠️️ Remove the default macOS styling from a TextField, this will remove all styling, including padding and background color. You may need to add additional modifiers to achieve the desired look.
         #endif
         .multilineTextAlignment(.trailing) // Aligns the text within the text field to the trailing edge.
         .frame(width: 36) // <-- Fixme: ⚠️️ make this dynamic somehow? just use padding etc?
         .foregroundStyle(color) // Sets the foreground color of the text field to the specified color.
   }
}
/**
 * Convenient
 */
extension TextField {
   /**
    * - Description: Applies the custom strength text field style to the text field.
    * - Parameter color: The color to use for the strength text field style.
    * - Returns: A modified version of the text field with the strength text field style applied.
    */
   @warn_unqualified_access // ref: https://www.hackingwithswift.com/quick-start/swiftui/how-to-make-swiftui-modifiers-safer-to-use-with-warn-unqualified-access
   public func strengthTextFieldStyle(color: Color) -> some View {
      let tfStyle = StrengthTextFieldStyle(color: color)
      return self.textFieldStyle(tfStyle)
   }
}
/**
 * Preview
 */
#Preview(traits: .fixedLayout(width: 200, height: 200)) {
   PreviewContainer {
      TextField("applied here", text: .constant("123"))
         .strengthTextFieldStyle(color: .gray)
         .padding()
         .frame(maxWidth: .infinity)
         .background(Color.blackOrWhite)
         #if os(macOS)
         .padding(.horizontal)
         #endif
   }
}
