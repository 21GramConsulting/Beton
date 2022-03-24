import Foundation

/// Defines the ``default`` unit for
/// [`UnitPressure`](https://developer.apple.com/documentation/foundation/unitpressure)
extension UnitPressure: Unit {
  /// Returns [bars](https://developer.apple.com/documentation/foundation/unitpressure/1856109-bars).
  public static var `default`: UnitPressure { .bars }
}
