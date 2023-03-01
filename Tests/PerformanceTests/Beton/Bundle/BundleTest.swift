import Beton
import XCTBeton

class BundleTest: XCTestCase {
  override func tearDown() {
    super.tearDown()
    XCTAssertMetric(.cpu, .cycles, .average(maximum: 5000))
    XCTAssertMetric(.cpu, .instructionsRetired, .average(maximum: 10_000))
    XCTAssertMetric(.cpu, .time, .average(maximum: 0.002))
    XCTAssertMetric(.memory, .physical, .average(maximum: 60))
    XCTAssertMetric(.memory, .physicalPeak, .average(maximum: 0))
    XCTAssertMetric(.disk, .logicalWrites, .average(maximum: 0))
    XCTAssertMetric(.clock, .timeMonotonic, .average(maximum: 0.005))
  }

  func testLocalizationBundles() {
    measure(metrics: .defaults) {
      let _ = Bundle.module.localizationBundles
    }
  }

  func testLocalizedString_keyOnly() {
    measure(metrics: .defaults) {
      let _ = Bundle.module.localizedString("Test")
    }
  }

  func testLocalizedString_keyAndTableOnly() {
    measure(metrics: .defaults) {
      let _ = Bundle.module.localizedString("Test", from: "Test")
    }
  }

  func testLocalizedString_keyAndValueOnly() {
    measure(metrics: .defaults) {
      let _ = Bundle.module.localizedString("Test", fallback: "Test")
    }
  }

}

extension Array where Self.Element == XCTMetric {
  static var defaults: [Element] {
    [
      XCTCPUMetric(),
      XCTMemoryMetric(),
      XCTStorageMetric(),
      XCTClockMetric(),
    ]
  }
}
