{-# LANGUAGE ForeignFunctionInterface #-}
module T19350 (c_add1) where

import Foreign.C.Types (CInt(..))

foreign import ccall unsafe "add1" c_add1 :: CInt -> CInt
