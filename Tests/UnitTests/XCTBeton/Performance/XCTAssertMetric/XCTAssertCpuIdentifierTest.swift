import Beton
@testable import XCTBeton

class XCTAssertCpuIdentifierTest: XCTestCase {
  func testIdentifier() {
    XCTAssertEqual(XCTAssertCpuIdentifier.time.identifier, "com.apple.dt.XCTMetric_CPU.time")
    XCTAssertEqual(XCTAssertCpuIdentifier.cycles.identifier, "com.apple.dt.XCTMetric_CPU.cycles")
    XCTAssertEqual(XCTAssertCpuIdentifier.instructionsRetired.identifier, "com.apple.dt.XCTMetric_CPU.instructions_retired")
  }
}
