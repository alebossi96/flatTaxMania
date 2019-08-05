clc
clear
data=importdata('completo.csv', ';');
Q=isna(data.data);
data.data(Q)=0;
#reddito -deduzione
#tasse-detrazione
ded=1100;
fasce=[0 10000 15000 26000 55000 75000 120000];
impNetta=0;
tot=0;
nPersone=0;
for i=1:400
  el=data.data(i,:);
  for j=1:7
    frequenza=el(charToInt('ak')+2*j-2);
    nPersone+=frequenza;
    ammontare= el(charToInt('ak')+2*j-1);
    fascia=fasce(j);
     if frequenza!=0 
       dx= (ammontare/frequenza -fascia)/frequenza;
       for i=1:frequenza
          reddito=i*dx*2+fascia-ded;
          if reddito<0
            reddito=0;
          end
          if reddito<15e3
            tot+=reddito*0.23;
          elseif reddito< 28000
            tot+=((reddito-15e3)*0.27+3450);
          elseif reddito< 55000
            tot+=((reddito-28e3)*0.38+6960);
          elseif reddito< 75000
            tot+=((reddito-55e3)*0.41+17220);
          else
            tot+=((reddito-75e3)*0.43+25420);
          end
       end
     end
   end
   impNetta+=el(charToInt('`z'));
end

detr=(tot-impNetta)/nPersone;
bonus=0;
impNetta=0;
tot=0;
nPersone=0;
bonusNetto=0;
for i=401:900
  el=data.data(i,:);
  for j=1:7
    frequenza=el(charToInt('ak')+2*j-2);
    nPersone+=frequenza;
    ammontare= el(charToInt('ak')+2*j-1);
    fascia=fasce(j);
     if frequenza!=0 
       dx= (ammontare/frequenza -fascia)/frequenza;
       for i=1:frequenza
          reddito=i*dx*2+fascia-ded;
          tax=0;
          if reddito<0
            reddito=0;
          end
          if reddito<15e3
            tax+=reddito*0.23;
          elseif reddito< 28000
            tax+=((reddito-15e3)*0.27+3450);
          elseif reddito< 55000
            tax+=((reddito-27e3)*0.38+6960);
          elseif reddito< 75000
            tax+=((reddito-55e3)*0.41+17220);
          else
            tax+=((reddito-75e3)*0.43+25420);
          end
          tot+=tax-detr;
          if (tax-detr)<0
            bonus-=tax-detr;
          end
       end
     end
   end
   bonusNetto+=el(charToInt('ab'));
   impNetta+=el(charToInt('`z'));
end
(tot-impNetta)/impNetta

bonusNetto
bonus
(bonus-bonusNetto)/bonusNetto
# detr =  3969.1
impNetta=0;
for i=1:7955
    el=data.data(i,:);
  impNetta+=el(charToInt('`z'));
end
