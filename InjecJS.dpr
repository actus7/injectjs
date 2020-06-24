program InjecJS;

uses
  {$IFDEF DELPHI16_UP}
  WinApi.Windows,
  {$ELSE}
  Forms,
  Windows,
  {$ENDIF }
  uCEFApplication,
  uMiniBrowser in 'uMiniBrowser.pas' {MiniBrowserFrm},
  uPreferences in 'uPreferences.pas' {PreferencesFrm},
  uSimpleTextViewer in 'uSimpleTextViewer.pas' {SimpleTextViewerFrm},
  uFindFrm in 'uFindFrm.pas' {FindFrm},
  uTestExtension in 'uTestExtension.pas';

{$R *.res}

begin
  CreateGlobalCEFApp;

  if GlobalCEFApp.StartMainProcess then
  begin
    ReportMemoryLeaksOnShutdown := DebugHook <> 0;
    Application.Initialize;
{$IFDEF DELPHI11_UP}
    Application.MainFormOnTaskbar := True;
{$ENDIF}
    Application.CreateForm(TMiniBrowserFrm, MiniBrowserFrm);
  Application.CreateForm(TPreferencesFrm, PreferencesFrm);
  Application.CreateForm(TSimpleTextViewerFrm, SimpleTextViewerFrm);
  Application.CreateForm(TFindFrm, FindFrm);
  Application.Run;
  end;

  DestroyGlobalCEFApp;

end.
