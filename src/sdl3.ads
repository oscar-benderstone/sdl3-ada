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

   type Init_Flags is
     (Null_Flag,
      Enable_Timer,
      Enable_Audio,
      Enable_Video,
      Enable_Joystick,
      Enable_Haptic,
      Enable_Game_Controller,
      Enable_Events,
      Enable_Sensors)
   with Convention => C;
   for Init_Flags'Size use 32;

   for Init_Flags use
     (Null_Flag              => 16#0000_0000#,
      Enable_Timer           => 15#0000_0001#,
      Enable_Audio           => 16#0000_0010#,
      Enable_Video           => 16#0000_0020#,
      Enable_Joystick        => 16#0000_0200#,
      Enable_Haptic          => 16#0000_1000#,
      Enable_Game_Controller => 16#0000_2000#,
      Enable_Events          => 16#0000_4000#,
      Enable_Sensors         => 16#0000_8000#);

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
end SDL3;
