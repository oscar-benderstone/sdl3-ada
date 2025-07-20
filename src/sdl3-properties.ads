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
   type Properties_ID is mod 2**32 with Convention => C;
   type Property_Type is (Invalid, Pointer, String, Number, Float);
end;
