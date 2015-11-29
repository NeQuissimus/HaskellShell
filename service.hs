#!/usr/bin/env stack
-- stack --resolver lts-3.15 --install-ghc runghc --package turtle
{-# LANGUAGE OverloadedStrings #-}
import Turtle hiding (toText)
import Data.Char (toLower)
import Data.Text hiding (empty,toLower,map)

data ServiceCommand = Start | Stop | Restart | Status deriving (Show)

data Service = Service String deriving (Show)

sctl :: Service -> ServiceCommand -> String
sctl (Service s) c = command
    where
        sys = "systemctl"
        command = sys ++ " " ++ (toLower <$> (show c)) ++ " " ++ s

main = stdout (inshell (pack (sctl (Service "sshd") Status)) empty)
