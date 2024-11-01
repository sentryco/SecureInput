import SwiftUI
import HybridColor
import TextColorizer
/**
 * Getter
 */
extension SecText {
   /**
    * - Description: This computed property returns an 
    *               `AttributedString` based on the 
    *               current state of the `SecText` view. 
    *               If the text field is empty, it returns 
    *               an `AttributedString of the placeholder 
    *               string. If the 'isSecured' state is 
    *               true, it returns an AttributedString of 
    *               obscured characters. Otherwise, it 
    *               returns a colorized AttributedString of 
    *               the text field's content.
    * - Note: Binding on content, that we can rebind and do colorization on
    * - Note: Binding that handles secure or not secure
    * - Note: We can do this with rebinding as well
    * - Fixme: ⚠️️ Move the colors into const values?
    */
   internal var attributedString: AttributedString {
      guard !$str.wrappedValue.isEmpty else { return AttributedString(placeholderStr) } // show placeholder if no content
      if $isSecured.wrappedValue {
         return AttributedString($str.wrappedValue.map { _ in Character("●") })
      } else {
         let blue: Color = {
            #if os(iOS)
            .init( // - Fixme: ⚠️️ for some reason Color.blue crashes, so use Color(uiColor: .systemBlue)
               light: .init(uiColor: UIColor.systemBlue.darker(amount: 0.2)),
               dark: .init(uiColor: UIColor.systemBlue.lighter(amount: 0.4))
            )
            #elseif os(macOS)
            .init( // - Fixme: ⚠️️ for some reason Color.blue crashes, so use Color(uiColor: .systemBlue)
               light: .init(nsColor: NSColor.systemBlue.darker(amount: 0.2)),
               dark: .init(nsColor: NSColor.systemBlue.lighter(amount: 0.4))
            )
            #endif
         }()
         let green: Color = {
            #if os(iOS)
            .init( // - Fixme: ⚠️️ for some reason Color.blue crashes, so use Color(uiColor: .systemBlue)
               light: .init(uiColor: UIColor.systemGreen.darker(amount: 0.2)),
               dark: .init(uiColor: UIColor.systemGreen.lighter(amount: 0.4))
            )
            #elseif os(macOS)
            .init( // - Fixme: ⚠️️ for some reason Color.blue crashes, so use Color(uiColor: .systemBlue)
               light: .init(nsColor: NSColor.systemGreen.darker(amount: 0.2)),
               dark: .init(nsColor: NSColor.systemGreen.lighter(amount: 0.4))
            )
            #endif
         }()
         let red: Color = {
            #if os(iOS)
            .init( // - Fixme: ⚠️️ for some reason Color.blue crashes, so use Color(uiColor: .systemBlue)
               light: .init(uiColor: UIColor.systemRed.darker(amount: 0.4)),
               dark: .init(uiColor: UIColor.systemRed.lighter(amount: 0.2))
            )
            #elseif os(macOS)
            .init( // - Fixme: ⚠️️ for some reason Color.blue crashes, so use Color(uiColor: .systemBlue)
               light: .init(nsColor: NSColor.systemRed.darker(amount: 0.4)),
               dark: .init(nsColor: NSColor.systemRed.lighter(amount: 0.2))
            )
            #endif
         }()
         let colors: (Color, Color, Color) = (blue, green, red)
         _ = colors
         return .attributedString(text: $str.wrappedValue, colors: Color.defaultColorScheme) // var attributedString = AttributedString(String(text), attributes: .init([.foregroundColor: Color.red]))
      }
   }
}
