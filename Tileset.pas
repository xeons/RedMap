unit Tileset;

interface

uses Map, Classes, Dialogs, SysUtils, Graphics;

type
  TTilesetHeader = packed record
    BankNumber:  Byte;
    TilesetArrangementPointer:  Word;
    TilesetGraphicsPointer:  Word;
    UnknownData: array [0..6] of Byte;
  end;

var
  //Palette: array [0..3] of TColor = (clWhite,clLtGray,clDkGray,clBlack);
  //Palette: array [0..3] of TColor = ($F8E8F8, $A8E058, $A0D0F8, $181010);
  Palette: array [0..3] of TColor = ($F8E8F8, $58E0A8, $F8D0A0, $101018);
  RawMapPalettes: array [0..12, 0..3] of Word;

const Zero: Byte = 0;

function GetTilesetHeader(TilesetNumber: Byte): TTilesetHeader;
function WordToColor(Value: Word): TColor;
procedure ReadTilesetGraphics(TilesetHeader: TTilesetHeader; Bmp: TBitmap);
procedure ReadMapPallets;

implementation

uses MapEditor;

function GetTilesetHeader(TilesetNumber: Byte): TTilesetHeader;
begin
  Rom.Position := $C7BE + ((TilesetNumber) * SizeOf(TTilesetHeader));
  Rom.Read(Result, SizeOf(TTilesetHeader));
end;

function WordToColor(Value: Word): TColor;
var
  R,G,B: Byte;
begin
  R := Round((((Value shr 00) and 31) / 31) * 255);
  G := Round((((Value shr 05) and 31) / 31) * 255);
  B := Round((((Value shr 10) and 31) / 31) * 255);
  Result := R or (G shl 8) or (B shl 16);
end;

//reads tile from Stream into Bmp and uses colors from Pal
procedure ReadTile(Stream: TStream; Bmp: TBitmap);
var
  X,Y: Integer;
  Data1,Data2: Byte;
begin
  for Y := 0 to 7 do
  begin
    Stream.Read(Data1,1);
    Stream.Read(Data2,1);
    for X := 0 to 7 do
      Bmp.Canvas.Pixels[X,Y] := Palette[((Data1 shr (7-X)) and 1) or (((Data2 shr (7-X)) and 1) shl 1)];
  end;
end;

//reads tileset at specific address into Bmp
procedure ReadTilesetGraphics(TilesetHeader: TTilesetHeader; Bmp: TBitmap);
var
  Tile: TBitmap;
  TileCnt: Byte;
  I: Integer;

begin

  Tile := TBitmap.Create;
  Tile.PixelFormat := pf24bit;
  Tile.Width  := 8;
  Tile.Height := 8;
  Rom.Position := GBPtrToFilePos(TilesetHeader.BankNumber, TilesetHeader.TilesetGraphicsPointer);
  TileCnt := 0;
  for I := 1 to 16 * 6 do
  begin
    ReadTile(Rom,Tile);
    Bmp.Canvas.Draw((TileCnt mod 16) * 8, (TileCnt div 16) * 8, Tile);
    Inc(TileCnt);
  end;
end;

procedure ReadMapPallets;
begin
  Rom.Position := $72660;
  Rom.Read(RawMapPalettes, 8*12);

end;

end.
