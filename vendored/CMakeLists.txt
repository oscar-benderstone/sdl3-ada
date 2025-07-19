# SPDX-License-Identifier: Zlib
# Modified from:
# [sdl3-sample]
# (https://github.com/Ravbug/sdl3-sample)

cmake_minimum_required(VERSION 3.30.0)

project(sdl3_ada_vendored C)

# TODO: add options for static libraries.
# Not recommended by SDL3, but should be possible.
add_library(sdl3ada SHARED version.c)

# Searches for SDL libraries in the user's system
# or, if set, installs them into vendored
option(SDLVENDORED "Use vendored SDL" OFF)
# Defined internally to cmake files
# of each respective lib.
set(SDLIMAGE_VENDORED OFF)
set(SDLTTF_VENDORED OFF)
set(SDLMIXER_VENDORED ON)

# disable formats we don't use
# to make the build faster and smaller.
# Also some of these don't work
# on all platforms so you'll
# need to do some experimentation.
set(SDLMIXER_GME OFF)
set(SDLMIXER_WAVPACK OFF)
set(SDLMIXER_MIDI_NATIVE OFF)
set(SDLMIXER_GME OFF)
set(SDLMIXER_WAVPACK OFF)
set(SDLMIXER_MOD OFF)
set(SDLMIXER_OPUS OFF)

include(FetchContent)
set(FETCHCONTENT_QUIET FALSE)
set(FETCHCONTENT_BASE_DIR "${CMAKE_BINARY_DIR}")

# Adapted from:
# https://github.com/libsdl-org/SDL_helloworld
if(SDLVENDORED)
  FetchContent_Declare(
    SDL3
    GIT_REPOSITORY "https://github.com/libsdl-org/SDL.git"
    GIT_TAG main
    EXCLUDE_FROM_ALL
  )
  FetchContent_MakeAvailable(SDL3)
else()
  # find_package looks for already-installed system packages.
  # Configure with `-DCMAKE_PREFIX_PATH="/path/to/package1;/path/to/package2"`
  # to add search paths.
  find_package(SDL3 REQUIRED CONFIG REQUIRED COMPONENTS SDL3-shared)
endif()

if(SDLIMAGE_VENDORED)
  FetchContent_Declare(
    SDL3_image
    GIT_REPOSITORY "https://github.com/libsdl-org/SDL_image.git"
    GIT_TAG "main"
    EXCLUDE_FROM_ALL
  )
  FetchContent_MakeAvailable(SDL3_image)
else()
  # find_package looks for already-installed system packages.
  # Configure with `-DCMAKE_PREFIX_PATH="/path/to/package1;/path/to/package2"`
  # to add search paths.
  find_package(SDL3_image REQUIRED)
endif()

if(SDLTTF_VENDORED)
  FetchContent_Declare(
    SDL3_ttf
    GIT_REPOSITORY "https://github.com/libsdl-org/SDL_ttf.git"
    GIT_TAG "main"
    EXCLUDE_FROM_ALL
  )
  FetchContent_MakeAvailable(SDL3_ttf)
else()
  # find_package looks for already-installed system packages.
  # Configure with `-DCMAKE_PREFIX_PATH="/path/to/package1;/path/to/package2"`
  # to add search paths.
  find_package(SDL3_ttf REQUIRED)
endif()

if(SDLMIXER_VENDORED)
  FetchContent_Declare(
    SDL3_mixer
    GIT_REPOSITORY "https://github.com/libsdl-org/SDL_mixer.git"
    GIT_TAG "main"
    EXCLUDE_FROM_ALL
  )
  FetchContent_MakeAvailable(SDL3_mixer)
else()
  # find_package looks for already-installed system packages.
  # Configure with `-DCMAKE_PREFIX_PATH="/path/to/package1;/path/to/package2"`
  # to add search paths.
  find_package(SDL3_mixer REQUIRED)
endif()

target_link_libraries(sdl3ada
  PRIVATE
  SDL3_image::SDL3_image
  SDL3_ttf::SDL3_ttf
  SDL3_mixer::SDL3_mixer
  # SDL3 MUST be last item
  # in list of SDL libraries
  SDL3::SDL3
)
