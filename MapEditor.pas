unit MapEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, XPMan, IniFiles, StdCtrls, Spin, ImgList, ComCtrls,
  pngimage, Map, Tileset, About, Misc, BlockEditor;

type

  TPointer = packed record
    First:  Byte;
    Second: Byte;
  end;

  TPokemon = packed record
    Level:  Byte;
    Number: Byte;
  end;

  TLandWildPkmn = packed record
    Rate:   Byte;
    Pkmn:   array [0..9] of TPokemon;
  end;

  TWaterWildPkmn = packed record
    Rate:   Byte;
    Pkmn:   array [0..9] of TPokemon;
  end;

  TMapEditorForm = class(TForm)
    XPManifest1: TXPManifest;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    LoadRom1: TMenuItem;
    SaveRom1: TMenuItem;
    SaveRomAs1: TMenuItem;
    N1: TMenuItem;
    LoadMap1: TMenuItem;
    SaveMap1: TMenuItem;
    N2: TMenuItem;
    Exit1: TMenuItem;
    Settings1: TMenuItem;
    Grid1: TMenuItem;
    N4: TMenuItem;
    Palette1: TMenuItem;
    Morning1: TMenuItem;
    Day1: TMenuItem;
    Night1: TMenuItem;
    Darkness1: TMenuItem;
    Indoor1: TMenuItem;
    Tools: TMenuItem;
    BlockEditor1: TMenuItem;
    ReconstructMap1: TMenuItem;
    ReBuildEvents1: TMenuItem;
    N3: TMenuItem;
    SaveMapPic1: TMenuItem;
    SaveTilesetPic1: TMenuItem;
    TryMap1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    SaveMapDialog: TSaveDialog;
    OpenRomDialog: TOpenDialog;
    SaveRomDialog: TSaveDialog;
    OpenMapDialog: TOpenDialog;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    MapScrollBox: TScrollBox;
    MapBox: TPaintBox;
    BlockPaletteScrollBox: TScrollBox;
    BlockPalette: TPaintBox;
    TabSheet2: TTabSheet;
    NoEventsLabel: TLabel;
    EventScrollBox: TScrollBox;
    SignpostImage: TImage;
    PeopleImage: TImage;
    WarpImage: TImage;
    EventBox: TPaintBox;
    TriggerImage: TImage;
    TabSheet3: TTabSheet;
    NoWildPkmnLabel: TLabel;
    LandGroup1: TGroupBox;
    LandPkmnLevel: TSpinEdit;
    LandPkmnBox: TListBox;
    LandPkmnCombo: TComboBox;
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    MapSelectPanel: TPanel;
    MapSelectCombo: TComboBox;
    Label5: TLabel;
    shpHighlight: TShape;
    TabSheet4: TTabSheet;
    Edit1: TMenuItem;
    Undo1: TMenuItem;
    LandLevelBox: TListBox;
    LandPkmnGroup: TGroupBox;
    LandLevelGroup: TGroupBox;
    LandReplaceBtn: TButton;
    WaterGroup1: TGroupBox;
    WaterPkmnBox: TListBox;
    WaterLevelBox: TListBox;
    WaterPkmnGroup: TGroupBox;
    WaterPkmnCombo: TComboBox;
    WaterLevelGroup: TGroupBox;
    WaterPkmnLevel: TSpinEdit;
    WaterReplaceBtn: TButton;
    LandRateTrack: TTrackBar;
    LandRateGroup: TGroupBox;
    Less1: TLabel;
    More1: TLabel;
    LandPercent: TLabel;
    WaterRateGroup: TGroupBox;
    Less2: TLabel;
    More2: TLabel;
    WaterPercent: TLabel;
    WaterRateTrack: TTrackBar;
    OffsetLabel1: TLabel;
    LandOffset1: TLabel;
    OffsetLabel2: TLabel;
    WaterOffset1: TLabel;
    procedure BlockEditor1Click(Sender: TObject);
    procedure Grid1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure BlockPaletteMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BlockPaletteMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MapBoxMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MapBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure MapBoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MapSelectComboChange(Sender: TObject);
    procedure MapBoxPaint(Sender: TObject);
    procedure BlockPalettePaint(Sender: TObject);
    procedure TilesetComboDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure SpinEdit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LoadRom1Click(Sender: TObject);


    //saves currently open map, event and pokemon data to rom (in memory) and writes to file
    procedure SaveRom(FileName: string);

    //loads specified map, tileset for map, map's events and pokemon
    procedure LoadMap(MapIndex: byte);
    //loads specified tileset
    procedure LoadTileset(TilesetNumber: Byte);
    //loads wild pokemon data for specified map
    procedure LoadPokemon(MapIndex: Byte);

    //saves currently loaded map, map's events and pokemon
    procedure SaveMap;
    //draws tileset blocks from MapData into Canvas
    procedure DrawMap(Canvas: TCanvas);
    //draws the tileset blocks on Canvas
    procedure DrawBlocks(Canvas: TCanvas);
    //refreshes the wild pokemon data controls in Wild Pokemon tab
    procedure UpdatePokemon;
    procedure SavePokemon;

    function IsOutsideOfMapBounds(X, Y: Integer): Boolean;
    procedure Exit1Click(Sender: TObject);
    procedure SaveRom1Click(Sender: TObject);
    procedure LandReplaceBtnClick(Sender: TObject);
    procedure WaterReplaceBtnClick(Sender: TObject);
    procedure LandPkmnBoxClick(Sender: TObject);
    procedure WaterPkmnBoxClick(Sender: TObject);
    procedure WaterRateTrackExit(Sender: TObject);
    procedure LandRateTrackExit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MapEditorForm: TMapEditorForm;
  LoadedTileset: Byte = 0;
  LoadedMap: string = '';
  LoadedMapBank:  Byte;
  LoadedMapNum:   Byte;
  SelBlock, SelPic, MapStart, TilesetStart, PokemonStart, Blocks: Integer;
  LoadedMapHeader: TMapHeader;
  Rom: TMemoryStream = nil;
  MapData:    array of Byte;
  BlockPics:  array [0..255] of TBitmap;
  Painting,DraggingEvent: Boolean;
  Tiles: TBitmap;
  MapModified: boolean;
  RomModified: boolean;
  DragOldX,DragOldY: Integer;
  TilesetCache: array [0..23] of TBitmap;
  ConnectionData: array [$00..$03] of TConnectionData;
  ConnectedMapHeaders: array [$00..$03] of TMapHeader;
  TopMapData:     array of Byte;
  BottomMapData:  array of Byte;
  LeftMapData:    array of Byte;
  RightMapData:   array of Byte;
  Pointer: TPointer;
  LandWildPkmn: TLandWildPkmn;
  WaterWildPkmn: TWaterWildPkmn;
  Location: string;

