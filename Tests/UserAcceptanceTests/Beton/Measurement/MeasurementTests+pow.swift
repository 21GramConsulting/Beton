import Beton
import XCTest

extension MeasurementTests {
  func testPow() {
    let measurement = pow(Measurement<UnitInformationStorage>(value: 2, unit: .bits), 3)
    let limit = Measurement<UnitInformationStorage>(value: 1, unit: .bytes)
    if limit <= measurement {
      XCTAssertEqual("Large enough data: \(measurement)", "Large enough data: 8.0 bit")
    } else {
      XCTAssertGreaterThanOrEqual(measurement, limit)
    }
  }
}
