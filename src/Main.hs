{-# LANGUAGE OverloadedStrings   #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Main where

import           Control.Exception
import           System.Environment (getArgs)

import qualified Handle
import qualified IOStreams
import qualified Lazy

main :: IO ()
main = run `catch` \e -> print ("OMG: " ++ show (e :: SomeException))
  where
    run = do
      flag:fileName:_ <- getArgs
      case flag of
        "-l" -> Lazy.run fileName
        "-h" -> Handle.run fileName
        "-i" -> IOStreams.run fileName
        _    -> error "please specify -l/-h/-s in first arg"
