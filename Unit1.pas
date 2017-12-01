Unit Unit1;

Interface

Uses
 Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
 Dialogs, ShellAPI, FileCtrl, XPMan, StdCtrls, ComCtrls, Spin, Buttons, ExtCtrls;

Type
 TForm1 = Class(TForm)
  lv: TListView;
  Panel1: TPanel;
  Panel2: TPanel;
  GroupBox1: TGroupBox;
  Label1: TLabel;
  Label2: TLabel;
  msub: TMemo;
  semin: TSpinEdit;
  sesec: TSpinEdit;
  sems: TSpinEdit;
  ba: TButton;
  GroupBox2: TGroupBox;
  Button2: TButton;
  Button1: TButton;
  SpeedButton1: TSpeedButton;
  Procedure Button1Click(Sender: TObject);
  Procedure Button2Click(Sender: TObject);
  Procedure semsChange(Sender: TObject);
  Procedure sesecChange(Sender: TObject);
  Procedure lvClick(Sender: TObject);
  Procedure lvChange(Sender: TObject; Item: TListItem; Change: TItemChange);
  Procedure lvData(Sender: TObject; Item: TListItem);
  Procedure msubChange(Sender: TObject);
  Procedure baClick(Sender: TObject);
  Procedure seminChange(Sender: TObject);
  Procedure GroupBox2Click(Sender: TObject);
  Procedure FormCreate(Sender: TObject);
  Procedure SpeedButton1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
 Private
    { Deklarasi hanya untuk penggunaan dalam unit ini saja }
  pathnow: String;
  changed: boolean;
  Procedure wmNCLButtonDown(Var Msg: TWMNCLButtonDown); Message WM_NCLBUTTONDOWN;
  Procedure wmNCLButtonUp(Var Msg: TWMNCLButtonUp); Message WM_NCLBUTTONUP;
 Public
    { Deklarasi untuk penggunaan ke semua unit yang terintegerasi }
 End;

Var
 Form1: TForm1;

Implementation

{$R *.dfm} //template tweaked by : Araachmadi Putra Pambudi
Procedure TForm1.wmNCLButtonDown(Var Msg: TWMNCLButtonDown);
Begin
 If Msg.HitTest = HTHELP Then
 Begin
  Msg.Result := 0; // swallow mouse down on biHelp border icon
 End
 Else
  Inherited;
End;

