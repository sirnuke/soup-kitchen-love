Design
======

Open with first level heading labeling the scope.  Followed by a paragraph describing the scope in human terms.

Followed by a list of bullet points describing what sort of classes fit into the scope.

A second level heading of the class name.  Generally should match the file name.  Doesn't necessary have to be a class.  Paragraph afterward should describe it in human terms.

Followed by a list of bullet points describing behavior and constraints.

A third level heading called *User Interface*.  Followed by a series of bullet points describing how the class interacts with users.

A third level heading called *Drawing*.  Followed by a series of bullet points describing how it draws to the screen.

# Scope

Human readable scope description.

## Class

Human readable class description.

* Constraints
* Behavior

### User Interface

* User interface behaviors

### Drawing

* Drawing procedures


**Old to be organized documentation**

Interface
--------

### MouseInterface

Wraps around tracking the mouse state for a region.

* Issues mousePress, mouseHover, mouseClear, and mouseTrigger callback events.

### MapView

Wraps around drawing and interacting with the game map.

* Does not manage the map beyond basic user interface steps.
* Handles all map drawing.
* One pawn can be selected at a time.
* Orders are sent to the Map object.
* Clicks off MapView are ignored
* Clicks on a controllable pawn select that pawn.
* While selecting a pawn, clicks on an interactable, unoccupied tile generate a move order.
* Clicking on an uninteractable tile deselects the pawn.


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
* Does not implement drawing.
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

Pawns
-----

### Pawn

Base for all pawns in the world.

* Smaller than tiles.
* Block other pawns.
* Implements pathfinding.
* Virtual functions for converting to/from string data.
* Tracks information necessary for drawing the pawn.

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
* Tracks information necessary for drawing the object.

