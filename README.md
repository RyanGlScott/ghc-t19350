# `ghc-t19350`

A minimal reproduction of [GHC#19350](https://gitlab.haskell.org/ghc/ghc/-/issues/19350).

# Reproduction steps on Linux

1. Generated `libadd1.so` and a `cabal.project.local` file that points to it:

   ```
   $ make
   ```
2. Build the Haskell code that links against `libadd1.so`. This should succeed:

   ```
   $ cabal run ghc-t19350 --write-ghc-environment-files=always
   ```
3. Load the compiled library into GHCi. This will fail due to GHC#19350:

   ```
   $ ghci
   ```
