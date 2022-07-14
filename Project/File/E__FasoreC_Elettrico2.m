clc
clear all
close all

%Fasore campo elettrico    23/10/19

Eo=[1 1];
x=-pi/2:0.1:pi/2;
A=1;
y= A*cos(x);

Ax=1;
Ay=exp(1i*(pi/2));

eps0= 8.854e-12;
mu0= 4*pi*1e-7;
epsr=1;
mur=1;
epsilon= epsr*eps0;
mu=mur*mu0;

vp=1/sqrt(epsilon*mu);
k=43;                    %k=2pi/lambda
lambda=(2*pi)/k;
f=vp/lambda;
T=1/f;
omega= 2*pi*f;

%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(1)
t= 0:20/(2*f):4*T;
z= 0:(lambda/20):2*lambda;
Ex=Ax* exp((-1*1i)*k.*z);
plot(z,real(Ex));
grid on;
xlabel('z[m]');
ylabel('Ex');

%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(2)
t= 0:1/(10*f):4*T;
z= 0:(lambda/20):2*lambda;
Ey=Ay*(exp((-1*1i)*k.*z));
%Ey=(-1i)*(exp((-1*1i)*k.*z));
plot(z,real(Ey));
grid on;
xlabel('z[m]')
ylabel('Ey');

%%%%%%%%%%%%%%%%%%%%%%%%%

figure(3)
plot(z,real(Ex))
hold on
plot(z,real(Ey))
grid on
xlabel('z[m]')
ylabel('Ex Ey')
title("Fasori del campo elettrico lungo gli assi x e y");

%%%%%%%%%%%%%%%%%%%%%%%%%%
g=ones(length(t),length(z));

for m=1:length(t)
    for n=1:length(z)
        g(m,n)= real(exp((-1i)*k*z(n))*(exp(1i*omega*t(m))));
    end
end

figure(4)
surface(z,t,g)
grid on

figure(5)
mesh(z,t,g)
grid on
