unit uTestExtension;

{$I cef.inc}

interface

uses
  {$IFDEF DELPHI16_UP}
  Winapi.Windows,
  {$ELSE}
  Windows,
  {$ENDIF}
  uCEFInterfaces, uCEFProcessMessage, uCEFv8Context, uCEFTypes;

type
  TTestExtension = class
    class procedure whatsfunction(const pfunc, pretorno: string);
  end;

implementation

uses
  uMiniBrowser;

class procedure TTestExtension.whatsfunction(const pfunc, pretorno: string);
var
  TempMessage : ICefProcessMessage;
  TempFrame   : ICefFrame;
begin
  try
    TempMessage := TCefProcessMessageRef.New(pfunc);
    TempMessage.ArgumentList.SetString(0, pretorno);

    TempFrame := TCefv8ContextRef.Current.Browser.MainFrame;

    if (TempFrame <> nil) and TempFrame.IsValid then
      TempFrame.SendProcessMessage(PID_BROWSER, TempMessage);
  finally
    TempMessage := nil;
  end;
end;

end.
