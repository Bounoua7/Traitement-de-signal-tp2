  clear all
  close all
  clc

  fe=8192; %La fréquence d’échantillonnage
  te=1/fe;
  ts=0:te:1;
   
    %La fréquence de chaque note de la gamme
  Dol=262;
  Re=294;
  Mi=330;
  Fa=349;
  Sol=392;
  La=440;
  Si=494;
  Do2=523;
   
  DOl=sin(2*Dol*pi*ts);
  RE=sin(2*Re*pi*ts);  
  MI=sin(2*Mi*pi*ts);
  FA=sin(2*Fa*pi*ts);
  SOL=sin(2*Sol*pi*ts);
  LA=sin(2*La*pi*ts);
  SI=sin(2*Si*pi*ts); 
  DO2=sin(2*Do2*pi*ts);
  lagamme=[DOl RE MI FA SOL LA SI DO2];
  sound (lagamme, fe ) ;

  
  %2
DS=abs(fft(lagamme));
N=length(lagamme)
figure(1);
plot(DS);
title('Fft de la gamme');
k=mag2db(DS);
figure(2);
fshift=(-N/2:N/2 -1 )*fe/N;
plot(fshift,fftshift(k));
title('');
