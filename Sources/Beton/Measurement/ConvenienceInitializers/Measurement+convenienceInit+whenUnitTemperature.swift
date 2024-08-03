extension Measurement where UnitType == UnitTemperature {
  public static func kelvin(_ value: Double) -> Self {
    .init(value: value, unit: .kelvin)
  }

  public static func celsius(_ value: Double) -> Self {
    .init(value: value, unit: .celsius)
  }

  public static func fahrenheit(_ value: Double) -> Self {
    .init(value: value, unit: .fahrenheit)
  }
}
