-- SPDX-FileCopyrightText: 2025 Copyright Oscar Bender-Stone <oscar-benderstone@gmail.com>
-- SPDX-License-Identifier: Zlib

--------------------------------------------------------------------------------------------------------------------
--  SDL.Locale
--
--  Get the list of preferred locales for the user.
--------------------------------------------------------------------------------------------------------------------

with Interfaces.C.Strings;

package SDL3.Locale is
   type Locale is record
      Language : C.Strings.chars_ptr;
      Country  : C.Strings.chars_ptr;
   end record
   with Convention => C;

   type Locale_Access is access all Locale;
   type Locale_Double_Access is access all Locale_Access;

   type C_int_pointer is access all C.int;

   -- TODO: add a wrapper here? --

   function Get_Preferred_Locales
     (count : in out C_int_pointer) return Locale_Double_Access
   with
     Import        => True,
     Convention    => C,
     External_Name => "SDL_GetPreferredLocales";
end;