implementation

{$R *.dfm}

procedure TMapEditorForm.FormCreate(Sender: TObject);
begin
  ControlStyle := ControlStyle + [csOpaque];
  MapScrollBox.ControlStyle := MapScrollBox.ControlStyle + [csOpaque];
  MapBox.ControlStyle := MapBox.ControlStyle + [csOpaque];

  // Create the tileset graphic
  Tiles := TBitmap.Create;
  Tiles.Width := 16*16;
  Tiles.Height := 16*6;
  Tiles.PixelFormat := pf24bit;

  // Import for drawing grid.
  MapBox.Canvas.Brush.Style := bsClear;
  EventBox.Canvas.Brush.Style := bsClear;
  BlockPalette.Canvas.Brush.Style := bsClear;
end;

procedure TMapEditorForm.Grid1Click(Sender: TObject);
begin
  //if grid is checked then it will be hidden
  if Grid1.Checked then
    Grid1.Checked := False
  else
  //if grid is unchecked then it will be shown
  Grid1.Checked := True;
  //PokemonIni.WriteBool('Settings','Grid',Grid1.Checked);
  //show the grid if needed
  if MapStart > 0 then
  begin
    DrawMap(MapBox.Canvas);
    //DrawEvents(MainForm.EventBox.Canvas);
    DrawBlocks(BlockPalette.Canvas);
  end;
end;

procedure TMapEditorForm.LoadRom1Click(Sender: TObject);
var
  I: Integer;
begin
  if OpenRomDialog.Execute then
  begin
    // Check if memory stream is null.
    if Rom = nil then
      Rom := TMemoryStream.Create;

    // Load TMemoryStream from file.
    Rom.LoadFromFile(OpenRomDialog.FileName);

    ReadMapPallets;

    // Load up tileset combos.
    for I := 0 to 23 do
    begin
      TilesetCache[I] := TBitmap.Create;
      TilesetCache[I].Width  := 128;
      TilesetCache[I].Height := 48;
      TilesetCache[I].PixelFormat := pf24bit;
      ReadTilesetGraphics(GetTilesetHeader(I), TilesetCache[I]);
    end;

    MapModified := False;
    RomModified := False;
    BlockEditor1.Enabled := False;
    ReBuildEvents1.Enabled := False;
    ReconstructMap1.Enabled := False;
    SaveRom1.Enabled := True;
    SaveRomAs1.Enabled := True;
    //ReadAreaNames;
    //ScanMapHeaders;
    ReadMapHeaderLocations;
    MapSelectPanel.Show;
    StatusBar1.Panels[1].Text := 'ROM Loaded...';
    //LoadMap(0);
    MapSelectCombo.ItemIndex := 0;
    MapSelectComboChange(Sender);
  end;
end;

procedure TMapEditorForm.SpinEdit1Change(Sender: TObject);
begin
  //ReadTilesetGraphics(GetTilesetHeader(SpinEdit1.Value), Tiles);
  //TilePalette.Picture.Graphic := Tiles;
end;

procedure TMapEditorForm.TilesetComboDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  with TComboBox(Control).Canvas do
  begin
    FillRect(Rect);
    TextOut(Rect.Left,Rect.Top,'Tileset ' + IntToStr(Index) + ':');
    Draw((Rect.Right - Rect.Left) div 2 - 64, Rect.Top + 13, TilesetCache[Index]);
  end;
end;

procedure TMapEditorForm.LoadTileset(TilesetNumber: Byte);
label LoadingDone;
var
    X, Y, Block, TileX, TileY: Integer;
    TileNumber: Byte;
    Temp: TBitmap;
    TilesetHdr: TTilesetHeader;
begin
    //if the tileset needed is already loaded, just exit
    //if LoadedTileset = TilesetNumber then Exit;

    TilesetHdr := GetTilesetHeader(TilesetNumber);
    TilesetStart := GBPtrToFilePos(TilesetHdr.BankNumber,TilesetHdr.TilesetArrangementPointer);

    if (TilesetStart = 0) or (GBPtrToFilePos(TilesetHdr.BankNumber,TilesetHdr.TilesetGraphicsPointer) = 0) then
    begin
        MessageDlg('Tileset information in rom seem to be corrupted. Loading will be cancelled.',mtError,[mbOK],0);
        Abort;
    end;

    Temp := TBitmap.Create;
    Temp.Width := 16*16;
    Temp.Height := 16*6;
    Temp.PixelFormat := pf24bit;

    //Temp.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Tileset' + IntToStr(TilesetNumber) + '.dib');
    ReadTilesetGraphics(GetTilesetHeader(TilesetNumber),Temp);
    Tiles.Canvas.StretchDraw(Tiles.Canvas.ClipRect,Temp);

    //start loading
    StatusBar1.Panels[0].Text := 'Loading Tileset ' + IntToStr(TilesetNumber) + ' please wait...';

    //start reading the block data from rom & rendering the tiles
    Rom.Position := TilesetStart;
    Blocks := 255;
    for Block := 0 to 255 do
    begin
      for Y := 0 to 3 do
      for X := 0 to 3 do
      begin
        Rom.Read(TileNumber,1);
        //create bitmap for block if not already existing
        if BlockPics[Block] = nil then
        begin
          BlockPics[Block] := TBitmap.Create;
          BlockPics[Block].Width := 32;
          BlockPics[Block].Height := 32;
          BlockPics[Block].PixelFormat := pf24bit;
        end;
        //calculate x and y coordinate where to copy tile from, the tileset picture has 16 tiles per line
        TileY := TileNumber div 16;
        TileX := TileNumber mod 16;
        //draw tile to block picture
        BlockPics[Block].Canvas.CopyRect(Rect(X*8,Y*8,X*8+8,Y*8+8),Tiles.Canvas,Rect(TileX*8,TileY*8,TileX*8+8,TileY*8+8));
      end;
    end;

    BlockPalette.Height := 32 * Blocks;
    BlockPaletteScrollBox.Show;
    SelBlock := 1;
    LoadedTileset := TilesetNumber;

    //updates blocks because tileset is changed
    DrawBlocks(BlockPalette.Canvas);

    //enable editing blocks
    BlockEditor1.Enabled := True;
    StatusBar1.Panels[0].Text := 'Tileset ' + inttostr(TilesetNumber) + ' loaded.';
