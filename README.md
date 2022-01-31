# Ts-




<h1 style="color:#0B615E;  text-align:center; vertical-align: middle; padding:40px 0; margin-top:30px " >TP2- Jeux de mots </br>
Synthèse et analyse spectrale d'une gamme de musique</h1>
             </br>

<h4 style="background-color:#F6CEF5"  id="up-id"> Réalisé par: OUM KOULTHOUME BOUNOUA </h4>


------------

<h4 style="color:#088A85;">   Objectifs   </h4>
• Comprendre comment manipuler un signal audio avec Matlab, en effectuant 
certaines opérations classiques sur un fichier audio d’une phrase enregistrée via 
un smartphone.
</br>

• Comprendre la notion des sons purs à travers la synthèse et l’analyse spectrale 
d'une gamme de musique.
 </p>

<ul>
<h3 style="color:#58ACFA";>

<h4> <a href="#rep-id">  Jeux de mots </a></h4>

<h4> <a href="#synthese-id"> Synthèse et analyse spectrale d’une gamme de musique</a></h4>

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






   <h3 style="color:#088A85" id="synthese-id" >Synthèse et analyse spectrale d’une gamme de musique</h3>
<h5 style="color:#FF8000"> Synthèse d’une gamme de musique</h5>
    
Les notes de musique produites par un piano peuvent être synthétisées 
approximativement numériquement. En effet, chaque note peut être considérée 
comme étant un son pur produit par un signal sinusoïdal. La fréquence de la note 
« La » est par exemple de 440 Hz. </br>
1- Créez un programme qui permet de jouer une gamme de musique. La fréquence 
de chaque note est précisée dans le tableau ci-dessous. Chaque note aura une durée 
de 1s. La durée de la gamme sera donc de 8s. La fréquence d’échantillonnage fe sera 
fixée à 8192 Hz.

![ff](https://user-images.githubusercontent.com/86807424/151797471-669f8c1c-0114-43a3-b83e-aaf26ea95c2b.png)


```Matlab
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
```
 <h5 style="color:#FF8000"> Spectre de la gamme de musique</h5>
2- Utilisez l’outil graphique d’analyse de signaux signalAnalyzer pour visualiser le 
spectre de votre gamme. Observez les 8 fréquences contenues dans la gamme et 
vérifiez leur valeur numérique à l’aide des curseurs.

 ![gfch](https://user-images.githubusercontent.com/86807424/151797521-41038975-8bba-4f3c-9e9f-ffb2ac287cc9.png)

</br>
3- Tracez le spectrogramme qui permet de visualiser le contenu fréquentiel du signal 
au cours du temps (comme le fait une partition de musique) mais la précision sur l’axe 
des fréquences n’est pas suffisante pour relever précisément les 8 fréquences.

![signalAnalyzer](https://user-images.githubusercontent.com/86807424/151797690-909f416b-2c2f-450d-a5c6-f1aa96b59242.png)


  <h5 style="color:#FF8000"> Approximation du spectre d’un signal sinusoïdal à temps 
continu par FFT</h5>


</br>
4- Le spectre d’un signal à temps continu peut être approché par transformée de 
Fourier discrète (TFD) ou sa version rapide (Fast Fourier Transform (FFT). Afficher le 
spectre de fréquence de la gamme musicale crée en échelle linéaire, puis avec une 
échelle en décibels.

![Sdb](https://user-images.githubusercontent.com/86807424/151797877-30f2a436-1dfc-41bc-a46b-037da9969fea.png)

```Matlab

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

```
figure1


![fig1](https://user-images.githubusercontent.com/86807424/151798060-93bab4b6-a07a-41c8-8812-1ad20861550e.png)

figure2

![figure2](https://user-images.githubusercontent.com/86807424/151798013-767eaadc-3e59-4f59-88b8-66a7f53dffde.png)

--------
 
  <h3> <a href="#up-id"> UP </h3>
  </div>
