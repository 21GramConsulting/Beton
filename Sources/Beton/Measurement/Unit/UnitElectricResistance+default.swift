import Foundation

/// Defines the ``default`` unit for
/// [`UnitElectricResistance`](https://developer.apple.com/documentation/foundation/unitelectricresistance)
extension UnitElectricResistance: Unit {
  /// Returns [ohms](https://developer.apple.com/documentation/foundation/unitelectricresistance/1856110-ohms).
  public static var `default`: UnitElectricResistance { .ohms }
}