end;

procedure TMapEditorForm.About1Click(Sender: TObject);
begin
  with TAboutDialog.Create(nil) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TMapEditorForm.BlockEditor1Click(Sender: TObject);
begin
  with TBlockEditorForm.Create(nil) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TMapEditorForm.BlockPaletteMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  SelBlock := (Y div 32);
end;

procedure TMapEditorForm.BlockPaletteMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  StatusBar1.Panels[0].Text := 'Block: $' + IntToHex(Y div 32 , 2) + ' Offset: $' + IntToHex(TilesetStart + ((Y div 32) * 16),0);
end;

procedure TMapEditorForm.BlockPalettePaint(Sender: TObject);
begin
  DrawBlocks(BlockPalette.Canvas);
end;

procedure TMapEditorForm.DrawBlocks(Canvas: TCanvas);
var
I: Integer;
begin
    Canvas.Brush.Style := bsClear;
    //go through the block pictures and draw then on BlockPalette
    for I := 0 to Blocks -1 do
    begin
        Canvas.Draw(0, I * 32, BlockPics[I]);
        if Grid1.Checked then
          Canvas.Rectangle(0, I * 32, 32 + 32, I * 32 + 32);
    end;
    //allow saving tileset picture
    SaveTilesetPic1.Enabled := True;
end;

procedure TMapEditorForm.DrawMap(Canvas: TCanvas);
var
	X, Y: Integer;
	MaxX, MaxY: Integer;
  StartTileConnect, StartWriteConnect: Integer;
  StartHeightWidthDifference: Integer;
  StartX, StartY, EndX, EndY: Integer;

begin
  Canvas.Brush.Style := bsClear;

  MaxX := Canvas.ClipRect.Right  div 32;
  MaxY := Canvas.ClipRect.Bottom div 32;

  if MaxX >= LoadedMapHeader.Width then MaxX := LoadedMapHeader.Width-1;
  if MaxY >= LoadedMapHeader.Height then MaxY := LoadedMapHeader.Height-1;

  for X := Canvas.ClipRect.Left div 32 to MaxX + 6 do
  for Y := Canvas.ClipRect.Top  div 32 to MaxY + 6 do
  begin
    if (X >= 3) and (Y >= 3) and (X <= MaxX + 3) and (Y <= MaxY + 3) then
    begin
      if (MapData[(Y-3) * LoadedMapHeader.Width + (X-3)] <= Blocks) then
        Canvas.Draw(X * 32, Y * 32, BlockPics[MapData[(Y-3) * LoadedMapHeader.Width + (X-3)]])
      else
      begin
        // Invalid blocks detected
        Canvas.Brush.Style := bsSolid;
        Canvas.Rectangle(X * 32, Y * 32, X * 32 + 32, Y * 32 + 32);
        Canvas.Brush.Style := bsClear;
      end;
    end
    else
    begin
      Canvas.Draw(X * 32, Y * 32, BlockPics[LoadedMapHeader.BorderBlock]);

      // Top
      if (LoadedMapHeader.ConnectionDataControl and $08) = $08 then
      begin
        StartTileConnect := (LoadedMapHeader.ConnectionData[0].MapDataPointer - $4000) - (ConnectedMapHeaders[0].DataPointer - $4000);
        StartWriteConnect := LoadedMapHeader.ConnectionData[0].MapLocationRamPointer - $C6E8;
        StartX := StartWriteConnect;
        StartY := 0;
        EndX := (LoadedMapHeader.ConnectionData[0].WidthHeightVisiblePart - 1) + StartWriteConnect;
        EndY := StartY + 3;

        if (X >= StartX) and (Y >= StartY) and (X <= EndX) and (Y < EndY) then
        begin
          StartHeightWidthDifference := ConnectedMapHeaders[0].Width - LoadedMapHeader.ConnectionData[0].WidthHeightVisiblePart;
          Canvas.Draw(X * 32, Y * 32, BlockPics[TopMapData[StartTileConnect + (Y * StartHeightWidthDifference) + (Y * LoadedMapHeader.ConnectionData[0].WidthHeightVisiblePart + (X - StartWriteConnect))]]);
        end;
      end;

      // Bottom
      if (LoadedMapHeader.ConnectionDataControl and $04) = $04 then
      begin
        StartTileConnect := (LoadedMapHeader.ConnectionData[1].MapDataPointer - $4000) - (ConnectedMapHeaders[1].DataPointer - $4000);
        StartWriteConnect := LoadedMapHeader.ConnectionData[1].MapLocationRamPointer - $C6E8;
        StartX := StartWriteConnect - ((LoadedMapHeader.Width + 6) * (LoadedMapHeader.Height + 3));
        StartY := StartWriteConnect div (LoadedMapHeader.Width + 6);
        EndX := StartX + (LoadedMapHeader.ConnectionData[1].WidthHeightVisiblePart - 1);
        EndY := StartY + 3;

        if (X >= StartX) and (Y >= StartY) and (X <= EndX) and (Y < EndY) then
        begin
          StartHeightWidthDifference := ConnectedMapHeaders[1].Width - LoadedMapHeader.ConnectionData[1].WidthHeightVisiblePart;
          Canvas.Draw(X * 32, Y * 32, BlockPics[BottomMapData[StartTileConnect + ((Y - StartY) * StartHeightWidthDifference) + ((Y - StartY) * LoadedMapHeader.ConnectionData[1].WidthHeightVisiblePart + (X - StartX))]]);
        end;
      end;

      // Left
      if (LoadedMapHeader.ConnectionDataControl and $02) = $02 then
      begin
        StartTileConnect := (LoadedMapHeader.ConnectionData[2].MapDataPointer - $4000) - (ConnectedMapHeaders[2].DataPointer - $4000);
        StartWriteConnect := LoadedMapHeader.ConnectionData[2].MapLocationRamPointer - $C6E8;
        StartX := 0;
        StartY := StartWriteConnect div (LoadedMapHeader.Width + 6);
        EndX := (StartX + 3) - 1;
        EndY := StartY + LoadedMapHeader.ConnectionData[2].WidthHeightVisiblePart;

        if (X >= StartX) and (Y >= StartY) and (X <= EndX) and (Y < EndY) then
        begin
          StartHeightWidthDifference := ConnectedMapHeaders[2].Width - LoadedMapHeader.ConnectionData[2].WidthHeightVisiblePart;
          Canvas.Draw(X * 32, Y * 32, BlockPics[LeftMapData[StartTileConnect + ((Y - StartY) * StartHeightWidthDifference) + ((Y - StartY) * LoadedMapHeader.ConnectionData[2].WidthHeightVisiblePart + (X - StartX))]]);
        end;
      end;

      // Right
      if (LoadedMapHeader.ConnectionDataControl and $01) = $01 then
      begin
        StartTileConnect := (LoadedMapHeader.ConnectionData[3].MapDataPointer - $4000) - (ConnectedMapHeaders[3].DataPointer - $4000);
        StartWriteConnect := LoadedMapHeader.ConnectionData[3].MapLocationRamPointer - $C6E8;

        StartX := LoadedMapHeader.Width+3;
        StartY := StartWriteConnect div (LoadedMapHeader.Width + 6);
        EndX := (StartX + 3) - 1;
        EndY := StartY + LoadedMapHeader.ConnectionData[3].WidthHeightVisiblePart;

        if (X >= StartX) and (Y >= StartY) and (X <= EndX) and (Y < EndY) then
        begin
          StartHeightWidthDifference := ConnectedMapHeaders[3].Width - LoadedMapHeader.ConnectionData[3].WidthHeightVisiblePart;
          Canvas.Draw(X * 32, Y * 32, BlockPics[RightMapData[StartTileConnect + ((Y - StartY) * StartHeightWidthDifference) + ((Y - StartY) * LoadedMapHeader.ConnectionData[3].WidthHeightVisiblePart + (X - StartX))]]);
        end;
      end;

    end;
    if Grid1.Checked then
      Canvas.Rectangle(X * 32, Y * 32, X * 32 + 32, Y * 32 + 32);
  end;
