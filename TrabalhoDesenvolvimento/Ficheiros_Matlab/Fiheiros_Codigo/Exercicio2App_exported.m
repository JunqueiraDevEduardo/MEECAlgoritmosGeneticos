classdef Exercicio2App_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                     matlab.ui.Figure
        GridLayout                   matlab.ui.container.GridLayout
        SairButton                   matlab.ui.control.Button
        executaroGAcustoRefernciaparaafunoobjetivofitnessfunctionquequeremosminimizarsaidasxefvalnotasdocdigogaplotbestfMostraaevoluodomelhorvalorfitnessaolongodasgeraesgaplotbestindivMostraomelhorindivduosoluoemcadageraogaplotexpectationMostraaexpectativamdiadosvaloresgaplotstoppingMostraoscritriosdeparagemdoalgoritmoPopInitRange009Defineointervaloinicialdapopulaoosindivduoscomeamcomvaloresentre0e09Label  matlab.ui.control.Label
        EX2AdmitindoqueafunocustodeproduodecadaumdosgeradoressodadaspelasEquaes1e2C1PG103PG1001P2G1C2PG202PG203P2G2RecorrendoToolboxdeOtimizaodoMATLABodespachoeconmicosemperdasdarededaFigura4ecomparaoosresultadoscomosobtidosrecorrendoaosmultiplicadoresdeLagrangefunctionzcustoxLabel  matlab.ui.control.Label
        ToolboxButton                matlab.ui.control.Button
        ValorDropDown                matlab.ui.control.DropDown
        REDEELTRICAOPTIMIZAOGALabel  matlab.ui.control.Label
        MENUPRINCIPALButton          matlab.ui.control.Button
    end

    



    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: MENUPRINCIPALButton
        function MENUPRINCIPALButtonPushed(app, event)
            MenuAPP; %retorna ao Menu Principal
            delete(app);% sai da aplicação
        end

        % Button pushed function: ToolboxButton
        function ToolboxButtonPushed(app, event)
            tipo = app.ValorDropDown.Value;  % "Seleção por  Roda da Roleta ou Seleção por Torneio
            if strcmp(tipo,'Selec.Roleta')
                run('ex2cselecroleta.m');   % executa a seleção ex2 por roleta
            end
            if strcmp(tipo,'Selec.Torneio')
                run('ex2cselectorneio.m');   % executa a seleção ex2 por torneio
            end
        end

        % Button pushed function: SairButton
        function SairButtonPushed(app, event)
            delete(app);
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 978 692];
            app.UIFigure.Name = 'MATLAB App';

            % Create GridLayout
            app.GridLayout = uigridlayout(app.UIFigure);
            app.GridLayout.ColumnWidth = {'1.13x', 179, 150, 183, '1x'};
            app.GridLayout.RowHeight = {64, '1.3x', 71, '1.11x', 69, 40, '1x'};

            % Create MENUPRINCIPALButton
            app.MENUPRINCIPALButton = uibutton(app.GridLayout, 'push');
            app.MENUPRINCIPALButton.ButtonPushedFcn = createCallbackFcn(app, @MENUPRINCIPALButtonPushed, true);
            app.MENUPRINCIPALButton.IconAlignment = 'right';
            app.MENUPRINCIPALButton.BackgroundColor = [0.8 0.8 0.8];
            app.MENUPRINCIPALButton.FontSize = 18;
            app.MENUPRINCIPALButton.FontWeight = 'bold';
            app.MENUPRINCIPALButton.Layout.Row = 2;
            app.MENUPRINCIPALButton.Layout.Column = 1;
            app.MENUPRINCIPALButton.Text = 'MENU PRINCIPAL';

            % Create REDEELTRICAOPTIMIZAOGALabel
            app.REDEELTRICAOPTIMIZAOGALabel = uilabel(app.GridLayout);
            app.REDEELTRICAOPTIMIZAOGALabel.BackgroundColor = [0 1 0];
            app.REDEELTRICAOPTIMIZAOGALabel.HorizontalAlignment = 'center';
            app.REDEELTRICAOPTIMIZAOGALabel.FontSize = 30;
            app.REDEELTRICAOPTIMIZAOGALabel.FontWeight = 'bold';
            app.REDEELTRICAOPTIMIZAOGALabel.Layout.Row = 1;
            app.REDEELTRICAOPTIMIZAOGALabel.Layout.Column = [1 5];
            app.REDEELTRICAOPTIMIZAOGALabel.Text = 'REDE ELÉTRICA OPTIMIZAÇÃO GA';

            % Create ValorDropDown
            app.ValorDropDown = uidropdown(app.GridLayout);
            app.ValorDropDown.Items = {'Selec.Roleta', 'Selec.Torneio'};
            app.ValorDropDown.FontSize = 18;
            app.ValorDropDown.FontWeight = 'bold';
            app.ValorDropDown.BackgroundColor = [0.149 0.549 0.8667];
            app.ValorDropDown.Layout.Row = 5;
            app.ValorDropDown.Layout.Column = 2;
            app.ValorDropDown.Value = 'Selec.Roleta';

            % Create ToolboxButton
            app.ToolboxButton = uibutton(app.GridLayout, 'push');
            app.ToolboxButton.ButtonPushedFcn = createCallbackFcn(app, @ToolboxButtonPushed, true);
            app.ToolboxButton.BackgroundColor = [0.149 0.549 0.8667];
            app.ToolboxButton.FontSize = 18;
            app.ToolboxButton.FontWeight = 'bold';
            app.ToolboxButton.Layout.Row = 6;
            app.ToolboxButton.Layout.Column = 2;
            app.ToolboxButton.Text = 'Toolbox';

            % Create EX2AdmitindoqueafunocustodeproduodecadaumdosgeradoressodadaspelasEquaes1e2C1PG103PG1001P2G1C2PG202PG203P2G2RecorrendoToolboxdeOtimizaodoMATLABodespachoeconmicosemperdasdarededaFigura4ecomparaoosresultadoscomosobtidosrecorrendoaosmultiplicadoresdeLagrangefunctionzcustoxLabel
            app.EX2AdmitindoqueafunocustodeproduodecadaumdosgeradoressodadaspelasEquaes1e2C1PG103PG1001P2G1C2PG202PG203P2G2RecorrendoToolboxdeOtimizaodoMATLABodespachoeconmicosemperdasdarededaFigura4ecomparaoosresultadoscomosobtidosrecorrendoaosmultiplicadoresdeLagrangefunctionzcustoxLabel = uilabel(app.GridLayout);
            app.EX2AdmitindoqueafunocustodeproduodecadaumdosgeradoressodadaspelasEquaes1e2C1PG103PG1001P2G1C2PG202PG203P2G2RecorrendoToolboxdeOtimizaodoMATLABodespachoeconmicosemperdasdarededaFigura4ecomparaoosresultadoscomosobtidosrecorrendoaosmultiplicadoresdeLagrangefunctionzcustoxLabel.HorizontalAlignment = 'center';
            app.EX2AdmitindoqueafunocustodeproduodecadaumdosgeradoressodadaspelasEquaes1e2C1PG103PG1001P2G1C2PG202PG203P2G2RecorrendoToolboxdeOtimizaodoMATLABodespachoeconmicosemperdasdarededaFigura4ecomparaoosresultadoscomosobtidosrecorrendoaosmultiplicadoresdeLagrangefunctionzcustoxLabel.WordWrap = 'on';
            app.EX2AdmitindoqueafunocustodeproduodecadaumdosgeradoressodadaspelasEquaes1e2C1PG103PG1001P2G1C2PG202PG203P2G2RecorrendoToolboxdeOtimizaodoMATLABodespachoeconmicosemperdasdarededaFigura4ecomparaoosresultadoscomosobtidosrecorrendoaosmultiplicadoresdeLagrangefunctionzcustoxLabel.Layout.Row = 2;
            app.EX2AdmitindoqueafunocustodeproduodecadaumdosgeradoressodadaspelasEquaes1e2C1PG103PG1001P2G1C2PG202PG203P2G2RecorrendoToolboxdeOtimizaodoMATLABodespachoeconmicosemperdasdarededaFigura4ecomparaoosresultadoscomosobtidosrecorrendoaosmultiplicadoresdeLagrangefunctionzcustoxLabel.Layout.Column = [2 5];
            app.EX2AdmitindoqueafunocustodeproduodecadaumdosgeradoressodadaspelasEquaes1e2C1PG103PG1001P2G1C2PG202PG203P2G2RecorrendoToolboxdeOtimizaodoMATLABodespachoeconmicosemperdasdarededaFigura4ecomparaoosresultadoscomosobtidosrecorrendoaosmultiplicadoresdeLagrangefunctionzcustoxLabel.Text = {'EX2: Admitindo que a função custo de produção de cada um dos geradores'; 'são dadas pelas Equações (1) e (2):'; 'C1(PG1) = 0,3· PG1 + 0,01· P^2G1;'; 'C2(PG2) = 0,2· PG2 + 0,3· P^2G2;'; ''; 'Recorrendo à Toolbox de Otimização do MATLAB, o despacho económico sem perdas'; 'da rede da Figura 4 e comparação os resultados com os obtidos recorrendo aos multiplicadores de'; 'Lagrange.'; 'function z=custo(x)'; ''; ''};

            % Create executaroGAcustoRefernciaparaafunoobjetivofitnessfunctionquequeremosminimizarsaidasxefvalnotasdocdigogaplotbestfMostraaevoluodomelhorvalorfitnessaolongodasgeraesgaplotbestindivMostraomelhorindivduosoluoemcadageraogaplotexpectationMostraaexpectativamdiadosvaloresgaplotstoppingMostraoscritriosdeparagemdoalgoritmoPopInitRange009Defineointervaloinicialdapopulaoosindivduoscomeamcomvaloresentre0e09Label
            app.executaroGAcustoRefernciaparaafunoobjetivofitnessfunctionquequeremosminimizarsaidasxefvalnotasdocdigogaplotbestfMostraaevoluodomelhorvalorfitnessaolongodasgeraesgaplotbestindivMostraomelhorindivduosoluoemcadageraogaplotexpectationMostraaexpectativamdiadosvaloresgaplotstoppingMostraoscritriosdeparagemdoalgoritmoPopInitRange009Defineointervaloinicialdapopulaoosindivduoscomeamcomvaloresentre0e09Label = uilabel(app.GridLayout);
            app.executaroGAcustoRefernciaparaafunoobjetivofitnessfunctionquequeremosminimizarsaidasxefvalnotasdocdigogaplotbestfMostraaevoluodomelhorvalorfitnessaolongodasgeraesgaplotbestindivMostraomelhorindivduosoluoemcadageraogaplotexpectationMostraaexpectativamdiadosvaloresgaplotstoppingMostraoscritriosdeparagemdoalgoritmoPopInitRange009Defineointervaloinicialdapopulaoosindivduoscomeamcomvaloresentre0e09Label.HorizontalAlignment = 'center';
            app.executaroGAcustoRefernciaparaafunoobjetivofitnessfunctionquequeremosminimizarsaidasxefvalnotasdocdigogaplotbestfMostraaevoluodomelhorvalorfitnessaolongodasgeraesgaplotbestindivMostraomelhorindivduosoluoemcadageraogaplotexpectationMostraaexpectativamdiadosvaloresgaplotstoppingMostraoscritriosdeparagemdoalgoritmoPopInitRange009Defineointervaloinicialdapopulaoosindivduoscomeamcomvaloresentre0e09Label.WordWrap = 'on';
            app.executaroGAcustoRefernciaparaafunoobjetivofitnessfunctionquequeremosminimizarsaidasxefvalnotasdocdigogaplotbestfMostraaevoluodomelhorvalorfitnessaolongodasgeraesgaplotbestindivMostraomelhorindivduosoluoemcadageraogaplotexpectationMostraaexpectativamdiadosvaloresgaplotstoppingMostraoscritriosdeparagemdoalgoritmoPopInitRange009Defineointervaloinicialdapopulaoosindivduoscomeamcomvaloresentre0e09Label.Layout.Row = 4;
            app.executaroGAcustoRefernciaparaafunoobjetivofitnessfunctionquequeremosminimizarsaidasxefvalnotasdocdigogaplotbestfMostraaevoluodomelhorvalorfitnessaolongodasgeraesgaplotbestindivMostraomelhorindivduosoluoemcadageraogaplotexpectationMostraaexpectativamdiadosvaloresgaplotstoppingMostraoscritriosdeparagemdoalgoritmoPopInitRange009Defineointervaloinicialdapopulaoosindivduoscomeamcomvaloresentre0e09Label.Layout.Column = [1 5];
            app.executaroGAcustoRefernciaparaafunoobjetivofitnessfunctionquequeremosminimizarsaidasxefvalnotasdocdigogaplotbestfMostraaevoluodomelhorvalorfitnessaolongodasgeraesgaplotbestindivMostraomelhorindivduosoluoemcadageraogaplotexpectationMostraaexpectativamdiadosvaloresgaplotstoppingMostraoscritriosdeparagemdoalgoritmoPopInitRange009Defineointervaloinicialdapopulaoosindivduoscomeamcomvaloresentre0e09Label.Text = {'%executar o GA: @custo: Referência para a função objetivo (fitness function) que queremos minimizar! saidas x e fval'; ''; '%notas do código:'; '%@gaplotbestf: Mostra a evolução do melhor valor (fitness) ao longo das gerações'; '%@gaplotbestindiv: Mostra o melhor indivíduo (solução) em cada geração'; '%@gaplotexpectation: Mostra a expectativa/média dos valores'; '%@gaplotstopping: Mostra os critérios de paragem do algoritmo'; '%''PopInitRange'',[0;0.9]: Define o intervalo inicial da população - os indivíduos começam com valores entre 0 e 0.9'};

            % Create SairButton
            app.SairButton = uibutton(app.GridLayout, 'push');
            app.SairButton.ButtonPushedFcn = createCallbackFcn(app, @SairButtonPushed, true);
            app.SairButton.BackgroundColor = [0.8 0.8 0.8];
            app.SairButton.FontSize = 24;
            app.SairButton.FontWeight = 'bold';
            app.SairButton.Layout.Row = 7;
            app.SairButton.Layout.Column = 1;
            app.SairButton.Text = 'Sair';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Exercicio2App_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end