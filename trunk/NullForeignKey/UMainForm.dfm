object FMainForm: TFMainForm
  Left = 0
  Top = 0
  Caption = 'Main Form'
  ClientHeight = 279
  ClientWidth = 613
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lblStatus: TLabel
    Left = 16
    Top = 51
    Width = 72
    Height = 19
    Caption = 'lblStatus'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 424
    Top = 22
    Width = 113
    Height = 25
    Caption = 'Create Person'
    TabOrder = 0
    OnClick = Button1Click
  end
  object edtFirstName: TLabeledEdit
    Left = 16
    Top = 24
    Width = 121
    Height = 21
    EditLabel.Width = 51
    EditLabel.Height = 13
    EditLabel.Caption = 'First Name'
    TabOrder = 1
  end
  object edtSurname: TLabeledEdit
    Left = 152
    Top = 24
    Width = 121
    Height = 21
    EditLabel.Width = 42
    EditLabel.Height = 13
    EditLabel.Caption = 'Surname'
    TabOrder = 2
  end
  object chkIncCity: TCheckBox
    Left = 288
    Top = 27
    Width = 97
    Height = 17
    Caption = 'Include City'
    TabOrder = 3
  end
end
