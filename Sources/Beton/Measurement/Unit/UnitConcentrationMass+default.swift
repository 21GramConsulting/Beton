import Foundation

/// Defines the ``default`` unit for
/// [`UnitConcentrationMass`](https://developer.apple.com/documentation/foundation/unitconcentrationmass)
extension UnitConcentrationMass: Unit {
  /// Returns [gramsPerLiter](https://developer.apple.com/documentation/foundation/unitconcentrationmass/1856019-gramsperliter).
  public static var `default`: UnitConcentrationMass { .gramsPerLiter }
}
