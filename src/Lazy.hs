{-# LANGUAGE OverloadedStrings   #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Lazy where

import           Data.Char         (isSpace)
import           Data.Text.Lazy    (Text)

import qualified Data.Text.Lazy    as Text.Lazy
import qualified Data.Text.Lazy.IO as Text.Lazy

run :: FilePath -> IO ()
run fname = do
  file <- Text.Lazy.readFile fname
  print (countWhiteSpace file)

countWhiteSpace :: Text -> Int
countWhiteSpace = fromIntegral . Text.Lazy.length . Text.Lazy.filter isSpace
