// swift-tools-version:5.3
import PackageDescription
let package = Package(
    name: "TokamakLearning",
    platforms: [.macOS(.v11)],
    products: [
        .executable(name: "TokamakLearning", targets: ["TokamakLearning"])
    ],
    dependencies: [
        .package(name: "Tokamak", url: "https://github.com/TokamakUI/Tokamak", from: "0.8.0")
    ],
    targets: [
        .target(
            name: "TokamakLearning",
            dependencies: [
                .product(name: "TokamakShim", package: "Tokamak")
            ]),
        .testTarget(
            name: "TokamakLearningTests",
            dependencies: ["TokamakLearning"]),
    ]
)