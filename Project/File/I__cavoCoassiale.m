clc
close all
clear all

%27/11/19

h= rfckt.coaxial('OuterRadius',3.5e-3,'InnerRadius',0.82e-3,'EpsilonR',2.1,'LineLength',1);
f= 800e6;

analyze(h,f)             %Obbligatorio per poter estrapolare dati, come Z0
z0= getz0(h)


%%%%%%%%%%%%%%%

% eps0= 8.854e-12;
% epsr= 2.1;
% mu0= 4*pi*1e-7;
% mur=1;
% 
% b= 3.5e-3;               %Raggio conduttore più grande
% a= 0.82e-3;              %Raggio conduttore più piccolo
% l= 1;                    %Lunghezza cavo
% 
% C= (2*pi*eps0*epsr)/(log(b/a))       %capacità
% L= log(b/a) * ((mu0*mur*l)/(2*pi))   %induttanza
% z0= sqrt(L/C)                        %impedenza

%%%%%%%%%%%%%%%

% f= 700;
% omega= 2*pi*f;
% 
% k= omega*sqrt(L*C)
% vp= 1/(sqrt(L/C))
