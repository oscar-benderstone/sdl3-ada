-- SPDX-FileCopyrightText: Copyright contributors to the sdlada project. --
-- SPDX-License-Identifier: Zlib --
--
-- Modified from: --
-- the sdlada project --
-- <https://github.com/ada-game-framework/sdlada>, --
-- licensed under the Zlib license. --
--

with Interfaces.C.Strings;
with SDL3.Error;

package body SDL3.Video is

   function Is_Screen_Saver_Enabled return Boolean is
      function SDL_Is_Screen_Saver_Enabled return Interfaces.C.int
      with
        Import        => True,
        Convention    => C,
        External_Name => "SDL_IsScreenSaverEnabled";
   begin
      return (if SDL_Is_Screen_Saver_Enabled = 1 then True else False);
   end Is_Screen_Saver_Enabled;
   --
   -- function Total_Drivers return Positive is
   --    function SDL_Get_Num_Video_Drivers return C.int
   --    with
   --      Import        => True,
   --      Convention    => C,
   --      External_Name => "SDL_GetNumVideoDrivers";
   --
   --    Num : constant C.int := SDL_Get_Num_Video_Drivers;
   -- begin
   --    if Num < 0 then
   --       raise Video_Error with SDL.Error.Get;
   --    end if;
   --
   --    return Positive (Num);
   -- end Total_Drivers;
   --
   -- function Driver_Name (Index : in Positive) return String is
   --    function SDL_Get_Video_Driver (I : in C.int) return C.Strings.chars_ptr
   --    with
   --      Import        => True,
   --      Convention    => C,
   --      External_Name => "SDL_GetVideoDriver";
   --
   --    --  Index is zero based, so need to subtract 1 to correct it.
   --    C_Str : constant C.Strings.chars_ptr :=
   --      SDL_Get_Video_Driver (C.int (Index) - 1);
   -- begin
   --    return C.Strings.Value (C_Str);
   -- end Driver_Name;
   --
   -- function Current_Driver_Name return String is
   --    function SDL_Get_Current_Video_Driver return C.Strings.chars_ptr
   --    with
   --      Import        => True,
   --      Convention    => C,
   --      External_Name => "SDL_GetCurrentVideoDriver";
   --
   --    C_Str : constant C.Strings.chars_ptr := SDL_Get_Current_Video_Driver;
   --
   --    use type C.Strings.chars_ptr;
   -- begin
   --    if C_Str = C.Strings.Null_Ptr then
   --       raise Video_Error with SDL.Error.Get;
   --    end if;
   --
   --    return C.Strings.Value (C_Str);
   -- end Current_Driver_Name;
end SDL3.Video;
