import Foundation

extension Data {
  public init(_ uuid: UUID) { self.init(Array(uuid)) }
  public init?(_ uuid: UUID?) {
    guard let uuid = uuid else { return nil }
    self.init(uuid)
  }
}

extension UUID {
  public init?(_ data: Data?) {
    guard let data = data else { return nil }
    guard data.count == 16 else { return nil }
    let bytes = [UInt8](data)
    self = .init(
      uuid: (
        bytes[0], bytes[1], bytes[2], bytes[3],
        bytes[4], bytes[5], bytes[6], bytes[7],
        bytes[8], bytes[9], bytes[10], bytes[11],
        bytes[12], bytes[13], bytes[14], bytes[15]
      ))
  }
}

extension UUID { public var data: Data { .init(self) } }
extension Data { public var uuid: UUID? { .init(self) } }
