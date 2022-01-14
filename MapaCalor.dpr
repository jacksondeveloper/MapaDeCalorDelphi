program MapaCalor;

uses
  Forms,
  unPrincipal in 'src\unPrincipal.pas' {fmPrincipal},
  MCButton in 'src\mapadecalor\MCButton.pas',
  MCEdit in 'src\mapadecalor\MCEdit.pas',
  MCEstatistica in 'src\mapadecalor\MCEstatistica.pas',
  MCMemo in 'src\mapadecalor\MCMemo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmPrincipal, fmPrincipal);
  Application.Run;
end.
