object AboutDialog: TAboutDialog
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'About'
  ClientHeight = 255
  ClientWidth = 417
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 64
    Top = 0
    Width = 353
    Height = 216
    Pen.Color = clWhite
  end
  object Bevel1: TBevel
    Left = 0
    Top = 216
    Width = 417
    Height = 2
  end
  object Shape2: TShape
    Left = 0
    Top = 0
    Width = 65
    Height = 217
    Brush.Color = clRed
    Pen.Color = clSkyBlue
    Pen.Style = psClear
    Pen.Width = 0
  end
  object AppNameLabel: TLabel
    Left = 72
    Top = 8
    Width = 46
    Height = 13
    Caption = 'RedMap'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object Label1: TLabel
    Left = 72
    Top = 192
    Width = 271
    Height = 13
    Caption = 'Joint effort by Xeon, Koolboyman, and BlueSonic'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object VersionLabel: TLabel
    Left = 72
    Top = 24
    Width = 79
    Height = 13
    Caption = 'Version 2.0 Beta'
    Color = clWhite
    ParentColor = False
  end
  object Image1: TImage
    Left = 16
    Top = 16
    Width = 32
    Height = 32
    Picture.Data = {
      055449636F6E0000010002001010100000000000280100002600000020201000
      00000000E80200004E0100002800000010000000200000000100040000000000
      C000000000000000000000001000000000000000000000000000800000800000
      00808000800000008000800080800000C0C0C000808080000000FF0000FF0000
      00FFFF00FF000000FF00FF00FFFF0000FFFFFF000000000000000000000F7000
      000F7000880F7088880F7088880F7088880F70880000000000000000FFFFFFFF
      FFFFFFFFF888888FF888888FFFFFFFFFFFFFFFFF0FFF00FF0F0FF00F00FF0F0F
      0F0F00FF0F0F0F0F00FF0F0F0F0F0F0F0F0F000F00FFF00F0F0FF0FF77777777
      7777770700000000000000007777777777777777E7E7FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF280000002000000040000000
      0100040000000000800200000000000000000000100000000000000000000000
      000080000080000000808000800000008000800080800000C0C0C00080808000
      0000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000
      000000000000000000000000000F7000000F70000000000000000000880F7088
      880F70888888888887000000880F7088880F7088888888888700000000000000
      000000007777777777000000FFFFFFFFFFFFFFFFFFFFFFFFFF000000F888888F
      F888888F77777777FF000000FFFFFFFFFFFFFFFF77777777770000000FFF00FF
      0F0FF00FF777778FFF00000000FF0F0F0F0F00FFFFFFFFFFFF0000000F0F0F0F
      00FF0F0F778F7777FF0000000F0F0F0F0F0F000F778F7777FF00000000FFF00F
      0F0FF0FFFFFFFFFFFF00000077777777777777077777778FFF00000000000000
      000000007777778FFF0000007777777777777777FFFFFFFFFF000000F777778F
      F777778FF777778FFF000000FFFFFFFFFFFFFFFFFFFFFFFFFF000000778F7777
      778F7777778F7777FF000000778F7777778F7777778F7777FF000000FFFFFFFF
      FFFFFFFFFFFFFFFFFF0000007777778F7777778F7777778FFF0000007777778F
      7777778F7777778FFF000000FFFFFFFFFFFFFFFFFFFFFFFFFF00000080000008
      8000000880000008FF00000007F8F88007F8F88007F8F880FF0000000F7F8780
      0F7F87800F7F8780FF0000000FF7F8F00FF7F8F00FF7F8F0FF0000000FFF7F80
      0FFF7F800FFF7F80FF0000000FFFF7F00FFFF7F00FFFF7F0FF00000080000008
      8000000880000008FF000000777777777777777777777777FF000000E7E7FFFF
      0000003F0000001F0000001F0000001F0000001F0000001F0000001F0000001F
      0000001F0000001F0000001F0000001F0000001F0000001F0000001F0000001F
      0000001F0000001F0000001F0000001F0000001F0000001F0000001F0000001F
      0000001F0000001F0000001F0000001F0000001F0000001F0000001F0D0A}
  end
  object Button1: TButton
    Left = 336
    Top = 224
    Width = 75
    Height = 23
    Cancel = True
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object Memo1: TMemo
    Left = 72
    Top = 48
    Width = 337
    Height = 137
    BorderStyle = bsNone
    Lines.Strings = (
      'Special thanks to BlueSonic (aka Jigglypuff) for letting me use '
      'some of GoldMap to forge this frankenstein of a program. And '
      'for putting up with all my questions regarding Delphi.'
      ''
      'Koolboyman for the immense amount of data and information you '
      'provided me. '
      ''
      'Tauwasser for showing me how the warp-to points, connection '
      'data, and ram addresses where calculated. '
      ''
      'And also, tons of respect to the author of ZeroMap, you where '
      'my inspiration for how to go about displaying the connected '
      'maps.'
      ''
      'This program is not endorsed or supported by Nintendo, and the '
      'author is not affiliated with any other corporate entity.'
      ''
      'This program is Freeware and provided "as is". The author '
      
        'cannot be held liable for damages any kind arising from it'#39's use' +
        ' or '
      'presence.'
      ''
      'Pok'#233'mon is copyright of '#169'1995-2005 '
      'Nintendo/Creatures Inc./GAME FREAK Inc.')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
end
