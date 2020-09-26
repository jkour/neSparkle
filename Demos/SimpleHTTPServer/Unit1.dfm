object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 256
  ClientWidth = 571
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 16
    Top = 8
    Width = 537
    Height = 177
    Lines.Strings = (
      'Log')
    TabOrder = 0
  end
  object efPath: TEdit
    Left = 16
    Top = 210
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '..\..\AppCast'
  end
  object IdHTTPServer1: TIdHTTPServer
    Active = True
    Bindings = <>
    DefaultPort = 7777
    OnConnect = IdHTTPServer1Connect
    OnDisconnect = IdHTTPServer1Disconnect
    AutoStartSession = True
    OnCommandGet = IdHTTPServer1CommandGet
    Left = 168
    Top = 200
  end
end
