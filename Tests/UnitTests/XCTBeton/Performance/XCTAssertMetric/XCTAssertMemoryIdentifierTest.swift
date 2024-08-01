import Beton

@testable import XCTBeton

class XCTAssertMemoryIdentifierTest: XCTestCase {
  func testIdentifier() {
    XCTAssertEqual(
      XCTAssertMemoryIdentifier.physical.identifier, "com.apple.dt.XCTMetric_Memory.physical")
    XCTAssertEqual(
      XCTAssertMemoryIdentifier.physicalPeak.identifier,
      "com.apple.dt.XCTMetric_Memory.physical_peak")
  }
}
