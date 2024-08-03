extension Measurement where UnitType == UnitEnergy {
  public static func kilojoules(_ value: Double) -> Self {
    .init(value: value, unit: .kilojoules)
  }

  public static func joules(_ value: Double) -> Self {
    .init(value: value, unit: .joules)
  }

  public static func kilocalories(_ value: Double) -> Self {
    .init(value: value, unit: .kilocalories)
  }

  public static func calories(_ value: Double) -> Self {
    .init(value: value, unit: .calories)
  }

  public static func kilowattHours(_ value: Double) -> Self {
    .init(value: value, unit: .kilowattHours)
  }
}
