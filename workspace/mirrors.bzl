# -*- mode: python -*-
# vi: set ft=python :

# This constant contains Drake's default lists of mirrors.  It is keyed by the
# repository type using magic strings ("github", etc.), and has values of type
# list-of-string; each string is a pattern for a mirror URL.
#
# When calling a Drake workspace rule that requires a mirror= argument, this
# constant is a reasonable default value.
#
# Each repository type has its own keyword string substitutions within its
# pattern string; these will vary from one repository type to another; consult
# the specific rules (e.g., github_archive()) for details.
#
# The first item in each list is the authoritative source (e.g., the upstream
# server), if there is one.
#
# For Drake's defaults, Packages are mirrored from upstream (GitHub, Bitbucket,
# PyPI, etc.) to CloudFront backed by an S3 bucket.
#
DEFAULT_MIRRORS = {
    "buildifier": [
        "https://github.com/bazelbuild/buildtools/releases/download/{version}/{filename}",  # noqa
    ],
    "github": [
        # For github.com, we choose a pattern based on the kind of commit.
        "https://github.com/{repository}/archive/refs/tags/{tag_name}.tar.gz",  # noqa
        "https://github.com/{repository}/archive/{commit_sha}.tar.gz",
    ],
}
