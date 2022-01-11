unit unPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, MCEdit, MCButton, MCMemo, MCEstatistica, DB, Grids, DBGrids,
  TypInfo;

type

  TfmPrincipal = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Label5: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edNome: TEdit;
    Label3: TLabel;
    edGondola: TEdit;
    Label2: TLabel;
    edPreco: TEdit;
    Label4: TLabel;
    edCST: TEdit;
    Label6: TLabel;
    mmObeservacao: TMemo;
    btCadastrar: TButton;
    btPintar: TButton;
    procedure btCadastrarClick(Sender: TObject);
    procedure btPintarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPrincipal: TfmPrincipal;

implementation

{$R *.dfm}

{ TEdit }


procedure TfmPrincipal.btCadastrarClick(Sender: TObject);
begin
  ShowMessage('Produto cadastrado com sucesso!');
end;

procedure TfmPrincipal.btPintarClick(Sender: TObject);
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
      Componente := FindComponent(MCEstatisticaVar.Tabela.FieldByName('NOME').asString);
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

end.
