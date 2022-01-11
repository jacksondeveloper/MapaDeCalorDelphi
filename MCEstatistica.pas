unit MCEstatistica;

interface

uses
  DB, DBClient, SysUtils, Forms, Graphics, Classes, TypInfo, StdCtrls;

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
    procedure PintarComponentes(TelaAtiva: TForm);
    property Tabela: TClientDataSet read GetTabela write SetTabela;
  end;

var
  MCEstatisticaVar: TMCEstatistica;

implementation

uses
  unPrincipal;

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

  // Se quiser pintar em tempo real
  // PintarComponentes(Screen.ActiveForm);
end;

procedure TMCEstatistica.PintarComponentes(TelaAtiva: TForm);
var
  Componente: TComponent;
  MaisCliques: Integer;

  function BuscaCor(subMaisCliques, subClick: Integer): TColor;
  var
    Grupo1, Grupo2: Integer;
  begin
    Grupo1 := subMaisCliques div 3;
    Grupo2 := Grupo1 * 2;

    if subClick <= Grupo1 then
      result := $00c4c4f2
    else if subClick <= Grupo2 then
      result := $006d6df7
    else
      result := $000303fc;
  end;
begin
  begin
    MCEstatisticaVar.Tabela.First;
    MaisCliques := 0;

    while not MCEstatisticaVar.Tabela.Eof do
    begin
      if MCEstatisticaVar.Tabela.FieldByName('CLICK').asInteger > MaisCliques then
        MaisCliques := MCEstatisticaVar.Tabela.FieldByName('CLICK').asInteger;
      MCEstatisticaVar.Tabela.Next;
    end;

    MCEstatisticaVar.Tabela.First;

    while not MCEstatisticaVar.Tabela.Eof do
    begin
      Componente := nil;
      Componente := TelaAtiva.FindComponent(MCEstatisticaVar.Tabela.FieldByName('NOME').asString);
      if Componente <> nil then
      begin
        if GetPropInfo(Componente, 'Color') <> nil then
        begin
          if Componente is TEdit then
            (Componente as TEdit).Color := BuscaCor(MaisCliques, MCEstatisticaVar.Tabela.FieldByName('CLICK').asInteger)
          else if Componente is TMemo then
            (Componente as TMemo).Color := BuscaCor(MaisCliques, MCEstatisticaVar.Tabela.FieldByName('CLICK').asInteger);
        end
        else if GetPropInfo(Componente, 'Font') <> nil then
        begin
          if Componente is TButton then
            (Componente as TButton).Font.Style := [fsBold];
        end;
      end;
      MCEstatisticaVar.Tabela.Next;
    end;

  end;
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
