extension Measurement where UnitType == UnitElectricCurrent {
  public static func megaamperes(_ value: Double) -> Self {
    .init(value: value, unit: .megaamperes)
  }

  public static func kiloamperes(_ value: Double) -> Self {
    .init(value: value, unit: .kiloamperes)
  }

  public static func amperes(_ value: Double) -> Self {
    .init(value: value, unit: .amperes)
  }

  public static func milliamperes(_ value: Double) -> Self {
    .init(value: value, unit: .milliamperes)
  }

  public static func microamperes(_ value: Double) -> Self {
    .init(value: value, unit: .microamperes)
  }
}
