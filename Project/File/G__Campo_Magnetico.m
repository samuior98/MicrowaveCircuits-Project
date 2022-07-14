clc
clear all 
close all

%Campo magnetico incidente, trasmesso e riflesso
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

tau=(2*eta2)/(eta1+eta2);    %coefficiente trasmissione tra 1° e 2° mezzo
gamma= (eta2-eta1)/(eta2+eta1);   %coefficiente di riflessione

ts=1/(2*f);
dt=ts/20;
t= 0:dt:120*dt;     %variazione temporale
dz=lambda/40;
z= 0:dz:120*dz;     %variazione spaziale

E0= 5;

xv= [1 0 0];
yv= [0 1 0];
yv2=[0 -1 0];
zv= [0 0 1];
zv2=[0 0 -1];
ik= zv;

%%%INCIDENTE%%%
Hi= real((E0/eta1)*E0* exp(-1i*k1*z));
h_i=ones(length(z),length(t));
for m=1:length(z)
    for n=1:length(t)
        h_i(m,n)= real((E0/eta1)*E0* exp(-1i*k1*z(n))*exp(1i*omega*t(m)));
    end
end

figure(1)   %t fissato
plot(z,real(Hi))
xlabel('z[m]')
ylabel('Ampiezza')
title('Espressione istantanea campo magnetico incidente - t fissato')
grid on

figure(2)   %z fissato
plot(t,real(Hi));
xlabel('t[s]')
ylabel('Ampiezza')
title('Espressione istantanea campo magnetico incidente - z fissato')
grid on

figure(3)
mesh(z,t,h_i)
xlabel('z[m]')
ylabel('t[s]')
title('Mesh campo magnetico incidente')

%%%TRASMESSO%%%
Ht= real((E0/eta2)*yv(2)*tau* exp((-1i)*k2.*z));
h_t= ones(length(z),length(t));
for m=1:length(z)
    for n=1:length(t)
        h_t(m,n)= real((E0/eta2)*tau*exp((-1i)*k2.*z(n))*exp((1i)*omega*t(m)));
    end
end

figure(4)   %t fissato
plot(z,real(Ht));
xlabel('z[m]')
ylabel('Ampiezza')
title('Espressione istantanea campo magnetico trasmesso - t fissato ')
grid on

figure(5)   %z fissato
plot(t,real(Ht));
xlabel('t[s]')
ylabel('Ampiezza')
title('Espressione istantanea campo magnetico trasmesso - z fissato')
grid on

figure(6)
mesh(z,t,h_t)
xlabel('z[m]')
ylabel('t[s]')
title('Mesh campo magnetico trasmesso')

%RIFLESSO%%%
C2= cross(zv2,xv);
Hr= real((E0/eta1)*yv2(2)*gamma* exp((1i)*k1.*z));
h_r= ones(length(z),length(t));

for m=1:length(z)
    for n=1:length(t)
        h_r(m,n)= real((E0/eta1)*gamma* exp((1i)*k1.*z(n))*exp((1i)*omega*t(m)));
    end
end

figure(7)   %t fissato
plot(z,real(Hr));
xlabel('z[m]')
ylabel('Ampiezza')
title('Espressione istantanea campo magnetico riflesso - t fissato')
grid on

figure(8)   %z fissato
plot(t,real(Hr));
xlabel('t[s]')
ylabel('Ampiezza')
title('Espressione istantanea campo magnetico riflesso - z fissato')
grid on

figure(9)
mesh(z,t,h_r)
xlabel('z[m]')
ylabel('t[s]')
title('Mesh campo magnetico riflesso')

