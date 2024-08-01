import Beton

/// Represents the type of metric you can make assertions for, like ``cpu`` or ``memory``.
///
/// Use ``XCTestCase/XCTAssertMetric(_:_:_:_:file:line:)`` to write assertions for performance metrics you measured
/// using  for example ``XCTestCase/measure(metrics:block:)``.
public struct XCTAssertMetric<Identifier> where Identifier: XCTAssertMetricIdentifier {}
extension XCTAssertMetric {
  /// Can be used to make assertions for the collected ``XCTCPUMetric``s.
  public static var cpu: XCTAssertMetric<XCTAssertCpuIdentifier> { .init() }
  /// Can be used to make assertions for the collected ``XCTMemoryMetric``s.
  public static var memory: XCTAssertMetric<XCTAssertMemoryIdentifier> { .init() }
  /// Can be used to make assertions for the collected ``XCTStorageMetric``s.
  public static var disk: XCTAssertMetric<XCTAssertDiskIdentifier> { .init() }
  /// Can be used to make assertions for the collected ``XCTClockMetric``s.
  public static var clock: XCTAssertMetric<XCTAssertClockIdentifier> { .init() }
}

extension XCTAssertMetric {
  /// Represents the type of value what you can assert for.
  ///
  /// The following example makes an assertion for the ``average(maximum:)`` of the time a code takes to run.
  /// ```swift
  /// measure {
  ///   let _ = (1..<1000).reduce(0, +)
  /// }
  /// XCTAssertMetric(.clock, .timeMonotonic, .average(maximum: 0.001))
  /// ```
  public enum Aspect {
    /// Represents the average maximum of the collected ``XCTMetric/measurements-70hq6``.
    case average(maximum: Double)
    /// Represents the relative standard deviation of the collected ``XCTMetric/measurements-70hq6``.
    case relativeStandardDeviation(maximum: Double)
  }
}

extension XCTAssertMetric.Aspect {
  var maximum: Double {
    switch self {
    case .average(let maximum): return maximum
    case .relativeStandardDeviation(let maximum): return maximum
    }
  }
}
