unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Label1Click(Sender: TObject);
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

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  LoanAmount, InterestRate, MonthlyPayment: Real;
  LoanTerm, i: Integer;
begin
  // Чтение значений из полей ввода
  LoanAmount := StrToFloatDef(Edit1.Text, 0);
  LoanTerm := StrToIntDef(Edit2.Text, 0);
  InterestRate := StrToFloatDef(Edit3.Text, 0) / 100 / 12;

  // Проверка на корректность введенных данных
  if (LoanAmount <= 0) or (LoanTerm <= 0) or (InterestRate <= 0) then
  begin
    ShowMessage('Введите корректные данные!');
    Exit;
  end;

  // Расчет ежемесячного платежа по формуле аннуитетного платежа
  MonthlyPayment := LoanAmount * (InterestRate * Exp(LoanTerm * Ln(1 + InterestRate))) / (Exp(LoanTerm * Ln(1 + InterestRate)) - 1);

  // Вывод результата
  Label5.Caption := Format('%.2f руб.', [MonthlyPayment]);
end;

end.

