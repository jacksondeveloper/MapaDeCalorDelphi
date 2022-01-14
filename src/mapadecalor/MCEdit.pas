unit MCEdit;

interface

uses
  StdCtrls, MCEstatistica;

type
  TEdit = class(StdCtrls.TEdit)
  protected
    procedure DoEnter; override;
  public
  end;

implementation

{ TEdit }

procedure TEdit.DoEnter;
begin
  inherited;
  MCEstatisticaVar.Inserir(Self.Name);
end;

end.

