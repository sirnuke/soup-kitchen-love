# Root

## Main

Loads library classes, wraps core Love functions to corresponding Core functions.

## Core

Singleton implementing the heart of the game.

## Settings

Singleton storing constants used throughout the codebase.

* Should not be modified from outside Settings class.
* Classes may use Settings as a fallback source.

## Session

Stores a game session

* Implements saving and loading.

