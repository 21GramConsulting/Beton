import Beton

import class XCTest.XCTStorageMetric

/// A metric to record the amount of data that a performance test logically writes to storage.
///
/// ``XCTStorageMetric`` is a wrapper to
/// [`XCTest.XCTStorageMetric`](https://developer.apple.com/documentation/xctest/xctstoragemetric).
public class XCTStorageMetric: XCTest.XCTStorageMetric, XCTMetric {

  deinit { forgetSelf() }

  /// Reports the measurements gathered for a metric between specific timestamps.
  ///
  /// Stores the measurement results of
  /// [`reportMeasurements(from:to:)`](https://developer.apple.com/documentation/xctest/xctmetric/3194241-reportmeasurements)
  /// allowing you to make assertions to them.
  public override func reportMeasurements(
    from startTime: XCTPerformanceMeasurementTimestamp,
    to endTime: XCTPerformanceMeasurementTimestamp
  ) throws -> [XCTPerformanceMeasurement] {
    storing(measurements: try super.reportMeasurements(from: startTime, to: endTime))
  }

  override public func copy(with zone: NSZone? = nil) -> Any {
    remembering(copy: super.copy(with: zone))
  }

}
