object dm: Tdm
  OldCreateOrder = False
  Height = 331
  Width = 432
  object FDConnection1: TFDConnection
    Params.Strings = (
      'MonitorBy=FlatFile'
      'ConnectionDef=SAMPLE')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 32
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 128
    Top = 32
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 88
    Top = 32
  end
  object Dept: TFDTable
    Active = True
    IndexFieldNames = 'CODE'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'DEPT'
    TableName = 'DEPT'
    Left = 48
    Top = 120
  end
  object DeptSource: TDataSource
    DataSet = Dept
    OnDataChange = DeptSourceDataChange
    Left = 88
    Top = 120
  end
  object Insa: TFDTable
    Active = True
    BeforeInsert = InsaBeforeInsert
    OnCalcFields = InsaCalcFields
    OnNewRecord = InsaNewRecord
    IndexFieldNames = 'NAME'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'INSA'
    TableName = 'INSA'
    Left = 48
    Top = 216
    object InsaID: TIntegerField
      Alignment = taCenter
      DisplayLabel = #49324#48264
      DisplayWidth = 10
      FieldName = 'ID'
      LookupDataSet = Dept
      LookupKeyFields = 'CODE'
      LookupResultField = 'SECTION'
      Origin = 'ID'
      Required = True
    end
    object InsaNAME: TStringField
      DisplayLabel = #51060#47492
      DisplayWidth = 10
      FieldName = 'NAME'
      Origin = 'NAME'
      Size = 10
    end
    object InsaAGE: TSmallintField
      DisplayLabel = #45208#51060
      DisplayWidth = 10
      FieldName = 'AGE'
      Origin = 'AGE'
      MaxValue = 60
      MinValue = 20
    end
    object InsaDEPT_CODE: TStringField
      DisplayLabel = #48512#49436#53076#46300
      DisplayWidth = 8
      FieldName = 'DEPT_CODE'
      Origin = 'DEPT_CODE'
      Size = 4
    end
    object InsaCLASS: TStringField
      DisplayLabel = #51649#44553
      DisplayWidth = 4
      FieldName = 'CLASS'
      Origin = 'CLASS'
      Size = 4
    end
    object InsaIPSA_DATE: TSQLTimeStampField
      DisplayLabel = #51077#49324#51068#51088
      DisplayWidth = 17
      FieldName = 'IPSA_DATE'
      Origin = 'IPSA_DATE'
      DisplayFormat = 'yyyy'#45380'mm'#50900'dd'#51068
      EditMask = '!9999/99/00;1;_'
    end
    object InsaSALARY: TIntegerField
      DisplayLabel = #44553#50668
      DisplayWidth = 13
      FieldName = 'SALARY'
      Origin = 'SALARY'
      DisplayFormat = '#,##0'#50896
    end
    object Insatax: TFloatField
      DisplayLabel = #49464#44552
      FieldKind = fkCalculated
      FieldName = 'tax'
      DisplayFormat = '#,##0'#50896
      Calculated = True
    end
    object InsaPHOTO: TBlobField
      DisplayLabel = #49324#51652
      DisplayWidth = 10
      FieldName = 'PHOTO'
      Origin = 'PHOTO'
      Visible = False
    end
    object InsaGRADE: TStringField
      DisplayLabel = #46321#44553
      DisplayWidth = 4
      FieldName = 'GRADE'
      Origin = 'GRADE'
      Size = 1
    end
  end
  object InsaSource: TDataSource
    DataSet = Insa
    Left = 88
    Top = 216
  end
  object InsaQuery: TFDQuery
    Active = True
    MasterSource = DeptSource
    MasterFields = 'CODE'
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'select * from insa'
      'where dept_code = :code')
    Left = 224
    Top = 120
    ParamData = <
      item
        Name = 'CODE'
        DataType = ftString
        ParamType = ptInput
        Size = 4
        Value = 'E001'
      end>
  end
  object InsaQuerySource: TDataSource
    DataSet = InsaQuery
    Left = 272
    Top = 120
  end
  object FDMoniFlatFileClientLink1: TFDMoniFlatFileClientLink
    FileName = 'd:\trace35.txt'
    Tracing = True
    Left = 176
    Top = 32
  end
  object FDBatchMove1: TFDBatchMove
    Mappings = <>
    LogFileName = 'Data.log'
    Left = 224
    Top = 216
  end
end
