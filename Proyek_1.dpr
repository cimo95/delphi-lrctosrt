program Proyek_1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Title := 'LRC2SRT';
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
