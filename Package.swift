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
            targets: ["CasePaths_Aggregation"]
        ),
        .library(
            name: "CasePathsCore",
            targets: ["CasePathsCore_Aggregation"]
        ),
        .library(
            name: "CasePathsMacrosSupport",
            targets: ["CasePathsMacrosSupport_Aggregation"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-precompiled/swift-syntax",
            revision: "603.0.2-precompiled.3"
        ),
        .package(
            url: "https://github.com/swift-precompiled/xctest-dynamic-overlay",
            revision: "1.11.0-precompiled.1"
        )
    ],
    targets: [
        .target(
            name: "CasePaths_Aggregation",
            dependencies: [
                "CasePaths",
                "CasePathsCore_Aggregation",
                "CasePathsMacros"
            ]
        ),
        .binaryTarget(
            name: "CasePaths",
            url: "https://github.com/swift-precompiled/swift-case-paths/releases/download/1.9.1-precompiled.1/CasePaths-0c69c177c717dd745cdb2b773884b7145f3e21e6b4661017b8f93ad61f064b44.xcframework.zip",
            checksum: "0c69c177c717dd745cdb2b773884b7145f3e21e6b4661017b8f93ad61f064b44"
        ),
        .target(
            name: "CasePathsCore_Aggregation",
            dependencies: [
                "CasePathsCore",
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
        .binaryTarget(
            name: "CasePathsCore",
            url: "https://github.com/swift-precompiled/swift-case-paths/releases/download/1.9.1-precompiled.1/CasePathsCore-15e450b0ec1863988034a495061cf44af036d7988a7d9b4ffe443b6cec93854e.xcframework.zip",
            checksum: "15e450b0ec1863988034a495061cf44af036d7988a7d9b4ffe443b6cec93854e"
        ),
        .target(
            name: "CasePathsMacrosSupport_Aggregation",
            dependencies: [
                "CasePathsMacrosSupport",
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
        ),
        .binaryTarget(
            name: "CasePathsMacrosSupport",
            url: "https://github.com/swift-precompiled/swift-case-paths/releases/download/1.9.1-precompiled.1/CasePathsMacrosSupport-0d16806e9a7c1ace018c0f54bab54bbae634b6d37f715dded219c537986857b7.xcframework.zip",
            checksum: "0d16806e9a7c1ace018c0f54bab54bbae634b6d37f715dded219c537986857b7"
        ),
        .macro(
            name: "CasePathsMacros",
            path: "Macros/CasePathsMacros"
        )
    ]
)