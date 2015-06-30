program RedMap;

uses
  Forms,
  MapEditor in 'MapEditor.pas' {MapEditorForm},
  Tileset in 'Tileset.pas',
  Map in 'Map.pas',
  About in 'About.pas' {AboutDialog},
  Misc in 'Misc.pas',
  BlockEditor in 'BlockEditor.pas' {BlockEditorForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'RedMap';
  Application.CreateForm(TMapEditorForm, MapEditorForm);
  Application.CreateForm(TAboutDialog, AboutDialog);
  Application.Run;
end.
