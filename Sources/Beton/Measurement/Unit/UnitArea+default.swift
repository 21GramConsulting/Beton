import Foundation

/// Defines the ``default`` unit for
/// [`UnitArea`](https://developer.apple.com/documentation/foundation/unitarea)
extension UnitArea: Unit {
  /// Returns [squareMeters](https://developer.apple.com/documentation/foundation/unitarea/1855985-squaremeters).
  public static var `default`: UnitArea { .squareMeters }
}
