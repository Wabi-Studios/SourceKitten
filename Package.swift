// swift-tools-version:5.9
import PackageDescription

let package = Package(
  name: "SourceKitten",
  platforms: [
    .macOS(.v14),
    .visionOS(.v1),
    .iOS(.v17),
    .tvOS(.v16),
    .watchOS(.v9),
  ],
  products: [
    .executable(name: "sourcekitten", targets: ["sourcekitten"]),
    .library(name: "SourceKittenFramework", targets: ["SourceKittenFramework"]),
  ],
  dependencies: [
    .package(url: "https://github.com/Wabi-Studios/swift-arg-parser.git", from: "1.2.4"),
    .package(url: "https://github.com/drmohundro/SWXMLHash.git", .upToNextMinor(from: "7.0.2")),
    .package(url: "https://github.com/Wabi-Studios/Yams.git", from: "5.0.7"),
  ],
  targets: [
    .executableTarget(
      name: "sourcekitten",
      dependencies: [
        .product(name: "StackOtterArgParser", package: "swift-arg-parser"),
        "SourceKittenFramework",
      ]
    ),
    .target(
      name: "Clang_C"
    ),
    .target(
      name: "SourceKit"
    ),
    .target(
      name: "SourceKittenFramework",
      dependencies: [
        "Clang_C",
        "SourceKit",
        "SWXMLHash",
        "Yams",
      ]
    ),
    .testTarget(
      name: "SourceKittenFrameworkTests",
      dependencies: [
        "SourceKittenFramework",
      ],
      exclude: [
        "Fixtures",
      ]
    ),
  ]
)
