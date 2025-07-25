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

   type Point is record
      X : Coordinate;
      Y : Coordinate;
   end record;

   Zero_Point : constant Point := (others => Centre_Coordinate);

   subtype Dimension is Positive;

   type Size is record
      Width  : Dimension;
      Height : Dimension;
   end record;

   function "*" (Operand : Size; Scale : Dimension) return Size
   is (Size'
         (Width => Operand.Width * Scale, Height => Operand.Height * Scale));

   function "/" (Operand : Size; Scale : Dimension) return Size
   is (Size'
         (Width => Operand.Width / Scale, Height => Operand.Height / Scale));

   type Line_Segment is record
      Start  : Point;
      Finish : Point;
   end record;

   type Rectangle is record
      Position   : Point;
      Dimensions : Size;
   end record;

   -- TODO: clarify coordinate system --

   function Left (R : Rectangle) return Coordinate
   is (R.Position.X)
   with Inline;

   function Right (R : Rectangle) return Coordinate
   is (R.Position.X + Coordinate (R.Dimensions.Width))
   with Inline;

   function Top (R : Rectangle) return Coordinate
   is (R.Position.Y)
   with Inline;

   function Bottom (R : Rectangle) return Coordinate
   is (R.Position.Y + Coordinate (R.Dimensions.Height))
   with Inline;

   --  SDL_PointInRect.
   function Inside (P : Point; R : Rectangle) return Boolean
   is (P.X >= Left (R)
       and then P.X <= Right (R)
       and then P.Y >= Top (R)
       and then P.Y <= Bottom (R));

   -- TODO: replace empty rects with an optional type
   -- --  SDL_RectEmpty.
   -- function Is_Empty (R : Rectangle) return Boolean
   -- is (R.Width = SDL.Natural_Dimension'First
   -- or  -- First = 0, so can never be < 0.
   -- R.Height = SDL.Natural_Dimension'First);

   --  SDL_RectEquals, not required, = is implicitly defined.

   function Intersects (A, B : Rectangle) return Boolean
   is (Left (A) <= Right (B)
       and then Right (A) >= Left (A)
       and then Top (A) >= Bottom (B)
       and then Bottom (A) <= Top (B));
end SDL3.Rectangle;
