extension Measurement where UnitType == UnitAcceleration {
  public static func metersPerSecondSquared(_ value: Double) -> Self {
    .init(value: value, unit: .metersPerSecondSquared)
  }

  public static func gravity(_ value: Double) -> Self {
    .init(value: value, unit: .gravity)
  }
}
