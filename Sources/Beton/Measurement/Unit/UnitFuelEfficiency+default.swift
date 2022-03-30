import Foundation

/// Defines the ``default`` unit for
/// [`UnitFuelEfficiency`](https://developer.apple.com/documentation/foundation/unitfuelefficiency)
extension UnitFuelEfficiency: Unit {
  /// Returns [litersPer100Kilometers](https://developer.apple.com/documentation/foundation/unitfuelefficiency/1856054-litersper100kilometers).
  public static var `default`: UnitFuelEfficiency { .litersPer100Kilometers }
}
