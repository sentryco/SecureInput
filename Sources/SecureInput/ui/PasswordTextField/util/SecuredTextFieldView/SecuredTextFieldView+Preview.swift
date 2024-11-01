import SwiftUI
import MockGen
/**
 * - Fixme: ⚠️️ Add debugview + state var
 * - Description: Provides a SwiftUI preview of the `SecuredTextFieldView` with a randomly generated password. It showcases the secured text field's appearance and behavior in a controlled environment for testing and debugging purposes.
 */
#Preview(traits: .fixedLayout(width: 400, height: 240)) {
   struct DebugView: View {
      @State var password: String = { // Initializes a state variable to hold the password
         CodeGen.generatePassword( // Generates a random password
            length: Int.random(in: 2...48), // Generates a random password length between 2 and 48 characters
            useLowercase: false, // Does not include lowercase letters in the password
            useNumbers: false, // Does not include numbers in the password
            useSpecialChars: false // Does not include special characters in the password
         ) // CodeGen.generatePassword(length: Int.random(in: 2...48)) // $3K#j9@Lm
      }()
      var body: some View {
         SecuredTextFieldView( // Initializes a SecuredTextFieldView instance
            hint: "text goes here", // Sets the placeholder text for the text field
            text: $password // Binds the password state variable to the text field
         )
      }
   }
   return PreviewContainer {
      DebugView()
      .padding()
      .background(Color(light: .white, dark: .black)) // - Fixme: ⚠️️ use .whiteBlack here
      #if os(macOS)
      .padding(.horizontal)
      #endif
   }
   .environment(\.colorScheme, .dark)
}
