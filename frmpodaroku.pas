unit frmpodaroku;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ClipBrd, Vcl.Imaging.GIFImg, Registry,
  Vcl.Menus, inifiles, Vcl.OleCtrls, SHDocVw, IdEcho, IdRawBase, IdRawClient,
  IdIcmpClient;

type
  TfrmPodarok = class(TForm)
    imgMain: TImage;
    HTTP: TIdHTTP;
    TrayIcon: TTrayIcon;
    TrayMenu: TPopupMenu;
    mnSettings: TMenuItem;
    mnCloseApp: TMenuItem;
    tmrMainWork: TTimer;
    tmrControl: TTimer;
    mnActImg: TPopupMenu;
    mnRefuseImg: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure imgMainDblClick(Sender: TObject);
    procedure TrayIconClick(Sender: TObject);
    procedure mnCloseAppClick(Sender: TObject);
    procedure mnSettingsClick(Sender: TObject);
    procedure tmrControlTimer(Sender: TObject);
    procedure tmrMainWorkTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure mnRefuseImgClick(Sender: TObject);
  private

  public
    function LoadFileFromInet(source : string; var ImgComponent : TImage; key : integer) : string;
    function LoadFileIntoImg(fname: string; var img : timage): string;
    function LoadLinkFromInet(source: string): string;
    function GetKeysAcceptedImg() : string;
    function GetKeysNewImg(): string;
    function GetKeysAcceptedImgLink(): string;
    function GetKeysNewImgLink(): string;
    function GetLinkForImgNumb(ind : integer): string;
    function GetCntKeys(strkeys : string): integer;
    function GetSenderForImgNumb(ind : integer): string;
    function GetVersionLink(passmd5_ : string): string;
    function SetAcceptImgLink(): string;
    function SetRefuseImgLink(): string;
    function DCOUNT(str, Delimeter: string) : integer;
    function StrBreak(str, Delimeter: string; fromParts, Cnt : integer) : string;
    procedure HideOrShowApp;
    procedure HideOrShowSett;
    procedure CloseApp;
    function ReadValue(reg_val, dflt_val : string): string;
    function SaveValue(reg_val, dflt_val : string): string;
    procedure GetAll;
    procedure GetAutorun;
    procedure GetLogin;
    procedure GetPass;
    procedure GetPeriod;
    procedure GetStayOnTop;
    procedure SetAll;
    procedure SetAutorun;
    procedure SetLogin;
    procedure SetPass;
    procedure SetPeriod;
    procedure SetVersion;
    procedure SetStayOnTop;
    function SaveAutostart(reg_key : string): boolean;
    function RemoveAutostart(reg_key : string): boolean;
    function IsLogPass(): boolean;
    procedure Split(Delimiter: Char; Str: string; ListOfStrings: TStrings) ;
    procedure DeleteUnused(var list : tstringlist);
    procedure MakeMainWork;
    procedure RestartMainWork;
    procedure Log(str : string);
    function GetFileName(key: string): string;
    function GetGreetfestLocalStoredFiles():string;
  end;

var
  frmPodarok: TfrmPodarok;

implementation

{$R *.dfm}

uses frmsettingsu, md5Hash, crypter, VarsCons, FrmAcceptImgU;

procedure TfrmPodarok.tmrControlTimer(Sender: TObject);
begin
{
  while cntcheck < 10 do
  begin
    if frmsettings <> nil then
    begin

      break;
    end;

    inc(cntcheck);
  end;

  if cntcheck >= CNT_CHECKS - 1 //CNT_CHECKS = 10, IF cntcheck >= 9, т.е. inc проходил 9 раз, т.е. 9 секунд
  then
  begin
//    showmessage(APP_PROBLEM_GET_SETTS);
//    application.Terminate;
  end;
}
  tmrControl.Enabled := false;

  RestartMainWork;
end;

procedure TfrmPodarok.tmrMainWorkTimer(Sender: TObject);
begin
  MakeMainWork;
end;

function TfrmPodarok.GetKeysAcceptedImgLink(): string;
var
  lnk : string;
begin
  lnk := format(BASELINK, [LOGIN, PASSMD5]);

  lnk := lnk + '&' + ACC_IMG_KEY_LIST_PARAM;

  frmpodarok.Log('GetKeysAcceptedImgLink : ' + lnk);

  result := lnk;
end;

function TfrmPodarok.GetVersionLink(passmd5_ : string): string;
var
  lnk : string;
