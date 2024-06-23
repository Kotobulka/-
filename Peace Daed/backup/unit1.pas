unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  todayDate : TDateTime;
  todayTime : TDateTime;

  Start : Double;
  b : Boolean;
implementation

{$R *.lfm}

{ TForm1 }

function GetTime : TDateTime;
var
  s:TSystemTime;
begin
  GetLocalTime(s);
  Result := SystemTimeToDateTime(s);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  todayTime := Time;
  todayDate := Date;

  Label1.Caption:= timetostr(todayTime);
  Label2.Caption:= datetostr(todayDate);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  b:=false;
  Timer2.Enabled := true;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Timer2.Enabled := false;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  exit;
end;

procedure TForm1.Label3Click(Sender: TObject);
begin

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  todayTime := Time;
  todayDate := Date;

  Label1.Caption:= timetostr(todayTime);
  Label2.Caption:= datetostr(todayDate);
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  if not (b) then
     Start := GetTime;
  b := True;
  label3.Caption:= formatdatetime('hh:nn:ss', GetTime - Start);
end;

end.

