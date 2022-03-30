import Foundation

/// Defines the ``default`` unit for
/// [`UnitDispersion`](https://developer.apple.com/documentation/foundation/unitdispersion)
extension UnitDispersion: Unit {
  /// Returns [partsPerMillion](https://developer.apple.com/documentation/foundation/unitdispersion/1690700-partspermillion).
  public static var `default`: UnitDispersion { .partsPerMillion }
}
