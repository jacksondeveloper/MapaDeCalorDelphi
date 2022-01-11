unit MCEstatistica;

interface

uses
  DB, DBClient, SysUtils, Forms;

type
  TMCEstatistica = class
  private
    FTabela: TClientDataSet;
    procedure SetTabela(const Value: TClientDataSet);
    function GetTabela: TClientDataSet;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Inserir(Nome: String);
    property Tabela: TClientDataSet read GetTabela write SetTabela;
  end;

var
  MCEstatisticaVar: TMCEstatistica;

implementation

uses
  unPrincipal, Classes;

{ TMCEstatistica }

constructor TMCEstatistica.Create;
begin
  FTabela := TClientDataSet.Create(nil);
  FTabela.Close;
  FTabela.FieldDefs.Clear;
  FTabela.FieldDefs.Add('NOME', ftString, 100);
  FTabela.FieldDefs.Add('CLICK', ftInteger);
  FTabela.FieldDefs.Add('TELA', ftString, 100);
  FTabela.CreateDataSet;

  // Ordenando pelo CLICK descendente
  with FTabela.IndexDefs.AddIndexDef do
  begin
    Name := 'CLICKINDEX';
    Fields := 'CLICK';
    Options := [ixDescending];
  end;
  FTabela.IndexName := 'CLICKINDEX';

  FTabela.FieldByName('NOME').DisplayWidth := 20;
  FTabela.FieldByName('TELA').DisplayWidth := 20;
  FTabela.Open;
end;

destructor TMCEstatistica.Destroy;
begin
  FreeAndNil(FTabela);
  inherited;
end;

function TMCEstatistica.GetTabela: TClientDataSet;
begin
  Result := FTabela;
end;

procedure TMCEstatistica.Inserir(Nome: String);
var
  Click: Integer;
begin
  Nome := UpperCase(Nome);

  FTabela.Filtered := False;
  FTabela.Filter := 'NOME = ' + QuotedStr(Nome);
  FTabela.Filtered := True;

  if FTabela.RecordCount > 0 then
  begin
    Click := FTabela.FieldByName('CLICK').AsInteger;
    Inc(Click);
    FTabela.Edit;
    FTabela.FieldByName('CLICK').AsInteger := Click;
    FTabela.Post;
  end
  else
  begin
    FTabela.Insert;
    FTabela.FieldByName('NOME').AsString := Nome;
    FTabela.FieldByName('CLICK').AsInteger := 1;
    FTabela.FieldByName('TELA').AsString := Screen.ActiveForm.Name;
    FTabela.Post;
  end;

  FTabela.Filtered := False;

  // Para testar e ver visualmente
  fmPrincipal.DataSource1.DataSet := FTabela;
end;

procedure TMCEstatistica.SetTabela(const Value: TClientDataSet);
begin
  FTabela := Value;
end;

initialization
  MCEstatisticaVar := TMCEstatistica.Create;

finalization
  FreeAndNil(MCEstatisticaVar);  

end.
