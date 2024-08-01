import Beton

extension XCTestCase {
  /// Measures the performance of a block of code.
  ///
  /// Call this method from within a test method to measure the performance of a block of code. By default, this method
  /// measures the number of seconds the block of code takes to execute. Use ``measure(metrics:block:)`` for example
  /// to change the default metrics measured by this method.
  ///
  /// After using this method you can make assertions to the collected metrics using
  /// ``XCTAssertMetric(_:_:_:_:file:line:)``.
  ///
  /// - Parameter block: A block whose performance is measured.
  @nonobjc public override func measure(_ block: () -> Void) {
    self.measure(metrics: Self.defaultMetrics, options: Self.defaultMeasureOptions, block: block)
  }

  /// Records the selected metrics for a block of code.
  ///
  /// After using this method you can make assertions to the collected metrics using
  /// ``XCTAssertMetric(_:_:_:_:file:line:)``.
  ///
  /// - Parameters:
  ///   - metrics: An array of metrics to measure, like CPU, memory, or elapsed time.
  ///   - block: A block whose performance is measured.
  @nonobjc public func measure(metrics: [XCTMetric], block: () -> Void) {
    self.measure(metrics: metrics, options: Self.defaultMeasureOptions, block: block)
  }

  /// Records the performance, using the specified measurement options, for a block of code.
  ///
  /// After using this method you can make assertions to the collected metrics using
  /// ``XCTAssertMetric(_:_:_:_:file:line:)``.
  ///
  /// - Parameters:
  ///   - options: Options to control the gathering of performance measurements.
  ///   - block: A block whose performance is measured.
  @nonobjc public func measure(options: XCTMeasureOptions, block: () -> Void) {
    self.measure(metrics: Self.defaultMetrics, options: options, block: block)
  }

  /// Records the selected metrics, using the specified measurement options, for a block of code.
  ///
  /// After using this method you can make assertions to the collected metrics using
  /// ``XCTAssertMetric(_:_:_:_:file:line:)``.
  ///
  /// - Parameters:
  ///   - metrics: An array of metrics to measure, like CPU, memory, or elapsed time.
  ///   - options: Options to control the gathering of performance measurements.
  ///   - block: A block whose performance is measured.
  @nonobjc public func measure(metrics: [XCTMetric], options: XCTMeasureOptions, block: () -> Void)
  {
    super.measure(metrics: metrics, options: options, block: block)
    precondition(lastRunMetrics.isEmpty, "Must not have performed measurements yet!")
    lastRunMetrics = metrics
  }
}
