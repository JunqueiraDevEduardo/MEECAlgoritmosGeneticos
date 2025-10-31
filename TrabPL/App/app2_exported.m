classdef app2_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure         matlab.ui.Figure
        VoltarButButton  matlab.ui.control.Button
        ResultadoLabel   matlab.ui.control.Label
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
            app.VoltarButButton.Position = [162 276 100 22];
            app.VoltarButButton.Text = 'VoltarBut';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = app2_exported

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