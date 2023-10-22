import Foundation

/// Defines the ``default`` unit for
/// [`UnitMass`](https://developer.apple.com/documentation/foundation/unitmass)
extension UnitMass: Unit {
  /// Returns [grams](https://developer.apple.com/documentation/foundation/unitmass/1855976-grams).
  public static var `default`: UnitMass { .grams }
}
