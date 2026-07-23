extension Notification.Name: @retroactive ExpressibleByStringLiteral {
  public init(stringLiteral value: String) { self.init(String(value)) }
}
