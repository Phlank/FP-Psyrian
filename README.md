# Psyrian Iteration 1

## About

Psyrian is a small space shooter inspired by Tyrian 2000, a game published by Epic MegaGames that was rereleased as freeware in 2007.

Once you are in the level, the controls are as follows:

- Up, Down, Left, Right: Move
- Space: Fire weapon
  
Score as many points as you can!

## Reflection

Something happened really early into this iteration: scope creep. At work, I've been operating in .NET Core 3.1 since June, and I love the resources it gives me to keep my code clean and expand my software very rapidly and safely. Godot has none of this, so this environment has been getting more and more difficult to cope with as the size of the project gets larger. However, I discovered something this iteration in using base objects: a base level holds all of the shared code and objects that each level uses, a base enemy holds some variables used between various enemies, etc.

This has made my life so much easier when thinking about each level, each enemy, and even each bullet. It feels like I'm finally getting to a point where I feel comfortable adding onto my project with a strong purpose. Not that I couldn't complete a ticket prior to this iteration for the project, but I feel like I can focus solely on a single ticket at a time now with the number of objects I'm dealing with. I'm enjoying designing parts to this game now, and that makes me feel good. Trying to keep code clean in Godot is still a lot more difficult than in statically typed langauges, and every part of me wants to use GDScript that way, but that doesn't innately make GDScript worse. I have made a lot of google searches and landed on closed github issues for the Godot engine with a final comment of "Will not implement/add" with regards to many OOP concepts I want to use.

In total, this iteration was more learning than productivity, but having felt like I can accomplish more in less time, I'm excited to see how the rest of the project pans out.

## Evaluation

- [X] D-1: The repository link is submitted to Canvas before the project deadline.
- [X] D-2: The repository contains a <code>README.md</code> file in its top-level directory.
- [X] D-3: The project content is eligible for an <a href="https://www.esrb.org/ratings-guide/">ESRB Rating</a> of M or less.
- [X] C-1: Your repository is well-formed, with an appropriate <code>.gitignore</code> file and no unnecessary files tracked.
- [X] C-2: Your release is tagged using <a href="https://semver.org/">semantic versioning</a> where the major version is zero, the minor version is the iteration number, and the patch version is incremented as usual for each change made to the minor version, and the release name matches the release tag.
- [X] C-3: You have a clear legal right to use all incorporated assets, and the licenses for all third-party assets are tracked in the <code>README.md</code> file.
- [X] C-4: The <code>README.md</code> contains instructions for how to play the game or such instructions are incorporated into the game itself.
- [X] C-5: The project content is eligible for an <a href="https://www.esrb.org/ratings-guide/">ESRB Rating</a> of T or less.
- [X] C-6: The release demonstrates the core gameplay loop: the player can take action that moves them toward a goal.
- [X] B-1: The <code>README.md</code> file contains a personal reflection on the iteration and self-evaluation, as defined above.
- [X] B-2: The game runs without errors or warnings.
- [X] B-3: The playable game is published to GitHub Pages and linked from the <code>README.md</code> file, or executable builds are provided for download as part of the GitHub release.
- [X] B-4: The source code and project structure comply with our adopted style guides.
- [X] B-5: Clear progress has been made on the game with respect to the project plan.
- [X] A-1: The source code contains no warnings: all warnings are properly addressed, not just ignored.
- [X] A-2: The game includes the conventional player experience loop of title, gameplay, and ending.
- [X] A-3: Earn <em>N</em>*&lceil;<em>P</em>/2&rceil; stars, where <em>N</em> is the iteration number and <em>P</em> is the number of people on the team.
- [X] ⭐ Include a dynamic (non-static) camera
- [X] ⭐ Incorporate parallax background scrolling
- [ ] ⭐ Use paper doll animations
- [ ] ⭐ Incorporate smooth transitions between title, game, and end states, rather than jumping between states via <code>change_scene</code>
- [ ] ⭐ Support both touch and mouse/keyboard input in the Web build
- [ ] ⭐ Allow the user to control the volume of music and sound effects independently.
- [ ] ⭐ Incorporate juiciness and document it in the <code>README.md</code>
- [ ] ⭐ Incorporate another kind of juiciness and document it in the <code>README.md</code>
- [ ] ⭐ Use particle effects
- [ ] ⭐ Use different layers and masks to manage collisions and document this in the <code>README.md</code>
- [ ] ⭐ Incorporate pop into your HUD or title screen using <code>Tween</code> or <code>AnimationPlayer</code>
- [ ] ⭐ Include an AI-controlled characters
- [ ] ⭐ Include an AI-controlled character controlled with a different AI
- [ ] ⭐ Add a pause menu that includes, at minimum, the ability to resume or return to the main menu
- [ ] ⭐ The game is released publicly on <code>itch.io</code>, with all the recommended accompanying text, screenshots, gameplay videos, <i>etc.</i>


## Credits

### Music

Title screen music is from myself.

Level 1 music is [Title Screen by sawsquarenoise](https://freemusicarchive.org/music/sawsquarenoise/dojokratos/tittle-screen). CC-BY-4.0.

Gem pickup sound is [Coin Pickup Sound V 0.2 by Davidsraba](https://freesound.org/people/Davidsraba/sounds/347174/). CC-1.0.

Weapon/Powerup pickup sound is [item pickup sound(?) by Darsycho](https://freesound.org/people/Darsycho/sounds/442574/). CC-1.0.

Other sound effects are from myself.

### Artwork:

All sprite artwork by Daniel Cook, published as part of Tyrian and Tyrian 2000 by Epic MegaGames. Tyrian 2000's source code and data files have been released as freeware under the GPL 2.0 License.

Star background by Bonsaiheldin, found on [OpenGameArt](https://opengameart.org/content/stars-parallax-backgrounds). CC0 1.0.