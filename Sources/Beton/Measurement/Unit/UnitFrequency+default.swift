import Foundation

/// Defines the ``default`` unit for
/// [`UnitFrequency`](https://developer.apple.com/documentation/foundation/unitfrequency)
extension UnitFrequency: Unit {
  /// Returns [hertz](https://developer.apple.com/documentation/foundation/unitfrequency/1690670-hertz).
  public static var `default`: UnitFrequency { .hertz }
}
