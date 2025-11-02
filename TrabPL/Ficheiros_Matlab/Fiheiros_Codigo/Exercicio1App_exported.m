classdef Exercicio1App_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                     matlab.ui.Figure
        GrficosLabel                 matlab.ui.control.Label
        VoltaraoMenuPrincipalButton  matlab.ui.control.Button
        PontodeinteresseButton       matlab.ui.control.Button
        ToolboxButton                matlab.ui.control.Button
        ValorDropDown                matlab.ui.control.DropDown
        ValorDropDownLabel           matlab.ui.control.Label
        OtimizaodoSenocomGALabel     matlab.ui.control.Label
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

        % Button pushed function: VoltaraoMenuPrincipalButton
        function VoltaraoMenuPrincipalButtonPushed(app, event)
            MenuAPP;  % volta ao menu principal
            delete(app);
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';

            % Create OtimizaodoSenocomGALabel
            app.OtimizaodoSenocomGALabel = uilabel(app.UIFigure);
            app.OtimizaodoSenocomGALabel.FontSize = 30;
            app.OtimizaodoSenocomGALabel.Position = [121 379 399 64];
            app.OtimizaodoSenocomGALabel.Text = 'Otimização do Seno com GA';

            % Create ValorDropDownLabel
            app.ValorDropDownLabel = uilabel(app.UIFigure);
            app.ValorDropDownLabel.HorizontalAlignment = 'right';
            app.ValorDropDownLabel.FontSize = 18;
            app.ValorDropDownLabel.Position = [244 311 46 23];
            app.ValorDropDownLabel.Text = 'Valor';

            % Create ValorDropDown
            app.ValorDropDown = uidropdown(app.UIFigure);
            app.ValorDropDown.Items = {'Mínimo', 'Máximo'};
            app.ValorDropDown.FontSize = 18;
            app.ValorDropDown.Position = [305 301 98 44];
            app.ValorDropDown.Value = 'Mínimo';

            % Create ToolboxButton
            app.ToolboxButton = uibutton(app.UIFigure, 'push');
            app.ToolboxButton.ButtonPushedFcn = createCallbackFcn(app, @ToolboxButtonPushed, true);
            app.ToolboxButton.FontSize = 18;
            app.ToolboxButton.Position = [121 142 154 31];
            app.ToolboxButton.Text = 'Toolbox';

            % Create PontodeinteresseButton
            app.PontodeinteresseButton = uibutton(app.UIFigure, 'push');
            app.PontodeinteresseButton.FontSize = 18;
            app.PontodeinteresseButton.Position = [367 142 163 34];
            app.PontodeinteresseButton.Text = 'Ponto de interesse';

            % Create VoltaraoMenuPrincipalButton
            app.VoltaraoMenuPrincipalButton = uibutton(app.UIFigure, 'push');
            app.VoltaraoMenuPrincipalButton.ButtonPushedFcn = createCallbackFcn(app, @VoltaraoMenuPrincipalButtonPushed, true);
            app.VoltaraoMenuPrincipalButton.Position = [248 49 145 37];
            app.VoltaraoMenuPrincipalButton.Text = 'Voltar ao Menu Principal';

            % Create GrficosLabel
            app.GrficosLabel = uilabel(app.UIFigure);
            app.GrficosLabel.FontSize = 24;
            app.GrficosLabel.Position = [274 208 94 31];
            app.GrficosLabel.Text = 'Gráficos';

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