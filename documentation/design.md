Design
======

Root
----

### Core

Singleton representing the heart of the game.

### Settings

Singleton storing constants used throughout the code.

* Constants should be set in the class where they are most relevant.
* Constants should not change during execution.

### Animation

Class wrapping around a series of images.

### Session

Stores a game session.

* Includes game session metadata.
* Includes a Map instance.
* Implements saving/loading.

Scenes
------

### Scene

Base for all scenes.

* Implements utility functions for children.
* Implements base callback functions.
* Warns when children do not implement critical callback functions.

### Loading

Special case scene for drawing a loading page.

* Does not respond to user input.
* Before activation, next scene id must be set.
* On step, enters next scene.
* May be reworked to support background loading.

### MainMenu

Entry point for players.

### InGame

Base scene for drawing the standard in-game view.

* Tracks the overall InGame user interface.

### MapEditor

UI for creating maps.

World
-----

### Map

Contains the physical state of the game world.

* Structure of all tiles.
* List of all objects.
* List of all pawns.
* Implements converting to/from savable string data.
* Implements code for drawing the map.
* Does not interact with the user interface.

### Coordinate

An (x,y) tile on the map.

* Can convert to a map position.
* Can be duplicated.
* Can be converted to relative screen point.

### Position

An arbitrary (x,y) position on the map.

* Can convert to a map coordinate.
* Can be duplicated.
* Should not be used when referring directly to the screen.
* Can be converted to relative screen point.

### Tile

A single tile in the map, representing a coordinate.

* Only one per coordinate.
* May contain part of a single object.
* Does not attempt to directly manipulate objects.
* Object determines whether tile is blocked or open.
* Does not track pawns.
* Pass through calls for drawing objects.

Pawns
-----

### Pawn

Base for all pawns in the world.

* Smaller than tiles.
* Block other pawns.
* Implements pathfinding.
* Virtual functions for converting to/from string data.
* Draws base pawn image when set in translated coordinates.

Objects
-------

### Object

Base for all logical objects in the world.

* Each coordinate must correspond to at most one object.
* Does not need to be continuous.
* May not overlap with other objects.
* Determines whether a given coordinate is blocked.
* Determines whether and how a pawn can interact with a tile.
* Determines image and animation used for tile.
* Children track additional state, as necessary.

