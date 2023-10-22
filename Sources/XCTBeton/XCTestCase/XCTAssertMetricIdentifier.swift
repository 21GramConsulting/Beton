import Beton

/// Identifies the type of ``XCTMetric/measurements-70hq6`` when making assertions.
///
/// For example when measuring CPU performance you can specify what type of characteristics of metrics do you want to
/// make assertions for, e.g. ``XCTAssertCpuIdentifier/time`` or ``XCTAssertCpuIdentifier/cycles``.
public protocol XCTAssertMetricIdentifier {
  /// The ``XCTMetric`` the identifier is associated with.
  associatedtype RelatedMetric: XCTMetric
  /// The characteristic you want to make assertion for using ``XCTestCase/XCTAssertMetric(_:_:_:_:file:line:)``.
  var identifier: String { get }
}
