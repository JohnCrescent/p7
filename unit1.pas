unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var ok:boolean;
  i,cislo,zvysok,vysledok,sustava:integer;
  prevod:string;
begin
  sustava:=strtoint(edit1.text);
  cislo:=strtoint(edit2.text);
 prevod:=inttostr(cislo);

if sustava>9 then showmessage('Základ sústavy musí byť menší ako 10. Zadaj inú sústavu.')
   else
     begin
       ok:=true;
       repeat                        //overenie či dané číslo existuje v sústave
         zvysok:=cislo mod 10;
         if zvysok>=sustava then ok:=false;
         cislo:=cislo div 10;
       until cislo=0;
      if ok=false then showmessage('Zadané číslo v danej sústava neexistuje. Zmeň čísla.') //ak číslo nevyhovuje vypýta si iné
         else
           begin
             vysledok:=0;
            for i:=1 to length(prevod) do                          //prevod čísla
                 vysledok:=vysledok*sustava+strtoint(prevod[i]);
             label4.caption:='Prevedené číslo: ' + inttostr(vysledok);  //vypíše prevedené čislo
           end;
     end;
end;

end.

