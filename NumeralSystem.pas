function isDigit(c:char):boolean;
var cod:word;
begin
  cod:=OrdUnicode(c);
  if (cod >= 48) and (cod <= 57) 
    then isDigit:=true
    else isDigit:=false;
end;    

function toDigit(c:char):shortint;
var cod:word;
begin
  if (not isDigit(c)) then begin 
    writeln('Ошибка в функции toDigit. Полученный символ не является цифрой');
    toDigit:=-1;
    exit;
  end;
  cod:=OrdUnicode(c);
  toDigit:=cod-48;
end;  

function toNumber(s:string; base:byte):integer;
var 
  weight:integer;
  res:integer;
  numGrade:integer; //номер разряда
  mult:integer;
  numGreatGrade:integer; //номер старшего разряда
  currentChar:char;
begin
  if (s[1] = '-') then begin
    mult:=-1;
    numGreatGrade:=length(s)-2;
  end else begin
    mult:=1;
    numGreatGrade:=length(s)-1;
  end;
  weight:=1;
  for numGrade:=0 to numGreatGrade do begin
    currentChar:=s[length(s)-numGrade];
    res:=res+weight*toDigit(currentChar);
    weight:=weight*base;
  end;  
  toNumber:=res*mult;
end;  

var i:integer;
    s:string;
    c:char;
    cod:word;
    base:byte;
begin
  readln(s);
  readln(base);
  writeln(toNumber(s,base));
end.    