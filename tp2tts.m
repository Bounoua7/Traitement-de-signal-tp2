clear all
close all
clc
figure(1)

[Y,fs]=audioread('phrase.wav');
% sound(Y,fs);

 t=linspace(0,length(Y)/fs,length(Y));
 plot(t,Y,'g');


%5
figure(2)

riennesertde=Y(16270:74701);
L=length(riennesertde);
t=(0:L-1)*1/fs;
subplot(2,2,1);
plot(t,riennesertde,'g');
title('riennesertde');
%sound(riennesertde,fs);


courir=Y(79693:90562);
N=length(courir);
t=(0:N-1)*1/fs;
subplot(2,2,2)
plot(t,courir,'b');
title('courir');

 
ilfaut=Y(101892:120179);
N2=length(ilfaut);
t=(0:N2-1)*1/fs;
subplot(2,2,3)
plot(t,ilfaut,'r');
title('ilfaut');
%sound(ilfaut,fs);
 
partirapoint=Y(126658:161014);
M=length(partirapoint);
t=(0:M-1)*1/fs;
subplot(2,2,4)
plot(t,partirapoint,'y');
title('partirapoint');
%sound(partirapoint,fs);


% Réarrangez ce vecteur pour écouter la phrase synthétisée 
%« Rien ne sert de partir à point, il faut courir ».
figure(3)
vec=[riennesertde,partirapoint,ilfaut,courir];
plot(vec,'r');
title('Rien ne sert de partir à point, il faut courir');
sound(vec,fs);
