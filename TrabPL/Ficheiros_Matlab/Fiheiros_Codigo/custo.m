
%Funcao a optimizar
function z=custo(x)
%Funcao fitness
c1=0.3*x(1)+0.01*x(1)^2;
c2=0.2*x(2)+0.3*x(2)^2;
z=c1+c2;