begin
//  if FlagReloadOrUseThisNew <> '' then
//    GetPass;

  if (frmsettings <> nil) and (frmsettings.edtlogin.Text <> '') then
    lnk := format(BASELINK, [frmsettings.edtlogin.Text, passmd5_])
  else
    lnk := format(BASELINK, [LOGIN, passmd5_]);

  lnk := lnk + '&' + VERSION_PARAM;

  frmpodarok.Log('GetVersionLink : ' + lnk);

  result := lnk;
end;

function TfrmPodarok.GetKeysNewImgLink(): string;
var
  lnk : string;
begin
  lnk := format(BASELINK, [LOGIN, PASSMD5]);

  lnk := lnk + '&' + NEW_IMG_KEY_LIST_PARAM;

  frmpodarok.Log('GetKeysNewImgLink : ' + lnk);

  result := lnk;
end;

function TfrmPodarok.SetAcceptImgLink(): string;
var
  lnk : string;
begin
  lnk := format(BASELINK, [LOGIN, PASSMD5]);

  lnk := lnk + '&' + ACCEPTIMAGE + '=' + inttostr(IMG_KEY);

  frmpodarok.Log('GetAcceptImgLink : ' + lnk);

  result := lnk;
end;

function TfrmPodarok.GetLinkForImgNumb(ind : integer): string;
var
  lnk : string;
begin
  lnk := format(BASELINK, [LOGIN, PASSMD5]);

  lnk := lnk + '&' + GETIMG + '=' + inttostr(ind);

  frmpodarok.Log('GetLinkForImgNumb : ' + lnk);

  result := lnk;
end;

function TfrmPodarok.GetSenderForImgNumb(ind : integer): string;
var
  lnk : string;
begin
  lnk := format(BASELINK, [LOGIN, PASSMD5]);

  lnk := lnk + '&' + GETSENDER + '=' + inttostr(ind);

  frmpodarok.Log('GetSenderForImgNumb : ' + lnk);

  result := lnk;
end;

procedure TfrmPodarok.FormActivate(Sender: TObject);
begin
  ShowWindow(Application.Handle, SW_HIDE);
end;

procedure TfrmPodarok.FormCreate(Sender: TObject);
var
    S: string;
begin
  IS_WARNED_BY_PASS := false;

  height := 1;
  width  := 1;

  LOCATION := application.ExeName;

  GetAll;

  if ((login = '') or (pass = '')) then
  begin
    IS_WARNED_BY_PASS := true;
    showmessage(EnterLogPass);
  end;

  TrayIcon.Hint := caption;

  cntcheck := 0; // количество проверок наличия формы настроек

  BASELINK := 'http://greetfest.com/request.php?email=%s&hash=%s';
  LAST_IMG := -1;
//  TOTAL_IMG := 0;
  NEED_LOG_CHECK := true;
  IMG_KEY_LOADED := -1;

//  USEREG := true;

  INIFILE := ChangeFileExt(extractfilename(application.ExeName), '.ini');

  SAVEDIR :=  extractfilepath(application.ExeName);

  SetLength(S, MAX_PATH);
  GetTempPath(MAX_PATH, PChar(S));
  GetLongPathName(PChar(S), PChar(S), MAX_PATH);
  SetLength(S, StrLen(PChar(S)));
  TEMPDIR := S;
//  ShowMessage(S);

//  TEMPDIR := GetEnvironmentVariable('TEMP');
//  ShowMessage(TEMPDIR);
end;

procedure TfrmPodarok.FormShow(Sender: TObject);
begin
  ShowWindow(Application.Handle, SW_HIDE);
end;

procedure TfrmPodarok.MakeMainWork;
var
  KeysListArray: TStringList;
begin
  tmrMainWork.Enabled := false;

  CNT_NEW_IMG := 1; // предположим 1 точно есть - потом проверим, но чтоб лишний раз не дергать

  frmsettings.IsConnectAndGetVers;

