-- SPDX-FileCopyrightText: 2025 Copyright Oscar Bender-Stone <oscar-benderstone@gmail.com>
-- SPDX-License-Identifier: Zlib
--
-- Modified from:
-- the sdlada project
-- <https://github.com/ada-game-framework/sdlada>,
-- licensed under the Zlib license.
with Interfaces.C;
with Interfaces.C.Strings;

package body SDL3.Error is
   package C renames Interfaces.C;

   procedure Set (S : in String) is
      procedure SDL_Set_Error (Fmt_Str, C_Str : in C.char_array)
      with
        Import        => True,
        Convention    => C_Variadic_1,
        External_Name => "SDL_SetError";
   begin
      SDL_Set_Error (C.To_C ("%s"), C.To_C (S));
   end Set;

   function Get return String is
      function SDL_Get_Error return C.Strings.chars_ptr
      with Import => True, Convention => C, External_Name => "SDL_GetError";
   begin
      return C.Strings.Value (SDL_Get_Error);
   end Get;
end SDL3.Error;
