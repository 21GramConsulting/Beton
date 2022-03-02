import Beton

extension XCTestCase {
  @nonobjc open func measure(metrics: [XCTMetric], block: () -> Void) {
    self.measure(metrics: metrics, options: Self.defaultMeasureOptions, block: block)
  }

  @nonobjc open func measure(options: XCTMeasureOptions, block: () -> Void) {
    self.measure(metrics: Self.defaultMetrics, options: options, block: block)
  }

  @nonobjc open func measure(metrics: [XCTMetric], options: XCTMeasureOptions, block: () -> Void) {
    super.measure(metrics: metrics, options: options, block: block)
    precondition(lastRunMetrics.isEmpty, "Must not have performed measurements yet!")
    lastRunMetrics = metrics
  }
}