//  IS_CONNECTION_EXISTS := false; /////////////////////////////////////////////

  while (IS_CONNECTION_EXISTS and (CNT_NEW_IMG > 0)) do ///////////////////////////////////////////////// while IS_CONNECTION_EXISTS
  begin
    KEYLIST := GetKeysNewImg();
    CNT_NEW_IMG := GetCntKeys(KEYLIST);

    frmpodarok.Log('273 KEYLIST := ' + KEYLIST);
    frmpodarok.Log('274 CNT_NEW_IMG := ' + inttostr(CNT_NEW_IMG));

    if ((CNT_NEW_IMG > 0) and (KEYLIST <> NO_IMG)) then
    begin
      IMG_KEY := strtointdef(StrBreak(KEYLIST, KEYSPLIT, 0, 1), 0);

      frmpodarok.Log('280 IMG_KEY := ' + inttostr(IMG_KEY));

      frmpodarok.Log('282 LoadFileFromInet start : ' + datetimetostr(now));

      LoadFileFromInet
      (
        GetLinkForImgNumb
        (
          IMG_KEY
        ), frmaccept.imgAccept, IMG_KEY
      );

      frmpodarok.Log('292 LoadFileFromInet end : ' + datetimetostr(now));

      FrmAccept.lblSender.Caption := LoadLinkFromInet(GetSenderForImgNumb(IMG_KEY));

      FrmAccept.ShowModal;
    end;

    dec(CNT_NEW_IMG);
  end;                                                  ///////////////////////////////////////////////// while IS_CONNECTION_EXISTS end

  if IS_CONNECTION_EXISTS then                          ///////////////////////////////////////////////// if IS_CONNECTION_EXISTS
  begin
    KEYLIST     := GetKeysAcceptedImg();
    CNT_ACC_IMG := GetCntKeys(KEYLIST);

    KeysListArray := TStringList.Create;
    Split(',', KEYLIST, KeysListArray);

    DeleteUnused(KeysListArray);

    KeysListArray.Free;

    frmpodarok.Log('310 KEYLIST = ' + KEYLIST + ' ; CNT_ACC_IMG = ' + inttostr(CNT_ACC_IMG));

    if CNT_ACC_IMG = 1 then
      LAST_IMG := 0
    else
    if CNT_ACC_IMG > 1 then
    begin
      inc(LAST_IMG);

      if LAST_IMG > CNT_ACC_IMG - 1 then
        LAST_IMG := 0;
    end;
  end;                                                  ///////////////////////////////////////////////// if IS_CONNECTION_EXISTS end

  frmpodarok.Log('330 CNT_ACC_IMG : ' + inttostr(CNT_ACC_IMG) + ' ; KEYLIST : ' + KEYLIST);

  if IS_CONNECTION_EXISTS and (KEYLIST <> NO_IMG) then // тк если равны то нет смысла перезагружать  //// if IS_CONNECTION_EXISTS and (KEYLIST <> NO_IMG)
  begin
    if CNT_ACC_IMG > 0 then
    begin
      IMG_KEY := strtointdef(StrBreak(KEYLIST, KEYSPLIT, LAST_IMG, 1), 0);

      frmpodarok.Log('338 : IMG_KEY = ' + inttostr(IMG_KEY));

      if (IMG_KEY <> IMG_KEY_LOADED) then
      begin
        frmpodarok.Log('342 : IMG_KEY = ' + inttostr(IMG_KEY) + ' ; IMG_KEY_LOADED = ' + inttostr(IMG_KEY_LOADED));

        frmpodarok.Log('344 LoadFileFromInet start : ' + datetimetostr(now));

        LoadFileFromInet
        (
          GetLinkForImgNumb
          (
            IMG_KEY
          ), imgmain, IMG_KEY
        );

        frmpodarok.Log('354 LoadFileFromInet end : ' + datetimetostr(now));

        IMG_KEY_LOADED := IMG_KEY;
      end;
    end
    else
      frmPodarok.Visible := false;
  end;                                                                                               //// if IS_CONNECTION_EXISTS and (KEYLIST <> NO_IMG) end

  if not IS_CONNECTION_EXISTS then /////////////////////// OFFLINE
  begin
    KEYLIST     := GetGreetfestLocalStoredFiles();
    CNT_ACC_IMG := GetCntKeys(KEYLIST);

    frmpodarok.Log('OFFLINE KEYLIST = ' + KEYLIST + ' ; CNT_ACC_IMG = ' + inttostr(CNT_ACC_IMG));

    if CNT_ACC_IMG = 1 then
      LAST_IMG := 0
    else
    if CNT_ACC_IMG > 1 then
    begin
      inc(LAST_IMG);

      if LAST_IMG > CNT_ACC_IMG - 1 then
        LAST_IMG := 0;
    end;

    if (KEYLIST <> NO_IMG) and (CNT_ACC_IMG > 0) then
    begin
      IMG_KEY := strtointdef(StrBreak(KEYLIST, KEYSPLIT, LAST_IMG, 1), 0);

      if (IMG_KEY <> IMG_KEY_LOADED) then
      begin
