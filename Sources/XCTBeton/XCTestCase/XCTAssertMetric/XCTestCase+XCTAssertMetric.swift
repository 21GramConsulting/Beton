import Beton
import XCTest

extension XCTestCase {
  /// Asserts that the given metric has the expected aspect.
  ///
  /// You can make assertions to performance metrics if you measured your code using some variant of ``measure(_:)``.
  /// Make sure to assert only for ``XCTMetric``s you configured, otherwise you get an assertion error.
  ///
  /// ```swift
  /// measure(metrics: [XCTCPUMetric()]) {
  ///   let _ = (1..<1000).reduce(0, +)
  /// }
  /// XCTAssertMetric(.cpu, .time, .average(maximum: 0.002))
  /// // The following assertion would fail, no memory results collected.
  /// // XCTAssertMetric(.memory, .physical, .average(maximum: 20))
  /// ```
  /// - Parameters:
  ///   - metric: The asserted performance metric.
  ///   - identifier: Part of the metric to make assertion for.
  ///   - aspect: The aspect to compare the performance metrics with.
  ///   - message: An optional description of a failure.
  ///   - file: The file where the failure occurs. The default is the filename of the test case where you call this function.
  ///   - line: The line number where the failure occurs. The default is the line number where you call this function.
  public final func XCTAssertMetric<Identifier>(
    _ metric: XCTAssertMetric<Identifier>,
    _ identifier: Identifier,
    _ aspect: XCTAssertMetric<Identifier>.Aspect,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
  ) {
    let measurements: [Double] = fetchMeasurement(for: identifier).map(\.value).map(\.value)
    XCTAssertLessThanOrEqual(
      measurements[keyPath: aspect.measurementKeyPath],
      aspect.maximum,
      errorMessage(for: identifier, message: message()),
      file: file,
      line: line
    )
    XCTAssertFalse(
      measurements.isEmpty,
      errorMessage(
        for: identifier,
        message: "No measurement results found."
      ),
      file: file,
      line: line
    )
  }

  private func errorMessage<Identifier>(for identifier: Identifier, message: String) -> String {
    message.isEmpty
      ? #"XCTAssertMetric<\#(Identifier.self).\#(identifier)>"#
      : #"XCTAssertMetric<\#(Identifier.self).\#(identifier)> - \#(message)"#
  }

  internal func fetchMeasurement<Identifier>(for identifier: Identifier) -> [XCTPerformanceMeasurement] where Identifier: XCTAssertMetricIdentifier {
    let measurements = lastRunMetrics
            .compactMap { $0 as? Identifier.RelatedMetric }
            .map(\.measurements)
            .reduce([], +)
            .filter { $0.identifier == identifier.identifier } // TODO: this naming is fucking dumb
    return Array(measurements.dropFirst())
  }
}

fileprivate extension Array where Element == Double {
  var average: Element { sum() / Double(count) }

  var standardDeviation: Element {
    let squaredDifferences = map { pow($0 - average, 2.0) }
    let variance = squaredDifferences.reduce(.zero, +) / Double(count - 1)
    return sqrt(variance)
  }

  var relativeStandardDeviation: Double { standardDeviation / average }

}

fileprivate extension XCTAssertMetric.Aspect {
  var measurementKeyPath: KeyPath<[Double], Double> {
    switch self {
    case .average:                   return \.average
    case .relativeStandardDeviation: return \.relativeStandardDeviation
    }
  }
}
