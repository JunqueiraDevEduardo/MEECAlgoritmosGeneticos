%% ============================================================
%  ALGORITMO GENÉTICO - Seleção por torneio
%  Ex2:
%  Autor: Eduardo, Rodrigo e João
% ============================================================

% Funções custo conforme enunciado
C1 = @(PG1) 0.3*PG1 + 0.01*PG1.^2;         % custo do gerador 1
C2 = @(PG2) 0.2*PG2 + 0.3*PG2.^2;          % custo do gerador 2

% Potência exigida
P_D = 0.9;

% Fitness/custo objetivo: PG2 = P_D - PG1
fitness = @(PG1) C1(PG1) + C2(P_D - PG1);

% Limites
lb = 0;      % limite inferior PG1
ub = 0.5;    % limite superior PG1

% Parâmetros do GA manual (sem toolbox)
Ngen = 100;      % número de gerações
Npop = 50;       % indivíduos na população

% População inicial: PG1 aleatórios dentro do intervalo
pop = lb + (ub-lb)*rand(Npop,1);

for gen = 1:Ngen
    % Avaliação do fitness de cada indivíduo
    costs = zeros(Npop,1);
    for i = 1:Npop
        PG1 = pop(i);
        PG2 = P_D - PG1;
        % Penalizar se PG2 sair fora dos limites possíveis
        if PG2 < 0 || PG2 > ub
            costs(i) = Inf; % Penaliza soluções inválidas
        else
            costs(i) = fitness(PG1); % Calcula o custo total
        end
    end

    % Seleção por torneio (pares)
    newPop = zeros(Npop,1);
    for k = 1:Npop/2
        idx = randperm(Npop,2);     % Seleciona dois indivíduos aleatórios
        [~, bestIdx] = min(costs(idx));     % Melhor do torneio
        winner = pop(idx(bestIdx));

        % Mutação simples: pequena alteração
        child1 = winner + 0.1*(rand-0.5);
        child2 = winner + 0.1*(rand-0.5);

        % Garante os limites
        child1 = max(lb, min(child1, ub));
        child2 = max(lb, min(child2, ub));

        newPop(2*k-1) = child1;
        newPop(2*k) = child2;
    end
    pop = newPop;    % Atualiza população
end

% Escolhe melhor solução da última geração
finalCosts = zeros(Npop,1);
for i = 1:Npop
    PG1 = pop(i);
    PG2 = P_D - PG1;
    if PG2 < 0 || PG2 > ub
        finalCosts(i) = Inf;
    else
        finalCosts(i) = fitness(PG1);
    end
end
[~,bestInd] = min(finalCosts);
PG1_opt = pop(bestInd);
PG2_opt = P_D - PG1_opt;
custo_min = finalCosts(bestInd);

% Resultados finais
disp("PG1 ótimo = " + PG1_opt)
disp("PG2 ótimo = " + PG2_opt)
disp("Custo mínimo = " + custo_min)
