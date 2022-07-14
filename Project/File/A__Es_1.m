%Plot u(t)=A cos(omega t) & u(z)=A cos(kz)

f= 9e9; %9 GHz 9*10^9 Hz frequenza
A= 1;    %ampiezza

%In che mezzo vogliamo far propagare il segnale?

% -VUOTO-
eps0= 8.854e-12;
mu0= 4*pi*1e-7;
%epsr= 2;
%eps= eps0*epsr;


omega=2*pi*f;
T= 1/f;
vp= 1/sqrt(eps0*mu0);
lambda= vp/f;
k=(2*pi)/lambda;

t= 0:1/(30*f):5*T;    %moltiplicato per 30 per essere più precisi nell'andare a disegnare la curva(prendiamo più punti)
z= -3*lambda:(lambda/20): 3*lambda;     %inizio:step:fine

figure(1)
u1= A*cos(omega.*t);  %u per z=0 al variare di t   .* significa che Matlab scaandirà automaticamente il vettore t
plot(t,u1);
xlabel('t[s]');


figure(2)
u2= A*cos(k.*z); %t=0  u al variare di z, fissato il tempo t
plot(z,u2);
xlabel('z[m]');


%Analizzando la figura 2, osserviamo che la lunghezza d'onda 
% è di 3cm verifichiamo anche con il command window richiamando lambda
% per verificare se sono uguali =>> OK

%Analizzando la figura 1, la lung.d'onda è di 0,11 ns
% richiamando T nel comm.wind. dovremmo ottenere lo stesso risultato
% =>> OK


