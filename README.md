# SDL3 Ada

Unofficial SDL3 bindings for Ada,
modifying code from [sdlada](https://github.com/ada-game-framework/sdlada)
for SDL2.

## Comparison with SDL2

SDL3 introduces new features and improvements
over SDL2;
see more details in [migration guide.](https://github.com/libsdl-org/SDL/blob/main/docs/README-migration.md)
For Ada, here are the relevant items:

- There is no `sdl3-config` command: the linker flag is now `-lSDL3`.
  This project automatically does this for you!
- More device support! Tablets, cameras, etc.
- A new [GPU API](https://wiki.libsdl.org/SDL3/CategoryGPU), targeting modern hardware.

Now, SDL2 apps can run with SDL3 using [sdl2-compat](https://github.com/libsdl-org/sdl2-compat).
However, for **new projects**, it is recommended
to use SDL3.

## Testing (WIP)

Regular testing with be performed
on the following major targets:

- Windows.
- Linux.
- MacOS.
- iOS.
- Android.

This project _may_ work on
other platforms with SDL3 and Ada
support, but this is not guaranteed.

## Credits

- [sdlada](https://github.com/ada-game-framework/sdlada):
  modified under the Zlib license. These are fantastic bindings,
  and the source code is easy to follow!
- [AdaCore](https://www.adacore.com/).
  Thank you to AdaCore and its contributors for the entire ecosystem.
  Ada is a great language!
