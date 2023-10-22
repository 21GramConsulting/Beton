import Foundation
import XCTest

@testable import Beton

extension MeasurementTest {
  func testInitFloatLiteral() {
    XCTAssertEqual(123.0, Measurement<UnitAcceleration>(value: 123, unit: UnitAcceleration.default))
    XCTAssertEqual(123.0, Measurement<UnitAngle>(value: 123, unit: UnitAngle.default))
    XCTAssertEqual(123.0, Measurement<UnitArea>(value: 123, unit: UnitArea.default))
    XCTAssertEqual(
      123.0, Measurement<UnitConcentrationMass>(value: 123, unit: UnitConcentrationMass.default))
    XCTAssertEqual(123.0, Measurement<UnitDispersion>(value: 123, unit: UnitDispersion.default))
    XCTAssertEqual(123.0, Measurement<UnitDuration>(value: 123, unit: UnitDuration.default))
    XCTAssertEqual(
      123.0, Measurement<UnitElectricCharge>(value: 123, unit: UnitElectricCharge.default))
    XCTAssertEqual(
      123.0, Measurement<UnitElectricCurrent>(value: 123, unit: UnitElectricCurrent.default))
    XCTAssertEqual(
      123.0,
      Measurement<UnitElectricPotentialDifference>(
        value: 123, unit: UnitElectricPotentialDifference.default))
    XCTAssertEqual(
      123.0, Measurement<UnitElectricResistance>(value: 123, unit: UnitElectricResistance.default))
    XCTAssertEqual(123.0, Measurement<UnitEnergy>(value: 123, unit: UnitEnergy.default))
    XCTAssertEqual(123.0, Measurement<UnitFrequency>(value: 123, unit: UnitFrequency.default))
    XCTAssertEqual(
      123.0, Measurement<UnitFuelEfficiency>(value: 123, unit: UnitFuelEfficiency.default))
    XCTAssertEqual(123.0, Measurement<UnitIlluminance>(value: 123, unit: UnitIlluminance.default))
    XCTAssertEqual(
      123.0, Measurement<UnitInformationStorage>(value: 123, unit: UnitInformationStorage.default))
    XCTAssertEqual(123.0, Measurement<UnitLength>(value: 123, unit: UnitLength.default))
    XCTAssertEqual(123.0, Measurement<UnitMass>(value: 123, unit: UnitMass.default))
    XCTAssertEqual(123.0, Measurement<UnitPower>(value: 123, unit: UnitPower.default))
    XCTAssertEqual(123.0, Measurement<UnitPressure>(value: 123, unit: UnitPressure.default))
    XCTAssertEqual(123.0, Measurement<UnitSpeed>(value: 123, unit: UnitSpeed.default))
    XCTAssertEqual(123.0, Measurement<UnitTemperature>(value: 123, unit: UnitTemperature.default))
    XCTAssertEqual(123.0, Measurement<UnitVolume>(value: 123, unit: UnitVolume.default))
  }
}
