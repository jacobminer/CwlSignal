// swift-tools-version:4.0
import PackageDescription

let package = Package(
	name: "CwlPreconditionTesting",
	products: [
		.library(name: "CwlPreconditionTesting", type: .dynamic, targets: ["CwlPreconditionTesting", "CwlMachBadInstructionHandler"])
	],
	dependencies: [
		.package(url: "https://github.com/mattgallagher/CwlCatchException.git", .branch("xcode10"))
	],
	targets: [
		.target(
			name: "CwlPreconditionTesting",
			dependencies: [
				.target(name: "CwlMachBadInstructionHandler"),
				.product(name: "CwlCatchException")
			],
			exclude: [
				"./Mach/CwlPreconditionTesting.h",
				"./Posix/CwlPreconditionTesting.h",
				"./CwlCatchBadInstructionPosix.swift"
			]
		),
		.target(name: "CwlMachBadInstructionHandler"),
		.testTarget(name: "CwlPreconditionTestingTests", dependencies: ["CwlPreconditionTesting"])
	]
)
