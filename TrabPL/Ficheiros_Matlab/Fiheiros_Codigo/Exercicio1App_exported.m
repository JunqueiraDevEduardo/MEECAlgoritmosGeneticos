classdef Exercicio1App_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                 matlab.ui.Figure
        GridLayout               matlab.ui.container.GridLayout
        SairButton               matlab.ui.control.Button
        EscolhadevaloresMnimoMximoLabel  matlab.ui.control.Label
        GrficosrepresentadosToolboxValorLabel  matlab.ui.control.Label
        EX1Exerccio1dafichaqueencontraromnimomximodafunosenousandoalgoritmosgenticosGAProgramadeoptimizacaoXGAFITNESSFCNNVARSAbAeqbeqlbubNONLCONoptionsLabel  matlab.ui.control.Label
        ValorDropDown            matlab.ui.control.DropDown
        Label                    matlab.ui.control.Label
        MENUPRINCIPALButton      matlab.ui.control.Button
        SenoButton               matlab.ui.control.Button
        ToolboxButton            matlab.ui.control.Button
        OPTIMIZAOSENOCOMGALabel  matlab.ui.control.Label
    end



    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: ToolboxButton
        function ToolboxButtonPushed(app, event)
            tipo = app.ValorDropDown.Value;  % "Mínimo" ou "Máximo"
    
            if strcmp(tipo,'Mínimo')
                run('gasenoMin.m');   % executa o GA do mínimo
            else
                run('gasenoMax.m');   % executa o GA do máximo
            end
        
        end

        % Button pushed function: MENUPRINCIPALButton
        function MENUPRINCIPALButtonPushed(app, event)
            MenuAPP;  % volta ao menu principal
            delete(app);
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
            app.UIFigure.Position = [100 100 967 699];
            app.UIFigure.Name = 'MATLAB App';

            % Create GridLayout
            app.GridLayout = uigridlayout(app.UIFigure);
            app.GridLayout.ColumnWidth = {'1.13x', 179, 150, 183, '1x'};
            app.GridLayout.RowHeight = {64, '1.3x', 71, '1.11x', 69, 40, '1x'};

            % Create OPTIMIZAOSENOCOMGALabel
            app.OPTIMIZAOSENOCOMGALabel = uilabel(app.GridLayout);
            app.OPTIMIZAOSENOCOMGALabel.BackgroundColor = [0 1 0];
            app.OPTIMIZAOSENOCOMGALabel.HorizontalAlignment = 'center';
            app.OPTIMIZAOSENOCOMGALabel.FontSize = 30;
            app.OPTIMIZAOSENOCOMGALabel.FontWeight = 'bold';
            app.OPTIMIZAOSENOCOMGALabel.Layout.Row = 1;
            app.OPTIMIZAOSENOCOMGALabel.Layout.Column = [1 5];
            app.OPTIMIZAOSENOCOMGALabel.Text = 'OPTIMIZAÇÃO SENO COM GA';

            % Create ToolboxButton
            app.ToolboxButton = uibutton(app.GridLayout, 'push');
            app.ToolboxButton.ButtonPushedFcn = createCallbackFcn(app, @ToolboxButtonPushed, true);
            app.ToolboxButton.BackgroundColor = [0.149 0.549 0.8667];
            app.ToolboxButton.FontSize = 18;
            app.ToolboxButton.FontWeight = 'bold';
            app.ToolboxButton.Layout.Row = 5;
            app.ToolboxButton.Layout.Column = 4;
            app.ToolboxButton.Text = 'Toolbox';

            % Create SenoButton
            app.SenoButton = uibutton(app.GridLayout, 'push');
            app.SenoButton.BackgroundColor = [0.149 0.549 0.8667];
            app.SenoButton.FontSize = 18;
            app.SenoButton.FontWeight = 'bold';
            app.SenoButton.Layout.Row = 5;
            app.SenoButton.Layout.Column = 5;
            app.SenoButton.Text = 'Seno';

            % Create MENUPRINCIPALButton
            app.MENUPRINCIPALButton = uibutton(app.GridLayout, 'push');
            app.MENUPRINCIPALButton.ButtonPushedFcn = createCallbackFcn(app, @MENUPRINCIPALButtonPushed, true);
            app.MENUPRINCIPALButton.BackgroundColor = [0.8 0.8 0.8];
            app.MENUPRINCIPALButton.FontSize = 18;
            app.MENUPRINCIPALButton.FontWeight = 'bold';
            app.MENUPRINCIPALButton.Layout.Row = 2;
            app.MENUPRINCIPALButton.Layout.Column = 1;
            app.MENUPRINCIPALButton.Text = 'MENU PRINCIPAL';

            % Create Label
            app.Label = uilabel(app.GridLayout);
            app.Label.FontSize = 14;
            app.Label.FontWeight = 'bold';
            app.Label.FontAngle = 'italic';
            app.Label.Layout.Row = 3;
            app.Label.Layout.Column = 5;
            app.Label.Text = '';

            % Create ValorDropDown
            app.ValorDropDown = uidropdown(app.GridLayout);
            app.ValorDropDown.Items = {'Mínimo', 'Máximo'};
            app.ValorDropDown.FontSize = 18;
            app.ValorDropDown.FontWeight = 'bold';
            app.ValorDropDown.BackgroundColor = [0.149 0.549 0.8667];
            app.ValorDropDown.Layout.Row = 5;
            app.ValorDropDown.Layout.Column = 2;
            app.ValorDropDown.Value = 'Mínimo';

            % Create EX1Exerccio1dafichaqueencontraromnimomximodafunosenousandoalgoritmosgenticosGAProgramadeoptimizacaoXGAFITNESSFCNNVARSAbAeqbeqlbubNONLCONoptionsLabel
            app.EX1Exerccio1dafichaqueencontraromnimomximodafunosenousandoalgoritmosgenticosGAProgramadeoptimizacaoXGAFITNESSFCNNVARSAbAeqbeqlbubNONLCONoptionsLabel = uilabel(app.GridLayout);
            app.EX1Exerccio1dafichaqueencontraromnimomximodafunosenousandoalgoritmosgenticosGAProgramadeoptimizacaoXGAFITNESSFCNNVARSAbAeqbeqlbubNONLCONoptionsLabel.HorizontalAlignment = 'center';
            app.EX1Exerccio1dafichaqueencontraromnimomximodafunosenousandoalgoritmosgenticosGAProgramadeoptimizacaoXGAFITNESSFCNNVARSAbAeqbeqlbubNONLCONoptionsLabel.WordWrap = 'on';
            app.EX1Exerccio1dafichaqueencontraromnimomximodafunosenousandoalgoritmosgenticosGAProgramadeoptimizacaoXGAFITNESSFCNNVARSAbAeqbeqlbubNONLCONoptionsLabel.Layout.Row = 2;
            app.EX1Exerccio1dafichaqueencontraromnimomximodafunosenousandoalgoritmosgenticosGAProgramadeoptimizacaoXGAFITNESSFCNNVARSAbAeqbeqlbubNONLCONoptionsLabel.Layout.Column = [2 5];
            app.EX1Exerccio1dafichaqueencontraromnimomximodafunosenousandoalgoritmosgenticosGAProgramadeoptimizacaoXGAFITNESSFCNNVARSAbAeqbeqlbubNONLCONoptionsLabel.Text = {'EX1:'; 'Exercício 1 da ficha, que é encontrar o mínimo/máximo da função seno usando algoritmos genéticos (GA)'; ''; '%Programa de optimizacao'; '%X = GA(FITNESSFCN,NVARS,A,b,Aeq,beq,lb,ub,NONLCON,options)'};

            % Create GrficosrepresentadosToolboxValorLabel
            app.GrficosrepresentadosToolboxValorLabel = uilabel(app.GridLayout);
            app.GrficosrepresentadosToolboxValorLabel.HorizontalAlignment = 'center';
            app.GrficosrepresentadosToolboxValorLabel.WordWrap = 'on';
            app.GrficosrepresentadosToolboxValorLabel.Layout.Row = 4;
            app.GrficosrepresentadosToolboxValorLabel.Layout.Column = [4 5];
            app.GrficosrepresentadosToolboxValorLabel.Text = {'Gráficos representados!'; 'Toolbox;'; 'Valor;'};

            % Create EscolhadevaloresMnimoMximoLabel
            app.EscolhadevaloresMnimoMximoLabel = uilabel(app.GridLayout);
            app.EscolhadevaloresMnimoMximoLabel.HorizontalAlignment = 'center';
            app.EscolhadevaloresMnimoMximoLabel.WordWrap = 'on';
            app.EscolhadevaloresMnimoMximoLabel.Layout.Row = 4;
            app.EscolhadevaloresMnimoMximoLabel.Layout.Column = 2;
            app.EscolhadevaloresMnimoMximoLabel.Text = {'Escolha de valores:'; 'Mínimo:'; 'Máximo:'};

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
        function app = Exercicio1App_exported

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