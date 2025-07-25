-- SPDX-FileCopyrightText: Copyright contributors to the sdlada project.
-- SPDX-License-Identifier: Zlib
--
-- Modified from:
-- the sdlada project
-- <https://github.com/ada-game-framework/sdlada>,
-- licensed under the Zlib license.

--------------------------------------------------------------------------------------------------------------------
--  SDL.Log
--
--  Message logging.
--------------------------------------------------------------------------------------------------------------------

package SDL3.Log is
   pragma Preelaborate;
   -- NOTE: this is an optional requirement.
   -- Message lengths can be unlimited
   -- in SDL3.
   Max_Length : constant Integer := 4096;

   type Categories is
     (Application,
      Error,
      Assert,
      System,
      Audio,
      Video,
      Render,
      Input,
      Test,
      GPU,
      Reserved2,
      Reserved3,
      Reserved4,
      Reserved5,
      Reserved6,
      Reserved7,
      Reserved8,
      Reserved9,
      Reserved10,
      Custom);

   -- subtype Reserved_Categories is
   --   Categories range Categories'Pos (GPU) .. Categories'Pos (Reserved10);

   -- --  Reserved categories.
   -- Reserved_First : constant Categories := 9;
   -- Reserved_Last  : constant Categories := 18;
   --
   -- --  Custom categories.
   -- Custom_Category : constant Categories := 19;
   --
   -- subtype Custom_Categories is
   --   Categories range Custom_Category .. Categories'Last;
   --
   type Priorities is (Verbose, Debug, Info, Warn, Error, Critical)
   with Convention => C;

   for Priorities use
     (Verbose  => 1,
      Debug    => 2,
      Info     => 3,
      Warn     => 4,
      Error    => 5,
      Critical => 6);

   --  Log a message with Category: Application and Priority: Info.
   procedure Put (Message : in String)
   with Inline => True;

   procedure Put
     (Message : in String; Category : in Categories; Priority : in Priorities)
   with Inline => True;

   --  Log a message with Priority: Critical.
   procedure Put_Critical
     (Message : in String; Category : in Categories := Application)
   with Inline => True;

   --  Log a message with Priority: Debug.
   procedure Put_Debug
     (Message : in String; Category : in Categories := Application)
   with Inline => True;

   --  Log a message with Priority: Error.
   procedure Put_Error
     (Message : in String; Category : in Categories := Application)
   with Inline => True;

   --  Log a message with Priority: Info.
   procedure Put_Info
     (Message : in String; Category : in Categories := Application)
   with Inline => True;

   --  Log a message with Priority: Verbose.
   procedure Put_Verbose
     (Message : in String; Category : in Categories := Application)
   with Inline => True;

   --  Log a message with Priority: Warn.
   procedure Put_Warn
     (Message : in String; Category : in Categories := Application)
   with Inline => True;

   --
   procedure Reset_Priorities
   with
     Import        => True,
     Convention    => C,
     External_Name => "SDL_ResetLogPriorities";

   --  Set the priority of all the log categories to the given Priority.
   procedure Set_Priorities (Priority : in Priorities)
   with
     Import        => True,
     Convention    => C,
     External_Name => "SDL_SetLogPriorities";

   --  Set the the given log Category to the given Priority.
   procedure Set_Priority (Category : in Categories; Priority : in Priorities)
   with Import => True, Convention => C, External_Name => "SDL_LogSetPriority";

   procedure Set (Category : in Categories; Priority : in Priorities)
   renames Set_Priority;  --  Deprecated

   --  Logging callbacks.
   --  TODO: complete this.
   --  I think this will require a bit more work. I think we will have to allocate a record
   --  and store this in a container which gets destroyed on application shutdown before SDL quits.
   type Root_User_Data is tagged null record;

   type Output_Callback is
     access procedure
       (User_Data : in Root_User_Data'Class;
        Category  : in Categories;
        Priority  : in Priorities;
        Message   : in String);
end SDL3.Log;
