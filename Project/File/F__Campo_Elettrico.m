clc
clear all 
close all

%Campo elettrico incidente,trasmesso e riflesso.
%30/10/19

eps0= 8.854e-12;
mu0= 4*pi*1e-7;
eps1= 2*eps0;
eps2= 5*eps0;
mu1= mu0;
mu2= mu0;

f= 800e6;
omega= 2*pi*f;
c= 3e8;
vp=1/sqrt(eps1*mu1);
lambda= vp/f;
T= 1/f;

k1= omega* sqrt(eps1*mu1);   %costante di propagazione 1°mezzo
k2= omega* sqrt(eps2*mu2);   %costante di propagazione 2°mezzo

eta1= sqrt(mu1/eps1);        %impedenza intrinseca 
eta2= sqrt(mu2/eps2);

tau=(2*eta2)/(eta1+eta2);         %coefficiente trasmissione tra 1° e 2° mezzo
gamma= (eta2-eta1)/(eta2+eta1);   %coefficiente di riflessione

ts=1/(2*f);
dt=ts/20;
dz=lambda/40;
t= 0:dt:120*dt;     %variazione temporale
z= 0:dz:120*dz;     %variazione spaziale

E0= 5;


%%%INCIDENTE%%%
Ei= E0;
e_i= ones(length(z),length(t));

for m=1:length(z)
    for n=1:length(t)
        e_i(m,n)= real(Ei* exp((-1i)*k1.*z(m))*(exp(1i*omega*t(n))));
    end
end

figure(1)   %t fissato
plot(z,e_i(1,:));
xlabel('z[m]')
ylabel('Ampiezza')
title('Espressione istantanea campo elettrico incidente fissato t')
grid on

figure(2)   %z fissato
plot(t,e_i(1,:));
xlabel('t[s]')
ylabel('Ampiezza')
title('Espressione istantanea campo elettrico incidente fissato z')
grid on

figure(3)
mesh(z,t,e_i)
xlabel('z[m]')
ylabel('t[s]')
title('Mesh campo elettrico incidente')


%%%TRASMESSO%%%
Et= E0*tau;
e_t= ones(length(z),length(t));

for m=1:length(z)
    for n=1:length(t)
        e_t(m,n)= real(Et* exp((-1i)*k2.*z(m))*(exp(1i*omega*t(n))));
    end
end

figure(4)
plot(z,e_t(1,:));
xlabel('z[m]')
ylabel('Ampiezza')
title('Espressione istantanea campo elettrico trasmesso - t fissato')
grid on

figure(5)
plot(t,e_t(1,:));
xlabel('t[s]')
ylabel('Ampiezza')
title('Espressione istantanea campo elettrico trasmesso - z fissato')
grid on

figure(6)
mesh(z,t,e_t)
xlabel('z[m]')
ylabel('t[s]')
title('Mesh campo elettrico trasmesso')


%%%RIFLESSO%%%
Er= E0*gamma;
e_r= ones(length(z),length(t));

for m=1:length(z)
    for n=1:length(t)
        e_r(m,n)= real(Er* exp(1j*k1.*z(m))*(exp(1j*omega*t(n))));
    end
end

figure(7)   %t fissato
plot(z,e_r(1,:));
xlabel('z[m]')
ylabel('Ampiezza')
title('Espressione istantanea campo elettrico riflesso - t fissato')
grid on

figure(8)   %z fissato
plot(t,e_r(1,:));
xlabel('t[s]')
ylabel('Ampiezza')
title('Espressione istantanea campo elettrico riflesso - z fissato')
grid on

figure(9)
mesh(z,t,e_r)
xlabel('z[m]')
ylabel('t[s]')
title('Mesh campo elettrico riflesso')


