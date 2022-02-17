load("//tools/lint:bazel_lint.bzl", "bazel_lint")

def add_lint_tests(
        bazel_lint_ignore = None,
        bazel_lint_extra_srcs = None,
        bazel_lint_exclude = None):
    existing_rules = native.existing_rules().values()
    bazel_lint(
        ignore = bazel_lint_ignore,
        extra_srcs = bazel_lint_extra_srcs,
        exclude = bazel_lint_exclude,
    )
