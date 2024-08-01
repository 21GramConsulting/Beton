import Beton

@testable import XCTBeton

class XCTAssertDiskIdentifierTest: XCTestCase {
  func testIdentifier() {
    XCTAssertEqual(
      XCTAssertDiskIdentifier.logicalWrites.identifier, "com.apple.dt.XCTMetric_Disk.logical_writes"
    )
  }
}
