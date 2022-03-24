import Foundation

/// Defines the ``default`` unit for
/// [`UnitPower`](https://developer.apple.com/documentation/foundation/unitpower)
extension UnitPower: Unit {
  /// Returns [watts](https://developer.apple.com/documentation/foundation/unitpower/1856075-watts).
  public static var `default`: UnitPower { .watts }
}
