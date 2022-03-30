import Beton
import class XCTest.XCTestCase

/// The primary class to define tests in XCTBeton.
///
/// Extends the capabilities of [`XCTestCase`](https://developer.apple.com/documentation/xctest/xctestcase) with
/// ``measure(metrics:options:block:)`` and ``XCTAssertMetric(_:_:_:_:file:line:)``. You can use these features if you
/// want to write performance tests with assertions.
///
/// The following example shows how you can write a simple assertion:
///
/// ```swift
/// import XCTBeton
///
/// class PerformanceTests: XCTestCase {
///   func test_measureSum() {
///     measure {
///       let _ = (1..<1000).reduce(0, +)
///     }
///     XCTAssertMetric(.clock, .timeMonotonic, .average(maximum: 0.001))
///   }
/// }
/// ```
open class XCTestCase: XCTest.XCTestCase {
  internal var lastRunMetrics: [XCTMetric] = []
  /// Default options for ``XCTestCase/measure(_:)``. The default instance specifies 5 iteration counts.
  open class override var defaultMeasureOptions: XCTMeasureOptions { XCTMeasureOptions() }
}

extension XCTest.XCTestCase {
  /// Default metrics for ``XCTestCase/measure(_:)``, returns only ``XCTClockMetric``.
  open class var defaultMetrics:        [XCTMetric] { [XCTClockMetric()] }
}
