import Foundation

extension Measurement: ExpressibleByFloatLiteral where UnitType: Unit, UnitType.U == UnitType {
  public init(floatLiteral value: Double) {
    self.init(value: value, unit: .default)
  }
}
