program December2_2;
{$mode objfpc}{$H+}

uses
  SysUtils, Classes, StrUtils;

function ReadFile(): TStringList;
var
  FilePath: string;
  FileContent: TStringList;
begin
  FilePath := ExtractFilePath(ParamStr(0)) + 'input.txt';
  FileContent := TStringList.Create;
  FileContent.LoadFromFile(FilePath);
  Result := FileContent;
end;

var
  Lines: TStringList;
  i, j, RangeCount: Integer;
  Line: string;
  Ranges: TStringArray;
  Range: string;
  AllInvalid: Int64;
  LowStr, HighStr: string;
  SepPos: Integer;
  Low, High: Int64;
  Id: Int64;
  IdStr: string;
  Len, PatLen, CurPos: Integer;
  Pattern: string;
  IsRepeated: Boolean;
begin
  Lines := ReadFile();
  try
    AllInvalid := 0;

    for i := 0 to Lines.Count - 1 do
    begin
      Line := Trim(Lines[i]);
      if Line = '' then
        Continue;

      Ranges := SplitString(Line, ',');

      for j := 0 to Length(Ranges) - 1 do
      begin
        Range := Trim(Ranges[j]);
        if Range = '' then
          Continue;

        SepPos := Pos('-', Range);
        if SepPos = 0 then
          Continue;

        LowStr := Copy(Range, 1, SepPos - 1);
        HighStr := Copy(Range, SepPos + 1, Length(Range) - SepPos);

        Low := StrToInt64(Trim(LowStr));
        High := StrToInt64(Trim(HighStr));

        Id := Low;
        while Id <= High do
        begin
          IdStr := IntToStr(Id);
          Len := Length(IdStr);

          if Len >= 2 then
          begin
            IsRepeated := False;

            for PatLen := 1 to (Len div 2) do
            begin
              if (Len mod PatLen) <> 0 then
                Continue;

              Pattern := Copy(IdStr, 1, PatLen);
              IsRepeated := True;

              CurPos := PatLen + 1;
              while CurPos <= Len do
              begin
                if Copy(IdStr, CurPos, PatLen) <> Pattern then
                begin
                  IsRepeated := False;
                  Break;
                end;
                Inc(CurPos, PatLen);
              end;

              if IsRepeated then
                Break;
            end;

            if IsRepeated then
              AllInvalid := AllInvalid + Id;
          end;

          Inc(Id);
        end;
      end;
    end;

    WriteLn(AllInvalid);
  finally
    Lines.Free;
  end;
end.
