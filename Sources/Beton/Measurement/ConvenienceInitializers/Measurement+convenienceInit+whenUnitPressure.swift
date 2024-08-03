extension Measurement where UnitType == UnitPressure {
  public static func newtonsPerMetersSquared(_ value: Double) -> Self {
    .init(value: value, unit: .newtonsPerMetersSquared)
  }

  public static func gigapascals(_ value: Double) -> Self {
    .init(value: value, unit: .gigapascals)
  }

  public static func megapascals(_ value: Double) -> Self {
    .init(value: value, unit: .megapascals)
  }

  public static func kilopascals(_ value: Double) -> Self {
    .init(value: value, unit: .kilopascals)
  }

  public static func hectopascals(_ value: Double) -> Self {
    .init(value: value, unit: .hectopascals)
  }

  public static func inchesOfMercury(_ value: Double) -> Self {
    .init(value: value, unit: .inchesOfMercury)
  }

  public static func bars(_ value: Double) -> Self {
    .init(value: value, unit: .bars)
  }

  public static func millibars(_ value: Double) -> Self {
    .init(value: value, unit: .millibars)
  }

  public static func millimetersOfMercury(_ value: Double) -> Self {
    .init(value: value, unit: .millimetersOfMercury)
  }

  public static func poundsForcePerSquareInch(_ value: Double) -> Self {
    .init(value: value, unit: .poundsForcePerSquareInch)
  }
}
