-- SPDX-FileCopyrightText: 2025 Copyright Oscar Bender-Stone <oscar-benderstone@gmail.com>
-- SPDX-License-Identifier: Zlib

with Interfaces.C.Strings;
with Interfaces.C.Pointers;

package body SDL3.Locales is
   package C renames Interfaces.C;

   function Get_System_Locales return Locales_Container is
      -- Internal C representation used by SDL
      type C_Locale is record
         Language : C.Strings.chars_ptr;
         Country  : C.Strings.chars_ptr;
      end record
      with Convention => C;

      type C_Locale_Access is access all C_Locale;
      type C_Locale_Double_Access is access all C_Locale_Access;

      type C_Locale_array is array (C.size_t range <>) of aliased C_Locale;

      Null_Locale : C_Locale := (others => C.Strings.Null_Ptr);

      package C_Locale_ptrs is new
        C.Pointers
          (Index              => C.size_t,
           Element            => C_Locale,
           Element_Array      => C_Locale_array,
           Default_Terminator => Null_Locale);

      type int_array is array (C.size_t range <>) of aliased C.int;

      package C_Int_Ptrs is new
        C.Pointers
          (Index              => C.size_t,
           Element            => C.int,
           Element_Array      => int_array,
           Default_Terminator => 0);

      type C_int_ptr is new C_Int_Ptrs.Pointer;

      function Get_Preferred_Locales
        (count : in out C_int_ptr) return C_Locale_Double_Access
      with
        Import        => True,
        Convention    => C,
        External_Name => "SDL_GetPreferredLocales";

      Preferred_Locales       : C_Locale_Double_Access := null;
      Preferred_Locales_Count : C_int_ptr := null;
   begin
      Preferred_Locales := Get_Preferred_Locales (Preferred_Locales_Count);

      if Preferred_Locales = null then
         return System_Locales;
      end if;

      -- System_Locales.Append (Preferred_Locales.all);

      return System_Locales;
   end;
end SDL3.Locales;
