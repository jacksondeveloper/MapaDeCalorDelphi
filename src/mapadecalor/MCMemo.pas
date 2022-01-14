unit MCMemo;

interface

uses
  StdCtrls, MCEstatistica;

type
  TMemo = class(StdCtrls.TMemo)
  protected
    procedure DoEnter; override;
  public
  end;

implementation

{ TEdit }

procedure TMemo.DoEnter;
begin
  inherited;
  MCEstatisticaVar.Inserir(Self.Name);
end;

end.

