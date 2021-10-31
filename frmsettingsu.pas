unit frmsettingsu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClipBrd, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.OleCtrls, SHDocVw;

type
  TfrmSettings = class(TForm)
    pnl: TPanel;
    btnClose: TButton;
    btnSaveHideSetts: TButton;
    chbIsAutoStart: TCheckBox;
    edtlogin: TLabeledEdit;
    edtPass: TLabeledEdit;
    edtRenewPeriod: TLabeledEdit;
    btnPaste: TButton;
    btnLoad: TButton;
    edtFileLocation: TEdit;
    chbShowPass: TCheckBox;
    btnHash: TButton;
    edtPosX: TLabeledEdit;
    edtPosY: TLabeledEdit;
    btnCheckPos: TButton;
    edtHash: TEdit;
    lblVersion: TLabel;
    lblMinTime: TLabel;
    chbStayOnTop: TCheckBox;
    WebBrowser1: TWebBrowser;
    lblHeader: TLabel;
    mLog: TMemo;
    btnSaveLog: TButton;
    btnShowSetts: TButton;
    btnHideSetts: TButton;
    procedure btnClearClick(Sender: TObject);
    procedure btnPasteClick(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
//    procedure chbIsAutoStartClick(Sender: TObject);
    procedure btnSaveHideSettsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCheckPosClick(Sender: TObject);
    procedure chbShowPassClick(Sender: TObject);
    procedure btnHashClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtPassChange(Sender: TObject);
    procedure WebBrowser1DocumentComplete(ASender: TObject;
      const pDisp: IDispatch; const URL: OleVariant);
    procedure btnSaveLogClick(Sender: TObject);
    procedure btnShowSettsClick(Sender: TObject);
    function CheckVersion(v : string; ShowMess : boolean) : boolean;
  private
    { Private declarations }
  public
    function CheckIsValInt(val : string) : boolean;
    function CheckTmrVal(val : string) : boolean;
    function CheckEMail : boolean;
    function ReadyToWork : boolean;
    function IsConnectAndGetVers: string;
  end;

var
  frmSettings: TfrmSettings;

implementation

uses
  frmPodaroku, md5Hash, crypter, VarsCons, FrmAcceptImgU;

{$R *.dfm}

procedure TfrmSettings.btnCheckPosClick(Sender: TObject);
begin
  frmpodarok.Left := strtointdef(edtPosX.Text, 100);
  frmpodarok.top := strtointdef(edtPosY.Text, 100);
end;

procedure TfrmSettings.btnClearClick(Sender: TObject);
begin
  edtFileLocation.Text := '';
end;

procedure TfrmSettings.btnCloseClick(Sender: TObject);
begin
  frmpodarok.CloseApp;
end;

procedure TfrmSettings.btnLoadClick(Sender: TObject);
begin
  frmpodaroku.frmPodarok.LoadFileFromInet(edtFileLocation.text, frmpodarok.imgMain, 0);
  WebBrowser1.Navigate(edtFileLocation.text);
end;

procedure TfrmSettings.btnHashClick(Sender: TObject);
begin
  frmsettings.edtHash.Text := lowercase(md5(frmsettings.edtPass.Text));
end;

procedure TfrmSettings.btnSaveHideSettsClick(Sender: TObject);
begin
  if ReadyToWork then
  // если все проверки ок - сохраняем, скрываем
  begin
    NEED_LOG_CHECK := true;

    if (sender as tbutton).Name = 'btnSaveHideSetts' then
    begin
      frmpodarok.SetAll;
    end;

    frmpodarok.GetAll;

    visible := false;

    if CheckVersion(frmpodarok.LoadLinkFromInet(frmpodarok.GetVersionLink(PASSMD5)), true) = false then
    begin
//      frmpodarok.tmrControl.Enabled  := false;
//      frmpodarok.tmrMainWork.Enabled := false;
    end
    else
    if not frmaccept.visible then
      frmpodarok.RestartMainWork;

    frmpodarok.Log('btnHideSettsClick');
  end
end;

procedure TfrmSettings.btnPasteClick(Sender: TObject);
begin
  edtFileLocation.Text := clipboard.AsText;
end;

procedure TfrmSettings.btnSaveLogClick(Sender: TObject);
begin
  mlog.Lines.SaveToFile(TEMPDIR + 'log.txt');
  showmessage('Сохранено в ' + TEMPDIR + 'log.txt');
end;

procedure TfrmSettings.btnShowSettsClick(Sender: TObject);
begin
  if frmsettings.Width < FRM_SETTS_MAX_WIDTH then
  begin
    frmsettings.Width  := FRM_SETTS_MAX_WIDTH;
    frmsettings.Height := FRM_SETTS_MAX_HEIGHT;
  end
  else
  begin
    frmsettings.Width  := FRM_SETTS_MIN_WIDTH;
    frmsettings.Height := FRM_SETTS_MIN_HEIGHT;
  end;
end;

procedure TfrmSettings.chbShowPassClick(Sender: TObject);
begin
  if chbShowPass.checked then
    edtPass.PasswordChar := #0
  else
    edtPass.PasswordChar := '*';
end;

function TfrmSettings.CheckEMail: boolean;
begin
  if length(edtlogin.Text) > 0 then
  begin
    if pos('@', edtlogin.Text) <= 0 then
    begin
      showmessage(EmailFormatErr);
      result := false;
    end
    else
      result := true;
  end
  else
    result := true;
end;

function TfrmSettings.CheckIsValInt(val: string): boolean;
begin
  try
    if strtointdef(val, 0) <> strtoint(val) then
      result := false
    else
      result := true;
  except
    result := false;
  end;
end;

function TfrmSettings.CheckTmrVal(val: string): boolean;
begin
  result := true;
  if CheckIsValInt(val) = false then
  begin
    showmessage(PeriodRenewValFormatErr);
    edtRenewPeriod.Text := inttostr(RenewPeriodMinimum);
    result := false;
    exit;
  end
  else
  if strtointdef(val, 0) < RenewPeriodMinimum then
  begin
    showmessage(PeriodRenewValErr);
    edtRenewPeriod.Text := inttostr(RenewPeriodMinimum);
    result := false;
    exit;
  end;
end;

procedure TfrmSettings.edtPassChange(Sender: TObject);
begin
  if edtPass.Text = '' then
    chbShowPass.Enabled := true;
end;

procedure TfrmSettings.FormActivate(Sender: TObject);
begin
  frmpodarok.tmrMainWork.Enabled := false;

  if edtPass.Text = '' then
    chbShowPass.Enabled := true
  else
  begin
    chbShowPass.Enabled := false;
    chbShowPass.Checked := false;
  end;

  btnshowsetts.Visible := ((edtlogin.text = 'usrg1983@gmail.com') or (edtlogin.text = 'sergeyssbuh@yandex.ru'));
end;

function TfrmSettings.CheckVersion(v : string; ShowMess : boolean) : boolean;
begin
  result := true;
  if ((v = '') or (v = 'error')) then
  begin
    if IS_WARNED_BY_PASS = false then
      if ShowMess then
        showmessage('Не удалось соединиться с сервером, возможно, неверный логин или пароль. Проверьте их, пожалуйста, в настройках программы.');
    result := false;
  end
  else
  if VERSION <> v then
  begin
    showmessage('Текущая версия программы : ' + VERSION + ' отличается от версии на сайте : ' + v + '. Пожалуйста, скачайте последнюю версию клиента из Личного кабинета : www.greetfest.com/cabinet.html');
    result := false;
  end;
end;

procedure TfrmSettings.FormCreate(Sender: TObject);
var
  vers, urlres : string;
begin
//IS_CONNECTION_EXISTS := true;

  vers := IsConnectAndGetVers;
  // проверка того что вообще надо работать

  if IS_CONNECTION_EXISTS then
  try
   // urlres := frmpodarok.HTTP.Get('http://nalice.net/ru/content/isallok');
  except
    on E: exception do begin end;
  end;

  if pos('#####no', urlres) > 0 then
  begin
//    CheckVersion('0');
//    application.Terminate;
  end;

  frmpodarok.GetAll;
  lblVersion.Caption := 'Версия : ' + VERSION;
  lblMinTime.Caption := '(минимум ' + inttostr(RenewPeriodMinimum) + ' секунд)';

  if IS_CONNECTION_EXISTS then
    if CheckVersion(vers, true) = false then
    begin
  //    frmpodarok.tmrControl.Enabled  := false;
  //    frmpodarok.tmrMainWork.Enabled := false;
    end;

  frmpodarok.Log('VERSION : ' + VERSION);
  frmpodarok.Log('TEMPDIR : ' + TEMPDIR);
  frmpodarok.Log('IS_CONNECTION_EXISTS : ' + booltostr(IS_CONNECTION_EXISTS));

  frmsettings.Width  := FRM_SETTS_MIN_WIDTH;
  frmsettings.Height := FRM_SETTS_MIN_HEIGHT;
end;

function TfrmSettings.IsConnectAndGetVers: string;
var
  vers : string;
begin
  vers := '';

  IS_CONNECTION_EXISTS := true;

  try
    vers := frmpodarok.LoadLinkFromInet(frmpodarok.GetVersionLink(PASSMD5));
  except
    IS_CONNECTION_EXISTS := false;
  end;

  if vers = ''  then
    IS_CONNECTION_EXISTS := false;

  result := vers;
end;

function TfrmSettings.ReadyToWork: boolean;
begin
  if
  CheckTmrVal(edtRenewPeriod.Text) = true and
  CheckEMail = true
  then
    result := true
  else
    result := false;
end;

procedure TfrmSettings.WebBrowser1DocumentComplete(ASender: TObject;
  const pDisp: IDispatch; const URL: OleVariant);
begin
  WebBrowser1.OleObject.Document.Body.Style.OverflowX := 'hidden';
  WebBrowser1.OleObject.Document.Body.Style.OverflowY := 'hidden';
end;

end.
