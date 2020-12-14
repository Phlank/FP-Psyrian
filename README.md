# Psyrian Iteration 1

## About

Psyrian is a small space shooter inspired by Tyrian 2000, a game published by Epic MegaGames that was rereleased as freeware in 2007.

Once you are in the level, the controls are as follows:

- Up, Down, Left, Right: Move
- Space: Fire weapon

Beat the final boss!

## Reflection

I think this iteration felt the easiest to work through by far. I had imagined getting a boss up and running would have taken longer, but I managed to work my way through it in about two hours and I couldn't be happier about that. I wanted the boss to really feel like Tyrian as I went in, and I feel like I got some of that same energy in there of changing patterns and tough-to-dodge projectiles.

Clean code is really hard to do in games, or at least in Godot. Throughout the project I found myself becoming more comfortable with GDScript, but I didn't find myself appreciating it anymore, I just figured my way around the weirdness of the language. It works for what it does, but I can't personally say that it's good or bad. It just works and that's enough.

There were a few times when I ran into pretty large frustrations in the project and would end up on a github issue for godot where language suggestions are made and the suggestions get dismissed. I actually encountered this many times; not having things like interfaces or multiple inheritance did frustrate me before I opted for simpler options. I also wished that I could have specified my own types with their own required children types, similar to the way that rigid and kinematic bodies require a collision shape as a child. This would have made me a lot happier, as I could have specified base types more clearly and specified more required behavior in the base type with the opportunity to override in the classes that inherited or implemented them them.

I had mentioned at some point that I have been working in .Net Core for a while and wished I had some of the tools from that toolset. You had asked what tools specifically, and while .Net doesn't really have much to do with games, I've never had an easier time with things that make my life easier like DI and data access. It felt very weird putting stuff into enums when a quick database table feels cleaner, but I honestly think that may just be due to the fact that I work with databases every single day and my company's clients all need custom options in their databases, so any selectable option in our software is coming from their own database.

A long time ago I made pong in C using the SDL2 library for graphics. I'm sure that if I went back and looked at that project I might vomit, especially considering the amount that I've learned through this project. Honestly, the full game of Tyrian/Tyrian 2000 blows my mind, especially looking at the raw image datasheets. Having to organize so much artwork on the screen in a meaningful way is crazy. When you first brought up "juice" in the semester, my mind immediately went to Tyrian. There's so many things that push it far beyond the scope of nearly every other vertical shooter. It's a masterpiece, and I'm so glad I got to use those assets in my own project to speed up my time spent.

Thanks for everything this semester; I deeply appreciate all that you gave us to learn and I value your high expectations for our work. This is my last semester at BSU, and having been in quite a few of your classes I can honestly say they helped me become a better developer than I would have become otherwise.

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

Weapon/Powerup pickup sound is [Pickup Magic Bells mod.wav by ryusa](https://freesound.org/people/ryusa/sounds/531092/). CC-1.0.

Boss small weapon sound is [laser3 by nsstudios](https://freesound.org/people/nsstudios/sounds/344276/). CC-BY-3.0

Boss big weapon sound is [smallas by inferno](https://freesound.org/people/inferno/sounds/18397/). CC Sampling Plus 1.0

Other sound effects are from myself.

### Artwork:

All sprite artwork by Daniel Cook, published as part of Tyrian and Tyrian 2000 by Epic MegaGames. Tyrian 2000's source code and data files have been released as freeware under the GPL 2.0 License.

Star background by Bonsaiheldin, found on [OpenGameArt](https://opengameart.org/content/stars-parallax-backgrounds). CC0 1.0.