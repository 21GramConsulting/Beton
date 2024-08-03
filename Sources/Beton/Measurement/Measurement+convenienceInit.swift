extension Measurement {
  public static func acceleration(
    _ value: Double,
    _ unit: UnitAcceleration
  ) -> Measurement<UnitAcceleration> { .init(value: value, unit: unit) }

  public static func angle(
    _ value: Double,
    _ unit: UnitAngle
  ) -> Measurement<UnitAngle> { .init(value: value, unit: unit) }

  public static func area(
    _ value: Double,
    _ unit: UnitArea
  ) -> Measurement<UnitArea> { .init(value: value, unit: unit) }

  public static func concentrationMass(
    _ value: Double,
    _ unit: UnitConcentrationMass
  ) -> Measurement<UnitConcentrationMass> { .init(value: value, unit: unit) }

  public static func dispersion(
    _ value: Double,
    _ unit: UnitDispersion
  ) -> Measurement<UnitDispersion> { .init(value: value, unit: unit) }

  public static func duration(
    _ value: Double,
    _ unit: UnitDuration
  ) -> Measurement<UnitDuration> { .init(value: value, unit: unit) }

  public static func electricCharge(
    _ value: Double,
    _ unit: UnitElectricCharge
  ) -> Measurement<UnitElectricCharge> { .init(value: value, unit: unit) }

  public static func electricCurrent(
    _ value: Double,
    _ unit: UnitElectricCurrent
  ) -> Measurement<UnitElectricCurrent> { .init(value: value, unit: unit) }

  public static func electricPotentialDifference(
    _ value: Double,
    _ unit: UnitElectricPotentialDifference
  ) -> Measurement<UnitElectricPotentialDifference> { .init(value: value, unit: unit) }

  public static func electricResistance(
    _ value: Double,
    _ unit: UnitElectricResistance
  ) -> Measurement<UnitElectricResistance> { .init(value: value, unit: unit) }

  public static func energy(
    _ value: Double,
    _ unit: UnitEnergy
  ) -> Measurement<UnitEnergy> { .init(value: value, unit: unit) }

  public static func frequency(
    _ value: Double,
    _ unit: UnitFrequency
  ) -> Measurement<UnitFrequency> { .init(value: value, unit: unit) }

  public static func fuelEfficiency(
    _ value: Double,
    _ unit: UnitFuelEfficiency
  ) -> Measurement<UnitFuelEfficiency> { .init(value: value, unit: unit) }

  public static func illuminance(
    _ value: Double,
    _ unit: UnitIlluminance
  ) -> Measurement<UnitIlluminance> { .init(value: value, unit: unit) }

  public static func informationStorage(
    _ value: Double,
    _ unit: UnitInformationStorage
  ) -> Measurement<UnitInformationStorage> { .init(value: value, unit: unit) }

  public static func length(
    _ value: Double,
    _ unit: UnitLength
  ) -> Measurement<UnitLength> { .init(value: value, unit: unit) }

  public static func mass(
    _ value: Double,
    _ unit: UnitMass
  ) -> Measurement<UnitMass> { .init(value: value, unit: unit) }

  public static func power(
    _ value: Double,
    _ unit: UnitPower
  ) -> Measurement<UnitPower> { .init(value: value, unit: unit) }

  public static func pressure(
    _ value: Double,
    _ unit: UnitPressure
  ) -> Measurement<UnitPressure> { .init(value: value, unit: unit) }

  public static func speed(
    _ value: Double,
    _ unit: UnitSpeed
  ) -> Measurement<UnitSpeed> { .init(value: value, unit: unit) }

  public static func temperature(
    _ value: Double,
    _ unit: UnitTemperature
  ) -> Measurement<UnitTemperature> { .init(value: value, unit: unit) }

  public static func volume(
    _ value: Double,
    _ unit: UnitVolume
  ) -> Measurement<UnitVolume> { .init(value: value, unit: unit) }

}
