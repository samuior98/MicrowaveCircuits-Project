clc
clear all 
close all

%13/11/19
%Incidenza normale - mezzi con perdite

eps0= 8.854e-12;
mu0= 4*pi*1e-7;
eps2= eps0*4;
mu2= mu0;
sigma2= 1e-2;

vp1=1/sqrt(eps0*mu0);
vp2=1/sqrt(eps2*mu2);

f= 1e9;
lambda2= vp2/f;
omega= 2*pi*f;

k1= omega*sqrt(eps0*mu0);              %costante di propagazione
k2= omega*sqrt((eps2+(sigma2/(1i*omega)))*mu2);

eta1= sqrt((1i*omega*mu0)/(1i*omega*eps0));    %impedenza intrinseca       
eta2= sqrt((1i*omega*mu2)/((1i*omega*eps2)+sigma2));

tau=(2*eta2)/(eta2+eta1);             %coefficiente di trasmissione
gamma= (eta2-eta1)/(eta2+eta1);       %coefficiente di riflessione

E0= 2;
xv=[1 0 0];

ts=1/(2*f);
dt=ts/20;
dz=lambda2/20;
t= 0:dt:120*dt;     
z= 0:dz:120*dz;

%CAMPO ELETTRICO INCIDENTE%
Ei= xv(1)*E0;
e_i= ones(length(z),length(t));

for m=1:length(z)
    for n=1:length(t)
        e_i(m,n)= real(Ei*exp((-1i)*k1.*z(m))*exp(1*1i*omega*t(n)));
    end
end

figure(1)   %t fissato
plot(z,e_i(1,:));
xlabel('z[m]')
ylabel('Ampiezza')
title('Espressione istantanea campo elettrico incidente - t fissato')
grid on

figure(2)   %z fissato
plot(t,e_i(1,:));
xlabel('t[s]')
ylabel('Ampiezza')
title('Espressione istantanea campo elettrico incidente - z fissato')
grid on

figure(3)
mesh(t,z,e_i)
xlabel('t[s]')
ylabel('z[m]')
title('Mesh campo elettrico incidente');

%CAMPO ELETTRICO TRASMESSO%
Et= tau*E0*exp(-1*1i*k2.*z);
e_t= ones(length(z),length(t));

for m=1:length(z)
    for n=1:length(t)
        e_t(m,n)= real(Et(m)*exp(1i*omega*t(n)));
    end
end

figure(4)   %t fissato
plot(z,e_t(:,1))
xlabel('z[m]')
ylabel('Ampiezza')
title('Espressione istantanea campo elettrico trasmesso - t fissato');
grid on

figure(5)   %z fissato
plot(t,e_t(1,:));
xlabel('t[s]')
ylabel('Ampiezza')
title('Espressione istantanea campo elettrico trasmesso - z fissato')
grid on

figure(6)
mesh(t,z,e_t)
xlabel('t[s]')
ylabel('z[m]')
title('Mesh campo elettrico trasmesso');

%CAMPO ELETTRICO RIFLESSO
Er= xv(1)*gamma*E0;
e_r= ones(length(z),length(t));

for m=1:length(z)
    for n=1:length(t)
        e_r(m,n)= real(Er*exp(1j*k1.*z(m))*exp(1*1j*omega*t(n)));
    end
end

figure(7)   %t fissato
plot(z,e_r(1,:));
xlabel('z[m]')
ylabel('Ampiezza')
title('Espressione istantanea campo elettrico riflesso - t fissato')
grid on

figure(8)
plot(t,e_r(1,:));
xlabel('t[s]')
ylabel('Ampiezza')
title('Espressione istantanea campo elettrico riflesso - z fissato')
grid on

figure(9)
mesh(t,z,e_r)
xlabel('t[s]')
ylabel('z[m]')
title('Mesh campo elettrico riflesso');

%subplot 1%
figure(10)
subplot(2,1,1)
plot(t,e_i(1,:))
title('Campo elettrico incidente - t fissato')
grid on
xlabel('z[m]')
ylabel('Ampiezza')

subplot(2,1,2)
plot(t,e_t(:,1))
title('Campo elettrico trasmesso - t fissato')
grid on
xlabel('z[m]')
ylabel('Ampiezza')

%subplot 2%
figure(11)
subplot(2,1,1)
plot(t,e_i(:,1))
title('Campo elettrico incidente - z fissato')
grid on
xlabel('t[s]')
ylabel('Ampiezza')

subplot(2,1,2)
plot(t,e_t(1,:))
title('Campo elettrico trasmesso - z fissato')
grid on
xlabel('t[s]')
ylabel('Ampiezza')
