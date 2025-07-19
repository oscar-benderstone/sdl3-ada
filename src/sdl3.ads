-- SPDX-FileCopyrightText: Copyright contributors to the sdlada project.
-- SPDX-License-Identifier: Zlib
--
-- Modified from: the sdlada project <https://github.com/ada-game-framework/sdlada>,
-- licensed under the Zlib license.
--
--------------------------------------------------------------------------------------------------------------------
--  SDL3
--
--  Ada bindings to the SDL 3.x.y library.
--------------------------------------------------------------------------------------------------------------------
with Interfaces.C;
-- with SDL3_Linker;

package SDL3 is
   pragma Pure;
   -- pragma Linker_Options (SDL_Linker.Options);

   package C renames Interfaces.C;

   use type C.int;

   type Init_Flags is mod 2**32 with Convention => C;

   Null_Init_Flags        : constant Init_Flags := 16#0000_0000#;
   Enable_Timer           : constant Init_Flags := 16#0000_0001#;
   Enable_Audio           : constant Init_Flags := 16#0000_0010#;
   Enable_Video           : constant Init_Flags := 16#0000_0020#;
   Enable_Joystick        : constant Init_Flags := 16#0000_0200#;
   Enable_Haptic          : constant Init_Flags := 16#0000_1000#;
   Enable_Game_Controller : constant Init_Flags := 16#0000_2000#;
   Enable_Events          : constant Init_Flags := 16#0000_4000#;
   Enable_Sensors         : constant Init_Flags := 16#0000_8000#;
   -- WARNING: SDL_INIT_EVERYTHING was deprecated in SDL3.
   -- The recommended use it to manually add Init_Flags.

   --  Coordinates are for positioning things.
   subtype Coordinate is C.int;
   subtype Natural_Coordinate is Coordinate range 0 .. Coordinate'Last;
   subtype Positive_Coordinate is Coordinate range 1 .. Coordinate'Last;

   Centre_Coordinate : constant Coordinate := 0;

   type Coordinates is record
      X : SDL3.Coordinate;
      Y : SDL3.Coordinate;
   end record
   with Convention => C;

   Zero_Coordinate : constant Coordinates := (others => 0);

   subtype Natural_Coordinates is Coordinates
   with
     Dynamic_Predicate =>
       Natural_Coordinates.X >= Natural_Coordinate'First
       and Natural_Coordinates.Y >= Natural_Coordinate'First;

   subtype Positive_Coordinates is Coordinates
   with
     Dynamic_Predicate =>
       Positive_Coordinates.X >= Positive_Coordinate'First
       and Positive_Coordinates.Y >= Positive_Coordinate'First;

   --  Dimensions are for sizing things.
   subtype Dimension is C.int;
   subtype Natural_Dimension is Dimension range 0 .. Dimension'Last;
   subtype Positive_Dimension is Dimension range 1 .. Dimension'Last;

   type Sizes is record
      Width  : Dimension;
      Height : Dimension;
   end record
   with Convention => C;

   Zero_Size : constant Sizes := (others => Natural_Dimension'First);

   subtype Natural_Sizes is Sizes
   with
     Dynamic_Predicate =>
       Natural_Sizes.Width >= 0 and Natural_Sizes.Height >= 0;

   subtype Positive_Sizes is Sizes
   with
     Dynamic_Predicate =>
       Positive_Sizes.Width >= 1 and Positive_Sizes.Height >= 1;

   function "*" (Left : in Sizes; Scale : in Positive_Dimension) return Sizes
   is (Sizes'(Width => Left.Width * Scale, Height => Left.Height * Scale));

   function "/" (Left : in Sizes; Scale : in Positive_Dimension) return Sizes
   is (Sizes'(Width => Left.Width / Scale, Height => Left.Height / Scale));

   function Initialise_Sub_System (Flags : Init_Flags) return Boolean
   with Inline;

   function Initialise (Flags : Init_Flags) return Boolean
   renames Initialise_Sub_System;

   procedure Quit_Sub_System (Flags : Init_Flags)
   with Import => True, Convention => C, External_Name => "SDL_QuitSubSystem";

   procedure Quit
   with Import => True, Convention => C, External_Name => "SDL_Quit";

   --  Get which sub-systems were initialised.
   function Get_Initialised return Init_Flags
   with Inline;

   --  Check whether a set of sub-systems were initialised.
   function Was_Initialised (Flags : Init_Flags) return Boolean
   with Inline;

private
   --  If any SDL2 function returns 0 for success, use this constant for readability.
   Success : constant Interfaces.C.int := 0;

   --  The next value is used in mapping the Ada types onto the C types, it is the word size used for all data
   --  in SDL, i.e. all data is 4 byte aligned so it works with 32-bit architectures.
   Word : constant := 4;

   --  These constants are internal to the events system.
   SDL_Query   : constant C.int := -1;
   SDL_Ignore  : constant C.int := 0;
   SDL_Disable : constant C.int := 0;
   SDL_Enable  : constant C.int := 1;
end SDL3;
