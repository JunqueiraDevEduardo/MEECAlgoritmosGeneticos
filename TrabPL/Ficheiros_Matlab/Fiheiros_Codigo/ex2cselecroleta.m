%% ============================================================
%  ALGORITMO GENÉTICO - Seleção por Roleta
%  Problema: Despacho Económico sem perdas
%  Autor: [O teu nome]
% ============================================================

clc; clear; close all;

%% Dados do problema
PD = 0.9;           % Potência total exigida (p.u.)
Pmin = 0;           % Limite inferior do Gerador 1
Pmax = 0.5;         % Limite superior do Gerador 1 (caso da alínea b)

% Funções de custo
C1 = @(PG1) 0.3*PG1 + 0.01*PG1.^2;
C2 = @(PG2) 0.2*PG2 + 0.3*PG2.^2;

% Função objetivo total
C_total = @(PG1) C1(PG1) + C2(PD - PG1);

%% Parâmetros do GA
Npop = 50;        % Tamanho da população
Nger = 100;       % Número de gerações
Pc = 0.8;         % Probabilidade de crossover
Pm = 0.1;         % Probabilidade de mutação
elitismo = true;  % Mantém o melhor indivíduo

%% Inicialização da população
pop = Pmin + (Pmax - Pmin) * rand(Npop,1);

%% Loop principal do GA
for g = 1:Nger
    % Avaliar custo e fitness (quanto menor o custo, maior o fitness)
    custos = C_total(pop);
    fitness = 1 ./ (custos + 1e-6); % evitar divisão por zero
    
    % Guardar melhor indivíduo
    [melhor_custo(g), idx_best] = min(custos);
    melhor_ind(g) = pop(idx_best);
    
    % Seleção por roleta
    pais = selecao_roleta(pop, fitness);
    
    % Cruzamento (crossover simples)
    filhos = crossover(pais, Pc, Pmin, Pmax);
    
    % Mutação
    filhos = mutacao(filhos, Pm, Pmin, Pmax);
    
    % Elitismo
    if elitismo
        [~, idx_worst] = max(C_total(filhos));
        filhos(idx_worst) = pop(idx_best);
    end
    
    % Nova geração
    pop = filhos;
end

%% Resultados finais
[melhor_custo_final, idx_final] = min(C_total(pop));
PG1_opt = pop(idx_final);
PG2_opt = PD - PG1_opt;
custo_min = melhor_custo_final;

fprintf('\n===== RESULTADOS DO GA (roleta) =====\n');
fprintf('PG1 ótimo = %.4f p.u.\n', PG1_opt);
fprintf('PG2 ótimo = %.4f p.u.\n', PG2_opt);
fprintf('Custo mínimo = %.6f (AC/h)\n', custo_min);
fprintf('======================================\n');

% Gráfico da evolução do custo
figure;
plot(1:Nger, melhor_custo, 'LineWidth', 1.5);
xlabel('Geração'); ylabel('Melhor Custo');
title('Evolução do Custo Mínimo - GA com Seleção por Roleta');
grid on;

%% ======= FUNÇÕES AUXILIARES =======

function pais = selecao_roleta(pop, fitness)
    % Seleção proporcional ao fitness
    N = numel(pop);
    total_fit = sum(fitness);
    prob = fitness / total_fit;
    prob_acum = cumsum(prob);
    
    pais = zeros(size(pop));
    for i = 1:N
        r = rand;
        idx = find(prob_acum >= r, 1, 'first');
        pais(i) = pop(idx);
    end
end

function filhos = crossover(pais, Pc, Pmin, Pmax)
    N = numel(pais);
    filhos = pais;
    for i = 1:2:N-1
        if rand < Pc
            alfa = rand;
            filhos(i)   = alfa*pais(i) + (1-alfa)*pais(i+1);
            filhos(i+1) = alfa*pais(i+1) + (1-alfa)*pais(i);
        end
    end
    filhos = max(min(filhos, Pmax), Pmin);
end

function filhos = mutacao(filhos, Pm, Pmin, Pmax)
    N = numel(filhos);
    for i = 1:N
        if rand < Pm
            filhos(i) = Pmin + (Pmax - Pmin)*rand;
        end
    end
end
