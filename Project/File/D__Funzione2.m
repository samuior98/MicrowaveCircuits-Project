%input:frequenza,ampiezza,epsilonR
%output:velocità propagazione,lungh.d'onda,periodo

%14/10/19

function [T, lambda, vp] = Funzione2(f,A,epsr)

omega=2*pi*f;
eps0= 8.854e-12;
mu0= 4*pi*1e-7;
eps=eps0*epsr;

T= 1/f
vp= 1/sqrt(eps*mu0)
lambda= vp/f

t= 0:1/(30*f):5*T;
z= -3*lambda:(lambda/20): 3*lambda;

figure(1)
u1= A*cos(omega.*t);
plot(t,u1);

end

