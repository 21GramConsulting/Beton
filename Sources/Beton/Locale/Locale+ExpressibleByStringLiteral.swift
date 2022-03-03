import Foundation

extension Locale: ExpressibleByStringLiteral {
  public init(stringLiteral locale: String) { self.init(identifier: locale) }
}