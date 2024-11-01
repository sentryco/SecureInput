import Foundation
/**
 * Const
 */
extension PasswordTextField {
   /**
    * A closure that restricts the input text.
    * - Description: A closure that defines the rules 
    *               for restricting the input text in 
    *               the password field. It takes the input 
    *               text as a parameter and returns the 
    *               restricted text according to the 
    *               defined rules.
    * - Parameters:
    *   - text: The input text to be restricted.
    * - Returns: The restricted text.
    */
   public typealias Restrict = (_ text: String) -> String
}
