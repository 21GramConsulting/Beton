import Foundation

/// Defines the ``default`` unit for
/// [`UnitLength`](https://developer.apple.com/documentation/foundation/unitlength)
extension UnitLength: Unit {
  /// Returns [meters](https://developer.apple.com/documentation/foundation/unitlength/1855995-meters).
  public static var `default`: UnitLength { .meters }
}
