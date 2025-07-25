-- SPDX-FileCopyrightText: 2025 Copyright Oscar Bender-Stone <oscar-benderstone@gmail.com>
-- SPDX-License-Identifier: Zlib

with SDL3;
with SDL3.Log;
with SDL3.Locales;

procedure Tests is
   Status     : Boolean;
   My_Locales : SDL3.Locales.Locales_Container;
begin
   Status := SDL3.Initialise (SDL3.Enable_Video);
   if not Status then
      return;
   end if;

   My_Locales := SDL3.Locales.Get_System_Locales;

   SDL3.Log.Put ("Hello, SDL3_Ada!");
   SDL3.Log.Put ("System locales: " & My_Locales'Image);
   SDL3.Quit;
end Tests;
