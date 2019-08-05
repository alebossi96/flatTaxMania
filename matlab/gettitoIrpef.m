function tot=gettitoIrpef(fasce, detr, ded)
  dist=csvread('distribuzione.csv');
  siz=size(dist)(1);
  tot=0;
  fasce =[0 0; fasce];
  sizFasce= size(fasce)(1);
  for i=1:siz
    reddito = exp(i/200)- ded;
    if reddito<0
      reddito=0;
    end
    tax=0;
   for j=1:sizFasce
     if reddito>fasce(j,1)
       aliquota=fasce(j+1,2);
       eff=min(reddito, fasce(j+1,1))-fasce(j,1);
       tax+=eff*aliquota;
     end
   end
   
   tot+=(tax-detr)*dist(i);
  end
end
