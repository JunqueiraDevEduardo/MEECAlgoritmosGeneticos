%% ============================================================
%  ALGORITMO GENÉTICO - Seleção por Roleta
%  Problema: Despacho Económico sem perdas
%  Autor: [O teu nome]
% ============================================================

clear; clc; close all;

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

run("ex2b.m");  % retorna PG1_tool, PG2_tool, custo_min_tool

fprintf('\nComparação com GA Toolbox:\n');
fprintf('GA Roleta:    PG1 = %.4f | PG2 = %.4f | Custo = %.5f\n', PG1_opt, PG2_opt, custo_min);
fprintf('GA Toolbox:  PG1 = %.4f | PG2 = %.4f | Custo = %.5f\n', PG1_tool, PG2_tool, custo_min_tool);

%% ==========================
% 1️⃣ Evolução do custo mínimo (GA Roleta)
% ==========================
figure(1);
plot(1:Nger, melhor_custo, 'r-', 'LineWidth', 1.5); hold on;
yline(custo_min_tool, 'g--', 'LineWidth', 2); % marca Toolbox
xlabel('Geração');
ylabel('Melhor Custo');
title('Evolução do Custo Mínimo - GA Roleta');
legend('GA Roleta', 'GA Toolbox (valor final)', 'Location', 'best');
grid on;

%% ==========================
% 2️⃣ Curva do custo total e ponto ótimo (GA Roleta)
% ==========================
C1 = @(PG1) 0.3*PG1 + 0.01*PG1.^2;
C2 = @(PG2) 0.2*PG2 + 0.3*PG2.^2;
PD = 0.9;
C_total = @(PG1) C1(PG1) + C2(PD - PG1);

PG1_vals = linspace(Pmin, Pmax, 200);
C_vals = C_total(PG1_vals);

figure(2);
plot(PG1_vals, C_vals, 'b-', 'LineWidth', 1.5); hold on;
plot(PG1_opt, custo_min, 'ro', 'MarkerSize', 10, 'LineWidth', 2);         % ponto ótimo Roleta
plot(PG1_tool, custo_min_tool, 'gs', 'MarkerSize', 10, 'LineWidth', 2);   % ponto Toolbox
xlabel('PG1 (p.u.)');
ylabel('Custo total (AC/h)');
title('Curva do Custo Total - GA Roleta vs Toolbox');
legend('Custo total', 'GA Roleta', 'GA Toolbox', 'Location', 'best');
grid on;

%% ==========================
% 3️⃣ Distribuição da população final (GA Roleta)
% ==========================
figure(3);
histogram(pop, 10, 'FaceColor', 'r'); hold on;
xline(PG1_opt, 'r--', 'Solução Ótima Roleta', 'LineWidth', 2);
xline(PG1_tool, 'g--', 'Solução Ótima Toolbox', 'LineWidth', 2);
xlabel('PG1 (p.u.)');
ylabel('Frequência / ponto ótimo');
title('Distribuição da População Final - GA Roleta');
legend('População Roleta', 'Ótimo Roleta', 'Ótimo Toolbox', 'Location', 'best');
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