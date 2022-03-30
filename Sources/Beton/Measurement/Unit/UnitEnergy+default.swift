import Foundation

/// Defines the ``default`` unit for
/// [`UnitEnergy`](https://developer.apple.com/documentation/foundation/unitenergy)
extension UnitEnergy: Unit {
  /// Returns [joules](https://developer.apple.com/documentation/foundation/unitenergy/1855987-joules).
  public static var `default`: UnitEnergy { .joules }
}
