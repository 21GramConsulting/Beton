import Foundation

public extension Data {
  init(_ uuid: UUID) { self.init(Array(uuid)) }
  init?(_ uuid: UUID?) {
    guard let uuid = uuid else { return nil }
    self.init(uuid)
  }
}
