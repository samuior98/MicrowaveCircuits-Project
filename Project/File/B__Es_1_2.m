%plottiamo ora la funzione u in cui varia sia il tempo che lo spazio

f=3e7;
c=3e8; 

t= 0:pi/5:10*pi;
z= 0:0.1:10;

omega=2*pi*f;
eps0= 8.854e-12;
mu0= 4*pi*1e-7;
vp= 1/sqrt(eps0*mu0);
lambda= vp/f;
k= 2*pi/lambda; %pulsazione spaziale
A=1;

g=ones(length(t),length(z));
for m=1:length(t)
    for n=1:length(z)
        g(m,n)= A*cos(omega*t(m)-k*z(n));
    end
end

%MESH
figure(1)
mesh(z,t,g);
xlabel('z(m)');
ylabel('t(n)');
title('Mesh');

%SURFACE
figure(2)
surface(z,t,g);
xlabel('z(m)');
ylabel('t(n)');
title('Surface');


figure(3)
plot(z,g(1,:));
grid on;
%hold on;
title('g(z) per t fissato');
xlabel('z(m)');
ylabel('Ampiezza');

figure(4)
plot(t,A*cos(omega.*t));           %g(1,:)
title('g(t) per z fissato');
xlabel('t(n)');
ylabel('Ampiezza');