end;

procedure TMapEditorForm.LoadMap(MapIndex: byte);
var
  TempMapHeader: TMapHeader;
  TempMapStart: Integer;
  TempMapIndex: Byte;
begin

  //first check if we need to save previously loaded map
  if MapModified then
  case MessageDlg('Save changes?',mtConfirmation,mbYesNoCancel,0) of
      mrYes: SaveMap;
      mrCancel: Abort;
  end;

  LoadedMapHeader := GetMapHeader(MapIndex);

  if (LoadedMapHeader.Width * LoadedMapHeader.Height = 0) then
  begin
    MessageDlg('There seems be error in map header. Map will not be loaded.',mtWarning,[mbOK],0);
    Abort;
  end;

  DebugString('LoadMap', IntToStr(Map.BankLocations[MapIndex]));

  // load palettes
  if (MapIndex >= 0) and (MapIndex <= 10) then
  begin
    Palette[0] := WordToColor(RawMapPalettes[MapIndex+1][0]);
    Palette[1] := WordToColor(RawMapPalettes[MapIndex+1][1]);
    Palette[2] := WordToColor(RawMapPalettes[MapIndex+1][2]);
    Palette[3] := WordToColor(RawMapPalettes[MapIndex+1][3]);
  end
  else
  begin
    // default
    Palette[0] := WordToColor(RawMapPalettes[0][0]);
    Palette[1] := WordToColor(RawMapPalettes[0][1]);
    Palette[2] := WordToColor(RawMapPalettes[0][2]);
    Palette[3] := WordToColor(RawMapPalettes[0][3]);
  end;

  // Load the tileset
  LoadTileset(LoadedMapHeader.TilesetNumber);

  // Set the pointer to the map data
  MapStart := GBPtrToFilePos(Map.BankLocations[MapIndex], LoadedMapHeader.DataPointer);

  // Make sure ROM is big enough
  if Rom.Size - Rom.Position < LoadedMapHeader.Width *  LoadedMapHeader.Height then
  begin
    MessageDlg('Map is too big to be read from file.', mtWarning, [mbOK], 0);
    Abort;
  end;

  // Resize the map, and read the map data.
  SetLength(MapData, LoadedMapHeader.Width * LoadedMapHeader.Height);
  //read map data to array
  Rom.Position := MapStart;
  Rom.Read(MapData[0], LoadedMapHeader.Width * LoadedMapHeader.Height);

  // Load Top connection data
  if (LoadedMapHeader.ConnectionDataControl and $08) = $08 then
  begin
    TempMapIndex := LoadedMapHeader.ConnectionData[0].MapNumber;
    TempMapHeader := GetMapHeader(TempMapIndex);
    TempMapStart := GBPtrToFilePos(Map.BankLocations[TempMapIndex],
      TempMapHeader.DataPointer);
    ConnectedMapHeaders[0] := TempMapHeader;
    SetLength(TopMapData, TempMapHeader.Width * TempMapHeader.Height);
    Rom.Position := TempMapStart;
    Rom.Read(TopMapData[0], TempMapHeader.Width * TempMapHeader.Height);
  end;

  // Load Bottom connection data
  if (LoadedMapHeader.ConnectionDataControl and $04) = $04 then
  begin
    TempMapIndex := LoadedMapHeader.ConnectionData[1].MapNumber;
    TempMapHeader := GetMapHeader(TempMapIndex);
    TempMapStart := GBPtrToFilePos(Map.BankLocations[TempMapIndex],
      TempMapHeader.DataPointer);
    ConnectedMapHeaders[1] := TempMapHeader;
    SetLength(BottomMapData, TempMapHeader.Width * TempMapHeader.Height);
    Rom.Position := TempMapStart;
    Rom.Read(BottomMapData[0], TempMapHeader.Width * TempMapHeader.Height);
  end;

  // Load Left connection data
  if (LoadedMapHeader.ConnectionDataControl and $02) = $02 then
  begin
    TempMapIndex := LoadedMapHeader.ConnectionData[2].MapNumber;
    TempMapHeader := GetMapHeader(TempMapIndex);
    TempMapStart := GBPtrToFilePos(Map.BankLocations[TempMapIndex],
      TempMapHeader.DataPointer);
    ConnectedMapHeaders[2] := TempMapHeader;
    SetLength(LeftMapData, TempMapHeader.Width * TempMapHeader.Height);
    Rom.Position := TempMapStart;
    Rom.Read(LeftMapData[0], TempMapHeader.Width * TempMapHeader.Height);
  end;

  // Load Right connection data
  if (LoadedMapHeader.ConnectionDataControl and $01) = $01 then
  begin
    TempMapIndex := LoadedMapHeader.ConnectionData[3].MapNumber;
    TempMapHeader := GetMapHeader(TempMapIndex);
    TempMapStart := GBPtrToFilePos(Map.BankLocations[TempMapIndex],
      TempMapHeader.DataPointer);
    ConnectedMapHeaders[3] := TempMapHeader;
    SetLength(RightMapData, TempMapHeader.Width * TempMapHeader.Height);
    Rom.Position := TempMapStart;
    Rom.Read(RightMapData[0], TempMapHeader.Width * TempMapHeader.Height);
  end;

  //give MapBox right size
  MapBox.Height := LoadedMapHeader.Height * 32 + (6 * 32); //Pad with 6 Blocks
  MapBox.Width  := LoadedMapHeader.Width * 32 + (6 * 32); //Pad with 6 Blocks

  //Show map
  MapScrollBox.Hide;
  MapScrollBox.Show;
  MapScrollBox.ScrollInView(MapBox);
  MapBox.Refresh;

  //TODO: Load events and pokemon
  LoadedMapBank := Map.BankLocations[MapIndex];
  LoadedMapNum  := MapIndex;

  MapModified := False;
  SaveMapPic1.Enabled := True;

  LoadPokemon(MapIndex);
  //hide event properties
  //WarpForm.Hide;
  //SignpostForm.Hide;
  //PeopleForm.Hide;
