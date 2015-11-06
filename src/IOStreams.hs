{-# LANGUAGE OverloadedStrings   #-}
{-# LANGUAGE ScopedTypeVariables #-}

module IOStreams where

import           Control.Exception
import           Data.ByteString   (ByteString)
import           Data.Char         (isSpace)
import qualified Data.Text         as Text
import           System.IO.Streams (InputStream, OutputStream)
import qualified System.IO.Streams as Streams

run :: FilePath -> IO ()
run fname = do
  i <- Streams.withFileAsInput fname countWhiteSpace
  print i

countWhiteSpace :: InputStream ByteString -> IO Int
countWhiteSpace is = Streams.decodeUtf8 is >>=
                     Streams.map (Text.length . Text.filter isSpace) >>=
                     Streams.fold (+) 0
