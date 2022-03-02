import Beton
import class XCTest.XCTCPUMetric

public class XCTCPUMetric: XCTest.XCTCPUMetric, XCTMetric {
  deinit { forgetSelf() }

  public override func reportMeasurements(from startTime: XCTPerformanceMeasurementTimestamp, to endTime: XCTPerformanceMeasurementTimestamp) throws -> [XCTPerformanceMeasurement] {
    storing(measurements: try super.reportMeasurements(from: startTime, to: endTime))
  }

  override public func copy(with zone: NSZone? = nil) -> Any {
    remembering(copy: super.copy(with: zone))
  }

}