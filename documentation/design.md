Design
======

Root
----

### Core

### Main

### Image

Class wrapping around a single image.

* Tracks one Love image.
* Tracks (x,y) position.
* Implements a draw function.

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

### Coordinate

An (x,y) tile on the map.

* Can convert to a point.
* Can be duplicated.

### Point

An arbitrary (x,y) position on the map.

* Can convert to a coordinate.
* Can be duplicated.

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
* Draws base pawn image using pretranslated coordinates.

Objects
-------

### Object

Base for all objects in the world.

* Must contain at least one coordinate.
* May not overlap with other objects.
* Does not need to be continuous.
* Determines whether a given coordinate is blocked.
* Determines whether a pawn can interact with a tile.
* Children track additional state, as necessary.
* Virtual functions for converting to/from string data.
* Draw the base tile image using pretranslated coordinates.
* Draws local UI elements using pretranslated coordinates and local state.
