extension Measurement where UnitType == UnitLength {
  public static func megameters(_ value: Double) -> Self {
    .init(value: value, unit: .megameters)
  }

  public static func kilometers(_ value: Double) -> Self {
    .init(value: value, unit: .kilometers)
  }

  public static func hectometers(_ value: Double) -> Self {
    .init(value: value, unit: .hectometers)
  }

  public static func decameters(_ value: Double) -> Self {
    .init(value: value, unit: .decameters)
  }

  public static func meters(_ value: Double) -> Self {
    .init(value: value, unit: .meters)
  }

  public static func decimeters(_ value: Double) -> Self {
    .init(value: value, unit: .decimeters)
  }

  public static func centimeters(_ value: Double) -> Self {
    .init(value: value, unit: .centimeters)
  }

  public static func millimeters(_ value: Double) -> Self {
    .init(value: value, unit: .millimeters)
  }

  public static func micrometers(_ value: Double) -> Self {
    .init(value: value, unit: .micrometers)
  }

  public static func nanometers(_ value: Double) -> Self {
    .init(value: value, unit: .nanometers)
  }

  public static func picometers(_ value: Double) -> Self {
    .init(value: value, unit: .picometers)
  }

  public static func inches(_ value: Double) -> Self {
    .init(value: value, unit: .inches)
  }

  public static func feet(_ value: Double) -> Self {
    .init(value: value, unit: .feet)
  }

  public static func yards(_ value: Double) -> Self {
    .init(value: value, unit: .yards)
  }

  public static func miles(_ value: Double) -> Self {
    .init(value: value, unit: .miles)
  }

  public static func scandinavianMiles(_ value: Double) -> Self {
    .init(value: value, unit: .scandinavianMiles)
  }

  public static func lightyears(_ value: Double) -> Self {
    .init(value: value, unit: .lightyears)
  }

  public static func nauticalMiles(_ value: Double) -> Self {
    .init(value: value, unit: .nauticalMiles)
  }

  public static func fathoms(_ value: Double) -> Self {
    .init(value: value, unit: .fathoms)
  }

  public static func furlongs(_ value: Double) -> Self {
    .init(value: value, unit: .furlongs)
  }

  public static func astronomicalUnits(_ value: Double) -> Self {
    .init(value: value, unit: .astronomicalUnits)
  }

  public static func parsecs(_ value: Double) -> Self {
    .init(value: value, unit: .parsecs)
  }
}
