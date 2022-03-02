import Foundation

public protocol Unit: Foundation.Unit {
  associatedtype U = Self
  static var `default`: U { get }
}
