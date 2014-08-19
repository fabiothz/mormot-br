unit UMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, mORMot, mORMotSQLite3, SynSQLite3Static, Vcl.ExtCtrls;

type
  TFMainForm = class(TForm)
    Button1: TButton;
    edtFirstName: TLabeledEdit;
    edtSurname: TLabeledEdit;
    chkIncCity: TCheckBox;
    lblStatus: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FConnection: TSQLRestClientURI;
    procedure CreateConnection;
  public
    { Public declarations }
  end;

var
  FMainForm: TFMainForm;

implementation

{$R *.dfm}

uses
  Person;

{ TFMainForm }

procedure TFMainForm.CreateConnection;
var
  LModel: TSQLModel;
  LModelServer: TSQLModel;
begin
  LModel := CreatePersonModel;
  LModelServer := CreatePersonModel;
  FConnection := TSQLRestClientDB.Create(LModel, LModelServer,
    ChangeFileExt(Application.ExeName,'.db3'), TSQLRestServerDB);
  TSQLRestClientDB(FConnection).Server.CreateMissingTables(0);
end;

procedure TFMainForm.FormCreate(Sender: TObject);
begin
  lblStatus.Caption := '';
  CreateConnection;
end;

procedure TFMainForm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FConnection);
end;

procedure TFMainForm.Button1Click(Sender: TObject);
var
  LPerson: TSQLPerson;
  LCity: TSQLCity;
  LId: Integer;
begin
  if chkIncCity.Checked then
  begin
    LCity := TSQLCity.CreateAndFillPrepare(FConnection,'');
    if not LCity.FillOne then
    begin
      LCity := TSQLCity.Create;
      LCity.Name := 'Vila Valerio';
      LCity.State := 'ES';
      FConnection.Add(LCity,True);
    end;
  end;

  LPerson := TSQLPerson.Create;
  LPerson.FirstName := edtFirstName.Text;
  LPerson.Surname := edtSurname.Text;

  if chkIncCity.Checked then
    LPerson.City := LCity.AsTSQLRecord
  else
    LPerson.City := nil;

  LId := FConnection.Add(LPerson,True);

  if LId > 0 then
  begin
    lblStatus.Caption := 'Included successfully - Id: '+IntToStr(LId);
    lblStatus.Font.Color := clGreen;
  end
  else
  begin
    lblStatus.Caption := 'Error: '+sLineBreak+FConnection.LastErrorMessage;
    lblStatus.Font.Color := clRed;
  end;
end;

end.
