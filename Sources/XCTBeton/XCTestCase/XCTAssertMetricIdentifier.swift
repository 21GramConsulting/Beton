import Beton

public protocol XCTAssertMetricIdentifier {
  associatedtype RelatedMetric: XCTMetric
  var identifier: String { get }
}