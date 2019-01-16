{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

import Data.Text (Text)
import Dhall
import Dhall.Core
import Text.Taggy.DOM
import Text.Taggy.Renderer
import Data.HashMap.Strict (HashMap)
import qualified Data.Text.Lazy as T
import qualified Data.Text.Lazy.IO as T
import qualified Data.HashMap.Strict as HM

data Example = Example 
  { name :: Dhall.Text
  , upvotes :: Dhall.Natural 
  }
  deriving (Dhall.Generic, Show)

instance Dhall.Interpret Example

newline :: IO ()
newline = putChar '\n'

main :: IO ()
main = do

  newline

  -- Print dhall file
  people <- Dhall.input Dhall.auto "./misc/people.dhall"
  mapM_ print (people :: [Example])

  newline

  ipsum <- T.readFile "./misc/ipsum.html"
  mapM_ T.putStrLn $ render <$> parseDOM True ipsum

  pure()

hashmap :: HashMap Text (Expr s a)
hashmap = HM.fromList
  [ ( "let" , Let )
  ]
