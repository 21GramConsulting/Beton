extension Measurement where UnitType == UnitSpeed {
  public static func metersPerSecond(_ value: Double) -> Self {
    .init(value: value, unit: .metersPerSecond)
  }

  public static func kilometersPerHour(_ value: Double) -> Self {
    .init(value: value, unit: .kilometersPerHour)
  }

  public static func milesPerHour(_ value: Double) -> Self {
    .init(value: value, unit: .milesPerHour)
  }

  public static func knots(_ value: Double) -> Self {
    .init(value: value, unit: .knots)
  }
}
