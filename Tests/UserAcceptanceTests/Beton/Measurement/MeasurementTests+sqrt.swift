import Beton
import XCTest

extension MeasurementTests {
  func testSqrt() {
    let measurement = sqrt(Measurement<UnitInformationStorage>(value: 64, unit: .bits))
    let limit = Measurement<UnitInformationStorage>(value: 1, unit: .bytes)
    if measurement <= limit {
      XCTAssertEqual("Small enough data: \(measurement)", "Small enough data: 8.0 bit")
    } else {
      XCTAssertLessThanOrEqual(measurement, limit)
    }
  }
}
