import Foundation

extension Measurement: @retroactive AdditiveArithmetic where UnitType: Unit, UnitType.U == UnitType {
  public static var zero: Self { Self.init(value: 0.0, unit: .default) }
}
