import SwiftUI
/**
 * This modifier is used to secure text input by replacing characters with a placeholder character, such as '●', to conceal the actual input. It dynamically updates the visible input based on the user's input and the security state.
 * - Note: Used in `SecTextView`
 * - Note: There is preview for this in: `SecTextView`
 */
struct SecureTextModifier: ViewModifier {
   /**
    * Binding to the visible input string
    * - Description: This is a binding to the visible input string. It represents the text that is currently visible in the text field. If the text is secured, this string will consist of placeholder characters (like '●') instead of the actual input.
    */
   @Binding var visibleInput: String
   /**
    * Binding to the isSecured boolean
    * - Description: This is a binding to a boolean that determines whether the text in the text field is obscured. When true, the text is displayed as dots or asterisks to hide the actual characters, providing a secure way to enter sensitive information such as passwords.
    */
   @Binding var isSecured: Bool
   /**
    * Binding to the inputValue string
    * - Description: This is a binding to the internal string that stores the actual user input. It is used to keep track of the text entered by the user, regardless of whether the text is currently obscured (secured) or visible.
    */
   @Binding var inputValue: String
   /**
    * Body
    * - Description: This function modifies the provided content view by listening for changes in the visible input. If the input is secured, it replaces each character with a '●' character to obscure the actual input. It also manages the inputValue based on the changes in the visible input.
    * 1. Listen for changes to the visibleInput and capture the new value.
    * 2. If the input is not secured, update inputValue and exit the onChange closure.
    * 3. If new input is longer than or equal to current inputValue, filter out placeholder characters and append new characters to inputValue.
    * 4. If new input is shorter, remove the last character from inputValue.
    * 5. Replace each character in newValue with a placeholder character to obscure the actual input.
    * - Fixme: ⚠️️ Is there a smaller password character? 👉 see legacy etc 👈
    * - Parameter content: The view to which the SecureTextModifier is applied.
    * - Returns: The modified view with the SecureTextModifier applied.
    */
   func body(content: Content) -> some View {
      content
         .onChange(of: visibleInput) { (_, newValue: String) in // Listens for changes to the visibleInput and captures the new value
            guard isSecured else { inputValue = newValue; return }  // Check if input is secured, if not, update inputValue and exit
            if newValue.count >= inputValue.count {  // Check if new input is longer than or equal to current inputValue
               let newItem = newValue.filter { $0 != Character("●") }  // Filter out '●' characters from new input
               inputValue.append(newItem)  // Append new characters to inputValue
            } else {
               inputValue.removeLast()  // Remove last character from inputValue if new input is shorter
            }
            // Maps each character in newValue to '●' and converts the resulting array back to a string
            visibleInput = String(newValue.map { _ in Character("●") })
         }
   }
}
/**
 * convenient
 */
extension View {
   /**
    * Applies the SecureTextModifier to a view, managing the visibility and security of text input.
    * - Parameters:
    *   - visibleInput: The text visible to the user in the TextField.
    *   - isSecured: A boolean to toggle between concealed and revealed text.
    *   - inputValue: The actual input value sent to the remote listener.
    * - Returns: The modified view with the SecureTextModifier applied.
    */
   internal func secureTextModifier(visibleInput: Binding<String>, isSecured: Binding<Bool>, inputValue: Binding<String>) -> some View {
      let modifier = SecureTextModifier(
         visibleInput: visibleInput, // Binding to the visible input string
         isSecured: isSecured, // Binding to the isSecured boolean
         inputValue: inputValue // Binding to the inputValue string
      )
      return self.modifier(modifier)
   }
}
