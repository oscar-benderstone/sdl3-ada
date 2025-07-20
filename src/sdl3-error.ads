-- SPDX-FileCopyrightText: Copyright contributors to the sdlada project.
-- SPDX-License-Identifier: Zlib
--
-- Modified from:
-- the sdlada project
-- <https://github.com/ada-game-framework/sdlada>,
-- licensed under the Zlib license.
--
--------------------------------------------------------------------------------------------------------------------
--  SDL.Error
--
--  Error message handling.
--------------------------------------------------------------------------------------------------------------------

-- TODO: the GNAT documentation
-- mentions issues with
-- [GetLastError and SetLastError
-- on Windows]
-- (https://gcc.gnu.org/onlinedocs/gnat_ugn/Using-GNAT-on-Windows.html).
-- Unfortunately, SDL uses these functions internally.
-- This issue should be tested! Maybe it's been fixed?

package SDL3.Error is
   pragma Preelaborate;

   procedure Clear
   with Import => True, Convention => C, External_Name => "SDL_ClearError";

   procedure Set (S : in String)
   with Inline;

   function Get return String
   with Inline;
end SDL3.Error;
