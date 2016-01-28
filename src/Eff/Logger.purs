module Eff.Logger where

-- https://gist.github.com/kRITZCREEK/4d549534570b06853c3c

import Prelude
import Control.Monad.Eff
import Control.Monad.Eff.Console

foreign import data LOGGER :: !
foreign import logS :: forall eff. String -> Eff (logger :: LOGGER | eff) Unit
foreign import runConsoleLogger :: forall a eff. Eff (logger :: LOGGER | eff) a -> Eff (console :: CONSOLE | eff) a