//        frmpodarok.Log('342 : IMG_KEY = ' + inttostr(IMG_KEY) + ' ; IMG_KEY_LOADED = ' + inttostr(IMG_KEY_LOADED));
//        frmpodarok.Log('344 LoadFileFromInet start : ' + datetimetostr(now));

        LoadFileIntoImg(GetFileName(inttostr(IMG_KEY)), imgmain);

//        frmpodarok.Log('354 LoadFileFromInet end : ' + datetimetostr(now));

        IMG_KEY_LOADED := IMG_KEY;
      end
      else
        frmPodarok.Visible := false;
    end;
  end;                             /////////////////////// OFFLINE end

  tmrMainWork.Enabled := true;
end;
{
procedure TfrmPodarok.LoadFileFromDisk(key : string; var image : timage);
var
  fname : string;
begin
  fname := GetFileName(key);
end;
}
procedure TfrmPodarok.DeleteUnused(var list : tstringlist);
var
  fname, fnameindir : string;
  i, maxlist : integer;
  store : boolean;
  searchResult : TSearchRec;
begin
  maxlist := list.Count - 1;
  store := false;

  SetCurrentDir(TEMPDIR);

  if FindFirst('*' + GREETFEST_TEMP_FILE_PART, faAnyFile, searchResult) = 0 then
  begin
    repeat

      fnameindir := searchResult.Name;
      for i := 0 to maxlist do
      begin
        store := false;
        fname := GetFileName(list[i]);
        if pos(fnameindir, fname) > 0 then
        begin
          store := true;
          break;
        end;
      end;

      if not store then
        DeleteFile(fnameindir);
    until FindNext(searchResult) <> 0;

    FindClose(searchResult);
  end;
end;

function TfrmPodarok.GetGreetfestLocalStoredFiles():string;
var
  key, fnameindir, res : string;
  searchResult : TSearchRec;
begin
  SetCurrentDir(TEMPDIR);

  res := '';

  if FindFirst('*' + GREETFEST_TEMP_FILE_PART, faAnyFile, searchResult) = 0 then
  begin
    repeat
      fnameindir := searchResult.Name;
      key        := copy(fnameindir, 1, pos(GREETFEST_TEMP_FILE_PART, fnameindir) - 1);
      res        := res + key + ',';

    until FindNext(searchResult) <> 0;

    FindClose(searchResult);
  end;

  if res <> '' then
    res := copy(res, 1, length(res) - 1);

  result := res;
end;

procedure TfrmPodarok.Split(Delimiter: Char; Str: string; ListOfStrings: TStrings) ;
begin
   ListOfStrings.Clear;
   ListOfStrings.Delimiter     := Delimiter;
   ListOfStrings.DelimitedText := Str;
end;

function TfrmPodarok.IsLogPass(): boolean;
begin
  if not NEED_LOG_CHECK then
  begin
    result := true;
    exit;
  end
  else
  if ((LOGIN = '') or (PASS = '')) then
  begin
    frmpodarok.Log('IsLogPass : (LOGIN = --) or (PASS = --)');
    NEED_LOG_CHECK := true;
    result := false;
    exit;
  end
  else
  begin
    frmpodarok.Log('IsLogPass : OK');
    NEED_LOG_CHECK := false;
    result := true;
    exit;
  end;
end;

function TfrmPodarok.GetKeysAcceptedImg(): string;
begin
  if not IsLogPass then exit;

  result := '';
  try
    if IS_CONNECTION_EXISTS then
      result := HTTP.Get(GetKeysAcceptedImgLink);
  except
    on e:exception do
    begin
      frmpodarok.Log('GetKeysAcceptedImg : EXCEPT : ' + e.Message);
      result := '';
    end;
  end;
end;

function TfrmPodarok.GetKeysNewImg(): string;
begin
  if not IsLogPass then exit;
  result := '';

  try
    if IS_CONNECTION_EXISTS then
      result := HTTP.Get(GetKeysNewImgLink);
  except
    on e:exception do
    begin
      frmpodarok.Log('GetKeysNewImgLink : EXCEPT : ' + e.Message);
      result := '';
    end;
  end;
end;

function TfrmPodarok.GetCntKeys(strkeys : string): integer;
var
  cntdiv : integer;
