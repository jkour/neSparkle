program DelphiSparkleExample;

uses
  System.StartUpCopy,
  FMX.Forms,
  MainUnit in 'MainUnit.pas'; {Form4}

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
