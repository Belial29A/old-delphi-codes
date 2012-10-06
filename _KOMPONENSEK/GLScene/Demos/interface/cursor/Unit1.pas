{: Displaying alpha-blended 2D bitmaps with GLScene.<p>

   This sample is a very basic picture viewer, using OpenGL for displaying
   images and maintaining a cursor with alpha-blended trail.<p>

   THUDSprite objects are used to display the bitmap and the cursor/trail. The
   cursor/trail bitmaps share a single material stored in the material library.<p>

   The trail uses a particle-system component to track trail bitmaps, each time
   the mouse is moved on the scene viewer, the HSCursor sprite is moved accordingly
   and a new trail bitmap is created and initialized. Trail bitmaps have a slowly
   decreasing alpha channel value and take 5 seconds to go from fully opaque to
   fully invisible, and when invisibility is reached, they are killed.<p>

   When trails are not active (toggled on/off by a menu item), the status bar
   displays the color (RGB) of the point below the cursor, by using the
   GetPixelColor function.<p>
}
unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtDlgs, Menus, ComCtrls, GLScene, GLObjects, GLParticles, GLMisc, GLTexture,
  GLCadencer, ExtCtrls, GLHudObjects;

type
  TForm1 = class(TForm)
    GLSceneViewer1: TGLSceneViewer;
    GLScene1: TGLScene;
    GLCamera1: TGLCamera;
    GLParticles1: TGLParticles;
    HSBitmap: THUDSprite;
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    MIFile: TMenuItem;
    MILoadImage: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    HSCursor: THUDSprite;
    GLCadencer1: TGLCadencer;
    Bevel1: TBevel;
    HSParticle: THUDSprite;
    GLMaterialLibrary1: TGLMaterialLibrary;
    Timer1: TTimer;
    O1: TMenuItem;
    MITrail: TMenuItem;
    N1: TMenuItem;
    MIExit: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure GLSceneViewer1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure GLParticles1ActivateParticle(Sender: TObject;
      particle: TGLBaseSceneObject);
    procedure HSParticleProgress(Sender: TObject; const deltaTime,
      newTime: Double);
    procedure Timer1Timer(Sender: TObject);
    procedure MITrailClick(Sender: TObject);
    procedure MILoadImageClick(Sender: TObject);
    procedure MIExitClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

uses Jpeg;

procedure TForm1.FormCreate(Sender: TObject);
begin
   // hide the Windows cursor for the GLSceneViewer
   GLSceneViewer1.Cursor:=crNone;
   // and load my ugly cursor (size adjusted in design props)
   with GLMaterialLibrary1.Materials[0] do
      Material.Texture.Image.LoadFromFile('..\..\media\cursor.bmp');
end;

procedure TForm1.MILoadImageClick(Sender: TObject);
begin
   if OpenPictureDialog1.Execute then begin
      // use the hourglass cursor, it may take some time to load the bitmap,
      // rescale it and generate mipmaps before sending it to OpenGL
      Screen.Cursor:=crHourGlass;
      with (HSBitmap.Material.Texture.Image as TGLPictureImage).Picture do begin
         LoadFromFile(OpenPictureDialog1.FileName);
         // adjust hud sprite size to match that of the picture
         HSBitmap.SetSize(Width, Height);
         // adjust position, hudsprites are centered on their x, y coords
         HSBitmap.Position.X:=Width/2;
         HSBitmap.Position.Y:=Height/2;
      end;
      Screen.Cursor:=crDefault;
   end;
end;

procedure TForm1.GLSceneViewer1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
   color : TColor;
begin
   // Mouse moved, adjust the position of our cursor
   HSCursor.Position.X:=x;
   HSCursor.Position.Y:=y;
   // Update the status bar with some misc. info
   color:=GLSceneViewer1.GetPixelColor(x, y);
   StatusBar1.SimpleText:=Format('X:%4d Y:%4d, R:%3d G:%3d B:%3d',
                                 [x, y, GetRValue(color), GetGValue(color), GetBValue(color)]);
   // Add a trail particle
   if MITrail.Checked then
      GLParticles1.CreateParticle;
   // Update things now
   GLCadencer1.Progress;
end;

procedure TForm1.HSParticleProgress(Sender: TObject; const deltaTime,
  newTime: Double);
begin
   with (Sender as THUDSprite) do begin
      // decrease life time / alpha
      TagFloat:=TagFloat-deltaTime;
      // update alpha channel, but if no more life is left, then suicide
      if TagFloat<0 then
         GLParticles1.KillParticle(TGLProxyObject(Sender))
      else AlphaChannel:=TagFloat*0.2;
   end;
end;

procedure TForm1.GLParticles1ActivateParticle(Sender: TObject;
  particle: TGLBaseSceneObject);
begin
   with (particle as THUDSprite) do begin
      // we are cadencing real-time, so these are 5 seconds
      TagFloat:=5;
      // new particle stands where cursor is
      Position.AsVector:=HSCursor.Position.AsVector;
   end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
   // update FPS and sprite count
   Caption:=Format('%.1f FPS - %d Cursor Sprites',
                   [GLSceneViewer1.FramesPerSecond, GLParticles1.Count]);
end;

procedure TForm1.MITrailClick(Sender: TObject);
begin
   // turn trails on/off
   MITrail.Checked:=not MITrail.Checked;
end;

procedure TForm1.MIExitClick(Sender: TObject);
begin
 Close;
end;

end.
