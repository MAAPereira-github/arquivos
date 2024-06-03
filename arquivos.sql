select --sum(decode(sinlan, '+', qtdhor, 0)), sum(decode(sinlan, '-', qtdhor, 0)),
   max(datlan) dta_lanc,
   trunc(sum(decode(sinlan, '+', qtdhor, '-', -qtdhor, 0)) / 60) as Hora,
   ((sum(decode(sinlan, '+', qtdhor, '-', -qtdhor, 0)) / 60) -  
trunc(sum(decode(sinlan, '+', qtdhor, '-', -qtdhor, 0)) / 60)) * 60 as Minuto
  from R011LAN
    where numcad = 900506 -- Informar o c�digo do funcion�rio. Geralmente, � 7000 + N�mero do Crach�
      and numemp = 1   
      and datlan < trunc(sysdate - 10);
