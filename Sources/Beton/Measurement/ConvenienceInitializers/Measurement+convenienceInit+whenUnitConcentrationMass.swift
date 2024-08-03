extension Measurement where UnitType == UnitConcentrationMass {
  public static func gramsPerLiter(_ value: Double) -> Self {
    .init(value: value, unit: .gramsPerLiter)
  }

  public static func milligramsPerDeciliter(_ value: Double) -> Self {
    .init(value: value, unit: .milligramsPerDeciliter)
  }

  public static func millimolesPerLiter(
    withGramsPerMole: Double,
    _ value: Double
  ) -> Self {
    .init(value: value, unit: .millimolesPerLiter(withGramsPerMole: withGramsPerMole))
  }
}
