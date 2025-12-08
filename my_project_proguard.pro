# Project-specific ProGuard configuration.
#
# ProGuard 6.x reports unresolved references to some Kotlin stdlib
# synthetic accessors when shrinking the combined Valdi/Kotlin code.
# These warnings are benign for this app, so we instruct ProGuard to
# ignore them and proceed with shrinking and obfuscation.

-ignorewarnings

# Keep Valdi utility classes used from native code via JNI. Their
# fully-qualified names are hard-coded in C++ (JavaCache.cpp and
# valdi/src/valdi/android/InternedStringCPP.hpp), so renaming or
# removing them leads to ClassNotFoundException at runtime.
-keep class com.snap.valdi.utils.** {
    *;
}
