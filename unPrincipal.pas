unit unPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, MCEdit, MCButton, MCMemo, MCEstatistica, DB, Grids, DBGrids;

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


procedure TfmPrincipal.btPintarClick(Sender: TObject);
begin
  MCEstatisticaVar.PintarComponentes(Self);
end;

end.
