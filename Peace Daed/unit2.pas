unit unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Edit1Change(Sender: TObject);
begin

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
   ShowMessage('Время для срабатывания будильника!');
  Timer1.Enabled := False;
end;

procedure TForm1.Button1Click(Sender: TObject);
  var
  AlarmTime: TDateTime;

begin
  try
    AlarmTime := StrToTime(Edit1.Text);
  except
    ShowMessage('Ошибка ввода времени');
    Exit;
  end;

  Timer1.Interval := Round((AlarmTime - Time) * 86400 * 1000); // Преобразуем разницу времени в миллисекунды
  Timer1.Enabled := True;
end;

end.

