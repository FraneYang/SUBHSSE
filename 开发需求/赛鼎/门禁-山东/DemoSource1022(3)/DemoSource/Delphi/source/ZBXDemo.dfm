object Form1: TForm1
  Left = 497
  Top = 176
  Width = 350
  Height = 451
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = onDestory
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 32
    Width = 13
    Height = 13
    Caption = 'IP:'
  end
  object GroupBox1: TGroupBox
    Left = 24
    Top = 8
    Width = 289
    Height = 73
    Caption = #35774#22791
    TabOrder = 3
    object Label2: TLabel
      Left = 8
      Top = 24
      Width = 46
      Height = 17
      Caption = #35774#22791'IP'#65306
    end
  end
  object edtDevIP: TEdit
    Left = 80
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '192.168.1.180'
  end
  object Button1: TButton
    Left = 216
    Top = 32
    Width = 75
    Height = 25
    Caption = #36830#25509
    TabOrder = 1
    OnClick = Button1Click
  end
  object pnlVideo1: TPanel
    Left = 24
    Top = 112
    Width = 289
    Height = 257
    Color = clSilver
    TabOrder = 2
    OnClick = pnlVideo1Click
  end
end
