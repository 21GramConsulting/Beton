import Beton
import class XCTest.XCTestCase

open class XCTestCase: XCTest.XCTestCase {
  internal var lastRunMetrics: [XCTMetric] = []
}

extension XCTest.XCTestCase {
  open class var defaultMetrics:        [XCTMetric] { [XCTClockMetric()] }
  open class var defaultMeasureOptions: XCTMeasureOptions { XCTMeasureOptions() }
}