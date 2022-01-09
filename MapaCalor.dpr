program MapaCalor;

uses
  Forms,
  unPrincipal in 'unPrincipal.pas' {fmPrincipal},
  MCEdit in 'MCEdit.pas',
  MCEstatistica in 'MCEstatistica.pas',
  MCButton in 'MCButton.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmPrincipal, fmPrincipal);
  Application.Run;
end.
