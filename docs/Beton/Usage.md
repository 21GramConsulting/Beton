### Importing

To use `Beton` simply import it. If you need anything
from [Foundation](https://developer.apple.com/documentation/foundation) you do not need to explicitly import it. You get
it for free by importing `Beton.`

```swift
import Beton
```

### Convenience features for [`Bundle`](https://developer.apple.com/documentation/foundation/bundle)

Using `Beton` it is quite easy to get localized bundles and values from them.

Given you have a localization bundle in your project for the `hu_HU` locale with `"Apple" = "Alma"` the following
example would return `"Alma"`.

```swift
let bundle          = Bundle.module.localizationBundles["hu_HU"]
let localizedApple  = bundle?.localizedString("Apple")
// localizedApple == "Alma"
let localizedBanana = bundle?.localizedString("Banana")
// localizedBanana == "Banana"
```

### Convenience for [`Locale`](https://developer.apple.com/documentation/foundation/locale)

Locales in `Beton` are expressible by string literals.

```swift
let locales: [Locale] = ["en_US", "en_GB", "hu_HU"]
for locale in locales {
  print("Currency symbol: \(locale.currencySymbol ?? "N/A")")
}
// Prints:
// Currency symbol: $
// Currency symbol: £
// Currency symbol: Ft
```

### ``?!`` operator

The ``?!`` operator unwraps an [`Optional`](https://developer.apple.com/documentation/swift/optional) value if is
not `nil`, otherwise throws the given error.

```swift
struct GenericError: Error {}

let answer = try Int("42") ?! GenericError()
// answer == 42

try Int("NaN") ?! GenericError()
// Throws: GenericError()
```

### ``sum`` extension on [`Sequence`](https://developer.apple.com/documentation/swift/sequence)s

Calculates the total of all elements in a sequence. Available on any sequence with values that conform
to [`AdditiveArithmetic`](https://developer.apple.com/documentation/swift/additivearithmetic)

```swift
let arraySum = [1.1, 2.2, 3.3, 4.4, 5.5].sum()
// arraySum == 16.5

let rangeSum = (1..<10).sum()
// rangeSum == 45

let setSum = Set(arrayLiteral: 1, 2, 3, 2, 3).sum()
// setSum == 6
```

### Convenience for [`Measurement`](https://developer.apple.com/documentation/foundation/measurement)s

In `Beton` measurements have default units and they conform
to [`AdditiveArithmetic`](https://developer.apple.com/documentation/swift/additivearithmetic).

```swift
let sum = [1, 2, 3].map { Measurement<UnitLength>(value: $0, unit: .default) }.sum()
// sum == 6.0 m
```
