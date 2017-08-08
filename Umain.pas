unit Umain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdActns, Vcl.ExtActns,
  Vcl.ActnList, System.Actions, Vcl.Menus, Vcl.Ribbon,  Vcl.Themes,
  Vcl.Styles,
  Vcl.RibbonSilverStyleActnCtrls, Vcl.ActnMan, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.RibbonActnCtrls, Vcl.ActnMenus, Vcl.RibbonActnMenus,
  Vcl.ToolWin, Vcl.ActnCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  System.Win.TaskbarCore, Vcl.Taskbar, Vcl.JumpList, Vcl.Touch.GestureMgr,
  Vcl.CategoryButtons, Vcl.ButtonGroup;

type

  TMyRec = record
    during:byte;
    teacher:string;
  end;

  p_myREC = ^tmyrec;

  TMainForm = class(TForm)
    ImageList1: TImageList;
    ActionManager1: TActionManager;
    Ribbon1: TRibbon;
    PopupMenu1: TPopupMenu;
    FileOpen1: TFileOpen;
    FileSaveAs1: TFileSaveAs;
    FileExit1: TFileExit;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    EditSelectAll1: TEditSelectAll;
    EditUndo1: TEditUndo;
    EditDelete1: TEditDelete;
    FormatRichEditBold1: TRichEditBold;
    FormatRichEditItalic1: TRichEditItalic;
    FormatRichEditUnderline1: TRichEditUnderline;
    FormatRichEditAlignLeft1: TRichEditAlignLeft;
    FormatRichEditAlignRight1: TRichEditAlignRight;
    FormatRichEditAlignCenter1: TRichEditAlignCenter;
    SearchFind1: TSearchFind;
    SearchFindNext1: TSearchFindNext;
    SearchReplace1: TSearchReplace;
    New_Action: TAction;
    Top_Action: TAction;
    About_Action: TAction;
    Windows_Action: TAction;
    Auric_Action: TAction;
    Silver_Action: TAction;
    RibbonPage1: TRibbonPage;
    RibbonPage2: TRibbonPage;
    RibbonGroup1: TRibbonGroup;
    RibbonGroup2: TRibbonGroup;
    RibbonGroup3: TRibbonGroup;
    RibbonGroup4: TRibbonGroup;
    RibbonGroup5: TRibbonGroup;
    RibbonGroup6: TRibbonGroup;
    RibbonGroup7: TRibbonGroup;
    RibbonApplicationMenuBar1: TRibbonApplicationMenuBar;
    RibbonQuickAccessToolbar1: TRibbonQuickAccessToolbar;
    Open1: TMenuItem;
    SaveAs1: TMenuItem;
    New1: TMenuItem;
    N1: TMenuItem;
    About1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Exit1: TMenuItem;
    RibbonSpinEdit1: TRibbonSpinEdit;
    StatusBar1: TStatusBar;
    GridPanel1: TGridPanel;
    CategoryPanelGroup1: TCategoryPanelGroup;
    RichEdit1: TRichEdit;
    TrayIcon1: TTrayIcon;
    Taskbar1: TTaskbar;
    JumpList1: TJumpList;
    TaskDialog1: TTaskDialog;
    GestureManager1: TGestureManager;
    Timer1: TTimer;
    CategoryPanel1: TCategoryPanel;
    CategoryPanel2: TCategoryPanel;
    CategoryButtons1: TCategoryButtons;
    ButtonGroup1: TButtonGroup;
    조직도: TCategoryPanel;
    TreeView1: TTreeView;
    CategoryPanel3: TCategoryPanel;
    ListView1: TListView;
    Trans_Action: TAction;
    Dept_Action: TAction;
    treeview_action: TAction;
    Action1: TAction;
    test_action: TAction;
    CategoryPanel4: TCategoryPanel;
    insa_Action: TAction;
    RibbonPage3: TRibbonPage;
    RibbonGroup8: TRibbonGroup;
    RibbonGroup9: TRibbonGroup;
    RibbonGroup10: TRibbonGroup;
    CategoryPanel5: TCategoryPanel;
    procedure Windows_ActionExecute(Sender: TObject);
    procedure Auric_ActionExecute(Sender: TObject);
    procedure Silver_ActionExecute(Sender: TObject);
    procedure Top_ActionExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RichEdit1Gesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure RibbonSpinEdit1Change(Sender: TObject);
    procedure New_ActionExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FileOpen1BeforeExecute(Sender: TObject);
    procedure FileOpen1Accept(Sender: TObject);
    procedure FileSaveAs1BeforeExecute(Sender: TObject);
    procedure FileSaveAs1Accept(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ShowHint(Sender:TOBJECT);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TreeView1Click(Sender: TObject);
    procedure myexceptionHandler(sender:tobject; e:exception);
    procedure RichEdit1Change(Sender: TObject);
    procedure test_actionExecute(Sender: TObject);
    procedure insa_ActionExecute(Sender: TObject);
    procedure Dept_ActionExecute(Sender: TObject);
    procedure Trans_ActionExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure treeview_actionExecute(Sender: TObject);
  private
    function GetCurrpos(RichEdit:TRichEdit):integer;
    function GetCurrLine(RichEdit:TRichEdit):integer;
    { Private declarations }
  public
    { Public declarations }
  end;
var
  MainForm: TMainForm;

implementation

uses Uinsa, Udept, Utrans, Uupdateform, Utree;

var
  p:p_myrec;
  t:TTreeNode;
  h:THandle;
{$R *.dfm}




procedure TMainForm.Action1Execute(Sender: TObject);
begin
  updateform := tupdateform.create(application);
  updateform.show;
end;

procedure TMainForm.Auric_ActionExecute(Sender: TObject);
begin
    TStyleManager.TrySetStyle('auric');
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  if TaskDialog1.Execute then
     showmessage('ok');
end;

procedure TMainForm.Dept_ActionExecute(Sender: TObject);
begin
  deptForm := TDeptForm.create(Application);
  DeptForm.show;
end;

procedure TMainForm.FileOpen1Accept(Sender: TObject);
begin
  try
     RichEdit1.Lines.LoadFromFile(FileOpen1.Dialog.FileName);
  except
    on eFopenError  do
       ShowMessage('지정한 파일이 없습니다');
    on eOutOfMemory do
       ShowMessage('사이즈가 너무 큽니다')
  end;
end;

procedure TMainForm.FileOpen1BeforeExecute(Sender: TObject);
begin
  FileOpen1.Dialog.InitialDir := 'd:\';
  FileOpen1.Dialog.Filter := '유니트화일|*.pas|텍스트화일|*.txt';
end;

procedure TMainForm.FileSaveAs1Accept(Sender: TObject);
begin
 try
   RichEdit1.Lines.SaveToFile(FileSaveAs1.Dialog.FileName);
 except
   on ewriteError do
      ShowMessage('파일 저장 오류');
 end;
end;

procedure TMainForm.FileSaveAs1BeforeExecute(Sender: TObject);
begin
   FileSaveAs1.Dialog.InitialDir := 'D:\';
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i:byte;
begin
  for I := 0 to treeview1.Items.Count - 1 do
    if not treeview1.Items[i].HasChildren then
       if treeview1.Items[i].Data <> nil then
          dispose(treeview1.Items[i].Data);

end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if RichEdit1.Lines.Text  <> '' then
  begin
    ShowMessage('메모장 지우시고 종료하십시오');
    CanClose := False;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  listItem :TListItem;
begin
  RibbonSpinEdit1.Value := RichEdit1.Font.Size;
  Application.OnHint := ShowHint;
//  Application.OnException := myExceptionHandler;
  t := Ttreenode.create(treeview1.Items);
  treeview1.selected := treeview1.Items.Add(t, '교육부');
//  treeview1.Items.AddChild(treeview1.selected , '델파이');
//  treeview1.Items.AddChild(treeview1.selected , '자바');
  new(p);
  p_myrec(p)^.during := 4;
  p_myrec(p)^.teacher := '김원경';
  treeview1.Items.AddChildObject(treeview1.selected, '델파이',p);

  new(p);
  p_myrec(p)^.during := 3;
  p_myrec(p)^.teacher := '아무개';
  treeview1.Items.AddChildObject(treeview1.selected, '자바',p);

  ListItem := ListView1.Items.add;
  ListItem.Caption := '김원경';
  ListItem.SubItems.Add('강사');
end;

function TMainForm.GetCurrLine(RichEdit: TRichEdit): integer;
begin
  result := RichEdit.Perform(EM_LINEFROMCHAR, RichEdit.SelStart,0);

end;

function TMainForm.GetCurrpos(RichEdit: TRichEdit): integer;
begin
  result := RichEdit.SelStart -
  RichEdit.Perform(EM_LINEINDEX, GetCurrLine(RichEdit),0)

end;

procedure TMainForm.insa_ActionExecute(Sender: TObject);
begin
  InsaForm := TinsaForm.create(application);
  insaForm.show;

end;

procedure TMainForm.myexceptionHandler(sender: tobject; e: exception);
begin
  if e is EaccessViolation  then
     ShowMessage('억세스 오류')
  else if e is eConvertError then
     showmessage('컴버전 오류')
  else if e is einvalidCast then
     ShowMessage('as연산자 오류')
  else if e is efopenError then
     ShowMessage('파일 오픈 오류')
   else application.ShowException(e);
 end;

procedure TMainForm.New_ActionExecute(Sender: TObject);
begin
  RichEdit1.Lines.Clear;
end;

procedure TMainForm.RibbonSpinEdit1Change(Sender:TObject);
begin
  RichEdit1.Font.size := RibbonSpinEdit1.Value;
end;

procedure TMainForm.RichEdit1Change(Sender: TObject);
begin
  Statusbar1.Panels[1].Text :=
  Format('현재컬럼:%d 현재라인:%d',[GetCurrPos(RichEdit1) +1,
  GetCurrLine(RichEdit1) + 1]);
end;

procedure TMainForm.RichEdit1Gesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
   case EventInfo.GestureID of
      sgiSquare: Showmessage('사각형');
      sgiCircle: Showmessage('원');
      sgiTriAngle: Showmessage('삼각형');
      sgiCheck:ShowMessage('체크');
   end;
end;

procedure TMainForm.ShowHint(Sender: TOBJECT);
begin
 statusBar1.Panels[0].Text := Application.Hint;
 //application.hintPause
end;

procedure TMainForm.Silver_ActionExecute(Sender: TObject);
begin
    TStyleManager.TrySetStyle('silver');
end;
procedure TMainForm.test_actionExecute(Sender: TObject);
begin
    showmessage('test');
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[2].Text :=
  FormatDateTime('yyyy-mmmm-dd dddd hh:nn:ss ampm',now);   //date,time;
end;

procedure TMainForm.Top_ActionExecute(Sender: TObject);
begin
  Top_action.Checked := not  Top_action.Checked;
  if Top_action.Checked then
     FormStyle := fsStayOnTop
  else
     FormStyle := fsNormal;
end;


procedure TMainForm.Trans_ActionExecute(Sender: TObject);
begin
  transForm := ttransform.create(application);
  transform.show;
end;

procedure TMainForm.TreeView1Click(Sender: TObject);
begin
   t := Treeview1.Selected;
    if T.Data <> NIL then
       SHOWMESSAGE(P_myrec(t.Data)^.teacher);
end;

procedure TMainForm.treeview_actionExecute(Sender: TObject);
begin
  treeform := ttreeform.Create(application);
  treeform.Show;
end;

procedure TMainForm.Windows_ActionExecute(Sender: TObject);
begin
 TStyleManager.TrySetStyle('windows');
end;

end.
