import Foundation

/// Defines the ``default`` unit for
/// [`UnitIlluminance`](https://developer.apple.com/documentation/foundation/unitilluminance)
extension UnitIlluminance: Unit {
  /// Returns [lux](https://developer.apple.com/documentation/foundation/unitilluminance/1823716-lux).
  public static var `default`: UnitIlluminance { .lux }
}
