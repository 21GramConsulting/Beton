extension Measurement where UnitType == UnitIlluminance {
  public static func lux(_ value: Double) -> Self {
    .init(value: value, unit: .lux)
  }
}
