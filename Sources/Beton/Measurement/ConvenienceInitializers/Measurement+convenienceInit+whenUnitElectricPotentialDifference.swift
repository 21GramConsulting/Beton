extension Measurement where UnitType == UnitElectricPotentialDifference {
  public static func megavolts(_ value: Double) -> Self {
    .init(value: value, unit: .megavolts)
  }

  public static func kilovolts(_ value: Double) -> Self {
    .init(value: value, unit: .kilovolts)
  }

  public static func volts(_ value: Double) -> Self {
    .init(value: value, unit: .volts)
  }

  public static func millivolts(_ value: Double) -> Self {
    .init(value: value, unit: .millivolts)
  }

  public static func microvolts(_ value: Double) -> Self {
    .init(value: value, unit: .microvolts)
  }
}
