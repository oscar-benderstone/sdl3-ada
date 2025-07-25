-- SPDX-FileCopyrightText: 2025 Copyright Oscar Bender-Stone <oscar-benderstone@gmail.com>
-- SPDX-License-Identifier: Zlib --
--
-- Modified from: --
-- the sdlada project --
-- <https://github.com/ada-game-framework/sdlada>, --
-- licensed under the Zlib license. --
------------------------------------------------------------------------------
--  SDL.Video --
--
--  Common display and video driver functionality. --
------------------------------------------------------------------------------

package SDL3.Video is
   pragma Preelaborate;

   package C renames Interfaces.C;

   Video_Error : exception;

   type Blend_Modes is (None, Alpha_Blend, Additive, Colour_Modulate, Multiply)
   with Convention => C;

   for Blend_Modes use
     (None            => 16#0000_0000#,
      Alpha_Blend     => 16#0000_0001#,
      Additive        => 16#0000_0002#,
      Colour_Modulate => 16#0000_0004#,
      Multiply        => 16#0000_0008#);

   --  Screen saver information.
   procedure Enable_Screen_Saver
   with
     Import        => True,
     Convention    => C,
     External_Name => "SDL_EnableScreenSaver";

   procedure Disable_Screen_Saver
   with
     Import        => True,
     Convention    => C,
     External_Name => "SDL_DisableScreenSaver";

   function Is_Screen_Saver_Enabled return Boolean
   with Inline => True;

   -- NOTE : SDL_VideoIniit and SDL_VideoQuit --
   -- have been removed in SDL3. --
   -- TODO: make these wrappers instead. --

   -- function Initialise (Name : in String) return Boolean;

   -- procedure Finalise
   -- with Import => True, Convention => C, External_Name => "SDL_VideoQuit";

   --function Total_Drivers return Positive;

   --function Driver_Name (Index : in Positive) return String;

   --function Current_Driver_Name return String;
end SDL3.Video;
