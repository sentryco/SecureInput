import SwiftUI
/**
 * Components
 */
extension SecureInputView {
   /**
    * body
    * - Description: The main view structure of the `SecureInputView` which contains a horizontal stack of the secure and non-secure text fields along with a toggle button to switch between them. This view also manages the initial focus state when it appears.
    */
   public var body: some View {
      HStack {
         textFieldsStack // Displays the stack of text fields for secure and insecure input
         toggleButton // Button to toggle between secure and insecure input modes
      }
      .accessID("pwsHStack") // InterfaceID.pwsHStack
      // - Fixme: ⚠️️ Make isSecure a binding, so we can set this from outside etc
      .onAppear { // Set init focus on appear
         DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) { // Seems like this is the official way (adding a dispatcher): https://www.kodeco.com/31569019-focus-management-in-swiftui-getting-started
            focus1 = isSecure
            focus2 = !isSecure
         }
      }
   }
}
