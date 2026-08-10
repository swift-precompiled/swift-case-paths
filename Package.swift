// swift-tools-version:6.0.0

import PackageDescription
import Foundation
import CompilerPluginSupport

let package = Package(
    name: "swift-case-paths",
    platforms: [
        .iOS("13.0"),
        .macOS("10.15"),
        .tvOS("13.0"),
        .watchOS("6.0")
    ],
    products: [
        .library(
            name: "CasePaths",
            targets: ["CasePaths_PrecompiledProduct"]
        ),
        .library(
            name: "CasePathsCore",
            targets: ["CasePathsCore_PrecompiledProduct"]
        ),
        .library(
            name: "CasePathsMacrosSupport",
            targets: ["CasePathsMacrosSupport_PrecompiledProduct"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-precompiled/swift-syntax",
            exact: "603.0.2"
        ),
        .package(
            url: "https://github.com/swift-precompiled/xctest-dynamic-overlay",
            exact: "1.11.0"
        )
    ],
    targets: [
        .target(
            name: "CasePaths_Aggregation",
            dependencies: ["CasePaths"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "CasePaths",
            url: "https://github.com/swift-precompiled/swift-case-paths/releases/download/1.9.1/CasePaths-af8968b40b063d44fb5f33f032940858a610d936881e086a483bc6bee6202d1c.xcframework.zip",
            checksum: "af8968b40b063d44fb5f33f032940858a610d936881e086a483bc6bee6202d1c"
        ),
        .target(
            name: "CasePathsCore_Aggregation",
            dependencies: ["CasePathsCore"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "CasePathsCore",
            url: "https://github.com/swift-precompiled/swift-case-paths/releases/download/1.9.1/CasePathsCore-e5a5a824099239dbfc630ec665c22b241d40da76b98a9d8d64a40cc542a4f0fd.xcframework.zip",
            checksum: "e5a5a824099239dbfc630ec665c22b241d40da76b98a9d8d64a40cc542a4f0fd"
        ),
        .target(
            name: "CasePathsMacrosSupport_Aggregation",
            dependencies: ["CasePathsMacrosSupport"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "CasePathsMacrosSupport",
            url: "https://github.com/swift-precompiled/swift-case-paths/releases/download/1.9.1/CasePathsMacrosSupport-9587ece25ef5057318ae44de7c9aea0434ec3bfd5baa403ad46d2717cd750139.xcframework.zip",
            checksum: "9587ece25ef5057318ae44de7c9aea0434ec3bfd5baa403ad46d2717cd750139"
        ),
        .macro(
            name: "CasePathsMacros",
            path: "Macros/CasePathsMacros"
        ),
        .target(
            name: "CasePaths_PrecompiledProduct",
            dependencies: [
                "CasePaths_Aggregation",
                "CasePathsCore_Aggregation",
                .product(
                    name: "IssueReporting",
                    package: "xctest-dynamic-overlay"
                ),
                .product(
                    name: "XCTestDynamicOverlay",
                    package: "xctest-dynamic-overlay"
                ),
                "CasePathsMacros"
            ]
        ),
        .target(
            name: "CasePathsCore_PrecompiledProduct",
            dependencies: [
                "CasePathsCore_Aggregation",
                .product(
                    name: "IssueReporting",
                    package: "xctest-dynamic-overlay"
                ),
                .product(
                    name: "XCTestDynamicOverlay",
                    package: "xctest-dynamic-overlay"
                )
            ]
        ),
        .target(
            name: "CasePathsMacrosSupport_PrecompiledProduct",
            dependencies: [
                "CasePathsMacrosSupport_Aggregation",
                .product(
                    name: "SwiftSyntaxMacros",
                    package: "swift-syntax"
                ),
                .product(
                    name: "SwiftCompilerPlugin",
                    package: "swift-syntax"
                ),
                .product(
                    name: "SwiftDiagnostics",
                    package: "swift-syntax"
                ),
                .product(
                    name: "SwiftSyntax",
                    package: "swift-syntax"
                ),
                .product(
                    name: "SwiftSyntaxBuilder",
                    package: "swift-syntax"
                )
            ]
        )
    ]
)