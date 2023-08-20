load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "StackOtterArgParserToolInfo",
    srcs = glob(["Sources/StackOtterArgParserToolInfo/**/*.swift"]),
    module_name = "StackOtterArgParserToolInfo",
)

swift_library(
    name = "StackOtterArgParser",
    srcs = glob(["Sources/StackOtterArgParser/**/*.swift"]),
    module_name = "StackOtterArgParser",
    visibility = ["//visibility:public"],
    deps = [
        ":StackOtterArgParserToolInfo",
    ],
)