Procedure TForm1.wmNCLButtonUp(Var Msg: TWMNCLButtonUp);
Begin
 If Msg.HitTest = HTHELP Then
 Begin
  Msg.Result := 0;
  messagebox(handle, pchar('LRC2SRT 1.0'#13#13'Created by : Arachmadi Putra Pambudi'#13'TwinDDC Team Leader and DitPut Drive Corporation Company owner' + #13#13'This program will help you to convert your Lyric file that has been made with MiniLyric or another Lyric creator in *.lrc format, into a ' + 'common subtitle format, so you can play it''s video clip with a subtitle that has made from the lyric file.'#13'This program only using Single-Timing' + 'Lyric File, because this program is using simple text parsing to work, so it won''t work with Multiple-Timing Lyric File.'), 'About LRC2SRT 1.0', 64);

 End
 Else
  Inherited;
End;

Function pangkas(Teks, TitikAwal, TitikAkhir: String; AmbilTitikLingkup, HapusLingkup: boolean; PanjangLingkupLuar: integer): String;
Begin
 If AmbilTitikLingkup And Not HapusLingkup Then
  result := copy(Teks, pos(TitikAwal, Teks), pos(TitikAkhir, Teks) + (length(TitikAkhir) - 1))
 Else If AmbilTitikLingkup And HapusLingkup Then
  result := copy(copy(Teks, pos(TitikAwal, Teks), pos(TitikAkhir, Teks) + (length(TitikAkhir) - 1)), 1, PanjangLingkupLuar);
 If Not AmbilTitikLingkup And Not HapusLingkup Then
  result := copy(copy(Teks, pos(TitikAwal, Teks), (pos(TitikAkhir, Teks) - pos(TitikAwal, Teks))), length(TitikAwal) + 1, length(Teks) - 1)
 Else If Not AmbilTitikLingkup And HapusLingkup Then
 Begin
  result := copy(Teks, length(copy(Teks, pos(TitikAwal, Teks), pos(TitikAkhir, Teks) + (length(TitikAkhir) - 1))) + 1, PanjangLingkupLuar);
 End;
End;

Function getval(s: String): TStringList;
Begin
 result := TStringList.Create;
 result.Add(pangkas(s, '[', ':', false, false, 0));
 result.Add(pangkas(s, ':', '.', false, false, 0));
 result.Add(pangkas(s, '.', ']', false, false, 0));
 result.Add(copy(s, 11, length(s)));
End;

Function isnum(s: String): boolean;
Begin
 Try
  strtoint(s);
  result := true;
 Except
  result := false;
 End;
End;

Procedure TForm1.Button1Click(Sender: TObject);
Var
 tod: TOpenDialog;
 tsl: TStringList;
 i, j, k: integer;
 tli: TListItem;
 fn: String;
Begin
 tod := TOpenDialog.Create(nil);
 tod.Filter := 'Minilyric File |*.lrc';
 tod.Title := 'Opening single timing lyric file';
 If directoryexists('C:\Lyrics') Then
  tod.FileName := 'C:\Lyrics\*.lrc';
 If Not tod.Execute Then
 Begin
  tod.Free;
  exit;
 End
 Else
 Begin
  pathnow := tod.FileName;
  lv.Clear;
  tsl := TStringList.Create;
  tsl.LoadFromFile(tod.filename);
  fn := tod.FileName;
  i := tsl.Count;
  j := 0;
  k := 0;
  While j < i - 1 Do
  Begin
   If Not isnum(getval(tsl[j])[0]) Then
   Begin
    inc(j);
    inc(k);
   End
   Else
   Begin
    tli := lv.Items.Add;
    tli.Caption := inttostr((j + 1) - k);
    tli.SubItems.Add(getval(tsl[j])[0]);
    tli.SubItems.Add(getval(tsl[j])[1]);
    tli.SubItems.Add(getval(tsl[j])[2]);
    tli.SubItems.Add(getval(tsl[j])[3]);
    inc(j);
   End;
  End;
 End;
 tod.free;
 tsl.Free;
 Caption := 'LRC2SRT - ' + ExtractFileName(fn);
 GroupBox1.Enabled := True;
 If lv.Items.Count <= 0 Then
 Begin
  messagebox(handle, 'Unable to parse the lyric data, make sure the file is UTF-8 encoded or is not blank.', 'Loading Failed', 16);
  Caption := 'LRC2SRT - Please Load a Lyric File';
 End;
End;

Procedure TForm1.Button2Click(Sender: TObject);
Var
 tsl: TStringList;
 i: integer;
 s: String;
Begin
 If lv.Items.Count <= 0 Then
 Begin
  messagebox(handle, 'Nothing to save', 'Save As SRT', 16);
  exit;
 End;
 tsl := TStringList.Create;
 For i := 1 To lv.Items.Count Do
 Begin
  If i = lv.Items.Count Then
   s := '00' + ':' + lv.Items.Item[i - 1].SubItems.strings[0] + ':' + lv.Items.Item[i - 1].SubItems.strings[1] + ',' + lv.Items.Item[i - 1].SubItems.strings[2] + ' --> ' + '00' + ':' + lv.Items.Item[i - 1].SubItems.strings[0] + ':' + inttostr(strtoint(lv.Items.Item[i - 1].SubItems.strings[1]) + 5) + ',' + lv.Items.Item[i - 1].SubItems.strings[2]
  Else
   s := '00' + ':' + lv.Items.Item[i - 1].SubItems.strings[0] + ':' + lv.Items.Item[i - 1].SubItems.strings[1] + ',' + lv.Items.Item[i - 1].SubItems.strings[2] + ' --> ' + '00' + ':' + lv.Items.Item[i].SubItems.strings[0] + ':' + lv.Items.Item[i].SubItems.strings[1] + ',' + inttostr(strtoint(lv.Items.Item[i].SubItems.strings[2]) - 3);
  tsl.Add(inttostr(i));
  tsl.Add(s);
  tsl.Add(lv.Items.Item[i - 1].subitems.strings[3]);
  tsl.Add('');
  lv.Items.Item[i - 1].Checked := true;
 End;
 tsl.Text := StringReplace(tsl.Text, ':-1', ':000', [rfIgnoreCase, rfreplaceall]);
 tsl.SaveToFile(ChangeFileExt(pathnow, '.srt'));
 tsl.Free;
 messagebox(handle, pchar('Conversion completed, the converted file has saved to the same folder with the lyric file.'), 'Conversion Completed', 64);
End;

Procedure TForm1.semsChange(Sender: TObject);
Begin
 If sems.Value > 99 Then
 Begin
  sesec.Value := sesec.Value + 1;
  sems.Text := '0';
 End;
End;

Procedure TForm1.sesecChange(Sender: TObject);
Begin
 If sesec.Value > 59 Then
 Begin
  semin.Value := semin.Value + 1;
  sesec.text := '0';
 End;
End;

Procedure TForm1.lvClick(Sender: TObject);
Begin
 Try
  If lv.ItemIndex < 0 Then
  Begin
   semin.Enabled := False;
   sesec.Enabled := False;
   sems.Enabled := False;
   msub.Enabled := False;
  End
  Else
  Begin
   semin.Text := lv.Items.Item[lv.itemindex].SubItems.Strings[0];
   sesec.Text := lv.Items.Item[lv.itemindex].SubItems.Strings[1];
   sems.Text := lv.Items.Item[lv.itemindex].SubItems.Strings[2];
   msub.Text := lv.Items.Item[lv.itemindex].SubItems.Strings[3];
   ba.Enabled := false;
   semin.Enabled := True;
   sesec.Enabled := True;
   sems.Enabled := True;
   msub.Enabled := True;
  End;
 Except
 End;
End;

Procedure TForm1.lvChange(Sender: TObject; Item: TListItem; Change: TItemChange);
Begin
 Try

  semin.Text := lv.Items.Item[lv.itemindex].SubItems.Strings[0];
  sesec.Text := lv.Items.Item[lv.itemindex].SubItems.Strings[1];
  sems.Text := lv.Items.Item[lv.itemindex].SubItems.Strings[2];
  msub.Text := lv.Items.Item[lv.itemindex].SubItems.Strings[3];
  ba.Enabled := false;
 Except
 End;
End;

Procedure TForm1.lvData(Sender: TObject; Item: TListItem);
Begin
 Try
  semin.Text := lv.Items.Item[lv.itemindex].SubItems.Strings[0];
  sesec.Text := lv.Items.Item[lv.itemindex].SubItems.Strings[1];
  sems.Text := lv.Items.Item[lv.itemindex].SubItems.Strings[2];
  msub.Text := lv.Items.Item[lv.itemindex].SubItems.Strings[3];
 Except
 End;
End;

Procedure TForm1.msubChange(Sender: TObject);
Begin
 changed := true;
End;

Procedure TForm1.baClick(Sender: TObject);
Var
 m, s, ms: String;
Begin
 If messagebox(handle, 'Do you want to apply changes to the current line?', 'Apply Changes', 48 + 4) = mrno Then
  exit
 Else If semin.Value < 10 Then
  m := '0' + semin.Text
 Else
  m := semin.Text;
 If sesec.Value < 10 Then
  s := '0' + sesec.Text
 Else
  s := sesec.Text;
 If sems.Value < 10 Then
  ms := '0' + sems.Text
 Else
  ms := sems.Text;

 lv.Items.BeginUpdate;
 lv.Items.Item[lv.ItemIndex].SubItems.Strings[0] := m;
 lv.Items.Item[lv.ItemIndex].SubItems.Strings[1] := s;
 lv.Items.Item[lv.ItemIndex].SubItems.Strings[2] := ms;
 lv.Items.Item[lv.ItemIndex].SubItems.Strings[3] := msub.Text;
 lv.Items.EndUpdate;
 lv.SetFocus;
End;

Procedure TForm1.seminChange(Sender: TObject);
Begin
 ba.Enabled := true;
End;

Procedure TForm1.GroupBox2Click(Sender: TObject);
Begin
 Application.Title := 'LRC2SRT 1.0';
End;

Procedure TForm1.FormCreate(Sender: TObject);
Begin
 Application.Title := 'LRC2SRT';
End;

Procedure TForm1.SpeedButton1Click(Sender: TObject);
Begin
 messagebox(handle, pchar('LRC2SRT 1.0'#13#13'Created by : Arachmadi Putra Pambudi'#13'TwinDDC Team Leader and DitPut Drive Corporation Company owner' + #13#13'This program will help you to convert your Lyric file that has been made with MiniLyric or another Lyric creator in *.lrc format, into a ' + 'common subtitle format, so you can play it''s video clip with a subtitle that has made from the lyric file.'#13'This program only using Single-Timing' + 'Lyric File, because this program is using simple text parsing to work, so it won''t work with Multiple-Timing Lyric File.'), 'About LRC2SRT 1.0', 64);

End;

procedure TForm1.FormResize(Sender: TObject);
begin
if Width < 543 then Width := 543;
if Height < 256 then Height := 256;
end;

End.

procedure TForm1.FormResize(Sender: TObject);
begin

end;


