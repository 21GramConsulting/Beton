import Beton

/// Identifies the type of CPU statistic you want to make assertion for in a performance test.
///
/// ``XCTCPUMetric`` captures statistics about CPU activity while the block argument to a
/// ``XCTestCase/measure(metrics:block:)`` call runs in a performance test. To make assertion to these statistics
/// use any of the values of ``XCTAssertCpuIdentifier``.
///
/// - SeeAlso: https://developer.apple.com/documentation/xctest/xctcpumetric
public enum XCTAssertCpuIdentifier {
  /// CPU time is the length of time, in seconds, that the CPU is active and executing instructions for the measured
  /// target.
  case time
  /// CPU cycles is the number of clock cycles that occur while the CPU is active and executing instructions for the
  /// measured target.
  case cycles
  /// CPU instructions retired is the number of processor instructions that run to completion during execution of the
  /// measured target.
  case instructionsRetired
}

extension XCTAssertCpuIdentifier: XCTAssertMetricIdentifier {
  public typealias RelatedMetric = XCTCPUMetric

  public var identifier: String {
    switch self {
    case .time:                return "com.apple.dt.XCTMetric_CPU.time"
    case .cycles:              return "com.apple.dt.XCTMetric_CPU.cycles"
    case .instructionsRetired: return "com.apple.dt.XCTMetric_CPU.instructions_retired"
    }
  }
}
