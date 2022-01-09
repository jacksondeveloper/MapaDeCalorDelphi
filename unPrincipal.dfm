object fmPrincipal: TfmPrincipal
  Left = 288
  Top = 214
  Width = 608
  Height = 318
  Caption = 'fmPrincipal'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 14
    Width = 28
    Height = 13
    Caption = 'Nome'
  end
  object Label2: TLabel
    Left = 16
    Top = 62
    Width = 28
    Height = 13
    Caption = 'Pre'#231'o'
  end
  object Label3: TLabel
    Left = 16
    Top = 110
    Width = 40
    Height = 13
    Caption = 'G'#244'ndola'
  end
  object Label4: TLabel
    Left = 20
    Top = 161
    Width = 21
    Height = 13
    Caption = 'CST'
  end
  object Label5: TLabel
    Left = 192
    Top = 12
    Width = 53
    Height = 13
    Caption = 'Estatisticas'
  end
  object Edit1: TEdit
    Left = 16
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Arroz'
  end
  object Edit2: TEdit
    Left = 16
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '10,99'
  end
  object DBGrid1: TDBGrid
    Left = 192
    Top = 30
    Width = 377
    Height = 219
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Edit3: TEdit
    Left = 16
    Top = 128
    Width = 121
    Height = 21
    TabOrder = 3
    Text = '1234'
  end
  object Edit4: TEdit
    Left = 17
    Top = 176
    Width = 121
    Height = 21
    TabOrder = 4
    Text = '00'
  end
  object Button1: TButton
    Left = 40
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 5
  end
  object DataSource1: TDataSource
    Left = 224
    Top = 120
  end
end
