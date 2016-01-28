module MainLogger where

import Prelude
import Control.Monad.Eff
import Control.Monad.Eff.Console
import Eff.Logger (LOGGER(), logS, runConsoleLogger)

noisyAdder :: forall eff. Int -> Int -> Eff (logger :: LOGGER | eff) Int
noisyAdder a b = do
  logS ("a:" <> show a <> " b:" <> show b)
  pure (a + b)

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  runConsoleLogger (noisyAdder 1 2) >>= show >>> log

{-
~/Documents/purescript-eff-logger
❯ pulp run
* Building project in/home/creek/Documents/purescript-eff-logger
* Build successful.
a:1 b:2
3
-}
