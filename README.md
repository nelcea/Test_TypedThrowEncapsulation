# Test Typed Throw Encapsulation

This test code shows using 2 different Error enums, one encapsulating the other.  
Using `swift run` to compile the code leads to a compiler assertion failure.  
There are several alternative implementations of the `encapsulateLevel2` method that do not provoke this crash.  
This has been tested with Swift 6.2.3 and 6.3-snapshot-2026-01-09.  
Bug has been submitted on the swift GitHub repo: [Compiler assertion failure with typed throws · Issue #86463 · swiftlang/swift](https://github.com/swiftlang/swift/issues/86463)
