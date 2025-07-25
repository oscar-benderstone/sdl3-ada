-- SPDX-FileCopyrightText: Copyright contributors to the sdlada project. --
-- SPDX-License-Identifier: Zlib --
--
-- Modified from: --
-- the sdlada project --
-- <https://github.com/ada-game-framework/sdlada>, --
-- licensed under the Zlib license. --
--
------------------------------------------------------------------------------
--  SDL.Rectangles --
--
--  Rectangle bounding areas. --
--
--  This uses Ada native types *instead* of SDL3, --
--  and conversions to SDL functions in other modules --
--  are made as needed. --
------------------------------------------------------------------------------

generic
   type Coordinate is range <>;
package SDL3.Rectangle is
   package C renames Interfaces.C;

   Centre_Coordinate : constant Coordinate := 0;

   type Position is record
      X : Coordinate;
      Y : Coordinate;
   end record;

   Zero_Position : constant Position := (others => Centre_Coordinate);

   subtype Dimension is Natural;

   type Size is record
      Width  : Dimension;
      Height : Dimension;
   end record;

   Zero_Size : constant Size := (others => 0);

   function "*" (Left : in Size; Scale : in Dimension) return Size
   is (Size'(Width => Left.Width * Scale, Height => Left.Height * Scale));

   function "/" (Left : in Size; Scale : in Dimension) return Size
   is (Size'(Width => Left.Width / Scale, Height => Left.Height / Scale));
end SDL3.Rectangle;
