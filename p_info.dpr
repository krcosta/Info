program p_info;

uses
  Forms,
  u_principal in 'u_principal.pas' {f_principal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tf_principal, f_principal);
  Application.Run;
end.
