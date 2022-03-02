import Foundation

public extension Sequence where Self.Element: AdditiveArithmetic {
  func sum() -> Element { reduce(Element.zero, +) }
}
