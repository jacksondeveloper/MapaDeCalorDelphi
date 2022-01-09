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
    Edit1: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label6: TLabel;
    Memo1: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
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


procedure TfmPrincipal.Button1Click(Sender: TObject);
begin
  ShowMessage('Produto cadastrado com sucesso!');
end;

end.
