//import SwiftUI
///**
// * Color scheme 1
// * - Description: Defines the primary color scheme for the application, providing a set of colors used throughout the UI for consistency and thematic styling.
// * - Fixme: ⚠️️ We might be able to just use swiftui rgb colors on the bellow.
// */
//extension Color {
//   /**
//    * Pale-Purple: A soft, almost lavender shade of purple. From the sources, a good match might be #E6E6FA which represents Lavender, a very light and pale shade of purple 4.
//    */
//   static let palePurple = Color(hex: "#E6E6FA")
//   /**
//    * Hazy-Mint: This suggests a muted, slightly desaturated mint green. While none of the exact shades were listed in the sources, a close approximation could be #8A9A5B, which is described as Sage Green, offering a hint towards the minty side but with a touch of gray to give it a hazy effect 4.
//    */
//   static let hazyMint = Color(hex: "#8A9A5B")
//   /**
//    * Suntan-Orange: This implies a warm, golden orange similar to the color of suntanned skin. A suitable choice might be #FF5733, which is a vibrant orange that could represent the warmth and glow of suntanned skin 4.
//    * - Note: Alternative name suntan-tangereen
//    */
//   static let suntanOrange = Color(hex: "#FF5733")
//   /**
//    * These colors should closely align with the descriptions given, providing a visually appealing and cohesive set of hues for various design applications.
//    */
//   static let colorScheme: AttributedString.Colors = (palePurple, hazyMint, suntanOrange)
//}
///**
// * Color scheme 2
// * - Description: Defines a secondary color scheme for the application, providing alternative color options for UI elements that require distinct visual themes.
// */
//extension Color {
//   /**
//    * Pale-purple:
//    * Purple is a combination of red and blue. To make it pale, we can reduce the intensity of both red and blue. A suitable hex-color for pale-purple could be #D1E0.
//    */
//   static let palePurple2: Color = .init(hex: "#D1E000")
//   /**
//    * Hazy-mint:
//    * Mint is a light shade of green, which is a combination of blue and yellow. To make it hazy, we can reduce the intensity of green. A suitable hex-color for hazy-mint could be #B2D0.
//    */
//   static let hazyMint2: Color = .init(hex: "#B2D000")
//   /**
//    * Suntan-orange:
//    * Orange is a combination of red and yellow. To make it suntan, we can reduce the intensity of red and increase the intensity of yellow. A suitable hex-color for suntan-orange could be #F5A9.
//    */
//   static let suntanOrange2: Color = .init(hex: "#F5A900")
//   /**
//    * To suggest hex-colors that match the given descriptions, I will first find the appropriate color codes and then provide them in the hexadecimal format.
//    */
//   static let colorScheme2: AttributedString.Colors = (palePurple2, hazyMint2, suntanOrange2)
//}
///**
// * Light Mode Colors
// * - Description: This section defines colors optimized for light mode, ensuring high readability and aesthetic appeal on lighter backgrounds.
// */
//extension Color {
//   /**
//    * Distressed Purple: This color should stand out against a white background but not be too harsh on the eyes. A softer shade of purple might work well.
//    */
//   static let distressedPurple: Color = .init(hex: "#9A5DFF")
//   /**
//    * Minty Retro Green: A vintage-inspired green that complements white backgrounds and is suitable for text.
//    */
//   static let mintyRetroGreen: Color = .init(hex: "#39CCCC")
//   /**
//    * Suntan Tangerine: A warm orange that pairs nicely with white for readability.
//    */
//   static let suntanTangerine: Color = .init(hex: "#F59E0B")
//}
///**
// * Dark Mode Colors
// * For dark mode, we need colors that will stand out against a near-black background. These colors should have enough contrast to ensure readability.
// * - Description: This section defines colors optimized for dark mode, ensuring high readability and aesthetic appeal on darker backgrounds.
// */
//extension Color {
//   /**
//    * Dark Distressed Purple: A deeper purple to maintain the theme but with higher contrast for dark mode.
//    */
//   static let darkDistressedPurple: Color = .init(hex: "#66107A")
//   /**
//    * Dark Minty Retro Green: A darker shade of green that still offers good contrast against a dark background.
//    */
//   static let darkMintyRetroGreen: Color = .init(hex: "#006400")
//   /**
//    * Dark Suntan Tangerine: A darker, more saturated orange to ensure visibility against the dark background.
//    */
//   static let darkSuntanTangerine: Color = .init(hex: "#C70039")
//}
///**
// * Creating color schemes that are both aesthetically pleasing and functional across different backgrounds requires careful consideration of contrast and visibility. Here are three colors for each set (light mode and dark mode) based on your requirements:
// * These color choices aim to balance aesthetics with functionality, ensuring that the text remains readable and visually appealing in both light and dark modes. The hex codes provided are just starting points; you may need to adjust them slightly based on your specific design needs and preferences.
// * - Description: This section defines a third color scheme, providing a set of colors optimized for both light and dark modes to enhance visibility and aesthetic appeal across different UI themes.
// */
//extension Color {
//   /**
//    * - Note: we could flip the colors, it would make them more legible, but I like the subdued look a bit
//    */
//   static let colorScheme3: AttributedString.Colors = (
//      .init(light: .distressedPurple, dark: .darkDistressedPurple),
//      .init(light: .mintyRetroGreen, dark: .darkMintyRetroGreen),
//      .init(light: .suntanTangerine, dark: .darkSuntanTangerine)
//   )
//}
///**
// * Assuming you have the extension defined somewhere in your project
// */
//extension Color {
//   /**
//    * Initializes a Color instance from a hexadecimal string representation.
//    * - Description: This initializer takes a hexadecimal string representation of a color and an optional alpha value. It parses the string to extract the red, green, and blue components of the color, and then initializes a Color instance with these components and the specified alpha value.
//    * - Parameters:
//    *   - hex: The hexadecimal string representation of the color
//    *   - alpha: The alpha value of the color, default is 1.0
//    */
//   fileprivate init(hex: String, alpha: Double = 1.0) {
//      let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
//      var int: UInt64 = 0
//      Scanner(string: hex).scanHexInt64(&int)
//      let r, g, b: UInt64
//      switch hex.count {
//      case 3: // RGB (12-bit)
//         (r, g, b) = ((int >> 8) * 17, ((int >> 4) & 0xF) * 17, (int & 0xF) * 17)
//      case 6: // RGB (24-bit)
//         (r, g, b) = (int >> 16, (int >> 8) & 0xFF, int & 0xFF)
//      default:
//         (r, g, b) = (0, 0, 0)  // Default to black if unrecognized
//      }
//      self.init(.sRGB, red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255, opacity: alpha)
//   }
//}
