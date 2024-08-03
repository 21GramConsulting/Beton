extension Measurement where UnitType == UnitFuelEfficiency {
  public static func litersPer100Kilometers(_ value: Double) -> Self {
    .init(value: value, unit: .litersPer100Kilometers)
  }

  public static func milesPerGallon(_ value: Double) -> Self {
    .init(value: value, unit: .milesPerGallon)
  }

  public static func milesPerImperialGallon(_ value: Double) -> Self {
    .init(value: value, unit: .milesPerImperialGallon)
  }
}
