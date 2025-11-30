% gasenoMax_grafico.m
options = optimoptions('ga','Display','off','PopInitRange',[0;2*pi]);
[x,fval] = ga(@senoMax,1,[],[],[],[],0,2*pi,[],options);
y = linspace(0,2*pi,200);
plot(y,sin(y),'b','LineWidth',1.5); hold on;
plot(x,-fval,'ro','MarkerSize',10,'LineWidth',2);
title('Máximo do seno'); grid on;

