-- SPDX-FileCopyrightText: Copyright contributors to the sdlada project.
-- SPDX-License-Identifier: Zlib
--
-- Modified from: the sdlada project <https://github.com/ada-game-framework/sdlada>,
-- licensed under the Zlib license.

package body SDL is
   function Initialise
     (Flags : in Init_Flags := Enable_Everything) return Boolean
   is
      function SDL_Init
        (Flags : in Init_Flags := Enable_Everything) return C.int
      with Import => True, Convention => C, External_Name => "SDL_Init";
   begin
      return (SDL_Init (Flags) = Success);
   end Initialise;

   function Initialise_Sub_System (Flags : in Init_Flags) return Boolean is
      function SDL_Init_Sub_System (Flags : in Init_Flags) return C.int
      with
        Import        => True,
        Convention    => C,
        External_Name => "SDL_InitSubSystem";
   begin
      return (SDL_Init_Sub_System (Flags) = Success);
   end Initialise_Sub_System;

   function SDL_Was_Initialised
     (Flags : in Init_Flags := Null_Init_Flags) return Init_Flags
   with Import => True, Convention => C, External_Name => "SDL_WasInit";

   function What_Was_Initialised return Init_Flags is
   begin
      return SDL_Was_Initialised;
   end What_Was_Initialised;

   function Was_Initialised (Flags : in Init_Flags) return Boolean is
   begin
      return (SDL_Was_Initialised (Flags) = Flags);
   end Was_Initialised;
end SDL;
