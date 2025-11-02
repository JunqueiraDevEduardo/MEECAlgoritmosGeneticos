%Programa de optimizacao
%X = GA(FITNESSFCN,NVARS,A,b,Aeq,beq,lb,ub,NONLCON,options)
options = optimoptions('ga','PlotFcns',...
 {@gaplotbestf,@gaplotbestindiv,@gaplotexpectation,@gaplotstopping},...
 'PopInitRange',[0;2*pi]);
[x fval] = ga(@senoMin,1,[],[],[],[],0,2*pi,[],options)
figure(2)
y=linspace(0,2*pi,100);
plot(y,sin(y),x,fval,'r*')
grid on