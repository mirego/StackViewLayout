// swift-tools-version: 5.5
import PackageDescription

let package = Package(
    name: "StackViewLayout",
    platforms: [
        .iOS(.v12),
        .tvOS(.v12)
    ],
    products: [
        .library(name: "StackViewLayout", targets: ["StackViewLayout"])
    ],
    targets: [
        .target(
            name: "StackViewLayout",
            path: "Sources",
            exclude: ["SupportingFiles"]
        )
    ]
)
