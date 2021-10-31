program GreetfestApp;

uses
  Vcl.Forms,
  frmpodaroku in 'frmpodaroku.pas' {frmPodarok},
  frmsettingsu in 'frmsettingsu.pas' {frmSettings},
  md5Hash in 'md5Hash.pas',
  crypter in 'crypter.pas',
  VarsCons in 'VarsCons.pas',
  FrmAcceptImgU in 'FrmAcceptImgU.pas' {FrmAccept};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := False;
  Application.Title := 'Greetfest.com';
  Application.CreateForm(TfrmPodarok, frmPodarok);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.CreateForm(TFrmAccept, FrmAccept);
  Application.Run;
end.
