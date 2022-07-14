clc
clear all
close all

%PLOT TENSIONE E CORRENTE DIRETTA (soluz. viaggianti)
eps0= 8.854e-12;
epsr= 2.1;
mu0= 4*pi*1e-7;
mur=1;
f=1250e6;
omega= 2*pi*f;
z0= 75;                 %Impedenza caratteristica

c=1/sqrt(eps0*mu0);
vp=c/sqrt(epsr*mur);
lambda= vp/f;
k=(2*pi)/lambda;        %Costante di propagazione

dz=lambda/40;           %Asse z
z= 0:dz:120*dz;

V=3;

%Soluzione viaggiante  V(z) diretta
figure(1)
Vdir= real(V*exp((-1i)*k.*z));
plot(z,real(Vdir));
grid on
xlabel('z[m]')
title("Tensione diretta lungo l'asse z") 

%Soluzione viaggiante I(z) diretta
figure(2)
Idir= real((V/z0)*exp((-1i)*k.*z));
plot(z,real(Idir));
grid on
xlabel('z[m]')
title("Corrente diretta lungo l'asse z")

%Subplot
figure(3)
subplot(2,1,1);
plot(z,real(Vdir))
title("Tensione diretta lungo l'asse z") 
xlabel('z[m]')
grid on

subplot(2,1,2);
plot(z,real(Idir))
title("Corrente diretta lungo l'asse z")
xlabel('z[m]')
grid on
