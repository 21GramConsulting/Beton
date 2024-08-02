# 1.4.0

## Minor changes

* **ADDED**: [Duration](https://developer.apple.com/documentation/swift/duration) utility extension for those really long cases.
* The Pipe operator! now you can do cool stuff
  like: `3 |> increment |> double |> double |> increment` and get `11`.
* `repeating` now supports throwing and other cases. Request features if you need more.

## Patch changes

* Increased test coverage.
* Dumped JB for good.
* Hacked through failing performance tests.
* Finally dumped [Jazzy](https://github.com/realm/jazzy) in favor of SwiftDocC.
