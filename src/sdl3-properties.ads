-- SPDX-FileCopyrightText: 2025 Copyright Oscar Bender-Stone <oscar-benderstone@gmail.com>
-- SPDX-License-Identifier: Zlib --
--
-----------------------------------------------------------------------
-- SDL.Properties --
--
-- From the SDL3 documentation: --
--
-- "A property is a variable that can be created and retrieved by name at --
-- runtime." --
--
-- Properties are put into groups, which are identified --
-- by integer IDS. They can be used as hashes: --
-- created, cleared, inserted, and destroyed. --
--
-- TODO: compare with Ada's hash tables. Maybe these are more reliable? --
-----------------------------------------------------------------------

-- with Interfaces.C.Strings; --

-- generic --
--    type T is private; --

package SDL3.Properties is
   type ID is mod 2**32 with Convention => C;
   type Property_Type is (Invalid, Pointer, String, Number, Float);

   procedure Get_Global_Properties
   with
     Import        => True,
     Convention    => C,
     External_Name => "SDL_GetGlobalProperties";

   function Create return ID
   with
     Import        => True,
     Convention    => C,
     External_Name => "SDL_CreateProperties";

   function Copy (source : in out ID; dst : in out ID) return C.C_bool
   with Import => True, Convention => C, External_Name => "SDL_CopyProperties";

end SDL3.Properties;
