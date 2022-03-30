import Foundation

extension Locale: ExpressibleByStringLiteral {
  /// A convenience initializer that allows you to express a
  /// [`Locale`](https://developer.apple.com/documentation/foundation/locale) using a string literal.
  ///
  /// ```swift
  /// let locales: [Locale] = ["en_US", "en_GB", "hu_HU"]
  /// for locale in locales {
  ///   print("Currency symbol: \(locale.currencySymbol ?? "N/A")")
  /// }
  /// ```
  public init(stringLiteral locale: String) { self.init(identifier: locale) }
}
