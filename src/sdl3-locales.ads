-- SPDX-FileCopyrightText: 2025 Copyright Oscar Bender-Stone <oscar-benderstone@gmail.com>
-- SPDX-License-Identifier: Zlib

--------------------------------------------------------------------------------------------------------------------
--  SDL.Locale
-- Manages locale information.
-- If available, can access locales from the system.
--------------------------------------------------------------------------------------------------------------------

with Ada.Containers.Vectors;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package SDL3.Locales is
   type Locale is record
      Language : Unbounded_String;
      Country  : Unbounded_String;
   end record
   with Convention => C;

   package Locale_Vectors is new
     Ada.Containers.Vectors (Index_Type => Natural, Element_Type => Locale);

   subtype Locales_Container is Locale_Vectors.Vector;

   -- NOTE: to be safe with SDL internals
   -- (that heavily use null terminating arrays),
   -- this function currently returns one entry
   -- (if it exists).
   function Get_System_Locales return Locales_Container;
private
   System_Locales : Locales_Container;
end SDL3.Locales;
