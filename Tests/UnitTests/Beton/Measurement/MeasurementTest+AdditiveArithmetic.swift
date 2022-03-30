import Foundation
import XCTest
@testable import Beton

extension MeasurementTest {
  func testZero() {
    XCTAssertEqual(Measurement<UnitAcceleration>.zero, Measurement<UnitAcceleration>(value: 0, unit: UnitAcceleration.default))
    XCTAssertEqual(Measurement<UnitAngle>.zero, Measurement<UnitAngle>(value: 0, unit: UnitAngle.default))
    XCTAssertEqual(Measurement<UnitArea>.zero, Measurement<UnitArea>(value: 0, unit: UnitArea.default))
    XCTAssertEqual(Measurement<UnitConcentrationMass>.zero, Measurement<UnitConcentrationMass>(value: 0, unit: UnitConcentrationMass.default))
    XCTAssertEqual(Measurement<UnitDispersion>.zero, Measurement<UnitDispersion>(value: 0, unit: UnitDispersion.default))
    XCTAssertEqual(Measurement<UnitDuration>.zero, Measurement<UnitDuration>(value: 0, unit: UnitDuration.default))
    XCTAssertEqual(Measurement<UnitElectricCharge>.zero, Measurement<UnitElectricCharge>(value: 0, unit: UnitElectricCharge.default))
    XCTAssertEqual(Measurement<UnitElectricCurrent>.zero, Measurement<UnitElectricCurrent>(value: 0, unit: UnitElectricCurrent.default))
    XCTAssertEqual(Measurement<UnitElectricPotentialDifference>.zero, Measurement<UnitElectricPotentialDifference>(value: 0, unit: UnitElectricPotentialDifference.default))
    XCTAssertEqual(Measurement<UnitElectricResistance>.zero, Measurement<UnitElectricResistance>(value: 0, unit: UnitElectricResistance.default))
    XCTAssertEqual(Measurement<UnitEnergy>.zero, Measurement<UnitEnergy>(value: 0, unit: UnitEnergy.default))
    XCTAssertEqual(Measurement<UnitFrequency>.zero, Measurement<UnitFrequency>(value: 0, unit: UnitFrequency.default))
    XCTAssertEqual(Measurement<UnitFuelEfficiency>.zero, Measurement<UnitFuelEfficiency>(value: 0, unit: UnitFuelEfficiency.default))
    XCTAssertEqual(Measurement<UnitIlluminance>.zero, Measurement<UnitIlluminance>(value: 0, unit: UnitIlluminance.default))
    XCTAssertEqual(Measurement<UnitInformationStorage>.zero, Measurement<UnitInformationStorage>(value: 0, unit: UnitInformationStorage.default))
    XCTAssertEqual(Measurement<UnitLength>.zero, Measurement<UnitLength>(value: 0, unit: UnitLength.default))
    XCTAssertEqual(Measurement<UnitMass>.zero, Measurement<UnitMass>(value: 0, unit: UnitMass.default))
    XCTAssertEqual(Measurement<UnitPower>.zero, Measurement<UnitPower>(value: 0, unit: UnitPower.default))
    XCTAssertEqual(Measurement<UnitPressure>.zero, Measurement<UnitPressure>(value: 0, unit: UnitPressure.default))
    XCTAssertEqual(Measurement<UnitSpeed>.zero, Measurement<UnitSpeed>(value: 0, unit: UnitSpeed.default))
    XCTAssertEqual(Measurement<UnitTemperature>.zero, Measurement<UnitTemperature>(value: 0, unit: UnitTemperature.default))
    XCTAssertEqual(Measurement<UnitVolume>.zero, Measurement<UnitVolume>(value: 0, unit: UnitVolume.default))
  }
}