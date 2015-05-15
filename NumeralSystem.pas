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


{Функция переводит целое число со знаком, полученное как строка s,
 с основанием base, в десятичную систему исчисления}
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

{Анализирует беззнаковое число, имеет ли оно дробную часть}
function isFraction(s:string):boolean;
var i,n:integer;
    pointFound:boolean;
begin
  pointFound:=false;
  n:=length(s);
  if (not isDigit(s[1])) then begin
    writeln('error. The first char is not digit');
    exit;
  end;
  if (not isDigit(s[n])) then begin
    writeln('error. The last char is not digit');
    exit;
  end;
  
  i:=2;
  while (not pointFound)and(i<=n-1) do begin
    if (not isDigit(s[i])) then begin
      if (s[i] = '.') or (s[i] = ',') 
        then pointFound:=true
        else begin
          writeln('error');
          exit;
        end;  
    end;
    i:=i+1;
  end;
  
  isFraction:=pointFound;
 
end;    

var i:integer;
    s:string;
    c:char;
    cod:word;
    base:byte;
begin
  readln(s);
  writeln(isFraction(s));
end.   
 