import XCTest
import Foundation
@testable import Beton

class DataInitFromUuidTest: XCTestCase {
  let uuid = UUID(uuidString: "123e4567-e89b-12d3-a456-426614174000")
  let data = Data([0x12, 0x3e, 0x45, 0x67, 0xe8, 0x9b, 0x12, 0xd3, 0xa4, 0x56, 0x42, 0x66, 0x14, 0x17, 0x40, 0x00])

  func testInit_nonOptionalUUID() {
    let data = Data(uuid!)
    XCTAssertEqual(data, self.data)
  }

  func testInit_sucessfully_optionalUUID() {
    guard let data = Data(uuid) else { return XCTFail("Resolved nil while expecting some.") }
    XCTAssertEqual(data, self.data)
  }

  func testInit_nil_optionalUUID() {
    XCTAssertNil(Data(Optional<UUID>.none))
  }
}
