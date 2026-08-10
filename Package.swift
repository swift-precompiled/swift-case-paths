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
            url: "https://github.com/swift-precompiled/swift-case-paths/releases/download/1.9.1/CasePaths-9c58bb45e69e040213afe77f8ba5c0c57a93f9705d3c43a375776ff79fbd7cd8.xcframework.zip",
            checksum: "9c58bb45e69e040213afe77f8ba5c0c57a93f9705d3c43a375776ff79fbd7cd8"
        ),
        .target(
            name: "CasePathsCore_Aggregation",
            dependencies: ["CasePathsCore"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "CasePathsCore",
            url: "https://github.com/swift-precompiled/swift-case-paths/releases/download/1.9.1/CasePathsCore-abfe22d99fcac8b83e8edf9239aca5d8c73a97717f794eb481bed19e2c478514.xcframework.zip",
            checksum: "abfe22d99fcac8b83e8edf9239aca5d8c73a97717f794eb481bed19e2c478514"
        ),
        .target(
            name: "CasePathsMacrosSupport_Aggregation",
            dependencies: ["CasePathsMacrosSupport"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "CasePathsMacrosSupport",
            url: "https://github.com/swift-precompiled/swift-case-paths/releases/download/1.9.1/CasePathsMacrosSupport-9a330c6bc8b9cd9b4c2d5b7f6d0fc2d6b904808b9dd4527e628193082e5c16d9.xcframework.zip",
            checksum: "9a330c6bc8b9cd9b4c2d5b7f6d0fc2d6b904808b9dd4527e628193082e5c16d9"
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