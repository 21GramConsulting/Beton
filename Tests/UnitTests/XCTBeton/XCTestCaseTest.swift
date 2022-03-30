import Beton
@testable import XCTBeton

class XCTestCaseTest: XCTestCase {
  func testLastRunMetrics() {
    let testCase = XCTestCase()
    XCTAssertTrue(testCase.lastRunMetrics.isEmpty, "Should initially be empty.")
  }

  func testDefaultMetrics() {
    XCTAssertEqual(XCTestCase.defaultMetrics.count, 1, "Should have only one default metric.")
    XCTAssertTrue(XCTestCase.defaultMetrics[0] is XCTClockMetric, "First item should be an XCTClockMetric.")
  }

}
