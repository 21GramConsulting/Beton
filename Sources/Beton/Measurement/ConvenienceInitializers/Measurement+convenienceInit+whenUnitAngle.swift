extension Measurement where UnitType == UnitAngle {
  public static func degrees(_ value: Double) -> Self {
    .init(value: value, unit: .degrees)
  }

  public static func arcMinutes(_ value: Double) -> Self {
    .init(value: value, unit: .arcMinutes)
  }

  public static func arcSeconds(_ value: Double) -> Self {
    .init(value: value, unit: .arcSeconds)
  }

  public static func radians(_ value: Double) -> Self {
    .init(value: value, unit: .radians)
  }

  public static func gradians(_ value: Double) -> Self {
    .init(value: value, unit: .gradians)
  }

  public static func revolutions(_ value: Double) -> Self {
    .init(value: value, unit: .revolutions)
  }
}
