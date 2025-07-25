-- SPDX-FileCopyrightText: Copyright contributors to the sdlada project. --
-- SPDX-License-Identifier: Zlib --
--
-- Modified from: --
-- the sdlada project --
-- <https://github.com/ada-game-framework/sdlada>, --
-- licensed under the Zlib license. --
--------------------------------------------------------------------------------------------------------------------
--  SDL.Video.Palettes
--
--  Palettes, colours and various conversions.
--------------------------------------------------------------------------------------------------------------------

package SDL3.Video.Palettes is
   pragma Preelaborate;

   package C renames Interfaces.C;

   type Colour_Component is range 0 .. 255 with Size => 8, Convention => C;

   type Colour is record
      Red   : Colour_Component := Colour_Component'First;
      Green : Colour_Component := Colour_Component'First;
      Blue  : Colour_Component := Colour_Component'First;
      Alpha : Colour_Component := Colour_Component'First;
   end record
   with Convention => C, Size => Colour_Component'Size * 4;

   Null_Colour : constant Colour := (others => <>);
end SDL3.Video.Palettes;
