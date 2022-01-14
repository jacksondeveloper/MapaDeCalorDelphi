unit MCButton;

interface

uses
  StdCtrls, MCEstatistica;

type
  TButton = class(StdCtrls.TButton)
  private
  protected
    procedure Click; override;
  public
  end;

implementation

{ TEdit }

procedure TButton.Click;
begin
  inherited;
  MCEstatisticaVar.Inserir(Self.Name);
end;

end.

