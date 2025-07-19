with SDL3;

procedure Tests is
   status : Boolean;
begin
   status := SDL3.Initialise (16#0000_0020#);
   if not status then
      return;
   end if;
   SDL3.Quit;
end Tests;
