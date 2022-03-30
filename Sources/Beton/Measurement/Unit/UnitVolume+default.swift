import Foundation

/// Defines the ``default`` unit for
/// [`UnitVolume`](https://developer.apple.com/documentation/foundation/unitvolume)
extension UnitVolume: Unit {
  /// Returns [liters](https://developer.apple.com/documentation/foundation/unitvolume/1856011-liters).
  public static var `default`: UnitVolume { .liters }
}
