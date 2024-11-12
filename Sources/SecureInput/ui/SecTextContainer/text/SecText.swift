import SwiftUI
import TextColorizer
/**
 * - Description: `SecText` is a SwiftUI view that 
 *                conditionally displays text as either 
 *                plain or obscured based on the 
 *                `isSecured` binding. It supports a 
 *                placeholder when the text is empty and 
 *                uses an `AttributedString` to allow for 
 *                rich text presentation.
 * - Note: TextEditor doesn't support AttributedString
 * - Note: Using UITextView to get attributed string working: https://stackoverflow.com/a/77044684/5389500
 * - Note: great on attributedstring https://fatbobman.com/en/posts/attributedstring/
 * - Note: here is a nsattr to attrstr text wrapper: https://medium.com/@fereshte.zargaran/preserving-attributed-text-styles-in-swiftui-a-quick-guide-834c3004eb40
 * - Note: here is a NSTextView and UITextView swiftui wrapper: https://github.com/onmyway133/blog/issues/956
 * - Note: markdown in text: https://www.hackingwithswift.com/quick-start/swiftui/how-to-render-markdown-content-in-text
 * - Note: shows texteditor to text render setup: https://ix76y.medium.com/using-markdown-in-swiftui-d00e70cae7d1
 * - Note: quick markdown in text tutorial: https://www.avanderlee.com/swiftui/markdown-text/
 * - Note: markdown lib: https://github.com/gonzalezreal/swift-markdown-ui
 * - Note: complex textfield construct w/ optional binding: https://medium.com/geekculture/making-the-most-of-textfields-in-swiftui-5fd80d612502
 * - Note: UITextView swiftui wrapper: https://medium.com/makingtuenti/rendering-attributed-strings-in-swiftui-8a49f6cf2315
 * - Note: complex UIKit wrapper for attributed str: https://danielsaidi.com/blog/2022/06/13/building-a-rich-text-editor-for-uikit-appkit-and-swiftui
 * - Note: texteditor and textview wrapper: https://uvolchyk.medium.com/exploring-text-customisation-with-nsattributedstring-07147d34525f
 * - Note: rich-text-editor: https://github.com/canopas/rich-editor-swiftui and https://github.com/danielsaidi/RichTextKit
 * - Note: uitv and nstv wrapper: https://github.com/gonzalezreal/AttributedText
 * - Note: We make two bindings in this scope to make it work
 * - Note: Text will do fine for presentation. It might even be TextView under the hood
 * - Fixme: ⚠️️ Tweak the colors
 * - Fixme: ⚠️️ Using observedobject could actually be the best solution here if it reacts on multiple values so isVisible and str change. try it!
 * - Fixme: ⚠️️ Potentially only use this for the passgenview 👈
 */
internal struct SecText: View {
   /**
    * Binding to the isSecured state variable.
    * - Description: A boolean value that determines 
    *               whether the text should be displayed 
    *               as plain text or obscured as a password.
    */
   @Binding internal var isSecured: Bool
   /**
    * The current value of the text that will be displayed in the view.
    * - Description: A string value that represents the content 
                     of the text field. This can be plain text 
                     or obscured text based on the `isSecured` 
                     state.
    */
   @Binding internal var str: String
   /**
    * State variable for the attributed string.
    * - Description: A state variable that holds an 
    *               AttributedString version of the `str` 
    *               binding. This allows for rich text 
    *               formatting and styling to be applied 
    *               to the text content.
    */
   @State internal var attrStr: AttributedString = .init()
   /**
    * Placeholder string to display when the str is empty.
    * - Description: A string that is displayed when 
    *               the text field is empty, providing 
    *               a hint to the user about what 
    *               information is expected to be entered.
    */
   internal let placeholderStr: String
   /**
    * Initializes the SecText struct with the given bindings and placeholder string.
    * - Description: This initializer sets up the SecText view 
    *               with the necessary bindings and placeholder 
    *               string. 
    * - Note: The `isSecured` binding determines whether the 
    *         text should be displayed as plain text or 
    *         obscured.
    * - Note: The `str` binding represents the content of the 
    *         text field. The `placeholderStr` is displayed 
    *         when the text field is empty,
    * - Note: providing a hint to the user about what 
    *         information is expected to be entered.
    * - Parameters:
    *   - isSecured: Binding to the isSecured state variable.
    *   - str: Binding to the str state variable.
    *   - placeholderStr: Placeholder string to display when the str is empty.
    */
   internal init(isSecured: Binding<Bool>, str: Binding<String>, placeholderStr: String) {
      self._isSecured = isSecured
      self._str = str
      // Setting str might need to be rebinded to
      self.placeholderStr = placeholderStr
      self._attrStr = State(initialValue: attributedString)
   }
}
