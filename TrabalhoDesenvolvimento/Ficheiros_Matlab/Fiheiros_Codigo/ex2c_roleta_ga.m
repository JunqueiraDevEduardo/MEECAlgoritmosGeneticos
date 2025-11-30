function [PG1_opt, PG2_opt, custo_min] = ex2c_roleta_ga(Pmax, Npop, Nger, Pc, Pm)
%% GA com seleção por roleta (somente Roleta)
% Retorna os resultados e plota gráficos da sua implementação

    PD = 0.9;           % Potência total exigida
    Pmin = 0;           % Limite inferior
    
    % Funções de custo
    C1 = @(PG1) 0.3*PG1 + 0.01*PG1.^2;
    C2 = @(PG2) 0.2*PG2 + 0.3*PG2.^2;
    C_total = @(PG1) C1(PG1) + C2(PD - PG1);
    
    % Inicialização da população
    pop = Pmin + (Pmax-Pmin)*rand(Npop,1);
    
    % Loop principal
    melhor_custo = zeros(Nger,1);
    melhor_ind = zeros(Nger,1);
    for g = 1:Nger
        custos = C_total(pop);
        fitness = 1./(custos + 1e-6);
        
        [melhor_custo(g), idx_best] = min(custos);
        melhor_ind(g) = pop(idx_best);
        
        pais = selecao_roleta(pop, fitness);
        filhos = crossover(pais, Pc, Pmin, Pmax);
        filhos = mutacao(filhos, Pm, Pmin, Pmax);
        
        % Elitismo
        [~, idx_worst] = max(C_total(filhos));
        filhos(idx_worst) = pop(idx_best);
        
        pop = filhos;
    end
    
    % Resultados finais
    [custo_min, idx_final] = min(C_total(pop));
    PG1_opt = pop(idx_final);
    PG2_opt = PD - PG1_opt;
    
    
    % ======================
    % Gráficos
    % ======================
    
    % Evolução do custo mínimo
    figure;
    plot(1:Nger, melhor_custo,'r-','LineWidth',1.5);
    xlabel('Geração'); ylabel('Melhor Custo'); 
    title('Evolução do Custo Mínimo - GA Roleta'); grid on;
    
    % Curva do custo total e ponto ótimo
    PG1_vals = linspace(Pmin,Pmax,200);
    C_vals = C_total(PG1_vals);
    
    figure;
    plot(PG1_vals,C_vals,'b-','LineWidth',1.5); hold on;
    plot(PG1_opt, custo_min, 'ro','MarkerSize',10,'LineWidth',2);
    xlabel('PG1 (p.u.)'); ylabel('Custo total (AC/h)');
    title('Curva do Custo Total - GA Roleta'); grid on;
    
    % Distribuição da população final
    figure;
    histogram(pop,10,'FaceColor','r'); hold on;
    xline(PG1_opt,'r--','Solução Ótima','LineWidth',2);
    xlabel('PG1 (p.u.)'); ylabel('Frequência / ponto ótimo');
    title('Distribuição da População Final - GA Roleta'); grid on;
end

% ======= FUNÇÕES AUXILIARES =======

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
