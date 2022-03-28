The following is a minimalistic example of how you write assertions to performance measurements.

```swift
import XCTBeton

class PerformanceTests: XCTestCase {
  func test_measureSum() {
    measure {
      let _ = (1..<1000).reduce(0, +)
    }
    XCTAssertMetric(.clock, .timeMonotonic, .average(maximum: 0.001))
  }
}
```