end;

procedure TMapEditorForm.LoadPokemon(MapIndex: Byte);
var
  First:  string;
  Second: string;
begin
  PokemonStart := 0;
  LandWildPkmn.Rate   := $00;
  WaterWildPkmn.Rate  := $00;
  LandPkmnBox.Clear;
  WaterPkmnBox.Clear;

  Rom.Position := $CEEB + (MapIndex * 2);
  Rom.Read(Pointer,SizeOf(Pointer));

  First     := IntToStr(Pointer.Second + $80);
  Second    := IntToStr(Pointer.First);
  Location  := IntToHex(StrToInt(First),2) + IntToHex(StrToInt(Second),2);
  Rom.Position := StrToInt('$' + Location);
  Rom.Read(LandWildPkmn,SizeOf(TLandWildPkmn));
  LandOffset1.Caption := '$' + Location;
  if (LandWildPkmn.Rate <> $00) then
    begin
      PokemonStart := StrToInt('$' + Location);
      Rom.Position := StrToInt('$' + Location) + SizeOf(TLandWildPkmn);
      Rom.Read(WaterWildPkmn,SizeOf(TWaterWildPkmn));
      WaterOffset1.Caption := '$' + IntToHex(StrToInt('$' + Location) + SizeOf(TLandWildPkmn),4);
    end
  else
    begin
      WaterOffset1.Caption := '$' + IntToHex(StrToInt('$' + Location) + $01,4);
      Rom.Position := StrToInt('$' + Location) + $01;
      Rom.Read(WaterWildPkmn,SizeOf(TWaterWildPkmn));
      if WaterWildPkmn.Rate <> $00 then
        begin
          PokemonStart := StrToInt('$' + Location) + $01;
        end;
    end;

  if (LandWildPkmn.Rate = $00) and (WaterWildPkmn.Rate = $00) then
    begin
      NoWildPkmnLabel.Show;
      Exit;
    end;
  if LandWildPkmn.Rate <> $00 then
    begin
      LandPkmnBox.Enabled     := True;
      LandPkmnCombo.Enabled   := True;
      LandPkmnLevel.Enabled   := True;
      LandRateTrack.Enabled   := True;
      LandReplaceBtn.Enabled  := True;
    end
  else
    begin
      LandPkmnBox.Enabled     := False;
      LandPkmnCombo.Enabled   := False;
      LandPkmnLevel.Enabled   := False;
      LandRateTrack.Enabled   := False;
      LandReplaceBtn.Enabled  := False;
    end;
  if WaterWildPkmn.Rate <> $00 then
    begin
      WaterPkmnBox.Enabled    := True;
      WaterPkmnCombo.Enabled  := True;
      WaterPkmnLevel.Enabled  := True;
      WaterRateTrack.Enabled  := True;
      WaterReplaceBtn.Enabled := True;
    end
  else
    begin
      WaterPkmnBox.Enabled    := False;
      WaterPkmnCombo.Enabled  := False;
      WaterPkmnLevel.Enabled  := False;
      WaterRateTrack.Enabled  := False;
      WaterReplaceBtn.Enabled := False;
    end;
  NoWildPkmnLabel.Hide;
  LandRateTrack.Position  := LandWildPkmn.Rate;
  LandPercent.Caption := IntToStr(LandWildPkmn.Rate) + '%';
  WaterRateTrack.Position := WaterWildPkmn.Rate;
  WaterPercent.Caption := IntToStr(WaterWildPkmn.Rate) + '%';
  UpdatePokemon;
end;

procedure TMapEditorForm.UpdatePokemon;
var
  I: Integer;
