classdef SomaApp_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure         matlab.ui.Figure
        VoltarButButton  matlab.ui.control.Button
        ResultadoLabel   matlab.ui.control.Label
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            resultado = v1 + v2;
            app.ResultadoLabel.Text = sprintf('Resultado: %.2f', resultado);
        end

        % Button pushed function: VoltarButButton
        function VoltarButtonPushed(app, event)
            close(app.UIFigure);
            MenuPrincipal; % volta ao menu principal
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

            % Create ResultadoLabel
            app.ResultadoLabel = uilabel(app.UIFigure);
            app.ResultadoLabel.Position = [166 368 90 49];
            app.ResultadoLabel.Text = 'ResultadoLabel';

            % Create VoltarButButton
            app.VoltarButButton = uibutton(app.UIFigure, 'push');
            app.VoltarButButton.ButtonPushedFcn = createCallbackFcn(app, @VoltarButtonPushed, true);
            app.VoltarButButton.Position = [162 276 100 22];
            app.VoltarButButton.Text = 'VoltarBut';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = SomaApp_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

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