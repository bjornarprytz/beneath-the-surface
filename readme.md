# beneath-the-surface

Stipulation: Procedural Art

- Shaders

## TODO

- Systems
  - Build Action
  - UI for building
    - hotkeyed row of building options
  - UI for resources
  - Hardware
    - Database (Tile)
    - Fire Wall (Edge)
  - Units (Programs)
    - Test unit: Daemon
    - 
    - Pathfinding
    - Movement happens tick-wise
    - Movement strategy and pattern defines the program
  - Tick
    - Move
    - Defend
    - Execute
  - Networking

## Ideas

- Research
  - A kind of passive progress depicted on the building bar
  - The player can reorder them to indicate research priority

- Hardware
  - Tile
    - GPU
  - Edge
    - Encryption Layer

- Fog of war
  - Known map parts
  - "Last known"

## Chore

- Setup itch.io page for beneath-the-surface [link](https://itch.io/game/new)
  - Set Kind to HTML
  - Set viewport dimensions (normal: 1280x720)
  - Check SharedArrayBuffer
  - Hit the Save button
- Get Butler API key from [itch.io](https://itch.io/user/settings/api-keys)
- Publish github repo
- Add key to GitHub secrets as BUTLER_API_KEY [link](https://github.com/bjornarprytz/beneath-the-surface/settings/secrets/actions)
- Push release with `./push_release.sh`

### Extra

- itch.io
  - Rename the game
  - Write a short description
  - Make a nice cover image (630x500)
  - Add screenshots (recommended: 3-5)
  - Pick a genre
  - Add a tag or two
  - Publish a devlog on instagram

### Meta

- Figure out how to develop for mobile
  - How to use the on-screen keyboard