begin
  LandPkmnBox.Clear;
  WaterPkmnBox.Clear;
  LandLevelBox.Clear;
  WaterLevelBox.Clear;
  if LandWildPkmn.Rate <> $00 then
    begin
      for I := 0 to 9 do
        begin
          LandPkmnBox.AddItem(LandPkmnCombo.Items[LandWildPkmn.Pkmn[I].Number],LandPkmnBox);
          LandLevelBox.AddItem(IntToStr(LandWildPkmn.Pkmn[I].Level),LandLevelBox);
        end;
    end;
  if WaterWildPkmn.Rate <> $00 then
    begin
      for I := 0 to 9 do
        begin
          WaterPkmnBox.AddItem(WaterPkmnCombo.Items[WaterWildPkmn.Pkmn[I].Number],WaterPkmnBox);
          WaterLevelBox.AddItem(IntToStr(WaterWildPkmn.Pkmn[I].Level),WaterLevelBox);
        end;
    end;
end;

procedure TMapEditorForm.MapBoxMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  StartTileConnect, StartWriteConnect: Integer;
  StartX, StartY, EndX, EndY: Integer;
  BlockX, BlockY: Integer;
begin

  BlockX := X div 32;
  BlockY := Y div 32;

  if IsOutsideOfMapBounds(X, Y) = false then
  begin
    //change block if mouse button is left
    if Button = mbLeft then
    begin
      MapModified := True;
      MapData[SelPic] := SelBlock;
      MapBox.Canvas.Draw((X div 32) * 32, (Y div 32) * 32, BlockPics[SelBlock]);
      //if gid is sellected, add it
      if Grid1.Checked then
        MapBox.Canvas.Rectangle(X div 32 * 32, Y div 32 * 32,
          X div 32 * 32 + 32, Y div 32 * 32 + 32);
      //enable painting for OnMouseMove
      Painting := True;
    end
    else
    begin
      //other buttons will select the block at cursor
      if (MapData[SelPic] <= Blocks) then
      begin
        BlockPaletteScrollBox.VertScrollBar.Position := 32 * MapData[SelPic];
        SelBlock := MapData[SelPic];
      end;
    end;
  end
  else
  begin
    // check if we are over a top connection
    if (LoadedMapHeader.ConnectionDataControl and $08) = $08 then
    begin
      StartTileConnect := (LoadedMapHeader.ConnectionData[0].MapDataPointer - $4000) - (ConnectedMapHeaders[0].DataPointer - $4000);
      StartWriteConnect := LoadedMapHeader.ConnectionData[0].MapLocationRamPointer - $C6E8;
      StartX := StartWriteConnect;
      StartY := 0;
      EndX := (LoadedMapHeader.ConnectionData[0].WidthHeightVisiblePart - 1) + StartWriteConnect;
      EndY := StartY + 3;
      if (BlockX >= StartX) and (BlockY >= StartY) and (BlockX <= EndX) and (BlockY < EndY) then
      begin
        MapSelectCombo.ItemIndex := LoadedMapHeader.ConnectionData[0].MapNumber;
        MapSelectComboChange(Sender);
      end;
    end;

    // check if we are over a bottom connection
    if (LoadedMapHeader.ConnectionDataControl and $04) = $04 then
    begin
      StartTileConnect := (LoadedMapHeader.ConnectionData[1].MapDataPointer - $4000) - (ConnectedMapHeaders[1].DataPointer - $4000);
      StartWriteConnect := LoadedMapHeader.ConnectionData[1].MapLocationRamPointer - $C6E8;
      StartX := StartWriteConnect - ((LoadedMapHeader.Width + 6) * (LoadedMapHeader.Height + 3));
      StartY := StartWriteConnect div (LoadedMapHeader.Width + 6);
      EndX := StartX + (LoadedMapHeader.ConnectionData[1].WidthHeightVisiblePart - 1);
      EndY := StartY + 3;
      if (BlockX >= StartX) and (BlockY >= StartY) and (BlockX <= EndX) and (BlockY < EndY) then
      begin
        MapSelectCombo.ItemIndex := LoadedMapHeader.ConnectionData[1].MapNumber;
        MapSelectComboChange(Sender);
      end;
    end;

    // Left
    if (LoadedMapHeader.ConnectionDataControl and $02) = $02 then
    begin
      StartTileConnect := (LoadedMapHeader.ConnectionData[2].MapDataPointer - $4000) - (ConnectedMapHeaders[2].DataPointer - $4000);
      StartWriteConnect := LoadedMapHeader.ConnectionData[2].MapLocationRamPointer - $C6E8;
      StartX := 0;
      StartY := StartWriteConnect div (LoadedMapHeader.Width + 6);
      EndX := (StartX + 3) - 1;
      EndY := StartY + LoadedMapHeader.ConnectionData[2].WidthHeightVisiblePart;
      if (BlockX >= StartX) and (BlockY >= StartY) and (BlockX <= EndX) and (BlockY < EndY) then
      begin
        MapSelectCombo.ItemIndex := LoadedMapHeader.ConnectionData[2].MapNumber;
        MapSelectComboChange(Sender);
      end;
    end;

    // Right
    if (LoadedMapHeader.ConnectionDataControl and $01) = $01 then
    begin
      StartTileConnect := (LoadedMapHeader.ConnectionData[3].MapDataPointer - $4000) - (ConnectedMapHeaders[3].DataPointer - $4000);
      StartWriteConnect := LoadedMapHeader.ConnectionData[3].MapLocationRamPointer - $C6E8;
      StartX := LoadedMapHeader.Width+3;
      StartY := StartWriteConnect div (LoadedMapHeader.Width + 6);
      EndX := (StartX + 3) - 1;
      EndY := StartY + LoadedMapHeader.ConnectionData[3].WidthHeightVisiblePart;
      if (BlockX >= StartX) and (BlockY >= StartY) and (BlockX <= EndX) and (BlockY < EndY) then
      begin
        MapSelectCombo.ItemIndex := LoadedMapHeader.ConnectionData[3].MapNumber;
        MapSelectComboChange(Sender);
      end;
    end;
  end;
end;

