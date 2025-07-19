// SPDX-FileCopyrightText: Copyright contributors to the sdlada project.
// SPDX-License-Identifier: Zlib
//
// Modified from:
// the sdlada project
// <https://github.com/ada-game-framework/sdlada>,
// licensed under the Zlib license.

#include <SDL3/SDL_version.h>

/* We need to define some constants here so we can get access to the values that
 * in #define form from Ada.
 */
const Uint8 SDL_Ada_Major_Version = SDL_MAJOR_VERSION;
const Uint8 SDL_Ada_Minor_Version = SDL_MINOR_VERSION;
const Uint8 SDL_Ada_Micro_Version = SDL_MICRO_VERSION;
