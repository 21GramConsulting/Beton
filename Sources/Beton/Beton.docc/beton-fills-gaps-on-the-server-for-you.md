# Beton fills gaps on the server for you

Things we were missing when we do Swift on the Server.

## Most Importantly: Call for ideas!

It's open-source and we're both committed and financially
invested in making this library great. Create an [issue](https://github.com/21GramConsulting/Beton/issues)
and let us know what you feel as basic, as "should work",
but it doesn't. Some examples:
1. You stumble upon something you have on your Mac, but not on Linux.
2. You wish any of Foundation's or the Swift Standard Library's units would have some API.
3. You wish you had certain fundamental utility types you cognitively expect but is missing.

## Localized Bundling

*Description to be delivered.*
Sorry folks, time pressure here.
If you're interested, open a ticket with your question, we'll
enjoy a nice public discussion and then have it transformed
into a documentation task.*

This piece of our System Tests should give you a taste at
least:
```swift
import Beton
import XCTest

extension CodeExamples {
  func testLocalizedStringExample() {
    let bundle = Bundle.module.localizationBundles["hu_HU"]
    XCTAssertEqual(bundle?.localizedString("Apple", from: "Test"), "Alma")
    XCTAssertEqual(bundle?.localizedString("Banana", from: "Test"), "Banana")
  }
}
```

Yes, it'd be nice on the server, to go like:
```swift
//...
let myLocalizedStuff = bundle.localizedString("Potato")
//...
```
Or the same with any other asset, like:
- Config files
- Images
- Videos
- Libraries (why would you do that... oh, don't even ask_)

## Convenience Extensions

We call our API provisions "Convenience Extensions"  that
were born out of an intuitive use of the standard library,
or Foundation framework, but were missing.