procedure TMapEditorForm.MapBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  StartTileConnect, StartWriteConnect: Integer;
  StartX, StartY, EndX, EndY: Integer;
  BlockX, BlockY: Integer;
begin

  BlockX := X div 32;
  BlockY := Y div 32;

  //Get block number where cursor is
  SelPic := ((Y div 32)-3) * LoadedMapHeader.Width + ((X div 32)-3);

  //don't do anything with wrong coordinates
  if (X < 0) or (Y < 0) or (SelPic >= (LoadedMapHeader.Width+3) * (LoadedMapHeader.Height+3)) then Exit;

  shpHighlight.Width := 32+1;
  shpHighlight.Height := 32+1;
  shpHighlight.Top := MapBox.Top + ((Y div 32) * 32);
  shpHighlight.Left := MapBox.Left + (X div 32) * 32;

  if IsOutsideOfMapBounds(X, Y) = True then
  begin
    shpHighlight.Brush.Color := $80FF;
    StatusBar1.Panels[0].Text := 'Border Tile (Read Only)';
    MapBox.Cursor := crDrag;

    // check if we are over a top connection
    if (LoadedMapHeader.ConnectionDataControl and $08) = $08 then
    begin
      StartTileConnect := (LoadedMapHeader.ConnectionData[0].MapDataPointer - $4000) - (ConnectedMapHeaders[0].DataPointer - $4000);
      StartWriteConnect := LoadedMapHeader.ConnectionData[0].MapLocationRamPointer - $C6E8;
      StartX := StartWriteConnect;
      StartY := 0;
      EndX := (LoadedMapHeader.ConnectionData[0].WidthHeightVisiblePart - 1) + StartWriteConnect;
      EndY := StartY + 3;
      if (BlockX >= StartX) and (BlockY >= StartY) and (BlockX <= EndX) and (BlockY < EndY) then
      begin
        shpHighlight.Left := (StartX*32)-MapBox.Canvas.ClipRect.Left;
        shpHighlight.Top := (StartY*32)-MapBox.Canvas.ClipRect.Top;
        shpHighlight.Width := (LoadedMapHeader.ConnectionData[0].WidthHeightVisiblePart*32)+1;
        shpHighlight.Height := (3*32)+1;
        StatusBar1.Panels[0].Text := 'Connected Map #: ' + IntToStr(LoadedMapHeader.ConnectionData[0].MapNumber);
        MapBox.Cursor := crHandPoint;
      end;
    end;

    // check if we are over a bottom connection
    if (LoadedMapHeader.ConnectionDataControl and $04) = $04 then
    begin
      StartTileConnect := (LoadedMapHeader.ConnectionData[1].MapDataPointer - $4000) - (ConnectedMapHeaders[1].DataPointer - $4000);
      StartWriteConnect := LoadedMapHeader.ConnectionData[1].MapLocationRamPointer - $C6E8;
      StartX := StartWriteConnect - ((LoadedMapHeader.Width + 6) * (LoadedMapHeader.Height + 3));
      StartY := StartWriteConnect div (LoadedMapHeader.Width + 6);
      EndX := StartX + (LoadedMapHeader.ConnectionData[1].WidthHeightVisiblePart - 1);
      EndY := StartY + 3;
      if (BlockX >= StartX) and (BlockY >= StartY) and (BlockX <= EndX) and (BlockY < EndY) then
      begin
        shpHighlight.Left := (StartX * 32) - MapBox.Canvas.ClipRect.Left;
        shpHighlight.Top := (StartY * 32) - MapBox.Canvas.ClipRect.Top;
        shpHighlight.Width := (LoadedMapHeader.ConnectionData[1].WidthHeightVisiblePart * 32)+1;
        shpHighlight.Height := (3*32)+1;
        StatusBar1.Panels[0].Text := 'Connected Map #: ' + IntToStr(LoadedMapHeader.ConnectionData[1].MapNumber);
        MapBox.Cursor := crHandPoint;
      end;
    end;

    // Left
    if (LoadedMapHeader.ConnectionDataControl and $02) = $02 then
    begin
      StartTileConnect := (LoadedMapHeader.ConnectionData[2].MapDataPointer - $4000) - (ConnectedMapHeaders[2].DataPointer - $4000);
      StartWriteConnect := LoadedMapHeader.ConnectionData[2].MapLocationRamPointer - $C6E8;
      StartX := 0;
      StartY := StartWriteConnect div (LoadedMapHeader.Width + 6);
      EndX := (StartX + 3) - 1;
      EndY := StartY + LoadedMapHeader.ConnectionData[2].WidthHeightVisiblePart;
      if (BlockX >= StartX) and (BlockY >= StartY) and (BlockX <= EndX) and (BlockY < EndY) then
      begin
        shpHighlight.Left := (StartX * 32) - MapBox.Canvas.ClipRect.Left;
        shpHighlight.Top := (StartY * 32) - MapBox.Canvas.ClipRect.Top;
        shpHighlight.Width := (3*32)+1;
        shpHighlight.Height := (LoadedMapHeader.ConnectionData[2].WidthHeightVisiblePart * 32)+1;
        StatusBar1.Panels[0].Text := 'Connected Map #: ' + IntToStr(LoadedMapHeader.ConnectionData[2].MapNumber);
        MapBox.Cursor := crHandPoint;
      end;
    end;

    // Right
    if (LoadedMapHeader.ConnectionDataControl and $01) = $01 then
    begin
      StartTileConnect := (LoadedMapHeader.ConnectionData[3].MapDataPointer - $4000) - (ConnectedMapHeaders[3].DataPointer - $4000);
      StartWriteConnect := LoadedMapHeader.ConnectionData[3].MapLocationRamPointer - $C6E8;
      StartX := LoadedMapHeader.Width+3;
      StartY := StartWriteConnect div (LoadedMapHeader.Width + 6);
      EndX := (StartX + 3) - 1;
      EndY := StartY + LoadedMapHeader.ConnectionData[3].WidthHeightVisiblePart;
      if (BlockX >= StartX) and (BlockY >= StartY) and (BlockX <= EndX) and (BlockY < EndY) then
      begin
        shpHighlight.Left := (StartX * 32) - MapBox.Canvas.ClipRect.Left;
        shpHighlight.Top := (StartY * 32) - MapBox.Canvas.ClipRect.Top;
        shpHighlight.Width := (3*32)+1;
        shpHighlight.Height := (LoadedMapHeader.ConnectionData[3].WidthHeightVisiblePart * 32)+1;
        StatusBar1.Panels[0].Text := 'Connected Map #: ' + IntToStr(LoadedMapHeader.ConnectionData[3].MapNumber);
        MapBox.Cursor := crHandPoint;
      end;
    end;
  end
  else
  begin
    StatusBar1.Panels[0].Text := 'X: ' + IntToStr((X div 32)-3) +
      ' Y: ' + IntToStr((Y div 32)-3) +
      ' Block: $' + IntToHex(MapData[SelPic], 2) +
      ' Offset: $' + IntToHex(MapStart + SelPic, 2);
    shpHighlight.Brush.Color := clLime;
    MapBox.Cursor := crDrag;
  end;

  //If mouse left button is pressed block is changed
  if Painting then
  begin
    MapData[SelPic] := SelBlock;
    MapBox.Canvas.Draw(X div 32 * 32,Y div 32 * 32,BlockPics[SelBlock]);
    //if grid is selected, add it
    if Grid1.Checked then
      MapBox.Canvas.Rectangle(X div 32 * 32, Y div 32 * 32,
        X div 32 * 32 + 32, Y div 32 * 32 + 32);
  end;
