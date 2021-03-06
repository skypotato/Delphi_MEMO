unit Udm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.IBBase, data.sqltimst,
  FireDAC.Comp.UI, FireDAC.Moni.Base, FireDAC.Moni.FlatFile,
  FireDAC.Comp.BatchMove;

type
  Tdm = class(TDataModule)
    FDConnection1: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    Dept: TFDTable;
    DeptSource: TDataSource;
    Insa: TFDTable;
    InsaSource: TDataSource;
    InsaID: TIntegerField;
    InsaNAME: TStringField;
    InsaAGE: TSmallintField;
    InsaDEPT_CODE: TStringField;
    InsaCLASS: TStringField;
    InsaIPSA_DATE: TSQLTimeStampField;
    InsaSALARY: TIntegerField;
    InsaPHOTO: TBlobField;
    InsaGRADE: TStringField;
    Insatax: TFloatField;
    InsaQuery: TFDQuery;
    InsaQuerySource: TDataSource;
    FDMoniFlatFileClientLink1: TFDMoniFlatFileClientLink;
    FDBatchMove1: TFDBatchMove;
    procedure InsaCalcFields(DataSet: TDataSet);
    procedure InsaNewRecord(DataSet: TDataSet);
    procedure InsaBeforeInsert(DataSet: TDataSet);
    procedure InsaSourceStateChange(Sender: TObject);
    procedure InsaSourceDataChange(Sender: TObject; Field: TField);
    procedure DeptSourceDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Uinsa;

{$R *.dfm}

procedure Tdm.DeptSourceDataChange(Sender: TObject; Field: TField);
begin
//  InsaQuery.Close;
//  InsaqUERY.Params[0].AsString :=
//  dept.FieldByName('code').AsString;
//  InsaQuery.Open;  //select  // execsql: delete insert,update
end;

procedure Tdm.InsaBeforeInsert(DataSet: TDataSet);
begin
  insaForm.DBEdit1.setfocus;
end;

procedure Tdm.InsaCalcFields(DataSet: TDataSet);
begin
  insatax.Value := insasalary.value * 0.1;
end;

procedure Tdm.InsaNewRecord(DataSet: TDataSet);
begin
  insasalary.Value := 3000000;
  insaGrade.value := '1';
  insaIpsa_date.Value := DateTimeToSqlTimestamp(now);
end;

procedure Tdm.InsaSourceDataChange(Sender: TObject; Field: TField);
begin
  insaform.SpeedButton1.Enabled := not insa.Bof;
  insaform.SpeedButton2.Enabled := not insa.Bof;
  insaform.SpeedButton3.Enabled := not insa.Eof;
  insaform.SpeedButton4.Enabled := not insa.Eof;
end;

procedure Tdm.InsaSourceStateChange(Sender: TObject);
begin
   insaform.button1.Enabled := insa.State = dsbrowse;
   insaform.button2.Enabled := insa.State = dsbrowse;
   insaform.button3.Enabled := insa.state in [dsinsert, dsedit];
   insaform.button4.Enabled := insa.state in [dsinsert, dsedit];
end;

end.
