import Foundation

/// Defines the ``default`` unit for
/// [`UnitAcceleration`](https://developer.apple.com/documentation/foundation/unitacceleration).
extension UnitAcceleration: Unit {
  /// Returns [metersPerSecondSquared](https://developer.apple.com/documentation/foundation/unitacceleration/1856015-meterspersecondsquared).
  public static var `default`: UnitAcceleration { .metersPerSecondSquared }
}
