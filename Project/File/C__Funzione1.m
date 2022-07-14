%14/10/19

function [ z ] = Funzione1(A)
%Funzione seno
A=3;
x= -pi:0.1:pi;
y= A*sin(x);
z=plot(x,y);
grid on;

end

