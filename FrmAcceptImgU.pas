unit FrmAcceptImgU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.jpeg;

type
  TFrmAccept = class(TForm)
    imgAccept: TImage;
    Panel1: TPanel;
    lbl1: TLabel;
    Label1: TLabel;
    lblSender: TLabel;
    Label2: TLabel;
    btnYes: TButton;
    btnNo: TButton;
    procedure btnYesClick(Sender: TObject);
    procedure btnNoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    function ShowImg() : string;
  end;

var
  FrmAccept: TFrmAccept;

implementation

uses frmpodaroku, VarsCons;

{$R *.dfm}

{ TFrmAccept }

procedure TFrmAccept.btnNoClick(Sender: TObject);
begin
  frmaccept.visible := false;

  frmpodarok.LoadLinkFromInet
    (
      frmpodarok.SetRefuseImgLink()
    );
end;

procedure TFrmAccept.btnYesClick(Sender: TObject);
begin
  frmaccept.visible := false;

  frmpodarok.LoadLinkFromInet
    (
      frmpodarok.SetAcceptImgLink()
    );
end;

procedure TFrmAccept.FormCreate(Sender: TObject);
begin
  caption := PROGRAM_ID;
end;

function TFrmAccept.ShowImg: string;
begin
  frmaccept.visible := true;
end;

end.