begin
  try
    cntdiv := DCOUNT(strkeys, KEYSPLIT);
    result := cntdiv;
  except
    on e:exception do
      frmpodarok.Log('GetCntKeys : EXCEPT : ' + e.Message);
  end;
end;

function TfrmPodarok.DCOUNT(str, Delimeter: string) : integer;
var
 StrL : TStringList;
 ParseStr : string;
begin
  try
    StrL := TStringList.Create;
    ParseStr:= StringReplace(str, Delimeter, #13, [rfReplaceAll]);
    StrL.Text := ParseStr;
    Result := StrL.Count;
  finally
    StrL.Free;
  end;
end;

function TfrmPodarok.StrBreak(str, Delimeter: string; fromParts, Cnt : integer) : string;
{
 str : your string
 Delimeter : Delimeter symbol
 fromParts : Initial position
 Cnt : Number of items
}
var
 StrL : TStringList;
 ParseStr : string;
 i : integer;
begin
  Result := '';
  try
    StrL := TStringList.Create;
    ParseStr:= StringReplace(str, Delimeter, #13, [rfReplaceAll]);
    StrL.Text := ParseStr;
    if StrL.Count > 0 then
    begin
      for i := 0 to Cnt-1 do
        if (StrL.Count > i) and (StrL.Count > fromParts) then
            if i>0 then Result := Result + Delimeter + StrL.Strings[fromParts+i]
                    else Result := Result + StrL.Strings[fromParts+i];
    end;
  finally
    StrL.Free;
  end;
end;

function TfrmPodarok.LoadFileFromInet(source: string; var ImgComponent : TImage; key : integer): string;
var
  LoadStream: TMemoryStream;
  fext, fname, ctype, fnamePNG : string;
begin
  if not IsLogPass then exit;

//  WebBrowser1.Navigate(source);
  try
    fname := GetFileName(inttostr(key));
    frmpodarok.Log('501 : fname = ' + fname);

    if IS_CONNECTION_EXISTS and not fileexists(fname) then
    begin
      try
        if IS_CONNECTION_EXISTS then
          http.Head(source);
      except
      end;

      ctype := http.Response.ContentType;
      frmsettings.lblHeader.Caption := ctype;

      if pos('png', ctype) <= 0 then
      begin
        frmpodarok.Log('489 : ctype = ' + ctype);
        exit;
      end;

      LoadStream := TMemoryStream.Create;

      HTTP.Get(source, LoadStream);

      LoadStream.SaveToFile(fname);
      LoadStream.Free;
    end;

    LoadFileIntoImg(fname, ImgComponent);

{
    fnamePNG := ChangeFileExt(fname, '.png');
    try
      CopyFile(PChar(fname), PChar(fnamePNG), false);

      if ImgComponent <> frmaccept.imgAccept then
        ImgComponent.Picture.LoadFromFile(fnamePNG);

      deletefile(fnamePNG);
    except
      frmpodarok.Log('542 : fnamePNG = ' + fnamePNG + ' ; fname = ' + fname);
    end;

    frmpodarok.Width  := imgMain.Picture.Width;
    frmpodarok.Height := imgMain.Picture.Height;

    frmpodarok.Left := screen.WorkAreaWidth  - imgMain.Picture.Width;
    frmpodarok.top  := screen.WorkAreaHeight - imgMain.Picture.Height;


    frmpodarok.Visible := true;
    frmpodarok.imgMain.Refresh;
}

//    frmpodarok.Repaint;
  except
    on e:exception do
      frmpodarok.Log('LoadFileFromInet : EXCEPT : ' + e.Message);
  end;

    frmpodarok.Repaint;
end;

function TfrmPodarok.LoadFileIntoImg(fname: string; var img : timage): string;
var
  fnamePNG : string;
begin
  fnamePNG := ChangeFileExt(fname, '.png');
  try
    CopyFile(PChar(fname), PChar(fnamePNG), false);

    if img <> frmaccept.imgAccept then
      img.Picture.LoadFromFile(fnamePNG);

    deletefile(fnamePNG);    //  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  except
    frmpodarok.Log('689 : LoadFileIntoImg = ' + fnamePNG + ' ; fname = ' + fname);
  end;

  frmpodarok.Width  := imgMain.Picture.Width;        //  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ??? if img not imgMain
  frmpodarok.Height := imgMain.Picture.Height;

  frmpodarok.Left := screen.WorkAreaWidth  - imgMain.Picture.Width;
  frmpodarok.top  := screen.WorkAreaHeight - imgMain.Picture.Height;

  frmpodarok.Visible := true;
  frmpodarok.imgMain.Refresh;
end;

function TfrmPodarok.LoadLinkFromInet(source: string): string;
begin
  if not IsLogPass then exit;

  try
    result := HTTP.Get(source);
    Log('LoadLinkFromInet : ' + source);

  except
    on e:exception do
      frmpodarok.Log('LoadLinkFromInet : EXCEPT : ' + e.Message);
  end;
end;

function TfrmPodarok.GetFileName(key: string): string;
begin
  result := TEMPDIR + key + GREETFEST_TEMP_FILE_PART;
end;

procedure TfrmPodarok.Log(str: string);
begin
  if ((frmsettings <> nil) and IS_LOG) then
    frmsettings.mLog.Lines.Add(datetimetostr(now) + ' : ' + str);
end;

procedure TfrmPodarok.RestartMainWork;
begin
  tmrMainWork.Enabled := false;
  MakeMainWork;
  tmrMainWork.Enabled := true;
end;

procedure TfrmPodarok.GetAll;
begin
  GetAutorun;
  GetLogin;
  GetPass;
  GetPeriod;
  GetStayOnTop;
//  GetX;
//  GetY;
end;

procedure TfrmPodarok.GetAutorun;
begin
  if ReadValue(AUTORUN_KEY, VAL_YES) = VAL_YES then
    IsAutoRun := true
  else
    IsAutoRun := false;

  if frmsettings <> nil then
    frmsettings.chbIsAutoStart.Checked := IsAutoRun;
end;

procedure TfrmPodarok.GetLogin;
begin
  LOGIN := ReadValue(LOGIN_KEY, LOGIN_VAL);

  if frmsettings <> nil then
    frmsettings.edtlogin.Text := login;
end;

procedure TfrmPodarok.SetPass;
var
  pass_new, pass_new_md5 : string;
begin
  NEED_LOG_CHECK := false; /////////////////////////////////// add 11.05.2014

  pass_new     := crypter.EncryptStr(frmsettings.edtPass.Text, 223);
  pass_new_md5 := ansilowercase(md5(frmsettings.edtPass.Text));

  if frmsettings.CheckVersion(frmpodarok.LoadLinkFromInet(frmpodarok.GetVersionLink(pass_new_md5)), false) = false then
  begin
    showmessage('Логин или пароль указаны с ошибкой');
  end
  else
  begin
    SaveValue(PASS_KEY, pass_new);
    showmessage('Пароль принят, пожалуйста, после нажатия кнопки ОК подождите несколько секунд для проверки данных на стороне сервера');
  end;

{
  GetPass;
  if pass_new <> PASS then
  begin
    vcl.Dialogs.InputQuery('Запрос пароля', 'Введите текущий пароль: ', old_pass_prompt);
    if old_pass_prompt = PASS then
    begin
      SaveValue(PASS_KEY, crypter.EncryptStr(pass_new, 223));
      showmessage('Пароль изменен.');
    end
    else
      showmessage('Указан неверный текущий пароль.');
  end;
}
//  SaveValue(PASS_KEY, crypter.EncryptStr(frmsettings.edtPass.Text, 223));
end;

procedure TfrmPodarok.GetPass;
begin
  pass  := ReadValue(PASS_KEY, PASS_VAL);

  PASS := crypter.DecryptStr(pass, 223);
  PASSMD5 := ansilowercase(md5(pass));

  if frmsettings <> nil then
  begin
    frmsettings.edtPass.Text := pass;
  end;
end;

procedure TfrmPodarok.GetPeriod;
begin
  check_period := strtoint(ReadValue(CHECK_PERIOD_KEY, inttostr(CHECK_PERIOD_VAL)));

  if frmsettings <> nil then
    frmsettings.edtRenewPeriod.Text := inttostr(check_period);

  tmrMainWork.Interval := check_period * 1000;
end;

procedure TfrmPodarok.GetStayOnTop;
begin
  if frmsettings <> nil then
  begin
    frmsettings.chbStayOnTop.checked := (strtoint(ReadValue(STAY_ON_TOP_KEY, STAY_ON_TOP_VAL)) = 1);

    if frmsettings.chbStayOnTop.checked then
      formstyle := fsStayOnTop
    else
      formstyle := fsNormal;
  end;
end;

procedure TfrmPodarok.mnSettingsClick(Sender: TObject);
begin
  if frmsettings <> nil then
    frmsettings.visible := true;
end;

procedure TfrmPodarok.mnCloseAppClick(Sender: TObject);
begin
  CloseApp;
end;

procedure TfrmPodarok.mnRefuseImgClick(Sender: TObject);
begin
  tmrMainWork.Enabled := false;

  if MessageBox(frmpodarok.Handle,
    PChar(REFUSE_THIS_QUESTION),
    PChar(PROGRAM_ID), MB_YESNO or MB_ICONASTERISK) = IDYES then
  begin
    frmpodarok.LoadLinkFromInet
    (
      frmpodarok.SetRefuseImgLink()
    );
  end;

  imgmain.Picture := nil;
  IMG_KEY_LOADED := -1;

  MakeMainWork;
  tmrMainWork.Enabled := true;
end;

procedure TfrmPodarok.CloseApp;
begin
  close;
end;

procedure TfrmPodarok.HideOrShowApp;
begin
  frmpodarok.Visible := not frmpodarok.Visible;
  if frmpodarok.Visible = false then
    frmsettings.visible := false;
end;

procedure TfrmPodarok.HideOrShowSett;
begin
  frmsettings.visible := not frmsettingsu.frmsettings.visible;
end;

procedure TfrmPodarok.imgMainDblClick(Sender: TObject);
begin
//  HideOrShowSett;
end;

procedure TfrmPodarok.TrayIconClick(Sender: TObject);
begin
//  HideOrShowApp;
end;

function TfrmPodarok.SaveAutostart(reg_key : string): boolean;
var
  reg : TRegistry;
begin
  result := true;

  reg := TRegistry.Create(KEY_ALL_ACCESS or KEY_WOW64_32KEY {KEY_ALL_ACCESS});
  reg.RootKey := HKEY_CURRENT_USER;

  if reg.OpenKey(reg_key, false) then
  begin
    //if not reg.ValueExists(PROGRAM_ID) then
    //begin
      reg.WriteString(PROGRAM_ID, '"' + LOCATION + '"');
    //end;
  end;

  reg.CloseKey;
  reg.Free;
end;


function TfrmPodarok.RemoveAutostart(reg_key : string): boolean;
var
  reg : TRegistry;
begin
  result := true;

  reg := TRegistry.Create(KEY_ALL_ACCESS or KEY_WOW64_32KEY {KEY_ALL_ACCESS});
  reg.RootKey := HKEY_CURRENT_USER;

  if reg.OpenKey(reg_key, false) then
  begin
    if reg.ValueExists(PROGRAM_ID) then
    begin
      reg.DeleteValue(PROGRAM_ID);
    end;
  end;

  reg.CloseKey;
  reg.Free;
end;

function TfrmPodarok.SaveValue(reg_val, dflt_val : string): string;
var
  reg : TRegistry;
  reg_key : string;
  ini: TIniFile;
begin
  result := VAL_NULL;

  if USEREG then
  begin
    reg := TRegistry.Create(KEY_ALL_ACCESS or KEY_WOW64_32KEY {KEY_ALL_ACCESS});
    reg.RootKey := HKEY_CURRENT_USER;

  // 32
    reg_key := PROG_REG_KEY_32 + '\' + PROGRAM_ID;

    if not reg.KeyExists(reg_key) then
      reg.CreateKey(reg_key);

    if reg.OpenKey(reg_key, true) then
      reg.WriteString(reg_val, dflt_val);

  // 64
  {
    reg_key := PROG_REG_KEY_64 + '\' + PROGRAM_ID;

    if not reg.KeyExists(reg_key) then
      reg.CreateKey(reg_key);

    if reg.OpenKey(reg_key, false) then
      reg.WriteString(reg_val, dflt_val);
  }
  //

    reg.CloseKey;
    reg.Free;

    result := dflt_val;

    if reg_val = AUTORUN_KEY then
    begin
      if dflt_val = VAL_YES then
      begin
        SaveAutostart(RUN_REG_KEY_32);
  //      SaveAutostart(RUN_REG_KEY_64);
      end
      else
      begin
        RemoveAutostart(RUN_REG_KEY_32);
  //      RemoveAutostart(RUN_REG_KEY_64);
      end;
    end;
  end
  else
  begin
    ini := TIniFile.Create(INIFILE);
    try
      ini.WriteString(PROGRAM_ID, reg_val, dflt_val);
    finally
      ini.Free;
    end;
  end;
end;

function TfrmPodarok.ReadValue(reg_val, dflt_val : string): string;
var
  reg : TRegistry;
  reg_key, res32, res64 : string;
  ini: TIniFile;
begin
  result := VAL_NULL;
  res32  := VAL_NULL;
  res64  := VAL_NULL;

  if USEREG then
  begin
    reg := TRegistry.Create(KEY_ALL_ACCESS or KEY_WOW64_32KEY {KEY_ALL_ACCESS});
    reg.RootKey := HKEY_CURRENT_USER;

  // 32
    reg_key := PROG_REG_KEY_32 + '\' + PROGRAM_ID;

    if not reg.KeyExists(reg_key) then
      reg.CreateKey(reg_key);

    if reg.OpenKey(reg_key, true) then
    begin
      if not reg.ValueExists(reg_val) then
      begin
        reg.WriteString(reg_val, dflt_val);
        res32 := dflt_val;
      end
      else
        res32 := reg.ReadString(reg_val);
    end;

  // 64
  {
    reg_key := PROG_REG_KEY_64 + '\' + PROGRAM_ID;

    if not reg.KeyExists(reg_key) then
      reg.CreateKey(reg_key);

    if reg.OpenKey(reg_key, false) then
    begin
      if not reg.ValueExists(reg_val) then
      begin
        reg.WriteString(reg_val, dflt_val);
        res64 := dflt_val;
      end
      else
        res64 := reg.ReadString(reg_val);
    end;
  }
  //

    reg.CloseKey;
    reg.Free;

    if (res64 <> VAL_NULL) then
      result := res64
    else
    if (res32 <> VAL_NULL) then
      result := res32
    else
      result := VAL_NULL;

    frmpodarok.Log('ReadValue : ' + reg_val + ' : ' + dflt_val + ' : ' + result);
  end
  else
  begin
    ini := TIniFile.Create(INIFILE);
    try
      result := ini.ReadString(PROGRAM_ID, reg_val, '');
    finally
      ini.Free;
    end;
  end;
end;

procedure TfrmPodarok.SetAll;
begin
  SetAutorun;
  SetLogin;
  SetPass;
  SetPeriod;
  SetStayOnTop;
end;

procedure TfrmPodarok.SetAutorun;
begin
  if frmsettings.chbIsAutoStart.Checked then
    SaveValue(AUTORUN_KEY, VAL_YES)
  else
    SaveValue(AUTORUN_KEY, VAL_NO);
end;

procedure TfrmPodarok.SetLogin;
begin
  SaveValue(LOGIN_KEY, frmsettings.edtlogin.Text);
end;

procedure TfrmPodarok.SetPeriod;
begin
  SaveValue(CHECK_PERIOD_KEY, frmsettings.edtRenewPeriod.Text);
end;

function TfrmPodarok.SetRefuseImgLink: string;
var
  lnk : string;
begin
  lnk := format(BASELINK, [LOGIN, PASSMD5]);

  lnk := lnk + '&' + REFUSEIMAGE + '=' + inttostr(IMG_KEY);

  frmpodarok.Log('SetRefuseImgLink : ' + lnk);

  result := lnk;
end;

procedure TfrmPodarok.SetStayOnTop;
begin
  if frmsettings.chbStayOnTop.Checked then
    SaveValue(STAY_ON_TOP_KEY, VAL_YES)
  else
    SaveValue(STAY_ON_TOP_KEY, VAL_NO);
end;

procedure TfrmPodarok.SetVersion;
begin
  SaveValue(VERS_KEY, VERSION);
end;

{
procedure TfrmPodarok.SetX;
begin
  SaveValue(POSX_KEY, frmsettings.edtPosX.Text);
  posx := frmsettings.edtPosX.Text;
  left := strtoint(posx);
end;
}

{
procedure TfrmPodarok.SetY;
begin
  SaveValue(POSY_KEY, frmsettings.edtPosY.Text);
  posy := frmsettings.edtPosY.Text;
 top  := strtoint(posy);
end;
}

{
procedure TfrmPodarok.GetX;
begin
  posx  := ReadValue(POSX_KEY, inttostr(left));

  if frmsettings <> nil then
    frmsettings.edtPosX.Text := posx;
end;
}

{
procedure TfrmPodarok.GetY;
begin
  posy  := ReadValue(POSY_KEY, inttostr(top));

  if frmsettings <> nil then
    frmsettings.edtPosY.Text := posy;
end;
}

end.
