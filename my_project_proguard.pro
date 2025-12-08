# Project-specific ProGuard configuration.
#
# ProGuard 6.x reports unresolved references to some Kotlin stdlib
# synthetic accessors when shrinking the combined Valdi/Kotlin code.
# These warnings are benign for this app, so we instruct ProGuard to
# ignore them and proceed with shrinking and obfuscation.

-ignorewarnings

# Keep Valdi classes used from native code via JNI and reflection.
# Many of these have their fully-qualified names hard-coded in C++
# (JavaCache.cpp, JNIConstants.hpp, valdi/src/valdi/android/*.hpp),
# so renaming or removing them leads to ClassNotFoundException at
# runtime. Keeping the entire com.snap.valdi.* package is safer than
# trying to list every individual class.
-keep class com.snap.valdi.** {
    *;
}

# Keep Djinni / client wrappers for Valdi used from native code.
# These are generated classes under com.snapchat.client.valdi* and
# com.snapchat.client.valdi_core*, referenced by name from Djinni-
# generated JNI glue and Valdi runtime C++. The upstream Valdi
# client_proguard-rules only keeps enums in this package, so we keep
# the full class hierarchies here.
-keep class com.snapchat.client.valdi.** {
    *;
}

-keep class com.snapchat.client.valdi_core.** {
    *;
}
