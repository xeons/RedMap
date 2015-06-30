unit Map;

interface

uses ComCtrls,SysUtils,Dialogs,Classes;

type

TConnectionData = packed record
  MapNumber: Byte;
  MapDataPointer: Word;
  MapLocationRamPointer: Word;
  WidthHeightVisiblePart: Byte;
  YChangePoint: Byte;
  XChangePoint: Byte;
  Unknown: Byte;
  UnknownPointer: Word;
end;

//Header 1
TMapHeader = packed record
  TilesetNumber: Byte;
  Height: Byte;
  Width: Byte;
  DataPointer: Word;
  ObjectScriptPointers: Word;
  LevelScriptPointer: Word;
  ConnectionDataControl: Byte;
  ConnectionData: array [$00..$03] of TConnectionData;
  ObjectDataPointer: Word;
  BorderBlock: Byte;
end;

const
Ln = #13#10;

//table needed for encoding area names
Table: array [$00..$FF] of string[4] = (
{   0      1      2      3      4      5      6      7      8      9      A      B      C      D      E      F     }
{0}'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,
{1}'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,' '   ,
{2}'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,
{3}'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,
{4}'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,Ln    ,
{5}'#'   ,Ln+Ln ,'HIRO','GARY','POKé',Ln    ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,
{6}'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,
{7}'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'…'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,' '   ,
{8}'A'   ,'B'   ,'C'   ,'D'   ,'E'   ,'F'   ,'G'   ,'H'   ,'I'   ,'J'   ,'K'   ,'L'   ,'M'   ,'N'   ,'O'   ,'P'   ,
{9}'Q'   ,'R'   ,'S'   ,'T'   ,'U'   ,'V'   ,'W'   ,'X'   ,'Y'   ,'Z'   ,'#'   ,'#'   ,':'   ,'#'   ,'#'   ,'#'   ,
{A}'a'   ,'b'   ,'c'   ,'d'   ,'e'   ,'f'   ,'g'   ,'h'   ,'i'   ,'j'   ,'k'   ,'l'   ,'m'   ,'n'   ,'o'   ,'p'   ,
{B}'q'   ,'r'   ,'s'   ,'t'   ,'u'   ,'v'   ,'w'   ,'x'   ,'y'   ,'z'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,
{C}'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,
{D}'#'   ,'''l' ,'''m' ,'''r' ,'''s' ,'''t' ,'''v' ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,
{E}''''  ,'#'   ,'#'   ,'-'   ,'#'   ,'#'   ,'?'   ,'!'   ,'.'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,'#'   ,
{F}'#'   ,' '   ,'#'   ,'#'   ,','   ,'#'   ,'0'   ,'1'   ,'2'   ,'3'   ,'4'   ,'5'   ,'6'   ,'7'   ,'8'   ,'9'
);

function GBPtrToFilePos(Bank: Byte; Addr: Word): Integer; overload;
function GBBank(Position: Integer): Byte;
procedure ReadMapHeaderLocations;
function GetMapHeader(MapIndex: Byte): TMapHeader;

var
  AreaNames: TStringList;
  BankLocations: array [$00..$F9] of Byte;
  MapHeaderOffsets: array [$00..$F9] of Word;

implementation

uses MapEditor;

//converts rombank and, address in that bank, into romfile offset
function GBPtrToFilePos(Bank: Byte; Addr: Word): Integer; overload;
begin
  Result := (Bank * $4000) + (Addr xor $4000);
end;

//gives gameboy rombank number ar specified file offset
function GBBank(Position: Integer): Byte;
begin
  Result := (Position div $4000);
end;

procedure ReadMapHeaderLocations;
begin
  Rom.Position := $C23D;
  Rom.Read(BankLocations, $F9);
  Rom.Position := $01AE;
  Rom.Read(MapHeaderOffsets, $F9 * sizeof(Word));
end;

function GetMapHeader(MapIndex: Byte): TMapHeader;
var
  TempHeader: TMapHeader;
begin
  Rom.Position := GBPtrToFilePos(BankLocations[MapIndex], MapHeaderOffsets[MapIndex]);

  Rom.Read(TempHeader.TilesetNumber, 1);
  Rom.Read(TempHeader.Height, 1);
  Rom.Read(TempHeader.Width, 1);
  Rom.Read(TempHeader.DataPointer, 2);
  Rom.Read(TempHeader.ObjectScriptPointers, 2);
  Rom.Read(TempHeader.LevelScriptPointer, 2);
  Rom.Read(TempHeader.ConnectionDataControl, 1);

  if (TempHeader.ConnectionDataControl and $08) = $08 then
    Rom.Read(TempHeader.ConnectionData[0], SizeOf(TConnectionData));

  if (TempHeader.ConnectionDataControl and $04) = $04 then
    Rom.Read(TempHeader.ConnectionData[1], SizeOf(TConnectionData));

  if (TempHeader.ConnectionDataControl and $02) = $02 then
    Rom.Read(TempHeader.ConnectionData[2], SizeOf(TConnectionData));

  if (TempHeader.ConnectionDataControl and $01) = $01 then
    Rom.Read(TempHeader.ConnectionData[3], SizeOf(TConnectionData));

  Rom.Read(TempHeader.ObjectDataPointer, 2);

  Rom.Position := GBPtrToFilePos(BankLocations[MapIndex],
    TempHeader.ObjectDataPointer);

  Rom.Read(TempHeader.BorderBlock, 1);

  Result := TempHeader;
end;

end.
