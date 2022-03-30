import Foundation

/// Defines the ``default`` unit for
/// [`UnitInformationStorage`](https://developer.apple.com/documentation/foundation/unitinformationstorage)
extension UnitInformationStorage: Unit {
  /// Returns [bits](https://developer.apple.com/documentation/foundation/unitinformationstorage/3172544-bits).
  public static var `default`: UnitInformationStorage { .bits }
}
