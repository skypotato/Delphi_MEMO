unit Uinsa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask,
  Data.DB,FireDAC.Stan.Error;

type
  TInsaForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    t2: TTabSheet;
    t3: TTabSheet;
    TabControl1: TTabControl;
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    DBImage1: TDBImage;
    DBRadioGroup1: TDBRadioGroup;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DBEdit2: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure TabControl1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InsaForm: TInsaForm;


implementation

{$R *.dfm}

uses Udm;

procedure TInsaForm.Button2Click(Sender: TObject);
begin
  if Messagedlg('정말 삭제 할래 ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes  then
     try
       dm.Insa.Delete;
     except
       on e:EFDDBEngineException do
          if e.Kind = ekUKViolated then
              showmessage('삭제 키 오류')
          else if e.Kind = ekRecordLocked then
               SHowMessage('레코드 락')
          else ShowMessage(inttostr(e.ErrorCode))

  end;
     end;


procedure TInsaForm.Button3Click(Sender: TObject);
begin
  dm.Insa.Cancel;
end;

procedure TInsaForm.Button4Click(Sender: TObject);
begin
//  if dm.Insa.State = dsbrowse then
//
// raise Exception.Create('조회중');

  try
    dm.Insa.Post;
  except
   on e:EFDDBEngineException do
        ShowMessage(inttostr(e.ErrorCode))

  end;
end;

procedure TInsaForm.ComboBox1Change(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
    0:
    begin
      dm.Insa.IndexName := 'I_ID';
//      dm.InsaID.Index:=0;
      dm.Insa.FieldByName('ID').Index := 0;
    end;
    1:
    begin
      dm.Insa.IndexName := 'I_NAME';
      dm.Insa.FieldByName('NAME').Index := 0;
    end;
    2:
    begin
      dm.Insa.IndexName := 'I_DEPT';
      dm.Insa.FieldByName('DEPT_CODE').Index := 0;
    end;
  end;
end;

procedure TInsaForm.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
     vk_return: selectNext(sender as twincontrol, true, true);
     vk_up:selectNext(sender as twincontrol, false, true);
     vk_down: selectNext(sender as twincontrol, true, true);
   end;
end;

procedure TInsaForm.Edit1Change(Sender: TObject);
begin
  dm.Insa.IndexFieldNames := 'name';
  dm.Insa.FindNearest([edit1.Text]);
end;

procedure TInsaForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 if key  = #13 then
    if NOT dm.Insa.FindKey([edit1.Text]) then
       showmessage('그런 사람 없음');

// if not dm.insa.Locate('name', edit1.text, []) then
// [loCaseInsesitive,loPartialkey]
end;

procedure TInsaForm.FormActivate(Sender: TObject);
begin
   dm.InsaSourceStateChange(dm.InsaSource);
   DM.InsaSourceDataChange(DM.InsaSource, DM.InsaID);
end;

procedure TInsaForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.InsaSource.OnStateChange := nil;
  DM.InsaSource.OnDataChange := NIL;
  action := cafree;
end;

procedure TInsaForm.FormCreate(Sender: TObject);
begin
  dm.InsaSource.OnStateChange := dm.InsaSourceStateChange;
  DM.InsaSource.OnDataChange := DM.InsaSourceDataChange;
end;

procedure TInsaForm.SpeedButton1Click(Sender: TObject);
begin
  dm.Insa.First;
end;

procedure TInsaForm.SpeedButton2Click(Sender: TObject);
begin
  if not dm.Insa.Bof then
     DM.Insa.Prior;
end;

procedure TInsaForm.SpeedButton3Click(Sender: TObject);
begin
  if not dm.Insa.Eof then
     dm.Insa.Next;
end;

procedure TInsaForm.SpeedButton4Click(Sender: TObject);
begin
  dm.Insa.Last;
end;

procedure TInsaForm.TabControl1Change(Sender: TObject);
begin
   if TabControl1.TabIndex = 0 then
     dm.Insa.Filtered := false
   else
   begin
     dm.Insa.Filtered := true;
     dm.Insa.Filter :=
     'class=' + '''' + TabControl1.Tabs[tabcontrol1.tabindex] + '''';
   end;

end;

end.
