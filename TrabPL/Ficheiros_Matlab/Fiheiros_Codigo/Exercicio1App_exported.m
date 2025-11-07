classdef Exercicio1App_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                     matlab.ui.Figure
        GridLayout                   matlab.ui.container.GridLayout
        SairButton                   matlab.ui.control.Button
        ValorDropDown                matlab.ui.control.DropDown
        ValorLabel                   matlab.ui.control.Label
        GrficosLabel                 matlab.ui.control.Label
        VoltaraoMenuPrincipalButton  matlab.ui.control.Button
        ValorButton                  matlab.ui.control.Button
        ToolboxButton                matlab.ui.control.Button
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

        % Button pushed function: SairButton
        function SairButtonPushed(app, event)
            delete(app); %sai da aplicação
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

            % Create GridLayout
            app.GridLayout = uigridlayout(app.UIFigure);
            app.GridLayout.ColumnWidth = {'1x', 154, 62, 44, 65, 100, '1.01x'};
            app.GridLayout.RowHeight = {64, '3.42x', 24, 20, '2.82x', 31, '1x', 34, '2.45x', 37};

            % Create OtimizaodoSenocomGALabel
            app.OtimizaodoSenocomGALabel = uilabel(app.GridLayout);
            app.OtimizaodoSenocomGALabel.BackgroundColor = [0 1 0];
            app.OtimizaodoSenocomGALabel.HorizontalAlignment = 'center';
            app.OtimizaodoSenocomGALabel.FontSize = 30;
            app.OtimizaodoSenocomGALabel.FontWeight = 'bold';
            app.OtimizaodoSenocomGALabel.Layout.Row = 1;
            app.OtimizaodoSenocomGALabel.Layout.Column = [2 6];
            app.OtimizaodoSenocomGALabel.Text = 'Otimização do Seno com GA';

            % Create ToolboxButton
            app.ToolboxButton = uibutton(app.GridLayout, 'push');
            app.ToolboxButton.ButtonPushedFcn = createCallbackFcn(app, @ToolboxButtonPushed, true);
            app.ToolboxButton.BackgroundColor = [0.651 0.651 0.651];
            app.ToolboxButton.FontSize = 18;
            app.ToolboxButton.Layout.Row = 5;
            app.ToolboxButton.Layout.Column = 2;
            app.ToolboxButton.Text = 'Toolbox';

            % Create ValorButton
            app.ValorButton = uibutton(app.GridLayout, 'push');
            app.ValorButton.BackgroundColor = [0.651 0.651 0.651];
            app.ValorButton.FontSize = 18;
            app.ValorButton.Layout.Row = 6;
            app.ValorButton.Layout.Column = 2;
            app.ValorButton.Text = 'Valor';

            % Create VoltaraoMenuPrincipalButton
            app.VoltaraoMenuPrincipalButton = uibutton(app.GridLayout, 'push');
            app.VoltaraoMenuPrincipalButton.ButtonPushedFcn = createCallbackFcn(app, @VoltaraoMenuPrincipalButtonPushed, true);
            app.VoltaraoMenuPrincipalButton.BackgroundColor = [0.8 0.8 0.8];
            app.VoltaraoMenuPrincipalButton.FontWeight = 'bold';
            app.VoltaraoMenuPrincipalButton.Layout.Row = 10;
            app.VoltaraoMenuPrincipalButton.Layout.Column = 2;
            app.VoltaraoMenuPrincipalButton.Text = 'Voltar ao Menu Principal';

            % Create GrficosLabel
            app.GrficosLabel = uilabel(app.GridLayout);
            app.GrficosLabel.FontSize = 14;
            app.GrficosLabel.FontWeight = 'bold';
            app.GrficosLabel.FontAngle = 'italic';
            app.GrficosLabel.Layout.Row = 5;
            app.GrficosLabel.Layout.Column = 1;
            app.GrficosLabel.Text = 'Gráficos:';

            % Create ValorLabel
            app.ValorLabel = uilabel(app.GridLayout);
            app.ValorLabel.HorizontalAlignment = 'center';
            app.ValorLabel.FontSize = 14;
            app.ValorLabel.FontWeight = 'bold';
            app.ValorLabel.FontAngle = 'italic';
            app.ValorLabel.Layout.Row = 2;
            app.ValorLabel.Layout.Column = 1;
            app.ValorLabel.Text = 'Valor:';

            % Create ValorDropDown
            app.ValorDropDown = uidropdown(app.GridLayout);
            app.ValorDropDown.Items = {'Mínimo', 'Máximo'};
            app.ValorDropDown.FontSize = 18;
            app.ValorDropDown.FontWeight = 'bold';
            app.ValorDropDown.BackgroundColor = [0.902 0.902 0.902];
            app.ValorDropDown.Layout.Row = 2;
            app.ValorDropDown.Layout.Column = 2;
            app.ValorDropDown.Value = 'Mínimo';

            % Create SairButton
            app.SairButton = uibutton(app.GridLayout, 'push');
            app.SairButton.ButtonPushedFcn = createCallbackFcn(app, @SairButtonPushed, true);
            app.SairButton.BackgroundColor = [0.8 0.8 0.8];
            app.SairButton.FontWeight = 'bold';
            app.SairButton.Layout.Row = 10;
            app.SairButton.Layout.Column = 6;
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