{-# LANGUAGE OverloadedStrings   #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Handle where

import           Control.Exception hiding (handle)
import           Data.Char         (isSpace)
import           System.IO

run :: FilePath -> IO ()
run fname = do
  handle <- openFile fname ReadMode
  i <- countWhiteSpace handle
  print i

countWhiteSpace :: Handle -> IO Int
countWhiteSpace h = loop 0
  where
    loop i = do
      eof <- hIsEOF h
      if eof
        then return i
        else do
          c <- hGetChar h
          if isSpace c then loop (i+1) else loop i
