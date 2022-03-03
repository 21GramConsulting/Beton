import Beton
import class XCTest.XCTestCase
import protocol XCTest.XCTMetric

open class XCTestCase: XCTest.XCTestCase {
  internal var lastRunMetrics: [XCTMetric] = []

  open class override var defaultMetrics: [XCTest.XCTMetric] { [XCTClockMetric()] }

  // Moved this here from an `XCTest.XCTestCase` extension, which caused a strange compilation error on the first run on a clean build.
  open class override var defaultMeasureOptions: XCTMeasureOptions { XCTMeasureOptions() }
}
