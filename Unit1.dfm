object Form1: TForm1
  Left = 416
  Top = 146
  Width = 543
  Height = 500
  Caption = 'LRC2SRT - Please Load a Lyric File'
  Color = clWindow
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnResize = FormResize
  DesignSize = (
    527
    461)
  PixelsPerInch = 96
  TextHeight = 13
  object lv: TListView
    Left = 8
    Top = 8
    Width = 513
    Height = 327
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelInner = bvSpace
    BevelOuter = bvSpace
    BevelKind = bkFlat
    Checkboxes = True
    Color = clWhite
    Columns = <
      item
        Caption = '#'
      end
      item
        Caption = 'Min'
        Width = 0
      end
      item
        Caption = 'Sec'
        Width = 0
      end
      item
        Caption = 'MS'
        Width = 0
      end
      item
        Caption = 'Subtitle'
        Width = 450
      end>
    ColumnClick = False
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    GridLines = True
    ReadOnly = True
    RowSelect = True
    ParentFont = False
    TabOrder = 0
    ViewStyle = vsReport
    OnChange = lvChange
    OnClick = lvClick
    OnData = lvData
  end
  object Panel1: TPanel
    Left = 0
    Top = 335
    Width = 527
    Height = 126
    Align = alBottom
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    DesignSize = (
      527
      126)
    object Panel2: TPanel
      Left = 3
      Top = 6
      Width = 521
      Height = 121
      Anchors = []
      BevelOuter = bvNone
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      object GroupBox1: TGroupBox
        Left = 152
        Top = 8
        Width = 361
        Height = 105
        Caption = 'Editing'
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 36
          Width = 46
          Height = 13
          Caption = 'Content :'
        end
        object Label2: TLabel
          Left = 8
          Top = 12
          Width = 48
          Height = 13
          Caption = 'Duration :'
        end
        object SpeedButton1: TSpeedButton
          Left = 328
          Top = 8
          Width = 25
          Height = 22
          Cursor = crHandPoint
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF534645534645534645534645534645534645FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB58E7BB59284F7E3D6EFE3DEEF
            E3DEF7E7DEF7E3D6BDA69C534645534645FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            BDA69CF7E7DEFFF3F7E7DBD6DEB29CD6A68CE7C7BDEFEBEFF7F3F7F7E3D6E7CB
            BD534645FFFFFFFFFFFFFFFFFFBDA69CF7EBE7FFFFFFC68E73BD5D29BD5D29DE
            B29CBD5D29BD5D29D69E84F7F3F7F7E7DED6C7BD534645FFFFFFFFFFFFBDA69C
            FFFFFFCE6D42BD5D29BD5D29C6A294FFFFFFE78252BD5D29BD5D29D69673FFFB
            F7F7E3D6534645FFFFFFBDA69CFFFBFFDE9E7BBD5D29CE6531CE6531CE6939D6
            8A63CE6531CE6531BD5D29BD5D29E7CBBDF7EFEFDECBC6534645D6C7BDFFF7F7
            C66131BD5D29CE6531BD5D29CE8663F7E7DED66939BD5D29CE6531BD5D29CE71
            42FFFFFFE7CBBD534645D6C7BDF7DFD6BD5D29CE6531CE6531BD5D29D68252FF
            FBFFE7AE94BD5D29BD5D29CE6531BD5D29FFEFEFF7DFD6534645D6C7BDF7D7CE
            CE6531CE6531CE6531CE6531BD5D29DEAA94FFF7F7EF9E73BD5D29CE6531BD5D
            29F7F3EFEFE3DE534645D6C7BDFFEFE7D66939CE6531CE6531BD5D29BD5D29BD
            5D29E7CFC6FFFFFFD66939CE6531CE6939FFFBFFF7DFD6534645D6C7BDFFFFFF
            F79A6BD66939CE8E6BF7EBE7D68252BD5D29D69673FFFFFFE78E5ABD5D29EF92
            63FFFFFFD6C7BD534645FFFFFFD6C7BDFFEBDEEF8652E78252F7F7F7FFFFFFDE
            BAADFFFFFFF7F7F7DE7142D67139FFF3EFF7E7E7534645FFFFFFFFFFFFD6C7BD
            FFFFFFFFEFD6FFAA73EFAA8CEFE3DEEFEFEFF7E7E7FFA67BF78E5AF7DBCEFFFF
            FFD6C7BDFFFFFFFFFFFFFFFFFFFFFFFFD6C7BDFFFFFFFFFFFFFFF3C6FFDFADFF
            D39CFFC794FFD7ADFFFFFFFFFFFFD6C7BDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFD6C7BDD6C7BDFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFDECBC6D6C7BDFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDECBC6D6C7BDD6
            C7BDD6C7BDD6C7BDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = SpeedButton1Click
        end
        object msub: TMemo
          Left = 64
          Top = 40
          Width = 289
          Height = 57
          BevelInner = bvSpace
          BevelKind = bkFlat
          BevelOuter = bvSpace
          Color = clWhite
          Ctl3D = False
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 0
          OnChange = msubChange
          OnClick = seminChange
        end
        object semin: TSpinEdit
          Left = 64
          Top = 11
          Width = 40
          Height = 26
          Color = clWhite
          Ctl3D = False
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          MaxValue = 59
          MinValue = 0
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          Value = 0
          OnChange = seminChange
        end
        object sesec: TSpinEdit
          Left = 107
          Top = 11
          Width = 40
          Height = 26
          Color = clWhite
          Ctl3D = False
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          MaxValue = 60
          MinValue = 0
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
          Value = 0
          OnChange = sesecChange
          OnClick = seminChange
        end
        object sems: TSpinEdit
          Left = 150
          Top = 11
          Width = 40
          Height = 26
          Color = clWhite
          Ctl3D = False
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          MaxValue = 100
          MinValue = 0
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
          Value = 0
          OnChange = semsChange
          OnClick = seminChange
        end
        object ba: TButton
          Left = 231
          Top = 8
          Width = 97
          Height = 25
          Caption = 'Apply Changes'
          Enabled = False
          TabOrder = 4
          OnClick = baClick
        end
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 8
        Width = 137
        Height = 105
        Caption = 'File'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        OnClick = GroupBox2Click
        object Button2: TButton
          Left = 8
          Top = 60
          Width = 121
          Height = 33
          Caption = 'Save As SRT'
          TabOrder = 0
          OnClick = Button2Click
        end
        object Button1: TButton
          Left = 8
          Top = 20
          Width = 121
          Height = 33
          Caption = 'Open Lyric File'
          TabOrder = 1
          OnClick = Button1Click
        end
      end
    end
  end
end
