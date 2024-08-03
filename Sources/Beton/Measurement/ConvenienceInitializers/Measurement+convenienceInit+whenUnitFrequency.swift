extension Measurement where UnitType == UnitFrequency {
  public static func terahertz(_ value: Double) -> Self {
    .init(value: value, unit: .terahertz)
  }

  public static func gigahertz(_ value: Double) -> Self {
    .init(value: value, unit: .gigahertz)
  }

  public static func megahertz(_ value: Double) -> Self {
    .init(value: value, unit: .megahertz)
  }

  public static func kilohertz(_ value: Double) -> Self {
    .init(value: value, unit: .kilohertz)
  }

  public static func hertz(_ value: Double) -> Self {
    .init(value: value, unit: .hertz)
  }

  public static func millihertz(_ value: Double) -> Self {
    .init(value: value, unit: .millihertz)
  }

  public static func microhertz(_ value: Double) -> Self {
    .init(value: value, unit: .microhertz)
  }

  public static func nanohertz(_ value: Double) -> Self {
    .init(value: value, unit: .nanohertz)
  }
}
