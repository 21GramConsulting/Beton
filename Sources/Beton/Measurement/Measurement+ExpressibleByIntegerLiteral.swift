import Foundation

extension Measurement: ExpressibleByIntegerLiteral where UnitType: Unit, UnitType.U == UnitType {
  public init(integerLiteral value: Int) {
    self.init(value: Double(value), unit: .default)
  }
}
