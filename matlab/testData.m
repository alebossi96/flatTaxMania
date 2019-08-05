clc
clear
data=importdata('completo.csv', ';');
Q=isna(data.data);
data.data(Q)=0;
tic
dist=csvread('distribuzione.csv');
#detr=1752;
detr=1653;
tot=0;
for i=1:size(dist)(1)
  reddito = exp(i/200);
  if reddito<15e3
    tax=reddito*0.23;
  elseif reddito< 28000
    tax=((reddito-15e3)*0.27+3450);
  elseif reddito< 55000
    tax=((reddito-28e3)*0.38+6960);
  elseif reddito< 75000
    tax=((reddito-55e3)*0.41+17220);
  else
    tax=((reddito-75e3)*0.43+25420);
    end
  tot+=(tax-detr)*dist(i);
end
toc
impNetta=0;
for i=1:size(data.data)(1)
    el=data.data(i,:);
    impNetta+=el(charToInt('`z'));
end

(tot-impNetta)/impNetta
fasce=[15e3 0.23; 28e3 0.27; 55e3 0.38; 75e3 0.41;1e10 0.43 ];
tot=gettitoIrpef(fasce, detr,0)
(tot-impNetta)/impNetta
