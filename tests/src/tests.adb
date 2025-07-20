with SDL3;
with SDL3.Log;
with SDL3.Locale;
with Interfaces.C.Strings; use Interfaces.C.Strings;

procedure Tests is
   Status        : Boolean;
   Locales_Count : SDL3.Locale.C_int_pointer;
   Locales       : SDL3.Locale.Locale_Double_Access;
begin
   Status := SDL3.Initialise (SDL3.Enable_Video);
   if not Status then
      return;
   end if;

   Locales := SDL3.Locale.Get_Preferred_Locales (Locales_Count);

   SDL3.Log.Put ("Hello, SDL3_Ada!");
   SDL3.Log.Put ("Your language is: " & Value (Locales.all.all.language));
   SDL3.Quit;
end Tests;
