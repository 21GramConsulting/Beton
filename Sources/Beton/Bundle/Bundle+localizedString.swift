import Foundation

extension Bundle {
  /// A convenience API for
  /// [`localizedString(forKey:value:table:)`](https://developer.apple.com/documentation/foundation/bundle/1417694-localizedstring).
  ///
  /// Equivalent to calling `localizedString(forKey: key, value: nil, table: nil)`.
  public func localizedString(_ key: String) -> String {
    self.localizedString(forKey: key, value: nil, table: nil)
  }

  /// A convenience API for
  /// [`localizedString(forKey:value:table:)`](https://developer.apple.com/documentation/foundation/bundle/1417694-localizedstring).
  ///
  /// Equivalent to calling `localizedString(forKey: key, value: nil, table: table)`.
  public func localizedString(_ key: String, from table: String) -> String {
    self.localizedString(forKey: key, value: nil, table: table)
  }

  /// A convenience API for
  /// [`localizedString(forKey:value:table:)`](https://developer.apple.com/documentation/foundation/bundle/1417694-localizedstring).
  ///
  /// Equivalent to calling `localizedString(forKey: key, value: fallback, table: nil)`.
  public func localizedString(_ key: String, fallback: String) -> String {
    self.localizedString(forKey: key, value: fallback, table: nil)
  }
}
