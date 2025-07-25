-- SPDX-FileCopyrightText: Copyright contributors to the sdlada project.
-- SPDX-License-Identifier: Zlib
--
-- Modified from:
-- the sdlada project
-- <https://github.com/ada-game-framework/sdlada>,
-- licensed under the Zlib license.
--
--------------------------------------------------------------------------------------------------------------------
--  SDL3
--
--  Ada bindings to the SDL 3.x.y library.
--------------------------------------------------------------------------------------------------------------------
with Interfaces.C;

package SDL3 is
   pragma Preelaborate;
   -- TODO: make this cross-platform,
   -- like original sdlada
   -- pragma Linker_Options (SDL_Linker.Options);
   pragma Linker_Options ("-lSDL3");

   package C renames Interfaces.C;

   use type C.int;

   type Init_Flags is mod 2**32 with Convention => C;

   Null_Init_Flags        : constant Init_Flags := 16#0000_0000#;
   Enable_Timer           : constant Init_Flags := 16#0000_0001#;
   Enable_Audio           : constant Init_Flags := 16#0000_0010#;
   Enable_Video           : constant Init_Flags := 16#0000_0020#;
   Enable_Joystick        : constant Init_Flags := 16#0000_0200#;
   Enable_Haptic          : constant Init_Flags := 16#0000_1000#;
   Enable_Game_Controller : constant Init_Flags := 16#0000_2000#;
   Enable_Events          : constant Init_Flags := 16#0000_4000#;
   Enable_Sensors         : constant Init_Flags := 16#0000_8000#;
   -- WARNING: SDL_INIT_EVERYTHING was deprecated in SDL3.
   -- The recommended use is to manually add Init_Flags.

   function Initialise_Sub_System (Flags : Init_Flags) return Boolean
   with Inline;

   function Initialise (Flags : Init_Flags) return Boolean
   renames Initialise_Sub_System;

   procedure Quit_Sub_System (Flags : Init_Flags)
   with Import => True, Convention => C, External_Name => "SDL_QuitSubSystem";

   procedure Quit
   with Import => True, Convention => C, External_Name => "SDL_Quit";

   --  Get which sub-systems were initialised.
   function Get_Initialised return Init_Flags
   with Inline;

   --  Check whether a set of sub-systems were initialised.
   function Was_Initialised (Flags : Init_Flags) return Boolean
   with Inline;

private
   --  The next value is used in mapping the Ada types onto the C types, it is the word size used for all data
   --  in SDL, i.e. all data is 4 byte aligned so it works with 32-bit architectures.
   Word : constant := 4;

   --  These constants are internal to the events system.
   SDL_Query   : constant C.int := -1;
   SDL_Ignore  : constant C.int := 0;
   SDL_Disable : constant C.int := 0;
   SDL_Enable  : constant C.int := 1;
end SDL3;
