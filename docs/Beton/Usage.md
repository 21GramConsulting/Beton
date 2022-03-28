The following example demonstrates the ``?!`` operator and ``sum`` extension
of [`Sequence`](https://developer.apple.com/documentation/swift/sequence) from the `Beton` module.

Notice that you do not need to import [Foundation](https://developer.apple.com/documentation/foundation) explicitly in
order to get [`Measurement`](https://developer.apple.com/documentation/foundation/measurement). That is because you get
it for free by importing `Beton.`

```swift
import Beton

struct InvalidValue: Error {
  let value: String
}

func parseMeter(_ s: String) throws -> Measurement<UnitLength> {
  Measurement(value: try Double(s) ?! InvalidValue(value: s), unit: .meters)
}

func example() throws {
  let sum = try ["1", "2", "3"].map(parseMeter).sum()
  print(sum) // Prints: 6.0 m

  let _ = try ["1", "bad number", "3"].map(parseMeter).sum()
  // Throws: InvalidValue(value: "bad number")
}
```
