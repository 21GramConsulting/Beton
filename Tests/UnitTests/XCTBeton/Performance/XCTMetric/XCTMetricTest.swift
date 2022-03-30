import Beton
import XCTBeton

class XCTMetricTest<Unit>: XCTestCase where Unit: XCTMetric {
  var unit: Unit! = nil

  func testMeasurement_emptyByDefault() {
    XCTAssertTrue(unit.measurements.isEmpty, "Measurements should be empty by default.")
  }

}
