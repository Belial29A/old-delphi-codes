unit FlatUtilitys;

interface

{$I Version.inc}

uses Windows, Classes, Graphics, Buttons, HSLUtils;

{$IFNDEF D4CB4}
const
  MSH_MOUSEWHEEL = 'MSWHEEL_ROLLMSG';
{$ENDIF}

type
  TScrollType = (up, down);
  TColorCalcType = (lighten, darken);
  TCheckBoxLayout = (checkboxLeft, checkboxRight);
  TRadioButtonLayout = (radioLeft, radioRight);
  {$IFNDEF D4CB4}
  TProgressBarOrientation = (pbHorizontal, pbVertical);
  {$ENDIF}
  TFlatTabPosition = (tpTop, tpBottom);
  TArrowPos = (NE, NW, SE, SW);
  TNumGlyphs = 1..4;
  TAdvColors = 0..100;

function CreateDisabledBitmap (FOriginal: TBitmap; OutlineColor, BackColor, HighlightColor, ShadowColor: TColor; DrawHighlight: Boolean): TBitmap;

function CalcAdvancedColor (ParentColor, OriginalColor: TColor; Percent: Byte; ColorType: TColorCalcType): TColor;
procedure CalcButtonLayout (Canvas: TCanvas; const Client: TRect; const Offset: TPoint; Layout: TButtonLayout;
  Spacing, Margin: Integer; FGlyph: TBitmap; FNumGlyphs: Integer;
  const Caption: string; var TextBounds: TRect; var GlyphPos: TPoint);
function Min(val1, val2: Word): Word;
function GetFontMetrics(Font: TFont): TTextMetric;
function GetFontHeight(Font: TFont): Integer;
function RectInRect(R1, R2: TRect): Boolean;

implementation

function CreateDisabledBitmap(FOriginal: TBitmap; OutlineColor, BackColor, HighlightColor, ShadowColor: TColor; DrawHighlight: Boolean): TBitmap;
const
  ROP_DSPDxax = $00E20746;
var
  MonoBmp: TBitmap;
  IRect: TRect;
begin
  IRect := Rect(0, 0, FOriginal.Width, FOriginal.Height);
  Result := TBitmap.Create;
  try
    Result.Width := FOriginal.Width;
    Result.Height := FOriginal.Height;
    MonoBmp := TBitmap.Create;
    try
      with MonoBmp do begin
        Width := FOriginal.Width;
        Height := FOriginal.Height;
        Canvas.CopyRect(IRect, FOriginal.Canvas, IRect);
{$IFDEF D4CB4}
        HandleType := bmDDB;
{$ENDIF}
        Canvas.Brush.Color := OutlineColor;
        if Monochrome then begin
          Canvas.Font.Color := clWhite;
          Monochrome := False;
          Canvas.Brush.Color := clWhite;
        end;
        Monochrome := True;
      end;
      with Result.Canvas do begin
        Brush.Color := BackColor;
        FillRect(IRect);
        if DrawHighlight then begin
          Brush.Color := HighlightColor;
          SetTextColor(Handle, clBlack);
          SetBkColor(Handle, clWhite);
          BitBlt(Handle, 1, 1, IRect.Right - IRect.Left, IRect.Bottom - IRect.Top, MonoBmp.Canvas.Handle, 0, 0, ROP_DSPDxax);
        end;
        Brush.Color := ShadowColor;
        SetTextColor(Handle, clBlack);
        SetBkColor(Handle, clWhite);
        BitBlt(Handle, 0, 0, IRect.Right - IRect.Left, IRect.Bottom - IRect.Top, MonoBmp.Canvas.Handle, 0, 0, ROP_DSPDxax);
      end;
    finally
      MonoBmp.Free;
    end;
  except
    Result.Free;
    raise;
  end;
end;

function CalcAdvancedColor (ParentColor, OriginalColor: TColor; Percent: Byte; ColorType: TColorCalcType): TColor;
var
  H, S, L: integer;
begin
  if Percent <> 0 then
  begin
    RGBtoHSLRange(ColorToRGB(ParentColor), H, S, L);
    inc(L, 10);
    if ColorType = lighten then
      if L + Percent > 100 then
        L := 100
      else
        inc(L, Percent)
    else
      if L - Percent < 0 then
        L := 0
      else
        dec(L, Percent);

    Result := HSLRangeToRGB(H, S, L);
  end
  else
    Result := OriginalColor;
end;

procedure CalcButtonLayout (Canvas: TCanvas; const Client: TRect; const Offset: TPoint; Layout: TButtonLayout;
  Spacing, Margin: Integer; FGlyph: TBitmap; FNumGlyphs: Integer;
  const Caption: string; var TextBounds: TRect; var GlyphPos: TPoint);
var
  TextPos: TPoint;
  ClientSize, GlyphSize, TextSize: TPoint;
  TotalSize: TPoint;
