import Foundation
import XCTest
@testable import Beton

extension SequenceTest {
  func testSum() {
    XCTAssertEqual([1, 2, 3, 4, 5, 6].sum(), 21)
  }
}
