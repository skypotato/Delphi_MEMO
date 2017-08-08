program sample;

uses
  Vcl.Forms,
  Umain in 'Umain.pas' {MainForm},
  Usplash in 'Usplash.pas' {SplashForm},
  Vcl.Themes,
  Vcl.Styles,
  Udm in 'Udm.pas' {dm: TDataModule},
  Udept in 'Udept.pas' {DeptForm},
  Utrans in 'Utrans.pas' {TransForm},
  Uupdateform in 'Uupdateform.pas' {updateform},
  Utree in 'Utree.pas' {TreeForm},
  Uinsa in 'Uinsa.pas' {InsaForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  SplashForm := TSplashForm.create(application);
  SplashForm.Show;
  SplashForm.Refresh;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TInsaForm, InsaForm);
  splashForm.Hide;
  splashform.Free;
  Application.Run;
end.
