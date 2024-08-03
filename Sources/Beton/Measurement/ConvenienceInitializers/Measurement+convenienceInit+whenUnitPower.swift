extension Measurement where UnitType == UnitPower {
  public static func terawatts(_ value: Double) -> Self {
    .init(value: value, unit: .terawatts)
  }

  public static func gigawatts(_ value: Double) -> Self {
    .init(value: value, unit: .gigawatts)
  }

  public static func megawatts(_ value: Double) -> Self {
    .init(value: value, unit: .megawatts)
  }

  public static func kilowatts(_ value: Double) -> Self {
    .init(value: value, unit: .kilowatts)
  }

  public static func watts(_ value: Double) -> Self {
    .init(value: value, unit: .watts)
  }

  public static func milliwatts(_ value: Double) -> Self {
    .init(value: value, unit: .milliwatts)
  }

  public static func microwatts(_ value: Double) -> Self {
    .init(value: value, unit: .microwatts)
  }

  public static func nanowatts(_ value: Double) -> Self {
    .init(value: value, unit: .nanowatts)
  }

  public static func picowatts(_ value: Double) -> Self {
    .init(value: value, unit: .picowatts)
  }

  public static func femtowatts(_ value: Double) -> Self {
    .init(value: value, unit: .femtowatts)
  }

  public static func horsepower(_ value: Double) -> Self {
    .init(value: value, unit: .horsepower)
  }
}
