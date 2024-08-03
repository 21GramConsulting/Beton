extension Measurement where UnitType == UnitInformationStorage {
  public static func kilobits(_ value: Double) -> Self {
    .init(value: value, unit: .kilobits)
  }

  public static func megabits(_ value: Double) -> Self {
    .init(value: value, unit: .megabits)
  }

  public static func gigabits(_ value: Double) -> Self {
    .init(value: value, unit: .gigabits)
  }

  public static func terabits(_ value: Double) -> Self {
    .init(value: value, unit: .terabits)
  }

  public static func petabits(_ value: Double) -> Self {
    .init(value: value, unit: .petabits)
  }

  public static func exabits(_ value: Double) -> Self {
    .init(value: value, unit: .exabits)
  }

  public static func zettabits(_ value: Double) -> Self {
    .init(value: value, unit: .zettabits)
  }

  public static func yottabits(_ value: Double) -> Self {
    .init(value: value, unit: .yottabits)
  }
}

extension Measurement where UnitType == UnitInformationStorage {
  public static func kibibits(_ value: Double) -> Self {
    .init(value: value, unit: .kibibits)
  }

  public static func mebibits(_ value: Double) -> Self {
    .init(value: value, unit: .mebibits)
  }

  public static func gibibits(_ value: Double) -> Self {
    .init(value: value, unit: .gibibits)
  }

  public static func tebibits(_ value: Double) -> Self {
    .init(value: value, unit: .tebibits)
  }

  public static func pebibits(_ value: Double) -> Self {
    .init(value: value, unit: .pebibits)
  }

  public static func exbibits(_ value: Double) -> Self {
    .init(value: value, unit: .exbibits)
  }

  public static func zebibits(_ value: Double) -> Self {
    .init(value: value, unit: .zebibits)
  }

  public static func yobibits(_ value: Double) -> Self {
    .init(value: value, unit: .yobibits)
  }
}
