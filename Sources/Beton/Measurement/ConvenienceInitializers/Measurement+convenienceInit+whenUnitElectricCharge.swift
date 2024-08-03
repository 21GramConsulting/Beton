extension Measurement where UnitType == UnitElectricCharge {
  public static func coulombs(_ value: Double) -> Self {
    .init(value: value, unit: .coulombs)
  }

  public static func megaampereHours(_ value: Double) -> Self {
    .init(value: value, unit: .megaampereHours)
  }

  public static func kiloampereHours(_ value: Double) -> Self {
    .init(value: value, unit: .kiloampereHours)
  }

  public static func ampereHours(_ value: Double) -> Self {
    .init(value: value, unit: .ampereHours)
  }

  public static func milliampereHours(_ value: Double) -> Self {
    .init(value: value, unit: .milliampereHours)
  }

  public static func microampereHours(_ value: Double) -> Self {
    .init(value: value, unit: .microampereHours)
  }
}
