unit About;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, pngimage, ExtCtrls;

type
  TAboutDialog = class(TForm)
    Shape1: TShape;
    Bevel1: TBevel;
    Shape2: TShape;
    AppNameLabel: TLabel;
    Label1: TLabel;
    VersionLabel: TLabel;
    Image1: TImage;
    Button1: TButton;
    Memo1: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutDialog: TAboutDialog;

implementation

{$R *.dfm}

end.
