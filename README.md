# Ts-tp2




<h1 style="color:#0B615E;  text-align:center; vertical-align: middle; padding:40px 0; margin-top:30px " >Traitement de signal- Analyse spectrale d’un signal Transformée de Fourier discrète</h1>
             </br>

<h4 style="background-color:#F6CEF5" > Réalisé par: OUM KOULTHOUME BOUNOUA </h4>


------------

<h4 style="color:#088A85;"> Objectifs 
  
</h4>• Comprendre comment manipuler un signal audio avec Matlab, en effectuant 
certaines opérations classiques sur un fichier audio d’une phrase enregistrée via 
un smartphone.
</br>

• Comprendre la notion des sons purs à travers la synthèse et l’analyse spectrale 
d'une gamme de musique.
 </p>

<ul>
<h3 style="color:#58ACFA";>

<h4> <a href="#rep-id">  Jeux de mots </a></h4>

</h3>
</ul>
      
------------
   <h3 style="color:#088A85" id="rep-id" >Jeux de mots</h3>
  

« phrase.wave » est un fichier audio enregistré à l’aide d’un smartphone, en 
prononçant lentement la phrase : 
- « Rien ne sert de courir, il faut partir à point ». 
1- Sauvegardez ce fichier sur votre répertoire de travail, puis charger-le dans MATLAB 
à l’aide de la commande « audioread ».
2- Tracez le signal enregistré en fonction du temps, puis écoutez-le en utilisant la 
commande « sound ».

```Matlab
clear all
close all
clc

[Y,fs]=audioread('phrase.wav');
sound(Y,fs);


t=linspace(0,length(Y)/fs,length(Y));
plot(t,Y,'g');

```


3- Cette commande permet d’écouter la phrase à sa fréquence d’échantillonnage 
d’enregistrement. Ecoutez la phrase en modifiant la fréquence d’échantillonnage à 
double ou deux fois plus petite pour vous faire parler comme « Terminator » ou « 
Donald Duck ». En effet, modifier la fréquence d’échantillonnage revient à appliquer 
un changement d’échelle y(t) = x(at) en fonction de la valeur du facteur d’échelle, cela 
revient à opérer une compression ou une dilatation du spectre initial d’où la version 
plus grave ou plus aigüe du signal écouté.


```Matlab
[Y,fs]=audioread('phrase.wav');
sound(Y,fs*2);

```


https://user-images.githubusercontent.com/86807424/151649523-c4f9314d-da33-4711-a95d-cf1e50a86663.mp4



```Matlab
[Y,fs]=audioread('phrase.wav');
sound(Y,fs/2);

```


https://user-images.githubusercontent.com/86807424/151649539-7dbc0955-e4b4-422a-b499-8dcf6c43cf28.mp4




4- Tracez le signal en fonction des indices du vecteur x, puis essayez de repérer les 
indices de début et de fin de la phrase « Rien ne sert de ».

   ![Q4](https://user-images.githubusercontent.com/86807424/151649507-983b34c0-ab32-4143-a942-9a4bc0e3d313.png)

   
5- Pour segmenter le premier mot, il faut par exemple créer un vecteur « riennesertde »
contenant les n premières valeurs du signal enregistré x qui correspondent à ce 
morceau. Créez ce vecteur, puis écoutez le mot segmenté.


```Matlab
[Y,fs]=audioread('phrase.wav');


figure(2)
riennesertde=Y(16270:74701);
L=length(riennesertde);
t=(0:L-1)*1/fs;
plot(t,riennesertde,'g');
 sound(riennesertde,fs);

```


https://user-images.githubusercontent.com/86807424/151649497-7b23ce13-cdae-4842-b231-246169aeb677.mp4



6- Segmentez cette fois-ci toute la phrase en créant les variables suivantes : 
riennesertde, courir, ilfaut, partirapoint.

```Matlab
figure(2)

riennesertde=Y(16270:74701);
L=length(riennesertde);
t=(0:L-1)*1/fs;
subplot(2,2,1);
plot(t,riennesertde,'g');
title('riennesertde');
sound(riennesertde,fs);


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

```
![segmentation](https://user-images.githubusercontent.com/86807424/151649484-a52d0563-beb6-45ec-ab21-40b359ac7a60.png)


7- Notez que le signal initial de parole est un vecteur colonne contenant un certain 
nombre de valeurs (length(x)). Réarrangez ce vecteur pour écouter la phrase 
synthétisée « Rien ne sert de partir à point, il faut courir ».
```Matlab
% Réarrangez ce vecteur pour écouter la phrase synthétisée 
%« Rien ne sert de partir à point, il faut courir ».
figure(3)
vec=[riennesertde,partirapoint,ilfaut,courir];
plot(vec,'r');
title('Rien ne sert de partir à point, il faut courir');
sound(vec,fs);

```





https://user-images.githubusercontent.com/86807424/151649466-521c8191-9806-4dff-9a7a-1cfa8ee90648.mp4





<h5 style="color:#FF8000"> Le code</h5>

```Matlab

clear all 
close all
clc

fe=50;
te= 1/50;              %pas de temps 
t=0:te:10-te;          %intervalle
N=length(t);           %le nombre de points constituant le signal x(t).

figure(1);

x=sin(2*pi*10*t)+sin(2*pi*20*t);         %le signal périodique x(t)
subplot(2,3,1);                          %subplot divise la figure et crée des axes à la position spécifiée.
plot(t,x);                               %plot permet de tracer une fonction
title('signal périodique');              % titre de la figure



```

<h5 style="color:#FF8000">résultat de la figure(1):</h5>








   <h3 style="color:#088A85" id="analys-id" >Analyse fréquentielle du chant du rorqual bleu</h3>


Il existe plusieurs signaux dont l’information est encodée dans des sinusoïdes. Les ondes sonores est un bon exemple. Considérons maintenant des données audios collectées à partir de microphones sous - marins au large de la Californie. On cherche à détecter à travers une analyse de Fourier le contenu fréquentiel d’une onde sonore émise pas un rorqual bleu.


--------
 
  
  </div>
