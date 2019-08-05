function tot=gettitoIrpef(fascie, detr, ded)
  dist=csvread('distribuzione.csv');
  siz=size(dist)(1);
  tot=0;
  fascie =[0 0; fascie];
  sizFascie= size(fascie)(1);
  for i=1:siz
    reddito = exp(i/200)- ded;
    if reddito<0
      reddito=0;
    end
    tax=0;
   for j=1:sizFascie
     if reddito>fascie(j,1)
       aliquota=fascie(j+1,2);
       eff=min(reddito, fascie(j+1,1))-fascie(j,1);
       tax+=eff*aliquota;
     end
   end
   
   tot+=(tax-detr)*dist(i);
  end
end