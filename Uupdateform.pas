unit Uupdateform;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Bind.Grid, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, Vcl.Mask, FireDAC.Stan.StorageBin;

type
  Tupdateform = class(TForm)
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    DBNavigator1: TDBNavigator;
    Button1: TButton;
    CheckBox1: TCheckBox;
    DBNavigator2: TDBNavigator;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    FDUpdateSQL1: TFDUpdateSQL;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Button5: TButton;
    Button6: TButton;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  updateform: Tupdateform;

implementation

{$R *.dfm}

uses Udm;

procedure Tupdateform.Button1Click(Sender: TObject);
begin
// fdquery1.Delete;
 dm.FDConnection1.ApplyUpdates([fdquery1]);
end;

procedure Tupdateform.Button2Click(Sender: TObject);
begin
  dm.Dept.cancelupdates;
end;

procedure Tupdateform.Button3Click(Sender: TObject);
begin
  dm.Dept.RevertRecord;
end;

procedure Tupdateform.Button4Click(Sender: TObject);
begin
  dm.Dept.ApplyUpdates(-1);
end;

procedure Tupdateform.Button5Click(Sender: TObject);
begin
  dm.Dept.Loadfromfile('sample');
end;

procedure Tupdateform.Button6Click(Sender: TObject);
begin
  dm.Dept.SaveToFile('sample');
end;

procedure Tupdateform.CheckBox1Click(Sender: TObject);
begin
//  checkBox1.Checked := not checkBox1.Checked;
  dm.dept.CachedUpdates := checkBox1.Checked;
end;

procedure Tupdateform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

end.
