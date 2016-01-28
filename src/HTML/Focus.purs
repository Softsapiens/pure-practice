module HTML.Focus where

-- http://stackoverflow.com/questions/32248943/automatically-focus-input-element-after-creation-in-purescript-halogen

import Prelude
import Control.Monad.Eff (Eff())
import Data.Function (Fn1(), runFn1)

foreign import data FOCUS :: !

foreign import setFocusImpl :: forall e. Fn1 String (Eff (focus :: FOCUS | e) Unit)

setFocus :: forall e. String -> Eff (focus :: FOCUS | e) Unit
setFocus = runFn1 setFocusImpl

{-
And then use the setFocus function in the initializer.

H.input
[ A.id_ "inputField"
, A.Initializer do
    liftEff $ setFocus "inputField"
    pure DoNothing
] [ ]
Note that I'm using an old version of halogen where the signature is still the old one (definition of Initializer in 30e8b2c7).
https://github.com/slamdata/purescript-halogen/blob/30e8b2c7174a1eeda73f67cc42c739ca24a1e218/src/Halogen/HTML/Attributes.purs#L112

-}
