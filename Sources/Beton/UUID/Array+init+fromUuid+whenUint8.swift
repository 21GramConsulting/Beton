import Foundation

extension Array where Element == UInt8 {
  public init(_ uuid: UUID) {
    let (u1, u2, u3, u4, u5, u6, u7, u8, u9, u10, u11, u12, u13, u14, u15, u16) = uuid.uuid
    self = [u1, u2, u3, u4, u5, u6, u7, u8, u9, u10, u11, u12, u13, u14, u15, u16]
  }

  public init?(_ uuid: UUID?) {
    guard let uuid = uuid else { return nil }
    self = .init(uuid)
  }
}
