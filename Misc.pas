unit Misc;

interface

uses Windows, Sysutils;

procedure DebugString(aCaption, aText: string);

implementation

 // GetFormatDT - Output = formated DateTime String
function GetFormatDT(aDateTime: TDateTime): string;
begin
  Result := FormatDateTime('dd.mm.yy hh:nn:ss zzz', aDateTime);
end;

// GetFormatT - Output = formated Time String
function GetFormatT(aDateTime: TDateTime): string;
begin
  Result := FormatDateTime('hh:nn:ss zzz', aDateTime)
end;

procedure DebugString(aCaption, aText: string);
begin
  OutputDebugString(PChar(Format('[%s][%s] %s',
    [aCaption, GetFormatDT(Now()),
    aText])));
end;

end.
