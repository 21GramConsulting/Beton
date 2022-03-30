import Foundation

/// Defines the ``default`` unit for
/// [`UnitElectricCharge`](https://developer.apple.com/documentation/foundation/unitelectriccharge)
extension UnitElectricCharge: Unit {
  /// Returns [ampereHours](https://developer.apple.com/documentation/foundation/unitelectriccharge/1856117-amperehours).
  public static var `default`: UnitElectricCharge { .ampereHours }
}
