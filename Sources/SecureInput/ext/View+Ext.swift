import SwiftUI

extension View {
   /**
    * Adds accessibility identifier to container (VStack / HStack etc)
    * - Description: Adds an accessibility identifier to the view, which can be used for UI testing to find and interact with views within the app. This modifier is particularly useful when applied to container views like VStack or HStack, as it allows the contained views to be identified as part of a specific group in the UI hierarchy.
    * - Important: ⚠️️ returning self is very important. If we return the accessibilityIdentifier result then strange crashes that are hard to debug may happen
    * - Note: No need to use this with List. Use regular accessibilityIdentifier then
    * - Note: List doesnt need to use accessID, only VStack and HStack seems to need to use accessID
    * - Note: This is used in a lot of places, so tweak it carefully
    * - Fixme: ⚠️️ find some better way to return self? maybe use a modifier?
    * - Parameter id: The identifier to assign to the view.
    * - Returns: The view with the applied padding.
    */
   public func accessID(_ id: String) -> some View {
      self
         .accessibilityElement(children: .contain) // Enable accessID on container
         .accessibilityIdentifier(id) // Set the accessibility identifier of the view
   }
}
