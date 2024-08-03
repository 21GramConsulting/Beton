extension Measurement where UnitType == UnitMass {
  public static func kilograms(_ value: Double) -> Self {
    .init(value: value, unit: .kilograms)
  }

  public static func grams(_ value: Double) -> Self {
    .init(value: value, unit: .grams)
  }

  public static func decigrams(_ value: Double) -> Self {
    .init(value: value, unit: .decigrams)
  }

  public static func centigrams(_ value: Double) -> Self {
    .init(value: value, unit: .centigrams)
  }

  public static func milligrams(_ value: Double) -> Self {
    .init(value: value, unit: .milligrams)
  }

  public static func micrograms(_ value: Double) -> Self {
    .init(value: value, unit: .micrograms)
  }

  public static func nanograms(_ value: Double) -> Self {
    .init(value: value, unit: .nanograms)
  }

  public static func picograms(_ value: Double) -> Self {
    .init(value: value, unit: .picograms)
  }

  public static func ounces(_ value: Double) -> Self {
    .init(value: value, unit: .ounces)
  }

  public static func pounds(_ value: Double) -> Self {
    .init(value: value, unit: .pounds)
  }

  public static func stones(_ value: Double) -> Self {
    .init(value: value, unit: .stones)
  }

  public static func metricTons(_ value: Double) -> Self {
    .init(value: value, unit: .metricTons)
  }

  public static func shortTons(_ value: Double) -> Self {
    .init(value: value, unit: .shortTons)
  }

  public static func carats(_ value: Double) -> Self {
    .init(value: value, unit: .carats)
  }

  public static func ouncesTroy(_ value: Double) -> Self {
    .init(value: value, unit: .ouncesTroy)
  }

  public static func slugs(_ value: Double) -> Self {
    .init(value: value, unit: .slugs)
  }
}
