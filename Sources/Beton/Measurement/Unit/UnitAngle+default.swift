import Foundation

/// Defines the ``default`` unit for
/// [`UnitAngle`](https://developer.apple.com/documentation/foundation/unitangle)
extension UnitAngle: Unit {
  /// Returns [degrees](https://developer.apple.com/documentation/foundation/unitangle/1856083-degrees).
  public static var `default`: UnitAngle { .degrees }
}
