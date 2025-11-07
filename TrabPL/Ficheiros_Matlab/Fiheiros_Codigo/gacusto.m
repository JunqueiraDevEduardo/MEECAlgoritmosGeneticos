%% ============================================================
%  ALGORITMO GENÉTICO 
%  Ex2:
%  Autor: Eduardo, Rodrigo e João
% ============================================================
%Programa de optimizacao com a função GA : Algoritmos Genéticos!
%X = GA(FITNESSFCN,NVARS,A,b,Aeq,beq,lb,ub,NONLCON,options)
%cria uma estrutura chamada "options" que configura o comportamento do
%algoritmo genético!, optimoptions('ga',...): Cria opções específicas para a função ga
options = optimoptions('ga','PlotFcns',...
 {@gaplotbestf,@gaplotbestindiv,@gaplotexpectation,@gaplotstopping},...
 'PopInitRange',[0;0.9]);
[x fval] = ga(@custo,2,[],[],[1 1],0.9,0,2*pi,[],options)%executar o GA: @custo: Referência para a função objetivo (fitness function) que queremos minimizar! saidas x e fval

%notas do código:
%@gaplotbestf: Mostra a evolução do melhor valor (fitness) ao longo das gerações

%@gaplotbestindiv: Mostra o melhor indivíduo (solução) em cada geração

%@gaplotexpectation: Mostra a expectativa/média dos valores

%@gaplotstopping: Mostra os critérios de paragem do algoritmo

%'PopInitRange',[0;0.9]: Define o intervalo inicial da população - os indivíduos começam com valores entre 0 e 0.9