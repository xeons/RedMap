//******************************************************************************
//GoldMap
//by BlueSonic (aka Jigglypuff)
//******************************************************************************
unit BlockEditor;

interface

uses
SysUtils, Controls, Classes, Forms, StdCtrls, ExtCtrls, Graphics;

type
  TBlockEditorForm = class(TForm)
    ScrollBox1: TScrollBox;
    TileLabel: TLabel;
    BlockLabel: TLabel;
    UpdateButton: TButton;
    AddressLabel: TLabel;
    BlockEditBox: TImage;
    BlockBox: TPaintBox;
    TilePalette: TImage;
    procedure FormCreate(Sender: TObject);
    procedure BlockBoxMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure BlockBoxMouseDown(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure LoadTile;
    procedure SaveTile;
    procedure UpdateTile;
    procedure TilePaletteMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure TilePaletteMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure BlockEditBoxMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure UpdateButtonClick(Sender: TObject);
    procedure BlockBoxPaint(Sender: TObject);
    procedure BlockEditBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  public
    BlockStart,SelTile,TileNumber : Integer;
    BlockData: array [0..15] of Byte;
  end;

implementation

uses MapEditor;

{$R *.DFM}

procedure TBlockeditorForm.LoadTile;
begin
  Rom.Position := BlockStart;
  //loads block
  Rom.Read(BlockData, SizeOf(BlockData));
end;

procedure TBlockeditorForm.SaveTile;
begin
  Rom.Position := BlockStart;
  //Saves block
  Rom.Write(BlockData, SizeOf(BlockData));
end;

procedure TBlockeditorForm.UpdateTile;
var
  X,Y,I: Integer;
  TileX, TileY, TileNumber: Byte;
begin
  I := 0;
  //draws tiles into block
  for Y := 0 to 3 do
  for X := 0 to 3 do
  begin
    TileNumber := BlockData[I];
    //calculate x and y coordinate where to copy tile from, the tileset picture has 16 tiles per line
    TileY := TileNumber div 16;
    TileX := TileNumber mod 16;
    //draw tile to block picture
    BlockEditBox.Picture.Bitmap.Canvas.CopyRect(Rect(X*8,Y*8,X*8+8,Y*8+8),Tiles.Canvas,Rect(TileX*8,TileY*8,TileX*8+8,TileY*8+8));
    Inc(I);
  end;
end;

procedure TBlockEditorForm.FormCreate(Sender: TObject);
begin
  //create block bitmap
  BlockEditBox.Picture.Bitmap := TBitmap.Create;
  BlockEditBox.Picture.Bitmap.Height := 32;
  BlockEditBox.Picture.Bitmap.Width := 32;
  BlockEditBox.Picture.Bitmap.PixelFormat := pf24bit;
  //initalize other stuff
  //BlockBox.Picture.Bitmap := MainForm.BlockPalette.Picture.Bitmap;
  BlockBox.Height := MapEditorForm.BlockPalette.Height;
  TilePalette.Picture.Graphic := Tiles;
  //TilePalette.Height := Tiles.Height;
  Caption := 'Block Editor - Tileset ' + IntToStr(LoadedTileset);
  BlockStart := TilesetStart;
  LoadTile;
  UpdateTile;
end;

procedure TBlockEditorForm.BlockBoxMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  BlockLabel.Caption := 'Block: $' + IntToHex(Y div 32, 2);
  AddressLabel.Caption := 'Offset: $' + IntToHex(TilesetStart + ((Y div 32) * 16), 2);
end;

procedure TBlockEditorForm.BlockBoxMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  BlockStart := TilesetStart + ((Y div 32) * 16);
  TileNumber := Y div 32;
  LoadTile;
  UpdateTile;
end;

procedure TBlockEditorForm.TilePaletteMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  TileLabel.Caption := 'Tile: $' + IntToHex((X div 8) + ((Y div 8) * 8), 2);
end;

procedure TBlockEditorForm.TilePaletteMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  //gets tile where cursor is
  SelPic := (X div 8) + ((Y div 8) * 8);
end;

procedure TBlockEditorForm.BlockEditBoxMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    //puts selected tile into block
    BlockData[(X div 8) + ((Y div 8) * 4)] := SelPic;
    UpdateTile;
  end
  else
  begin
    SelPic := BlockData[(X div 8) + ((Y div 8) * 4)];
  end;
end;

procedure TBlockEditorForm.UpdateButtonClick(Sender: TObject);
begin
  SaveTile;
  //draws edited tile into tileset
  BlockPics[TileNumber].Canvas.Draw(0, 0, BlockEditBox.Picture.Bitmap);
  //update block palette
  MapEditorForm.DrawBlocks(MapEditorForm.BlockPalette.Canvas);
  MapEditorForm.DrawBlocks(BlockBox.Canvas);
  MapEditorForm.DrawMap(MapEditorForm.MapBox.Canvas);
  RomModified := True;
end;

procedure TBlockEditorForm.BlockBoxPaint(Sender: TObject);
begin
  MapEditorForm.DrawBlocks(BlockBox.Canvas);
end;

procedure TBlockEditorForm.BlockEditBoxMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  TileLabel.Caption := 'Tile: $' + IntToHex(BlockData[(X div 8) + ((Y div 8) * 4)], 2);
end;

end.
