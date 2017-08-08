unit Utrans;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  TTransForm = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    DBGrid2: TDBGrid;
    FDQuery1: TFDQuery;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TransForm: TTransForm;

implementation

{$R *.dfm}

uses Udm;

procedure TTransForm.Button1Click(Sender: TObject);
begin
   dm.FDConnection1.StartTransaction;
   try
     try
       fdquery1.Close;
       FDQuery1.SQL.Text := 'delete from insa where dept_code = :code';
       FDQuery1.params[0].asstring := dm.dept.fields[0].asstring;
       FDQuery1.ExecSQL;
     except
       showmessage('사원 삭제 오류');
       raise;
     end;
     try
       dm.Dept.Delete;
     except
       showmessage('부서 삭제 오류');
       raise;
     end;
     dm.FDConnection1.commit;
   except
      dm.FDConnection1.rollback;
   end;
   dm.Dept.Refresh;
   dm.insa.Refresh;
end;

procedure TTransForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   action := caFree;
end;

end.
