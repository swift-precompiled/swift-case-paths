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
            revision: "603.0.2-precompiled.2"
        ),
        .package(
            url: "https://github.com/swift-precompiled/xctest-dynamic-overlay",
            revision: "1.11.0"
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
            url: "https://github.com/swift-precompiled/swift-case-paths/releases/download/1.9.1/CasePaths-75d391e25a678620f8560b5ea268ab89da926fe77ff88c7421564bb0999ca913.xcframework.zip",
            checksum: "75d391e25a678620f8560b5ea268ab89da926fe77ff88c7421564bb0999ca913"
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
            url: "https://github.com/swift-precompiled/swift-case-paths/releases/download/1.9.1/CasePathsCore-2e30f3774417e4a4955662efc76a79fcfdfa3facd522eeb6fc5002ce90491626.xcframework.zip",
            checksum: "2e30f3774417e4a4955662efc76a79fcfdfa3facd522eeb6fc5002ce90491626"
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
            url: "https://github.com/swift-precompiled/swift-case-paths/releases/download/1.9.1/CasePathsMacrosSupport-da058bb05208e7e6d91e847bd43a9636817a320ad0761e2ce95f648666380d74.xcframework.zip",
            checksum: "da058bb05208e7e6d91e847bd43a9636817a320ad0761e2ce95f648666380d74"
        ),
        .macro(
            name: "CasePathsMacros",
            path: "Macros/CasePathsMacros"
        )
    ]
)