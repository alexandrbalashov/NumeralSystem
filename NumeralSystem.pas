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

function toNumber(s:string):integer;
var weight,res,i:integer;
begin
  weight:=1;
  for i:=0 to length(s)-1 do begin
    res:=res+weight*toDigit(s[length(s)-i]);
    weight:=weight*10;
  end;  
  toNumber:=res;
end;  

var i:integer;
    s:string;
    c:char;
    cod:word;
begin
  readln(s);
  writeln(toNumber(s));
end.    