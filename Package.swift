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
            dependencies: [
                "CasePaths",
                "CasePathsCore_Aggregation",
                "CasePathsMacros"
            ]
        ),
        .binaryTarget(
            name: "CasePaths",
            url: "https://github.com/swift-precompiled/swift-case-paths/releases/download/1.9.1/CasePaths-ff18c44f43d6921c0ce38386521367eb35ed7e8448a0c1aa3ccc55f9e27566af.xcframework.zip",
            checksum: "ff18c44f43d6921c0ce38386521367eb35ed7e8448a0c1aa3ccc55f9e27566af"
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
            url: "https://github.com/swift-precompiled/swift-case-paths/releases/download/1.9.1/CasePathsCore-ba91165b4e21464f217fdf5464a786d5e084e2cb201da7f19d6290a67ac27ad0.xcframework.zip",
            checksum: "ba91165b4e21464f217fdf5464a786d5e084e2cb201da7f19d6290a67ac27ad0"
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
            url: "https://github.com/swift-precompiled/swift-case-paths/releases/download/1.9.1/CasePathsMacrosSupport-1f3fd9be8be6a7ca4ed06217e5da98e71403abee834f0195d2d8fc01b5e87f55.xcframework.zip",
            checksum: "1f3fd9be8be6a7ca4ed06217e5da98e71403abee834f0195d2d8fc01b5e87f55"
        ),
        .macro(
            name: "CasePathsMacros",
            path: "Macros/CasePathsMacros"
        )
    ]
)