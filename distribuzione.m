#fare la distribuzione
clc
clear
data=importdata('completo.csv', ';');
Q=isna(data.data);
data.data(Q)=0;
#reddito -deduzione
#tasse-detrazione
ded=1060;
detr=1652;
fascie=[0 10000 15000 26000 55000 75000 120000];
N=4000;
dist=zeros(N,1);

totale=0;
for k=1:size(data.data)(1)
  el=data.data(k,:);
  for j=1:7
    frequenza=el(charToInt('ak')+2*j-2);
    ammontare= el(charToInt('ak')+2*j-1);
    fascia=fascie(j);
     if frequenza!=0 
       dx= (ammontare/frequenza -fascia)/frequenza;
       for i=1:frequenza
          reddito=i*dx*2+fascia-ded;
          if reddito>10
          dist(round(200*log(reddito))+1)+=1;
        end
        end
      end
    end 
   totale+=el(charToInt('`x'));
end
tot=0;
for i=1:N
  tot+=exp(i/200)*dist(i);
end
(totale-tot)/totale
csvwrite('distribuzione.csv', dist)