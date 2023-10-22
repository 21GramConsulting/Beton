import Foundation

/// Defines the ``default`` unit for
/// [`UnitTemperature`](https://developer.apple.com/documentation/foundation/unittemperature)
extension UnitTemperature: Unit {
  /// Returns [celsius](https://developer.apple.com/documentation/foundation/unittemperature/1690835-celsius).
  public static var `default`: UnitTemperature { .celsius }
}
