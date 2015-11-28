#!/usr/bin/env stack
-- stack --resolver lts-3.15 --install-ghc runghc --package turtle
{-# LANGUAGE OverloadedStrings #-}
import Turtle
currentPath :: (MonadIO io) => io Text
currentPath = do
    dir <- pwd
    return (format fp dir)

main = do
    a <- currentPath
    print a