begin
  // calculate the item sizes
  ClientSize := Point(Client.Right - Client.Left, Client.Bottom - Client.Top);

  if FGlyph <> nil then
    GlyphSize := Point(FGlyph.Width div FNumGlyphs, FGlyph.Height)
  else
    GlyphSize := Point(0, 0);

  if Length(Caption) > 0 then
    begin
      TextBounds := Rect(0, 0, Client.Right - Client.Left, 0);
      DrawText(Canvas.Handle, PChar(Caption), Length(Caption), TextBounds, DT_CALCRECT or DT_SINGLELINE);
      TextSize := Point(TextBounds.Right - TextBounds.Left, TextBounds.Bottom - TextBounds.Top);
    end
  else
    begin
      TextBounds := Rect(0, 0, 0, 0);
      TextSize := Point(0, 0);
    end;

  // If the layout has the glyph on the right or the left, then both the
  // text and the glyph are centered vertically.  If the glyph is on the top
  // or the bottom, then both the text and the glyph are centered horizontally.
  if Layout in [blGlyphLeft, blGlyphRight] then
  begin
    GlyphPos.Y := (ClientSize.Y - GlyphSize.Y + 1) div 2;
    TextPos.Y := (ClientSize.Y - TextSize.Y + 1) div 2;
  end
  else
  begin
    GlyphPos.X := (ClientSize.X - GlyphSize.X + 1) div 2;
    TextPos.X := (ClientSize.X - TextSize.X + 1) div 2;
  end;

  // if there is no text or no bitmap, then Spacing is irrelevant
  if (TextSize.X = 0) or (GlyphSize.X = 0) then
    Spacing := 0;

  // adjust Margin and Spacing
  if Margin = -1 then
  begin
    if Spacing = -1 then
    begin
      TotalSize := Point(GlyphSize.X + TextSize.X, GlyphSize.Y + TextSize.Y);
      if Layout in [blGlyphLeft, blGlyphRight] then
        Margin := (ClientSize.X - TotalSize.X) div 3
      else
        Margin := (ClientSize.Y - TotalSize.Y) div 3;
      Spacing := Margin;
    end
    else
    begin
      TotalSize := Point(GlyphSize.X + Spacing + TextSize.X, GlyphSize.Y + Spacing + TextSize.Y);
      if Layout in [blGlyphLeft, blGlyphRight] then
        Margin := (ClientSize.X - TotalSize.X + 1) div 2
      else
        Margin := (ClientSize.Y - TotalSize.Y + 1) div 2;
    end;
  end
  else
  begin
    if Spacing = -1 then
    begin
      TotalSize := Point(ClientSize.X - (Margin + GlyphSize.X), ClientSize.Y - (Margin + GlyphSize.Y));
      if Layout in [blGlyphLeft, blGlyphRight] then
        Spacing := (TotalSize.X - TextSize.X) div 2
      else
        Spacing := (TotalSize.Y - TextSize.Y) div 2;
    end;
  end;

  case Layout of
    blGlyphLeft:
    begin
      GlyphPos.X := Margin;
      TextPos.X := GlyphPos.X + GlyphSize.X + Spacing;
    end;
    blGlyphRight:
    begin
      GlyphPos.X := ClientSize.X - Margin - GlyphSize.X;
      TextPos.X := GlyphPos.X - Spacing - TextSize.X;
    end;
    blGlyphTop:
    begin
      GlyphPos.Y := Margin;
      TextPos.Y := GlyphPos.Y + GlyphSize.Y + Spacing;
    end;
    blGlyphBottom:
    begin
      GlyphPos.Y := ClientSize.Y - Margin - GlyphSize.Y;
      TextPos.Y := GlyphPos.Y - Spacing - TextSize.Y;
    end;
  end;

  // fixup the result variables
  with GlyphPos do
  begin
    Inc(X, Client.Left + Offset.X);
    Inc(Y, Client.Top + Offset.Y);
  end;
  OffsetRect(TextBounds, TextPos.X + Client.Left + Offset.X, TextPos.Y + Client.Top + Offset.X);
end;

function Min(val1, val2: Word): Word;
begin
  Result := val1;
  if val1 > val2 then
    Result := val2;
end;

function GetFontMetrics(Font: TFont): TTextMetric;
var
  DC: HDC;
  SaveFont: HFont;
begin
  DC := GetDC(0);
  SaveFont := SelectObject(DC, Font.Handle);
  GetTextMetrics(DC, Result);
  SelectObject(DC, SaveFont);
  ReleaseDC(0, DC);
end;

function GetFontHeight(Font: TFont): Integer;
begin
  with GetFontMetrics(Font) do
    Result := Round(tmHeight + tmHeight / 8);
end;

function RectInRect(R1, R2: TRect): Boolean;
begin
  Result := IntersectRect(R1, R1, R2);
end;

end.
