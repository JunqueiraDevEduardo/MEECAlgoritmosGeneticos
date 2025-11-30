function [PG1_tool, PG2_tool, custo_min_tool] = ex2c_toolbox(Pmax)
%% GA Toolbox (somente Toolbox)
% Retorna resultados e plota gráficos do GA Toolbox

    PD = 0.9; Pmin = 0;
    C1 = @(PG1) 0.3*PG1 + 0.01*PG1.^2;
    C2 = @(PG2) 0.2*PG2 + 0.3*PG2.^2;
    C_total = @(PG1) C1(PG1) + C2(PD - PG1);

    options = optimoptions('ga','PlotFcns',{@gaplotbestf,@gaplotbestindiv,@gaplotexpectation,@gaplotstopping});
    
    [x,fval] = ga(C_total,1,[],[],[],[],Pmin,Pmax,[],options);
    
    PG1_tool = x;
    PG2_tool = PD - x;
    custo_min_tool = fval;
  
    
    % Gráfico da curva do custo total
    PG1_vals = linspace(Pmin,Pmax,200);
    C_vals = C_total(PG1_vals);
    
    figure;
    plot(PG1_vals,C_vals,'b-','LineWidth',1.5); hold on;
    plot(PG1_tool, custo_min_tool, 'gs','MarkerSize',10,'LineWidth',2);
    xlabel('PG1 (p.u.)'); ylabel('Custo total (AC/h)');
    title('Curva do Custo Total - GA Toolbox'); grid on;
end
