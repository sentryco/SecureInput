import SwiftUI
import HybridColor
/**
 * Icon style
 * - Description: A style extension for Image views that configures icons specifically for read-row layouts in the application, ensuring visual consistency and adherence to the design language.
 */
extension Image {
   /**
    * Applies a predefined style to the icon used in read-row views.
    * - Description: This style configures the icon's size, padding, and color to ensure it matches the read-row's design specifications.
    * - Fixme: ⚠️️ move param to const?
    * - Fixme: ⚠️️ add custom size via param?
    * - Fixme: ⚠️️ make this relative to a scale etc
    * - Fixme: ⚠️️ use Metric.iconSize
    */
   internal var readRowIconStyle: some View {
      // there is also: Palette.Detail.icon
      let color: Color = { // Palette.Main.SearchBar.icon // .whiteOrBlack.opacity(0.6)
         .init(
            light: Color(hex: 0x222222) // The background color for light mode
               .opacity(0.6),
            dark: Color(hex: 0xC5C5C5) // The background color for dark mode
               .opacity(0.6)
         )
      }()
      return self.iconStyle(
         size: 20, // Sets the size of the icon to 20
         padding: 0, // Sets the padding around the icon to 0
         color: color// Sets the color of the icon to a semi-transparent white or black, depending on the environment, with an opacity of 0.6
      )
   }
}
/**
 * Preview
 */
#Preview(traits: .fixedLayout(width: 100, height: 100)) {
   PreviewContainer {
      Image(systemName: "star.fill") // We cant use constlib SFSym.star_fill.str here
         .readRowIconStyle
         .frame(maxWidth: .infinity)
         .padding()
         .background(Color.blackOrWhite.opacity(1))
   }
}
