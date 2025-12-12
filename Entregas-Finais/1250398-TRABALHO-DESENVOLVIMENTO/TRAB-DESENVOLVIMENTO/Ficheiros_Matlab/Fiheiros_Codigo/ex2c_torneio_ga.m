function [PG1_opt, PG2_opt, custo_min] = ex2c_torneio_ga(Pmax, Npop, Nger, Pc, Pm)
%% GA com Seleção por Torneio (modular)
% Retorna os resultados e plota gráficos

    PD = 0.9;       % Potência exigida
    Pmin = 0;       % Limite inferior

    % Funções de custo
    C1 = @(PG1) 0.3*PG1 + 0.01*PG1.^2;
    C2 = @(PG2) 0.2*PG2 + 0.3*PG2.^2;
    C_total = @(PG1) C1(PG1) + C2(PD - PG1);

    %% Inicialização da população
    pop = Pmin + (Pmax-Pmin)*rand(Npop,1);
    melhor_custo = zeros(Nger,1);

    %% Loop principal
    for g = 1:Nger
        custos = C_total(pop);

        % Guardar melhor indivíduo (elitismo)
        [melhor_custo(g), idx_best] = min(custos);
        elite = pop(idx_best);

        % Seleção, crossover e mutação
        pais = selecao_torneio(pop, custos);
        filhos = crossover(pais, Pc, Pmin, Pmax);
        filhos = mutacao(filhos, Pm, Pmin, Pmax);

        % Inserir elite na nova geração
        [~, idx_worst] = max(C_total(filhos));
        filhos(idx_worst) = elite;

        % Atualizar população
        pop = filhos;
    end

    % Melhor solução final
    custos_finais = C_total(pop);
    [custo_min, idx_final] = min(custos_finais);
    PG1_opt = pop(idx_final);
    PG2_opt = PD - PG1_opt;

    %% ======= Gráficos =======
    % Evolução do custo
    figure;
    plot(1:Nger, melhor_custo,'b-','LineWidth',1.5);
    xlabel('Geração'); ylabel('Melhor Custo');
    title('Evolução do Custo - GA Torneio'); grid on;

    % Curva do custo total
    PG1_vals = linspace(Pmin,Pmax,200);
    figure;
    plot(PG1_vals, C_total(PG1_vals),'b','LineWidth',2); hold on;
    plot(PG1_opt, custo_min,'ro','MarkerSize',10,'LineWidth',2);
    title('Curva do Custo Total - GA Torneio'); grid on;

    % Distribuição da população final
    figure;
    histogram(pop,10,'FaceColor','b'); hold on;
    xline(PG1_opt,'r--','Ótimo','LineWidth',2);
    title('Distribuição da População Final - GA Torneio'); grid on;
end

%% ===== Funções Auxiliares =====

function pais = selecao_torneio(pop, custos)
    % Seleção por torneio (pares)
    N = numel(pop);
    pais = zeros(size(pop));
    for i = 1:2:N
        idx = randperm(N,4); % 4 indivíduos -> 2 torneios
        % Torneio 1
        if custos(idx(1)) < custos(idx(2))
            pai1 = pop(idx(1));
        else
            pai1 = pop(idx(2));
        end
        % Torneio 2
        if custos(idx(3)) < custos(idx(4))
            pai2 = pop(idx(3));
        else
            pai2 = pop(idx(4));
        end
        pais(i) = pai1;
        if i+1 <= N
            pais(i+1) = pai2;
        end
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
    filhos = max(min(filhos,Pmax), Pmin);
end

function filhos = mutacao(filhos, Pm, Pmin, Pmax)
    N = numel(filhos);
    for i = 1:N
        if rand < Pm
            filhos(i) = Pmin + (Pmax - Pmin)*rand;
        end
    end
end
