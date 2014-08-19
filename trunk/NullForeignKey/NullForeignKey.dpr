program NullForeignKey;

uses
  Vcl.Forms,
  UMainForm in 'UMainForm.pas' {FMainForm},
  Person in '..\CommonClasses\Person.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMainForm, FMainForm);
  Application.Run;
end.
