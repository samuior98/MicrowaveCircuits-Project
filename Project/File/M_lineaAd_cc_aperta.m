%Linea aperta e in corto circuito: plot tensionem corrente e espr. istantanea  

clc
clear all
close all

z0=50;
f=1200e6;
eps0=8.854e-12;
mu0=4*pi*1e-7;
omega=2*pi*f;
epsr=1;
eps=eps0*epsr;
mur=1;
mu=mu0*mur;
c=1/sqrt(eps0*mu0);
vp=c/sqrt(epsr*1);
lambda=vp/f;
k=(2*pi)/lambda;
sigma=1e-2;
v0=3;
i0=v0/z0;
periodo=1/f;

%Asse spaziale
dz=lambda/40;
z=0:dz:120*dz;
%Asse temporale
ts=1/(2*f);
dt=ts/20;
t=0:dt:120*dt;

%%%LINEA CHIUSA%%%
Vc=z0*abs(i0)*abs(sin(k*z));     %Tensione
Ic=abs(i0)*abs(cos(k*z));        %Corrente

%Plottiamo il tutto
%Tensione linea chiusa
figure(1);
plot(z,real(abs(Vc)));
grid on;
xlabel('z[m]');
title('Tensione di linea chiusa');

%Corrente linea chiusa
figure(2);
plot(z,real(abs(Ic)));
grid on;
xlabel('z[m]');
title('Corrente di linea chiusa');

%Espressione istantanea della tensione linea chiusa
v=ones(length(z),length(t));
for a=1:length(z)
    for b=1:length(t)
        v(a,b)=real(z0*abs(i0)*abs(sin(k*z(a)))*exp(1i*omega*t(b)));
    end
end

%plot dell'espressione istantanea della tensione
figure(3);
mesh(z,t,abs(v))
grid on;
xlabel('z[m]');
ylabel('t[s]');
title('Espressione istantanea di tensione su linea chiusa');

%Espressione istantanea della corrente linea chiusa
i=ones(length(z),length(t));
for a=1:length(z)
    for b=1:length(t)
        i(a,b)=real(abs(i0)*abs(cos(k*z(a)))*exp(1i*omega*t(b)));
    end
end

%plot dell'espressione istantanea della corrente
figure(4);
mesh(z,t,abs(i))
grid on;
xlabel('z[m]');
ylabel('t[s]');
title('Espressione istantanea di corrente su linea chiusa');

%%%LINEA APERTA%%%
Va=abs(v0)*abs(cos(k*z));      %Tensione
Ia=(abs(v0)/z0)*abs(sin(k*z));   %Corrente

%Plottiamo il tutto
%Tensione di linea aperta
figure(5);
plot(z,real(abs(Va)));
grid on;
xlabel('z[m]');
title('Tensione su linea aperta');

%Corrente di linea aperta
figure(6);
plot(z,real(abs(Ia)));
grid on;
xlabel('z[m]');
title('Corrente su linea aperta');

%Espressione istantanea della tensione su linea aperta
va=ones(length(z),length(t));
for a=1:length(z)
    for b=1:length(t)
        va(a,b)=real(abs(v0)*abs(cos(k*z(a)))*exp(1i*omega*t(b)));
    end
end

%plot dell'espressione istantanea della tensione su linea aperta
figure(7);
mesh(z,t,abs(va))
grid on;
xlabel('z[m]');
ylabel('t[s]');
title('Espressione istantanea di tensione su linea aperta');

%Espressione istantanea della corrente su linea aperta
ia=ones(length(z),length(t));
for a=1:length(z)
    for b=1:length(t)
        ia(a,b)=real((abs(v0)/z0)*abs(sin(k*z(a)))*exp(1i*omega*t(b)));
    end
end

%plot dell'espressione istantanea della tensione
figure(8);
mesh(z,t,abs(ia))
grid on;
xlabel('z[m]');
ylabel('t[s]');
title('Espressione istantanea di corrente su linea aperta');

%%%

%Espressione istantanea tensione linea chiusa in 2D
figure(9);
plot(z,abs(v));
grid on;
xlabel('z[m]');
title('Espressione istantanea tensione linea chiusa');

%Espressione istantanea corrente linea chiusa 2D
figure(10);
plot(z,abs(i));
grid on;
xlabel('z[m]');
title('Espressione istantanea corrente linea chiusa');

%Espressione istantanea tensione linea aperta 2D
figure(11);
plot(z,abs(va));
grid on;
xlabel('z[m]');
title('Espressione istantanea tensione linea aperta');

%Espressione istantanea corrente linea aperta 2D
figure(12);
plot(z,abs(ia));
grid on;
xlabel('z[m]');
title('Espressione istantanea corrente linea aperta');





