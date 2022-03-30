import Foundation

/// Defines the ``default`` unit for
/// [`UnitSpeed`](https://developer.apple.com/documentation/foundation/unitspeed)
extension UnitSpeed: Unit {
  /// Returns [kilometersPerHour](https://developer.apple.com/documentation/foundation/unitspeed/1856044-kilometersperhour).
  public static var `default`: UnitSpeed { .kilometersPerHour }
}
