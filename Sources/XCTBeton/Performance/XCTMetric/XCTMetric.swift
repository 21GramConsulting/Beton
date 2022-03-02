import Beton
import protocol XCTest.XCTMetric
import class XCTest.XCTPerformanceMeasurement

public protocol XCTMetric: XCTest.XCTMetric {
  var measurements: [XCTPerformanceMeasurement] { get }
}
