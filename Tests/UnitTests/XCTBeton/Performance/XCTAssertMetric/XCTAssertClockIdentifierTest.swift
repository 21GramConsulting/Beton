import Beton

@testable import XCTBeton

class XCTAssertClockIdentifierTest: XCTestCase {
  func testIdentifier() {
    XCTAssertEqual(
      XCTAssertClockIdentifier.timeMonotonic.identifier,
      "com.apple.dt.XCTMetric_Clock.time.monotonic"
    )
  }
}