end;

procedure TMapEditorForm.MapBoxMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    Painting := False;
end;

procedure TMapEditorForm.MapBoxPaint(Sender: TObject);
begin
    DrawMap(MapBox.Canvas);
end;

procedure TMapEditorForm.MapSelectComboChange(Sender: TObject);
begin
    LoadMap(MapSelectCombo.ItemIndex);
  //Tab := PageControl1.ActivePageIndex;
  //PageControl1.ActivePageIndex := Tab;
  //MapBoxPaint(nil);
  //MapBox.Invalidate;
  //MapScrollBox.Refresh;
end;

function TMapEditorForm.IsOutsideOfMapBounds(X, Y: Integer): Boolean;
begin
  if ((Y div 32) - 3 < 0) or ((X div 32) - 3 < 0)
    or ((X div 32) - 3 >= LoadedMapHeader.Width) or ((Y div 32) - 3 >= LoadedMapHeader.Height) then
    Result := True
  else
    Result := False;
end;

procedure TMapEditorForm.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TMapEditorForm.SaveRom1Click(Sender: TObject);
begin
  SaveRom(OpenRomDialog.FileName);
end;

procedure TMapEditorForm.SaveRom(FileName: string);
begin
  if MapStart > 0 then
    SaveMap;
  //if (EventsAddr>0) then
  //  SaveEvents;
  if PokemonStart > 0 then
    SavePokemon;
  Rom.SaveToFile(FileName);
  RomModified := False;
end;

procedure TMapEditorForm.SaveMap;
begin
  //write map data
  Rom.Position := MapStart;
  Rom.Write(MapData[0],LoadedMapHeader.Width * LoadedMapHeader.Height);
  //save other stuff
  //SaveEvents;
  //SavePokemon;
  MapModified := False;
  RomModified := True;
end;

procedure TMapEditorForm.SavePokemon;
begin
  if PokemonStart = 0 then
    Exit;

  if LandWildPkmn.Rate <> $00 then
    begin
      Rom.Position := PokemonStart;
      Rom.Write(LandWildPkmn,SizeOf(TLandWildPkmn));
    end;
  if WaterWildPkmn.Rate <> $00 then
    begin
      if LandWildPkmn.Rate = $00 then
        begin
          Rom.Position := PokemonStart;
          Rom.Write(WaterWildPkmn,SizeOf(TWaterWildPkmn));
        end
      else
        begin
          Rom.Position := PokemonStart + SizeOf(TLandWildPkmn);
          Rom.Write(WaterWildPkmn,SizeOf(TWaterWildPkmn));
        end;
    end;
end;

procedure TMapEditorForm.LandReplaceBtnClick(Sender: TObject);
begin
  LandWildPkmn.Pkmn[LandPkmnBox.ItemIndex].Number := LandPkmnCombo.ItemIndex;
  LandWildPkmn.Pkmn[LandPkmnBox.ItemIndex].Level  := LandPkmnLevel.Value;
  UpdatePokemon;
  MapModified := True;
end;

procedure TMapEditorForm.WaterReplaceBtnClick(Sender: TObject);
begin
  WaterWildPkmn.Pkmn[WaterPkmnBox.ItemIndex].Number := WaterPkmnCombo.ItemIndex;
  WaterWildPkmn.Pkmn[WaterPkmnBox.ItemIndex].Level  := WaterPkmnLevel.Value;
  UpdatePokemon;
  MapModified := True;
end;

procedure TMapEditorForm.LandPkmnBoxClick(Sender: TObject);
begin
  LandPkmnCombo.ItemIndex := LandWildPkmn.Pkmn[LandPkmnBox.ItemIndex].Number;
  LandPkmnLevel.Value     := LandWildPkmn.Pkmn[LandPkmnBox.ItemIndex].Level;
end;

procedure TMapEditorForm.WaterPkmnBoxClick(Sender: TObject);
begin
  WaterPkmnCombo.ItemIndex  := WaterWildPkmn.Pkmn[WaterPkmnBox.ItemIndex].Number;
  WaterPkmnLevel.Value      := WaterWildPkmn.Pkmn[WaterPkmnBox.ItemIndex].Level;
end;

procedure TMapEditorForm.LandRateTrackExit(Sender: TObject);
begin
  LandWildPkmn.Rate     := LandRateTrack.Position;
  LandPercent.Caption   := IntToStr(LandRateTrack.Position) + '%';
  MapModified := True;
end;

procedure TMapEditorForm.WaterRateTrackExit(Sender: TObject);
begin
  WaterWildPkmn.Rate    := WaterRateTrack.Position;
  WaterPercent.Caption  := IntToStr(WaterRateTrack.Position) + '%';
  MapModified := True;
end;

end.
