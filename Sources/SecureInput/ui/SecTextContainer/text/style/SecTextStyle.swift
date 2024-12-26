import SwiftUI

fileprivate struct SecTextStyle: TextFieldStyle {
   fileprivate func _body(configuration: TextField<Self._Label>) -> some View {
      let passwordFont: Font = .system(size: 18, weight: .regular, design: .monospaced)
      return configuration
         .foregroundColor(Color.whiteOrBlack.opacity(0.8))
         .font(passwordFont)
   }
}
extension View {
   internal var secTextStyle: some View {
      let tfStyle = SecTextStyle()
      return self.textFieldStyle(tfStyle)
   }
}
