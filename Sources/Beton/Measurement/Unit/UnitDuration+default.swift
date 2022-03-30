import Foundation

/// Defines the ``default`` unit for
/// [`UnitDuration`](https://developer.apple.com/documentation/foundation/unitduration)
extension UnitDuration: Unit {
  /// Returns [seconds](https://developer.apple.com/documentation/foundation/unitduration/1856005-seconds).
  public static var `default`: UnitDuration { .seconds }
}
