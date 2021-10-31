program Greetfest;

uses
  Vcl.Forms,
  Windows,
  SysUtils,
  frmpodaroku in 'frmpodaroku.pas' {frmPodarok},
  frmsettingsu in 'frmsettingsu.pas' {frmSettings},
  md5Hash in 'md5Hash.pas',
  crypter in 'crypter.pas',
  VarsCons in 'VarsCons.pas',
  FrmAcceptImgU in 'FrmAcceptImgU.pas' {FrmAccept};

{$R *.res}

var
  hMutex: THandle;
  CreateMutexResult: Boolean;
begin
  hMutex := CreateMutex(nil, False, PChar(ExtractFileName(Application.ExeName)));
  try
    CreateMutexResult :=
      (GetLastError = ERROR_ALREADY_EXISTS) //ћьютекс уже существует
       or
      (hMutex = 0);

    if CreateMutexResult then
      Exit;

    Application.Initialize;
    Application.MainFormOnTaskbar := False;
    Application.Title := 'Greetfest.com';

    Application.CreateForm(TfrmPodarok, frmPodarok);
  Application.CreateForm(TFrmAccept, FrmAccept);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.Run;
  finally
    if hMutex <> 0 then
    begin
      ReleaseMutex(hMutex);
      CloseHandle(hMutex);
    end;
  end;
end.
