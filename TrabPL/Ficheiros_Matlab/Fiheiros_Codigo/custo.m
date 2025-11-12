%% ============================================================
%  ALGORITMO GENÉTICO 
%  Ex2:
%  Autor: Eduardo, Rodrigo e João
% ============================================================
%Ex2:
%Funcao a optimizar
function z=custo(x)
%Equações c1 e c2 defenidas inicialmente
c1=0.3*x(1)+0.01*x(1)^2;
c2=0.2*x(2)+0.3*x(2)^2;
%Funcao fitness
z=c1+c2;
