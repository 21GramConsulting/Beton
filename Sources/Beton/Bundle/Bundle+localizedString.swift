import Foundation

public extension Bundle {
  func localizedString(_ key: String) -> String {
    self.localizedString(forKey: key, value: nil, table: nil)
  }

  func localizedString(_ key: String, from table: String) -> String {
    self.localizedString(forKey: key, value: nil, table: table)
  }

  func localizedString(_ key: String, fallback: String) -> String {
    self.localizedString(forKey: key, value: fallback, table: nil)
  }
}