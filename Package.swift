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
            url: "https://github.com/swift-precompiled/swift-case-paths/releases/download/1.9.1/CasePaths-0b147a087616703e5f230a2bb3260727268c164aca513a6045fab421e8c5c7c3.xcframework.zip",
            checksum: "0b147a087616703e5f230a2bb3260727268c164aca513a6045fab421e8c5c7c3"
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
            url: "https://github.com/swift-precompiled/swift-case-paths/releases/download/1.9.1/CasePathsCore-3f077cdbc4c55f340f642d9c911c1818c2325eae0dcd2c24a6cc773adba0c861.xcframework.zip",
            checksum: "3f077cdbc4c55f340f642d9c911c1818c2325eae0dcd2c24a6cc773adba0c861"
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
            url: "https://github.com/swift-precompiled/swift-case-paths/releases/download/1.9.1/CasePathsMacrosSupport-a81c1671cc1a3d5ac7f1e9dabc8603d10a5829f4d01b92244f27161781ab97c2.xcframework.zip",
            checksum: "a81c1671cc1a3d5ac7f1e9dabc8603d10a5829f4d01b92244f27161781ab97c2"
        ),
        .macro(
            name: "CasePathsMacros",
            path: "Macros/CasePathsMacros"
        )
    ]
)