extension Measurement where UnitType == UnitDispersion {
  public static func partsPerMillion(_ value: Double) -> Self {
    .init(value: value, unit: .partsPerMillion)
  }
}
