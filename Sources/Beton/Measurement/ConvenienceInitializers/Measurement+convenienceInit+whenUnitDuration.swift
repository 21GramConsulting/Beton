extension Measurement where UnitType == UnitDuration {
  public static func seconds(_ value: Double) -> Self {
    .init(value: value, unit: .seconds)
  }

  public static func minutes(_ value: Double) -> Self {
    .init(value: value, unit: .minutes)
  }

  public static func hours(_ value: Double) -> Self {
    .init(value: value, unit: .hours)
  }
}
