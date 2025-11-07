classdef Exercicio2App_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                       matlab.ui.Figure
        GridLayout                     matlab.ui.container.GridLayout
        SairButton                     matlab.ui.control.Button
        VoltaraoExerccio1Button        matlab.ui.control.Button
        DESPACHODEUMAREDEELTRICALabel  matlab.ui.control.Label
        VoltaraoMenuPrincipalButton    matlab.ui.control.Button
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: VoltaraoExerccio1Button
        function VoltaraoExerccio1ButtonPushed(app, event)
            Exercicio1App;  % abre a app do exercício 1
            delete(app);    % fecha o exercício2
        end

        % Button pushed function: SairButton
        function SairButtonPushed(app, event)
            delete(app);    % fecha o exercício 2
        end

        % Button pushed function: VoltaraoMenuPrincipalButton
        function VoltaraoMenuPrincipalButtonPushed(app, event)
            MenuAPP; %retorna ao Menu Principal
            delete(app);% sai da aplicação
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
            app.GridLayout.ColumnWidth = {'1x', 207, 145, 207};
            app.GridLayout.RowHeight = {64, '1x', 37};

            % Create VoltaraoMenuPrincipalButton
            app.VoltaraoMenuPrincipalButton = uibutton(app.GridLayout, 'push');
            app.VoltaraoMenuPrincipalButton.ButtonPushedFcn = createCallbackFcn(app, @VoltaraoMenuPrincipalButtonPushed, true);
            app.VoltaraoMenuPrincipalButton.IconAlignment = 'right';
            app.VoltaraoMenuPrincipalButton.BackgroundColor = [0.8 0.8 0.8];
            app.VoltaraoMenuPrincipalButton.FontWeight = 'bold';
            app.VoltaraoMenuPrincipalButton.Layout.Row = 3;
            app.VoltaraoMenuPrincipalButton.Layout.Column = 4;
            app.VoltaraoMenuPrincipalButton.Text = 'Voltar ao Menu Principal';

            % Create DESPACHODEUMAREDEELTRICALabel
            app.DESPACHODEUMAREDEELTRICALabel = uilabel(app.GridLayout);
            app.DESPACHODEUMAREDEELTRICALabel.BackgroundColor = [0 1 0];
            app.DESPACHODEUMAREDEELTRICALabel.HorizontalAlignment = 'center';
            app.DESPACHODEUMAREDEELTRICALabel.FontSize = 30;
            app.DESPACHODEUMAREDEELTRICALabel.FontWeight = 'bold';
            app.DESPACHODEUMAREDEELTRICALabel.Layout.Row = 1;
            app.DESPACHODEUMAREDEELTRICALabel.Layout.Column = [2 4];
            app.DESPACHODEUMAREDEELTRICALabel.Text = 'DESPACHO DE UMA REDE ELÉTRICA';

            % Create VoltaraoExerccio1Button
            app.VoltaraoExerccio1Button = uibutton(app.GridLayout, 'push');
            app.VoltaraoExerccio1Button.ButtonPushedFcn = createCallbackFcn(app, @VoltaraoExerccio1ButtonPushed, true);
            app.VoltaraoExerccio1Button.BackgroundColor = [0.8 0.8 0.8];
            app.VoltaraoExerccio1Button.FontSize = 14;
            app.VoltaraoExerccio1Button.FontWeight = 'bold';
            app.VoltaraoExerccio1Button.Layout.Row = 3;
            app.VoltaraoExerccio1Button.Layout.Column = 2;
            app.VoltaraoExerccio1Button.Text = 'Voltar ao Exercício 1';

            % Create SairButton
            app.SairButton = uibutton(app.GridLayout, 'push');
            app.SairButton.ButtonPushedFcn = createCallbackFcn(app, @SairButtonPushed, true);
            app.SairButton.IconAlignment = 'center';
            app.SairButton.BackgroundColor = [0.8 0.8 0.8];
            app.SairButton.FontSize = 14;
            app.SairButton.FontWeight = 'bold';
            app.SairButton.Layout.Row = 3;
            app.SairButton.Layout.Column = 3;
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