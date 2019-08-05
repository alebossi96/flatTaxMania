clc
clear
data=importdata('completo.csv', ';');
Q=isna(data.data);
data.data(Q)=0;
#reddito -deduzione
#tasse-detrazione
totale=0;
freqPersone=0;
freqPersoneNetto=0;
imponibileNetto=0;
for i=1:500
   el=data.data(i,:);
   for j=1:7
     totale+=el(charToInt('ak')+2*j-1);
     freqPersone+=el(charToInt('ak')+2*j-2);
   end
   imponibileNetto+=el(charToInt('`x'));
   freqPersoneNetto+=el(charToInt('`w'));
end
ded=(totale-imponibileNetto)/freqPersone;
loss=0;
totale=0;
freqPersone=0;
freqPersoneNetto=0;
imponibileNetto=0;
for i=501:1500
   el=data.data(i,:);
   for j=1:7
     
     frq=el(charToInt('ak')+2*j-2);
     totale+=el(charToInt('ak')+2*j-1)-ded*frq;
     freqPersone+=frq;
   end
   imponibileNetto+=el(charToInt('`x'));
   freqPersoneNetto+=el(charToInt('`w'));
end
(totale-imponibileNetto)/imponibileNetto

effettivi=0;
freqReali=0;
for i=501:1500
  el=data.data(i,:);
frequenza=el(charToInt('ak'));
ammontare=el(charToInt('ak')+1);
     if frequenza!=0 
       dx= (ammontare/frequenza)/frequenza;
       for i=1:frequenza
          reddito=i*dx*2-ded;
          if reddito<0
            effettivi+=1;
          end
       end
     end
   effettivi+=  el(charToInt('ai'));
   freqReali+=el(charToInt('`y'));
end
(effettivi-freqReali)/freqReali

#deduzioni=1100
#con questa posso verificare anche la frequenza
