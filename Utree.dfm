object TreeForm: TTreeForm
  Left = 0
  Top = 0
  Caption = #51312#51649#46020
  ClientHeight = 304
  ClientWidth = 337
  Color = clBtnFace
  DragKind = dkDock
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    337
    304)
  PixelsPerInch = 96
  TextHeight = 13
  object TreeView1: TTreeView
    Left = 8
    Top = 16
    Width = 153
    Height = 281
    Anchors = [akLeft, akTop, akRight, akBottom]
    Indent = 19
    TabOrder = 0
    OnClick = TreeView1Click
  end
  object ListView1: TListView
    Left = 175
    Top = 16
    Width = 154
    Height = 281
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = <
      item
        Caption = #51060#47492
      end
      item
        Caption = #51649#44553
      end>
    TabOrder = 1
    ViewStyle = vsReport
  end
  object Dept_query: TFDQuery
    Connection = dm.FDConnection1
    SQL.Strings = (
      'select * from dept'
      'order by dept,section')
    Left = 41
    Top = 96
  end
  object Insa_QUERY: TFDQuery
    Connection = dm.FDConnection1
    SQL.Strings = (
      'select name,class'
      'from insa'
      'where dept_code =:code')
    Left = 197
    Top = 116
    ParamData = <
      item
        Name = 'CODE'
        ParamType = ptInput
      end>
  end
end
