-- SPDX-FileCopyrightText: Copyright contributors to the sdlada project.
-- SPDX-License-Identifier: Zlib
--
-- Modified from:
-- the sdlada project
-- <https://github.com/ada-game-framework/sdlada>,
-- licensed under the Zlib license.

package body SDL3 is
   function Initialise_Sub_System (Flags : Init_Flags) return Boolean is
      function SDL_Init_Sub_System (Flags : Init_Flags) return C.C_bool
      with
        Import        => True,
        Convention    => C,
        External_Name => "SDL_InitSubSystem";
   begin
      return Boolean (SDL_Init_Sub_System (Flags));
   end Initialise_Sub_System;

   function SDL_Was_Initialised
     (Flags : Init_Flags := Null_Init_Flags) return Init_Flags
   with Import => True, Convention => C, External_Name => "SDL_WasInit";

   function Get_Initialised return Init_Flags is
   begin
      -- Following the [SDL3 documentation]
      -- (https://wiki.libsdl.org/SDL3/SDL_WasInit):
      -- "Returns a mask of all initialized subsystems if flags is 0,
      -- otherwise it returns the initialization status of the specified subsystems."
      return SDL_Was_Initialised (0);
   end Get_Initialised;

   function Was_Initialised (Flags : Init_Flags) return Boolean is
   begin
      return (SDL_Was_Initialised (Flags) = Flags);
   end Was_Initialised;
end SDL3;
