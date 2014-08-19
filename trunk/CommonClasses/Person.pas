unit Person;

interface

uses
  mORMot,
  SynCommons;

type
  TSQLCity = class(TSQLRecord)
  private
    FName: RawUTF8;
    FState: RawUTF8;
  published
    property Name: RawUTF8 read FName write FName;
    property State: RawUTF8 read FState write FState;
  end;

  TSQLPerson = class(TSQLRecord)
  private
    fFirstname, fSurname: RawUTF8;
    FCity: TSQLCity;
  published
    property FirstName: RawUTF8 read fFirstname write fFirstname;
    property Surname: RawUTF8 read fSurname write fSurname;
    property City: TSQLCity read FCity write FCity;
  end;

function CreatePersonModel: TSQLModel;

implementation

function CreatePersonModel: TSQLModel;
begin
  Result := TSQLModel.Create([TSQLCity,TSQLPerson]);
end;

end.
