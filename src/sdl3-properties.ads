-- SPDX-FileCopyrightText: Copyright contributors to the sdlada project.
-- SPDX-License-Identifier: Zlib

--------------------------------------------------------------------------------------------------------------------
-- SDL.Properties
--
-- From the SDL3 documentation:
--
-- "A property is a variable that can be created and retrieved by name at
-- runtime."
--
-- Properties are put into groups, which are identified
-- by integer IDS. They can be used as hashes:
-- created, cleared, inserted, and destroyed.
--
-- TODO: compare to Ada's existing hash tables.

package SDL3.Properties is
   type ID is mod 2**32 with Convention => C;
   type Property_Type is (Invalid, Pointer, String, Number, Float);

   procedure Get_Global_Properties
   with
     Import        => True,
     Convention    => C,
     External_Name => "SDL_GetGlobalProperties";

   -- TODO: maybe abstract this away?
   function Create return ID
   with
     Import        => True,
     Convention    => C,
     External_Name => "SDL_CreateProperties";

   function Copy (source : in out ID; dst : in out ID) return Boolean;

   -- TODO: determine if this is compatible with
   -- Ada's tasks!
   function Lock (props : in out ID) return Boolean;

   procedure Unlock (props : in out ID);
end;
