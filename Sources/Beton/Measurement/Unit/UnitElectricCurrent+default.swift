import Foundation

/// Defines the ``default`` unit for
/// [`UnitElectricCurrent`](https://developer.apple.com/documentation/foundation/unitelectriccurrent)
extension UnitElectricCurrent: Unit {
  /// Returns [amperes](https://developer.apple.com/documentation/foundation/unitelectriccurrent/1855973-amperes).
  public static var `default`: UnitElectricCurrent { .amperes }
}
