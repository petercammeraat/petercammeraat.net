// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "MyWebsite",
    platforms: [.macOS(.v12)],
    products: [
        .executable(name: "MyWebsite", targets: ["MyWebsite"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/petercammeraat/Publish", branch: "master"),
        .package(url: "https://github.com/petercammeraat/Plot", branch: "master")
    ],
    targets: [
        .executableTarget(
            name: "MyWebsite",
            dependencies: [
                .product(name: "Publish", package: "publish"),
                .product(name: "Plot", package: "plot")
            ]
        )
    ]
)
