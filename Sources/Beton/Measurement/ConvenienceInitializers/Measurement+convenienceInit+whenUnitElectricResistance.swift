extension Measurement where UnitType == UnitElectricResistance {
  public static func megaohms(_ value: Double) -> Self {
    .init(value: value, unit: .megaohms)
  }

  public static func kiloohms(_ value: Double) -> Self {
    .init(value: value, unit: .kiloohms)
  }

  public static func ohms(_ value: Double) -> Self {
    .init(value: value, unit: .ohms)
  }

  public static func milliohms(_ value: Double) -> Self {
    .init(value: value, unit: .milliohms)
  }

  public static func microohms(_ value: Double) -> Self {
    .init(value: value, unit: .microohms)
  }
}
