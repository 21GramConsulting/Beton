import Beton
import protocol XCTest.XCTMetric
import class XCTest.XCTPerformanceMeasurement

/// Extends [`XCTest.XCTMetric`](https://developer.apple.com/documentation/xctest/xctmetric) with
/// ``XCTMetric/measurements-swift.property`` holding recorded performance metrics.
public protocol XCTMetric: XCTest.XCTMetric {
  /// Holds recorded performance metrics.
  ///
  /// Use ``XCTestCase/XCTAssertMetric(_:_:_:_:file:line:)`` to make assertions for the measurements.
  var measurements: [XCTPerformanceMeasurement] { get }
}
