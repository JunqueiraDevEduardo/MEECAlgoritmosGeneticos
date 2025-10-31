%% Funções custo
C1 = @(PG1) 0.3*PG1 + 0.01*PG1.^2;
C2 = @(PG2) 0.2*PG2 + 0.3*PG2.^2;

% Potência total exigida
P_D = 0.9;

% Fitness: mínimo do custo total, restringindo PG2 = P_D - PG1 com o uso do
% método fitness
fitness = @(PG1) C1(PG1) + C2(P_D - PG1);

% Restrição PG1 entre 0 e P_D
lb = 0;       % Limite inferior PG1
ub = P_D;     % Limite superior PG1

% GA precisa de opções
options = optimoptions('ga','PlotFcns',...
{@gaplotbestf,@gaplotbestindiv,@gaplotexpectation,@gaplotstopping});

% Corre o GA
[x, fval] = ga(fitness, 1, [], [], [], [], lb, ub, [], options);

% Resultados
PG1_opt = x;
PG2_opt = P_D - x;
custo_min = fval;

disp("PG1 ótimo = " + PG1_opt)
disp("PG2 ótimo = " + PG2_opt)
disp("Custo mínimo = " + custo_min)