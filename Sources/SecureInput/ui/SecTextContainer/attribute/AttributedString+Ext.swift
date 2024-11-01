//import SwiftUI
//import HybridColor
///**
// * - Note: Alternate name for this: `Colorizer`
// * - Fixme: ⚠️️ Try greenish retro blue, washedout red, retro vintage car racing green
// * - Fixme: ⚠️️ Move color scheme to Pallet consts later etc
// * - Fixme: ⚠️️ Make this opensource?
// */
//extension AttributedString {
//   /**
//    * - Description: This function takes a string and applies a distinct color to each character based on whether it's a letter, number, or symbol. Letters are colored with the primary color, numbers with the secondary color, and symbols with the tertiary color. The result is an AttributedString where the text is visually categorized by character type, enhancing readability and aesthetic appeal.
//    * - Important: ⚠️️ Trying to refactor this with AttributeContainer([.foregroundColor: colors.primary] etc, doesnt seem to work. The color isnt added. Ther emight be some other way of doing it, might be worth looking into later
//    * - Note: We use the  ranges(of:)  method to get the ranges of letters, numbers, and symbols in the  text . We then iterate over these ranges and apply the desired foreground color to each range using the subscript syntax  attributedString[range].foregroundColor .
//    * - Note: Alt name: `colorizedAttrStr`
//    * - Fixme: ⚠️️ One easy way to simplify all this is to store color and char in a tuple. and apply it later. ask copilot to write up the code etc
//    * - Parameters:
//    *   - text: The input text to be colorized.
//    *   - colors: A tuple of three colors to be applied to letters, numbers, and symbols respectively.
//    * - Returns: An attributed string with colorized characters.
//    */
//   public static func attributedString(text: String, colors: Colors = defaultColors/*, defaultColor: Color = .whiteOrBlack*/) -> AttributedString {
//      var attributedString = AttributedString()
//      for character in text { // Iterates over each character in the input text
//         switch character {
//         case let char where char.isLetter: // Handles characters that are letters
//            // Swift.print("\(character) char.isLetter: \(character.isLetter)")
//            var attrStr = AttributedString(String(character)) // , attributes: .init([.foregroundColor: colors.primary])
//            attrStr.foregroundColor = colors.primary
//            attributedString.append(attrStr)
//         case let char where char.isNumber: // Handles characters that are numbers
//            // Swift.print("\(character) char.isNumber: \(character.isNumber)")
//            var attrStr = AttributedString(String(character)) // , attributes: .init([.foregroundColor: colors.secondary])
//            attrStr.foregroundColor = colors.secondary
//            attributedString.append(attrStr)
//         //  case let c where c.isSymbol: // - Fixme: ⚠️️ for some reason isSymbol doesnt work on symbols
//         default: // symbol
//            // Swift.print("\(character) char.isSymbol: \(character.isSymbol)")
//            var attrStr = AttributedString(String(character)) // , attributes: .init([.foregroundColor: colors.tertiary])
//            attrStr.foregroundColor = colors.tertiary
//            attributedString.append(attrStr)
//         }
//      }
//      return attributedString
//   }
//}
