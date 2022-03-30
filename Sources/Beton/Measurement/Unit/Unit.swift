import Foundation

/// Represents a [Unit](https://developer.apple.com/documentation/foundation/unit) of measure with a ``default`` unit.
public protocol Unit: Foundation.Unit {
  associatedtype U = Self
  /// The default unit. For example
  /// [`meters`](https://developer.apple.com/documentation/foundation/unitlength/1855995-meters) for
  /// [`UnitLength`](https://developer.apple.com/documentation/foundation/unitlength).
  static var `default`: U { get }
}
