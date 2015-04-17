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



var i:integer;
    s:string;
    c:char;
    cod:word;
begin
  readln(s);
  for i:=1 to length(s) do begin
    writeln(toDigit(s[i]));
  end;
 
end.    