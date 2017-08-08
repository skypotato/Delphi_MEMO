unit Udept;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDeptForm = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    DBGrid2: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    StringGrid1: TStringGrid;
    totQuery: TFDQuery;
    FDStoredProc1: TFDStoredProc;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DeptForm: TDeptForm;

implementation

{$R *.dfm}

uses Udm;

procedure TDeptForm.Button1Click(Sender: TObject);
begin
   if Edit1.Text = '' then
      raise Exception.Create('부서 코드는 반드시 입력하십시오');

   if dm.Dept.Locate('code', edit1.Text, []) then
      raise Exception.Create('이미 등록된 부서코드입니다');

   FDStoredProc1.Close;
   FDStoredProc1.ParamByName('pcode').AsString := edit1.Text;
   FDStoredProc1.ParamByName('pdept').AsString := edit2.Text;
   FDStoredProc1.ParamByName('psection').AsString := edit3.Text;
   FDStoredProc1.ExecProc;

   dm.Dept.Refresh;
end;

procedure TDeptForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   action := caFree;
end;

procedure TDeptForm.FormCreate(Sender: TObject);
var
  i:integer;
begin
  StringGrid1.RowCount := dm.Dept.RecordCount + 2;
  StringGrid1.Cells[0,0] := '부서명';
  StringGrid1.Cells[1,0] := '팀  명';
  StringGrid1.Cells[2,0] := '인원수';

  for I := 1 to dm.Dept.recordcount do
  begin
     StringGrid1.Cells[0,i]  := '';
     StringGrid1.Cells[1,i]  := '';
     StringGrid1.Cells[2,i]  := '';
  end;

  dm.Dept.first;
  for I := 1 to dm.Dept.RecordCount do
  begin
    StringGrid1.Cells[0,i]  := dm.Dept.FieldByName('dept').AsString;
    StringGrid1.Cells[1,i]  := dm.Dept.FieldByName('section').AsString;
    totquery.Close;
    totquery.Params[0].AsString := dm.Dept.FieldByName('code').AsString;
    totquery.Open;
    StringGrid1.Cells[2,i]  := totquery.FieldByName('total').AsString;
    dm.Dept.Next;
  end;
   StringGrid1.Cells[2,i] := '총인원수';
   totquery.Close;
   totquery.Params[0].AsString := '%';
   totquery.Open;
   StringGrid1.Cells[2,i]  := totquery.FieldByName('total').AsString;
end;

procedure TDeptForm.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  s:string;
  pos:integer;
  oldalign:integer;
begin
  s := stringgrid1.Cells[acol, arow];
  with stringGrid1.Canvas do
  begin
    fillrect(rect);
    begin
      if arow = 0 then
      begin
        Font.Color := clblue;
        Font.Size := Font.Size + 4;
      end;
      if (acol = 2 ) and (arow <> 0) then
      begin
        Font.Color := clred;
        Font.Size := Font.Size + 4;
        s  := s + '명';
        oldalign := setTextalign(handle, ta_right);
        textrect(rect, rect.right, rect.Top+3, s);
        setTextalign(handle,oldalign);
      end
    else
    begin
      pos := ((rect.Right - rect.Left) - textwidth(s)) div 2;
      textrect(rect, rect.Left+pos, rect.Top+3, s);
    end;
  end;
  end;
end;

end.
