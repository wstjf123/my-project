# Project-specific ProGuard configuration.
#
# ProGuard 6.x reports unresolved references to some Kotlin stdlib
# synthetic accessors when shrinking the combined Valdi/Kotlin code.
# These warnings are benign for this app, so we instruct ProGuard to
# ignore them and proceed with shrinking and obfuscation.

-ignorewarnings

