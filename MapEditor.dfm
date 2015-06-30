object MapEditorForm: TMapEditorForm
  Left = 193
  Top = 122
  Width = 655
  Height = 699
  Caption = 'RedMap'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 33
    Width = 639
    Height = 588
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Map'
      object MapScrollBox: TScrollBox
        Left = 0
        Top = 0
        Width = 582
        Height = 560
        HorzScrollBar.Tracking = True
        VertScrollBar.Tracking = True
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        Visible = False
        object MapBox: TPaintBox
          Left = 0
          Top = 0
          Width = 129
          Height = 121
          Cursor = crDrag
          OnMouseDown = MapBoxMouseDown
          OnMouseMove = MapBoxMouseMove
          OnMouseUp = MapBoxMouseUp
          OnPaint = MapBoxPaint
        end
        object shpHighlight: TShape
          Left = 0
          Top = 0
          Width = 32
          Height = 32
          Brush.Color = 33023
          Enabled = False
          Pen.Mode = pmMask
          Pen.Style = psClear
          Pen.Width = 0
        end
      end
      object BlockPaletteScrollBox: TScrollBox
        Left = 582
        Top = 0
        Width = 49
        Height = 560
        HorzScrollBar.Tracking = True
        VertScrollBar.Tracking = True
        Align = alRight
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 1
        Visible = False
        object BlockPalette: TPaintBox
          Left = 0
          Top = 0
          Width = 32
          Height = 105
          Cursor = crHandPoint
          OnMouseDown = BlockPaletteMouseDown
          OnMouseMove = BlockPaletteMouseMove
          OnPaint = BlockPalettePaint
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Events'
      ImageIndex = 1
      object NoEventsLabel: TLabel
        Left = 16
        Top = 16
        Width = 170
        Height = 13
        Caption = 'Events for this map are not loaded.'
        Visible = False
        WordWrap = True
      end
      object EventScrollBox: TScrollBox
        Left = 0
        Top = 0
        Width = 631
        Height = 560
        HorzScrollBar.Tracking = True
        VertScrollBar.Tracking = True
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        Visible = False
        object SignpostImage: TImage
          Left = 256
          Top = 128
          Width = 32
          Height = 32
          Visible = False
        end
        object PeopleImage: TImage
          Left = 296
          Top = 128
          Width = 32
          Height = 32
          Visible = False
        end
        object WarpImage: TImage
          Left = 216
          Top = 128
          Width = 32
          Height = 32
          Visible = False
        end
        object EventBox: TPaintBox
          Left = 0
          Top = 0
          Width = 100
          Height = 105
        end
        object TriggerImage: TImage
          Left = 336
          Top = 128
          Width = 32
          Height = 32
          Visible = False
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Wild Pok'#233'mon'
      ImageIndex = 2
      object NoWildPkmnLabel: TLabel
        Left = 8
        Top = 8
        Width = 449
        Height = 26
        Caption = 
          'It seems this map does not have wild Pok'#233'mon data associated to ' +
          'it. Some maps do not have wild Pok'#233'mon at all (e.g. indoor place' +
          's).'
        WordWrap = True
      end
      object LandGroup1: TGroupBox
        Left = 8
        Top = 40
        Width = 385
        Height = 249
        Caption = 'Land Pok'#233'mon'
        TabOrder = 0
        object OffsetLabel1: TLabel
          Left = 200
          Top = 176
          Width = 35
          Height = 13
          Caption = 'Offset:'
        end
        object LandOffset1: TLabel
          Left = 240
          Top = 176
          Width = 18
          Height = 13
          Caption = '$00'
        end
        object LandPkmnBox: TListBox
          Left = 16
          Top = 24
          Width = 105
          Height = 137
          Hint = 'Wild Pok'#233'mon on land'
          Style = lbOwnerDrawFixed
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          Items.Strings = (
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            '')
          ParentFont = False
          TabOrder = 0
          OnClick = LandPkmnBoxClick
        end
        object LandLevelBox: TListBox
          Left = 128
          Top = 24
          Width = 41
          Height = 137
          Enabled = False
          ItemHeight = 13
          TabOrder = 1
        end
        object LandPkmnGroup: TGroupBox
          Left = 200
          Top = 24
          Width = 169
          Height = 49
          Caption = 'Pokemon'
          TabOrder = 2
          object LandPkmnCombo: TComboBox
            Left = 8
            Top = 20
            Width = 153
            Height = 21
            Style = csDropDownList
            Enabled = False
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              '00 Missingno'
              '01 Rydon'
              '02 Kangaskahn'
              '03 Nidoran M'
              '04 Clefairy'
              '05 Spearow'
              '06 Voltorb'
              '07 Nidoking'
              '08 Slowbro'
              '09 Ivysaur'
              '0A Eggecutor'
              '0B Licktung'
              '0C Exegute'
              '0D Grimer'
              '0E Gengar'
              '0F Nidoran F'
              '10 Nidoqueen'
              '11 Cubone'
              '12 Ryhorn'
              '13 Lapras'
              '14 Arcanine'
              '15 Mew'
              '16 Gyrados'
              '17 Shellder'
              '18 Tentacool'
              '19 Gastly'
              '1A Scyther'
              '1B Staryu'
              '1C Blastoice'
              '1D Pinser'
              '1E Tangala'
              '1F **Bad Pokemon**'
              '20 **Bad Pokemon**'
              '21 Growlithe'
              '22 Onix'
              '23 Fearow'
              '24 Pidgey'
              '25 Slowpoke'
              '26 Kadabra'
              '27 Graveler'
              '28 Chansey'
              '29 Machoke'
              '2A Mr. Mime'
              '2B Hitmonlee'
              '2C Hitmonchan'
              '2D Arbok'
              '2E Parasect'
              '2F Psyduck'
              '30 Drowzee'
              '31 Golom'
              '32 **Bad Pokemon**'
              '33 Magmar'
              '34 **Bad Pokemon**'
              '35 Electabuzz'
              '36 Magneton'
              '37 Koffing'
              '38 **Bad Pokemon**'
              '39 Mankey'
              '3A Seel'
              '3B Digglett'
              '3C Tarous'
              '3D **Bad Pokemon**'
              '3E **Bad Pokemon**'
              '3F **Bad Pokemon**'
              '40 FarFetche'#39'd'
              '41 Venonat'
              '42 Dragonite'
              '43 **Bad Pokemon**'
              '44 **Bad Pokemon**'
              '45 **Bad Pokemon**'
              '46 Doduo'
              '47 Poliwag'
              '48 Jynx'
              '49 Moltres'
              '4A Articuno'
              '4B Zapdos'
              '4C Ditto'
              '4D Meowth'
              '4E Krabby'
              '4F **Bad Pokemon**'
              '50 **Bad Pokemon**'
              '51 **Bad Pokemon**'
              '52 Vulpix'
              '53 Ninetails'
              '54 Pikachu'
              '55 Raichu'
              '56 **Bad Pokemon**'
              '57 **Bad Pokemon**'
              '58 Dratini'
              '59 Dragonair'
              '5A Kabuto'
              '5B Kabutops'
              '5C Horsea'
              '5D Seadra'
              '5E **Bad Pokemon**'
              '5F **Bad Pokemon**'
              '60 Sandshrew'
              '61 Sandslash'
              '62 Omanyte'
              '63 Omaster'
              '64 Jigglypuff'
              '65 Wigglytuff'
              '66 Eevee'
              '67 Flareon'
              '68 Jolteon'
              '69 Vaporeon'
              '6A Machop'
              '6B Zubat'
              '6C Ekans'
              '6D Paras'
              '6E Poliwhirl'
              '6F Poliwrath'
              '70 Weedle'
              '71 Kakuna'
              '72 Beedril'
              '73 **Bad Pokemon**'
              '74 Dodrio'
              '75 Primeape'
              '76 Dugtrio'
              '77 Venomoth'
              '78 Dewgong'
              '79 **Bad Pokemon**'
              '7A **Bad Pokemon**'
              '7B Caterpie'
              '7C Metapod'
              '7D Butterfree'
              '7E Machamp'
              '7F **Bad Pokemon**'
              '80 Golduck'
              '81 Hypno'
              '82 Golbat'
              '83 Mewtwo'
              '84 Snorlax'
              '85 Magikarp'
              '86 **Bad Pokemon**'
              '87 **Bad Pokemon**'
              '88 Muk'
              '89 **Bad Pokemon**'
              '8A Kingler'
              '8B Cloyster'
              '8C **Bad Pokemon**'
              '8D Electrode'
              '8E Clefable'
              '8F Weezing'
              '90 Persian'
              '91 Marowak'
              '92 **Bad Pokemon**'
              '93 Haunter'
              '94 Abra'
              '95 Alakazzam'
              '96 Pidgeotto'
              '97 Pidgeot'
              '98 Starmie'
              '99 Bulbasaur'
              '9A Venusaur'
              '9B Tentacruel'
              '9C **Bad Pokemon**'
              '9D Goldeen'
              '9E Seaking'
              '9F **Bad Pokemon**'
              'A0 **Bad Pokemon**'
              'A1 **Bad Pokemon**'
              'A2 **Bad Pokemon**'
              'A3 Ponyta'
              'A4 Rapidash'
              'A5 Rattata'
              'A6 Ratticate'
              'A7 Nidorino'
              'A8 Nidorina'
              'A9 Geodude'
              'AA Porygon'
              'AB Areodactyl'
              'AC **Bad Pokemon**'
              'AD Magnemite'
              'AE **Bad Pokemon**'
              'AF **Bad Pokemon**'
              'B0 Charmander'
              'B1 Squirtle'
              'B2 Charmeleon'
              'B3 Wartortle'
              'B4 Charizard'
              'B5 **Bad Pokemon**'
              'B6 **Bad Pokemon**'
              'B7 **Bad Pokemon**'
              'B8 **Bad Pokemon**'
              'B9 Oddish'
              'BA Gloom'
              'BB Vileplume'
              'BC Bellsprout'
              'BD Weepinbell'
              'BE Victreebell')
          end
        end
        object LandLevelGroup: TGroupBox
          Left = 200
          Top = 80
          Width = 169
          Height = 49
          Caption = 'Level'
          TabOrder = 3
          object LandPkmnLevel: TSpinEdit
            Left = 8
            Top = 19
            Width = 153
            Height = 22
            Hint = 'Pok'#233'mon'#39's level'
            Enabled = False
            MaxValue = 255
            MinValue = 1
            TabOrder = 0
            Value = 1
          end
        end
        object LandReplaceBtn: TButton
          Left = 200
          Top = 136
          Width = 75
          Height = 25
          Caption = 'Replace'
          Enabled = False
          TabOrder = 4
          OnClick = LandReplaceBtnClick
        end
        object LandRateGroup: TGroupBox
          Left = 16
          Top = 168
          Width = 169
          Height = 65
          Caption = 'Encounter Rate'
          TabOrder = 5
          object Less1: TLabel
            Left = 8
            Top = 48
            Width = 21
            Height = 13
            Caption = 'Less'
          end
          object More1: TLabel
            Left = 136
            Top = 48
            Width = 24
            Height = 13
            Caption = 'More'
          end
          object LandPercent: TLabel
            Left = 57
            Top = 48
            Width = 56
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = '%'
          end
          object LandRateTrack: TTrackBar
            Left = 8
            Top = 16
            Width = 153
            Height = 33
            Enabled = False
            Max = 100
            Min = 1
            Frequency = 10
            Position = 1
            TabOrder = 0
            OnExit = LandRateTrackExit
          end
        end
      end
      object WaterGroup1: TGroupBox
        Left = 8
        Top = 304
        Width = 385
        Height = 249
        Caption = 'Water Pok'#233'mon'
        TabOrder = 1
        object OffsetLabel2: TLabel
          Left = 200
          Top = 176
          Width = 35
          Height = 13
          Caption = 'Offset:'
        end
        object WaterOffset1: TLabel
          Left = 240
          Top = 176
          Width = 18
          Height = 13
          Caption = '$00'
        end
        object WaterPkmnBox: TListBox
          Left = 16
          Top = 24
          Width = 105
          Height = 137
          Hint = 'Wild Pok'#233'mon on land'
          Style = lbOwnerDrawFixed
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          Items.Strings = (
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            '')
          ParentFont = False
          TabOrder = 0
          OnClick = WaterPkmnBoxClick
        end
        object WaterLevelBox: TListBox
          Left = 128
          Top = 24
          Width = 41
          Height = 137
          Enabled = False
          ItemHeight = 13
          TabOrder = 1
        end
        object WaterPkmnGroup: TGroupBox
          Left = 200
          Top = 24
          Width = 169
          Height = 49
          Caption = 'Pokemon'
          TabOrder = 2
          object WaterPkmnCombo: TComboBox
            Left = 8
            Top = 20
            Width = 153
            Height = 21
            Style = csDropDownList
            Enabled = False
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              '00 Missingno'
              '01 Rydon'
              '02 Kangaskahn'
              '03 Nidoran M'
              '04 Clefairy'
              '05 Spearow'
              '06 Voltorb'
              '07 Nidoking'
              '08 Slowbro'
              '09 Ivysaur'
              '0A Eggecutor'
              '0B Licktung'
              '0C Exegute'
              '0D Grimer'
              '0E Gengar'
              '0F Nidoran F'
              '10 Nidoqueen'
              '11 Cubone'
              '12 Ryhorn'
              '13 Lapras'
              '14 Arcanine'
              '15 Mew'
              '16 Gyrados'
              '17 Shellder'
              '18 Tentacool'
              '19 Gastly'
              '1A Scyther'
              '1B Staryu'
              '1C Blastoice'
              '1D Pinser'
              '1E Tangala'
              '1F **Bad Pokemon**'
              '20 **Bad Pokemon**'
              '21 Growlithe'
              '22 Onix'
              '23 Fearow'
              '24 Pidgey'
              '25 Slowpoke'
              '26 Kadabra'
              '27 Graveler'
              '28 Chansey'
              '29 Machoke'
              '2A Mr. Mime'
              '2B Hitmonlee'
              '2C Hitmonchan'
              '2D Arbok'
              '2E Parasect'
              '2F Psyduck'
              '30 Drowzee'
              '31 Golom'
              '32 **Bad Pokemon**'
              '33 Magmar'
              '34 **Bad Pokemon**'
              '35 Electabuzz'
              '36 Magneton'
              '37 Koffing'
              '38 **Bad Pokemon**'
              '39 Mankey'
              '3A Seel'
              '3B Digglett'
              '3C Tarous'
              '3D **Bad Pokemon**'
              '3E **Bad Pokemon**'
              '3F **Bad Pokemon**'
              '40 FarFetche'#39'd'
              '41 Venonat'
              '42 Dragonite'
              '43 **Bad Pokemon**'
              '44 **Bad Pokemon**'
              '45 **Bad Pokemon**'
              '46 Doduo'
              '47 Poliwag'
              '48 Jynx'
              '49 Moltres'
              '4A Articuno'
              '4B Zapdos'
              '4C Ditto'
              '4D Meowth'
              '4E Krabby'
              '4F **Bad Pokemon**'
              '50 **Bad Pokemon**'
              '51 **Bad Pokemon**'
              '52 Vulpix'
              '53 Ninetails'
              '54 Pikachu'
              '55 Raichu'
              '56 **Bad Pokemon**'
              '57 **Bad Pokemon**'
              '58 Dratini'
              '59 Dragonair'
              '5A Kabuto'
              '5B Kabutops'
              '5C Horsea'
              '5D Seadra'
              '5E **Bad Pokemon**'
              '5F **Bad Pokemon**'
              '60 Sandshrew'
              '61 Sandslash'
              '62 Omanyte'
              '63 Omaster'
              '64 Jigglypuff'
              '65 Wigglytuff'
              '66 Eevee'
              '67 Flareon'
              '68 Jolteon'
              '69 Vaporeon'
              '6A Machop'
              '6B Zubat'
              '6C Ekans'
              '6D Paras'
              '6E Poliwhirl'
              '6F Poliwrath'
              '70 Weedle'
              '71 Kakuna'
              '72 Beedril'
              '73 **Bad Pokemon**'
              '74 Dodrio'
              '75 Primeape'
              '76 Dugtrio'
              '77 Venomoth'
              '78 Dewgong'
              '79 **Bad Pokemon**'
              '7A **Bad Pokemon**'
              '7B Caterpie'
              '7C Metapod'
              '7D Butterfree'
              '7E Machamp'
              '7F **Bad Pokemon**'
              '80 Golduck'
              '81 Hypno'
              '82 Golbat'
              '83 Mewtwo'
              '84 Snorlax'
              '85 Magikarp'
              '86 **Bad Pokemon**'
              '87 **Bad Pokemon**'
              '88 Muk'
              '89 **Bad Pokemon**'
              '8A Kingler'
              '8B Cloyster'
              '8C **Bad Pokemon**'
              '8D Electrode'
              '8E Clefable'
              '8F Weezing'
              '90 Persian'
              '91 Marowak'
              '92 **Bad Pokemon**'
              '93 Haunter'
              '94 Abra'
              '95 Alakazzam'
              '96 Pidgeotto'
              '97 Pidgeot'
              '98 Starmie'
              '99 Bulbasaur'
              '9A Venusaur'
              '9B Tentacruel'
              '9C **Bad Pokemon**'
              '9D Goldeen'
              '9E Seaking'
              '9F **Bad Pokemon**'
              'A0 **Bad Pokemon**'
              'A1 **Bad Pokemon**'
              'A2 **Bad Pokemon**'
              'A3 Ponyta'
              'A4 Rapidash'
              'A5 Rattata'
              'A6 Ratticate'
              'A7 Nidorino'
              'A8 Nidorina'
              'A9 Geodude'
              'AA Porygon'
              'AB Areodactyl'
              'AC **Bad Pokemon**'
              'AD Magnemite'
              'AE **Bad Pokemon**'
              'AF **Bad Pokemon**'
              'B0 Charmander'
              'B1 Squirtle'
              'B2 Charmeleon'
              'B3 Wartortle'
              'B4 Charizard'
              'B5 **Bad Pokemon**'
              'B6 **Bad Pokemon**'
              'B7 **Bad Pokemon**'
              'B8 **Bad Pokemon**'
              'B9 Oddish'
              'BA Gloom'
              'BB Vileplume'
              'BC Bellsprout'
              'BD Weepinbell'
              'BE Victreebell')
          end
        end
        object WaterLevelGroup: TGroupBox
          Left = 200
          Top = 80
          Width = 169
          Height = 49
          Caption = 'Level'
          TabOrder = 3
          object WaterPkmnLevel: TSpinEdit
            Left = 8
            Top = 19
            Width = 153
            Height = 22
            Hint = 'Pok'#233'mon'#39's level'
            Enabled = False
            MaxValue = 255
            MinValue = 1
            TabOrder = 0
            Value = 1
          end
        end
        object WaterReplaceBtn: TButton
          Left = 200
          Top = 136
          Width = 75
          Height = 25
          Caption = 'Replace'
          Enabled = False
          TabOrder = 4
          OnClick = WaterReplaceBtnClick
        end
        object WaterRateGroup: TGroupBox
          Left = 16
          Top = 168
          Width = 169
          Height = 65
          Caption = 'Encounter Rate'
          TabOrder = 5
          object Less2: TLabel
            Left = 8
            Top = 48
            Width = 21
            Height = 13
            Caption = 'Less'
          end
          object More2: TLabel
            Left = 136
            Top = 48
            Width = 24
            Height = 13
            Caption = 'More'
          end
          object WaterPercent: TLabel
            Left = 57
            Top = 48
            Width = 56
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = '%'
          end
          object WaterRateTrack: TTrackBar
            Left = 8
            Top = 16
            Width = 153
            Height = 33
            Enabled = False
            Max = 100
            Min = 1
            Frequency = 10
            Position = 1
            TabOrder = 0
            OnExit = WaterRateTrackExit
          end
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Headers'
      ImageIndex = 3
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 621
    Width = 639
    Height = 20
    Panels = <
      item
        Text = 'Ready.'
        Width = 200
      end
      item
        Text = 'Start by opening a rom file from File->Open...'
        Width = 50
      end>
  end
  object MapSelectPanel: TPanel
    Left = 0
    Top = 0
    Width = 639
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    Visible = False
    object Label5: TLabel
      Left = 8
      Top = 8
      Width = 56
      Height = 13
      Caption = 'Select Map:'
    end
    object MapSelectCombo: TComboBox
      Left = 72
      Top = 4
      Width = 233
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = MapSelectComboChange
      Items.Strings = (
        'Pallet Town'
        'Viridian City'
        'Pewter City'
        'Cerulean City'
        'Lavender Town'
        'Vermilion City'
        'Celadon City'
        'Fuchsia City'
        'Cinnibar Island'
        'Indigo Plateau'
        'Saffron City'
        '** Bad Map **'
        'Route 1'
        'Route 2'
        'Route 3'
        'Route 4'
        'Route 5'
        'Route 6'
        'Route 7'
        'Route 8'
        'Route 9'
        'Route 10'
        'Route 11'
        'Route 12'
        'Route 13'
        'Route 14'
        'Route 15'
        'Route 16'
        'Route 17'
        'Route 18'
        'Route 19'
        'Route 20'
        'Route 21'
        'Route 22'
        'Route 23'
        'Route 24'
        'Route 25'
        'Ash'#39's House F1'
        'Ash'#39's House F2'
        'Gary'#39's House'
        'Oak'#39's Lab'
        'Viridian Pok'#233'mon Center'
        'Viridian Mart'
        'Viridian School'
        'Viridian House'
        'Viridian Gym'
        'Digletts Cave (Route 2)'
        'Viridian Forest (Exit)'
        'Route 2 House'
        'Route 2 Gate'
        'Viridian Forest (Entrance)'
        'Viridian Forest'
        'Pewter City Museum F1'
        'Pewter City Museum F2'
        'Pewter City Gym'
        'Pewter City House'
        'Pewter City Mart'
        'Pewter City House'
        'Pewter City Pok'#233'mon Center'
        'Mt. Moon Cave (1)'
        'Mt. Moon Cave (2)'
        'Mt. Moon Cave (3)'
        'Cerulean House (Robbed)'
        'Cerulean House (2)'
        'Cerulean Pok'#233'mon Center'
        'Cerulean Gym'
        'Cerulean Bike Shop'
        'Cerulean Mart'
        'Mt. Moon Pok'#233'mon Center'
        'Cerulean House (Robbed) (Copy)'
        'Route 5 Gate'
        'Underground Tunnel Entrance (Route 5)'
        'Day Care Center'
        'Route 6 Gate'
        'Underground Tunnel Entrance (Route 6)'
        'Underground Tunnel Entrance (Route 6) (Copy)'
        'Route 7 Gate'
        'Underground Path Entrance (Route 7)'
        'Underground Path Entrance (Route 7) (Copy)'
        'Route 8 Gate'
        'Underground Path Entrance (Route 8)'
        'Rock Tunnel Pok'#233'mon Center'
        'Rock Tunnel (1)'
        'Power Plant'
        'Route 11 Gate'
        'Diglett'#39's Cave Entrance (Route 11)'
        'Route 11 Gate (Upstairs)'
        'Route 12 Gate'
        'Bill'#39's House'
        'Vermilion Pok'#233'mon Center'
        'Vermilion Pok'#233'mon Fan Club'
        'Vermilion Mart'
        'Vermilion Gym'
        'Vermilion House'
        'Vermilion Dock'
        'S.S. Anne (1)'
        'S.S. Anne (2)'
        'S.S. Anne (3)'
        'S.S. Anne (4)'
        'S.S. Anne (5)'
        'S.S. Anne (6)'
        'S.S. Anne (7)'
        'S.S. Anne (8)'
        'S.S. Anne (9)'
        'S.S. Anne (10)'
        '** Bad Map **'
        '** Bad Map **'
        '** Bad Map **'
        'Victory Road (1)'
        '** Bad Map **'
        '** Bad Map **'
        '** Bad Map **'
        '** Bad Map **'
        'Elite Four Lance'
        '** Bad Map **'
        '** Bad Map **'
        '** Bad Map **'
        '** Bad Map **'
        'Hall of Fame Room'
        'Underground Path (N/S)'
        'Elite Four Gary'
        'Underground Path (W/E)'
        'Celadon Mart (1)'
        'Celadon Mart (2)'
        'Celadon Mart (3)'
        'Celadon Mart (4)'
        'Celadon Mart (6)'
        'Celadon Mart Elevator'
        'Celadon Mansion (1)'
        'Celadon Mansion (2)'
        'Celadon Mansion (3)'
        'Celadon Mansion (4)'
        'Celadon Mansion (5)'
        'Celadon Pokecenter'
        'Celadon Gym'
        'Celadon Game Corner'
        'Celadon Mart (5)'
        'Celadon Prize Room'
        'Celadon Diner'
        'Celadon House (2)'
        'Celadon Hotel'
        'Lavender Pokecenter'
        'Pokemon Tower (1)'
        'Pokemon Tower (2)'
        'Pokemon Tower (3)'
        'Pokemon Tower (4)'
        'Pokemon Tower (5)'
        'Pokemon Tower (6)'
        'Pokemon Tower (7)'
        'Lavender House (1)'
        'Lavender Mart'
        'Lavender House (2)'
        'Fuchsia Mart'
        'Fuchsia House (1)'
        'Fuchsia Pokecenter'
        'Fuchsia House (2)'
        'Safari Zone Entrance'
        'Fuchsia Gym'
        'Fuchsia Meeting Room'
        'Seafoam Islands (2)'
        'Seafoam Islands (3)'
        'Seafoam Islands (4)'
        'Seafoam Islands (5)'
        'Vermilion House (2)'
        'Fuchsia House (3)'
        'Mansion (1)'
        'Cinnibar Gym'
        'Lab (1)'
        'Lab (2)'
        'Lab (3)'
        'Lab (4)'
        'Cinnibar Pokecenter'
        'Cinnibar Mart'
        'Cinnibar Mart (Copy)'
        'Indigo Plateau Lobby'
        'Copycat'#39's House F1 '
        'Copycat'#39's House F2'
        'Fighting Dojo'
        'Saffron Gym'
        'Saffron House (1)'
        'Saffron Mart'
        'Silph Co (1)'
        'Saffron Pokecenter'
        'Saffron House (2)'
        'Route 15 Gate'
        'Route 15 Gate Upstairs'
        'Route 16 Gate Map'
        'Route 16 Gate Upstairs'
        'Route 16 House'
        'Route 12 House'
        'Route 18 Gate'
        'Route 18 Gate Upstairs'
        'Seafoam Islands (1)'
        'Route 22 Gate'
        'Victory Road'
        'Route 12 Gate Upstairs'
        'Vermilion House (3)'
        'Diglett'#39's Cave'
        'Victory Road (3)'
        'Rocket Hideout (1)'
        'Rocket Hideout (2)'
        'Rocket Hideout (3)'
        'Rocket Hideout (4)'
        'Rocket Hideout (Elevator)'
        '** Bad Map **'
        '** Bad Map **'
        '** Bad Map **'
        'Silph Co (2)'
        'Silph Co (3)'
        'Silph Co (4)'
        'Silph Co (5)'
        'Silph Co (6)'
        'Silph Co (7)'
        'Silph Co (8)'
        'Mansion (2)'
        'Mansion (3)'
        'Mansion (4)'
        'Safari Zone East'
        'Safari Zone North'
        'Safari Zone West'
        'Safari Zone Center'
        'Safari Zone Rest House (1)'
        'Safari Zone Secret House'
        'Safari Zone Rest House (2)'
        'Safari Zone Rest House (3)'
        'Safari Zone Rest House (4)'
        'Unknown Dungeon(2)'
        'Unknown Dungeon(3)'
        'Unknown Dungeon(1)'
        'Name Rater'#39's House'
        'Cerulean House (3)'
        '** Bad Map **'
        'Rock Tunnel (2)'
        'Silph Co (9)'
        'Silph Co (10)'
        'Silph Co (11)'
        'Silph Co (Elevator)'
        '** Bad Map **'
        '** Bad Map **'
        'Battle Center'
        'Trade Center'
        '** Bad Map **'
        '** Bad Map **'
        '** Bad Map **'
        '** Bad Map **'
        'Elite Four Loreli'
        'Elite Four Bruno'
        'Elite Four Agatha'
        'Surf House (Yellow)'
        '** Bad Map **'
        '** Bad Map **'
        '** Bad Map **'
        '** Bad Map **'
        '** Bad Map **'
        '** Bad Map **')
    end
  end
  object XPManifest1: TXPManifest
    Left = 600
    Top = 584
  end
  object MainMenu1: TMainMenu
    Left = 568
    Top = 584
    object File1: TMenuItem
      Caption = 'File'
      object LoadRom1: TMenuItem
        Caption = 'Open...'
        Hint = 'Open a rom file to be edited.'
        ShortCut = 16463
        OnClick = LoadRom1Click
      end
      object SaveRom1: TMenuItem
        Caption = 'Save'
        Enabled = False
        Hint = 'Saves the currently opened rom to file.'
        ShortCut = 16467
        OnClick = SaveRom1Click
      end
      object SaveRomAs1: TMenuItem
        Caption = 'Save As...'
        Enabled = False
        Hint = 'Saves the currently opened rom to different file.'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object LoadMap1: TMenuItem
        Caption = 'Load Map...'
        Hint = 'Loads map from file.'
      end
      object SaveMap1: TMenuItem
        Caption = 'Save Map...'
        Hint = 'Saves current map to file.'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        Hint = 'Bye-bye!'
        OnClick = Exit1Click
      end
    end
    object Edit1: TMenuItem
      Caption = 'Edit'
      object Undo1: TMenuItem
        Caption = 'Undo'
        ShortCut = 16474
      end
    end
    object Settings1: TMenuItem
      Caption = 'Settings'
      object Grid1: TMenuItem
        Caption = 'Gridlines'
        Hint = 'Show the gridlines in map editor, events and block palette.'
        ShortCut = 16455
        OnClick = Grid1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Palette1: TMenuItem
        Caption = 'Palette'
        Hint = 'Change the color scheme GoldMap uses to display map.'
        object Morning1: TMenuItem
          Caption = 'Morning'
          GroupIndex = 2
          RadioItem = True
        end
        object Day1: TMenuItem
          Tag = 1
          Caption = 'Day'
          Checked = True
          GroupIndex = 2
          RadioItem = True
        end
        object Night1: TMenuItem
          Tag = 2
          Caption = 'Night'
          GroupIndex = 2
          RadioItem = True
        end
        object Darkness1: TMenuItem
          Tag = 3
          Caption = 'Darkness'
          GroupIndex = 2
          RadioItem = True
        end
        object Indoor1: TMenuItem
          Tag = 4
          Caption = 'Indoor'
          GroupIndex = 2
          RadioItem = True
        end
      end
    end
    object Tools: TMenuItem
      Caption = 'Tools'
      object BlockEditor1: TMenuItem
        Caption = 'Block Editor...'
        Enabled = False
        Hint = 'Edit map building blocks.'
        ShortCut = 16450
        OnClick = BlockEditor1Click
      end
      object ReconstructMap1: TMenuItem
        Caption = 'Resize Map...'
        Enabled = False
        Hint = 'Change size of map, and relocate map data in rom.'
        ShortCut = 16466
      end
      object ReBuildEvents1: TMenuItem
        Caption = 'Reconstruct Events...'
        Enabled = False
        Hint = 'Change number of events.'
        ShortCut = 16453
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object SaveMapPic1: TMenuItem
        Caption = 'Save Picture of Map...'
        Enabled = False
        Hint = 'Save picture of map into file.'
        ShortCut = 49229
      end
      object SaveTilesetPic1: TMenuItem
        Caption = 'Save Picture of Blocks...'
        Enabled = False
        Hint = 'Save picture of map building blocks into file.'
        ShortCut = 49218
      end
      object TryMap1: TMenuItem
        Caption = 'Try Map...'
        Enabled = False
        Hint = 
          'Allows you to manually specify map size and address to load it f' +
          'rom.'
        ShortCut = 16468
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
      object About1: TMenuItem
        Caption = 'About...'
        Hint = 'About GoldMap.'
        ShortCut = 112
        OnClick = About1Click
      end
    end
  end
  object SaveMapDialog: TSaveDialog
    DefaultExt = 'map'
    Filter = 'Maps (*.map)|*.map|All Files (*.*)|*.*'
    Left = 536
    Top = 584
  end
  object OpenRomDialog: TOpenDialog
    Filter = 'GameBoy roms (*.gb),(*.gbc)|*.gb;*.gbc|Any file (*.*)|*.*'
    Title = 'Select Pok'#233'mon Gold or Silver rom'
    Left = 504
    Top = 552
  end
  object SaveRomDialog: TSaveDialog
    DefaultExt = 'gb'
    Filter = 'GameBoy roms (*.GB),(*.GBC)|*.GB;*.GBC|All files (*.*)|*.*'
    Title = 'Save rom'
    Left = 536
    Top = 552
  end
  object OpenMapDialog: TOpenDialog
    DefaultExt = 'map'
    Filter = 'Maps (*.map)|*.map|All Files (*.*)|*.*'
    Left = 504
    Top = 584
  end
  object ImageList1: TImageList
    Left = 568
    Top = 552
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000038383800383838003838
      3800383838003838380038383800383838003838380038383800383838003838
      38003838380038383800383838007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F000000000000000000000000000000000038383800D0E0F000D0E0
      F000D0E0F000D0E0F000D0E0F000D0E0F000D0E0F000D0E0F000D0E0F000D0E0
      F000D0E0F000D0E0F000383838007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F000000000000000000000000000000000038383800D0E0F000F848
      4800F8484800F8484800F8484800F8484800F8484800F8484800F8484800F848
      4800F8484800D0E0F000383838007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000078F8000078F8000078F8000078F8000078F8000078F8000000
      00007F7F7F000000000000000000000000000000000038383800D0E0F000F848
      4800F8807800F8807800F8807800F8807800F8807800F8807800F8807800F880
      7800F8484800D0E0F000383838007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000078F800003878000038780000387800003878000078F8000000
      00007F7F7F000000000000000000000000000000000038383800D0E0F000F848
      4800F8484800F8484800F8807800F8807800F8807800F8807800F8807800F880
      7800F8484800D0E0F000383838007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000078F800003878000078F8000078F800003878000078F8000000
      00007F7F7F000000000000000000000000000000000038383800D0E0F000F848
      4800F8484800F8484800F8484800F8807800F8807800F8807800F8807800F848
      4800F8484800D0E0F000383838007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000078F800003878000078F8000078F800003878000078F8000000
      00007F7F7F000000000000000000000000000000000038383800D0E0F000F848
      4800F8484800F8484800F8484800F8484800F8807800F8807800F8484800F848
      4800F8484800D0E0F000383838007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000078F800003878000038780000387800003878000078F8000000
      00007F7F7F000000000000000000000000000000000038383800D0E0F000F848
      4800F8807800F8807800F8484800F8484800F8484800F8484800F8484800F848
      4800F8484800D0E0F000383838007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000078F8000078F8000078F8000078F8000078F8000078F8000000
      00007F7F7F000000000000000000000000000000000038383800D0E0F000F848
      4800F8807800F8807800F8484800F8484800F8484800F8484800F8484800F848
      4800F8484800D0E0F000383838007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000038383800D0E0F000F848
      4800F8484800F8484800F8484800F8484800F8484800F8484800F8484800F848
      4800F8484800D0E0F000383838007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000038383800D0E0F000D0E0
      F000D0E0F000D0E0F000D0E0F000D0E0F000D0E0F000D0E0F000D0E0F000D0E0
      F000D0E0F000D0E0F000383838007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000038383800383838003838
      3800383838003838380038383800383838003838380038383800383838003838
      3800383838003838380038383800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF000180FFFF000000000180C00000000000
      3FFC800000000000380480000000000030048000000000003004800000000000
      3004800000000000F007800000000000F0078000000000003004800000000000
      3004800000000000300C8000000000003FFC8000000000003FFC800100000000
      0180FFFF000000000180FFFF0000000000000000000000000000000000000000
      000000000000}
  end
end
