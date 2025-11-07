classdef SubtracaoApp_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure        matlab.ui.Figure
        SUBTRAOLabel    matlab.ui.control.Label
        VoltarButton    matlab.ui.control.Button
        CalcularButton  matlab.ui.control.Button
        Label_2         matlab.ui.control.Label
        Label           matlab.ui.control.Label
        ResultadoField  matlab.ui.control.NumericEditField
        BEdit           matlab.ui.control.NumericEditField
        AEdit           matlab.ui.control.NumericEditField
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            app.UIFigure.CloseRequestFcn = @(src,evt) delete(app);
        end

        % Button pushed function: CalcularButton
        function CalcularButtonPushed(app, event)
            a = app.AEdit.Value;
            b = app.BEdit.Value;
            app.ResultadoField.Value = a - b;
        end

        % Button pushed function: VoltarButton
        function VoltarButtonPushed(app, event)
            MenuPrincipal;
            delete(app);
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 400 514];
            app.UIFigure.Name = 'MATLAB App';

            % Create AEdit
            app.AEdit = uieditfield(app.UIFigure, 'numeric');
            app.AEdit.Position = [158 382 100 22];

            % Create BEdit
            app.BEdit = uieditfield(app.UIFigure, 'numeric');
            app.BEdit.Position = [158 313 100 22];

            % Create ResultadoField
            app.ResultadoField = uieditfield(app.UIFigure, 'numeric');
            app.ResultadoField.Editable = 'off';
            app.ResultadoField.Position = [159 236 100 22];

            % Create Label
            app.Label = uilabel(app.UIFigure);
            app.Label.FontSize = 24;
            app.Label.Position = [202 342 11 31];
            app.Label.Text = '-';

            % Create Label_2
            app.Label_2 = uilabel(app.UIFigure);
            app.Label_2.FontSize = 24;
            app.Label_2.Position = [201 267 14 34];
            app.Label_2.Text = '=';

            % Create CalcularButton
            app.CalcularButton = uibutton(app.UIFigure, 'push');
            app.CalcularButton.ButtonPushedFcn = createCallbackFcn(app, @CalcularButtonPushed, true);
            app.CalcularButton.Position = [159 176 100 23];
            app.CalcularButton.Text = 'Calcular';

            % Create VoltarButton
            app.VoltarButton = uibutton(app.UIFigure, 'push');
            app.VoltarButton.ButtonPushedFcn = createCallbackFcn(app, @VoltarButtonPushed, true);
            app.VoltarButton.Position = [158 77 100 23];
            app.VoltarButton.Text = 'Voltar ao Menu';

            % Create SUBTRAOLabel
            app.SUBTRAOLabel = uilabel(app.UIFigure);
            app.SUBTRAOLabel.FontSize = 24;
            app.SUBTRAOLabel.Position = [132 445 154 32];
            app.SUBTRAOLabel.Text = 'SUBTRAÇÃO';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = SubtracaoApp_exported

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