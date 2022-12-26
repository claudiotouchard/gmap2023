program gmap2023;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {fprincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfprincipal, fprincipal);
  Application.Run;
end.
