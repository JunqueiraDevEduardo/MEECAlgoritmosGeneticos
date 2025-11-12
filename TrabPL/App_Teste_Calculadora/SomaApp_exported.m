classdef SomaApp_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure        matlab.ui.Figure
        SOMALabel       matlab.ui.control.Label
        CalcularButton  matlab.ui.control.Button
        ResultadoField  matlab.ui.control.NumericEditField
        Label_2         matlab.ui.control.Label
        Label           matlab.ui.control.Label
        BEdit           matlab.ui.control.NumericEditField
        AEdit           matlab.ui.control.NumericEditField
        VoltarButton    matlab.ui.control.Button
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            app.UIFigure.CloseRequestFcn = @(src,evt) delete(app);
        end

        % Button pushed function: VoltarButton
        function VoltarButtonPushed(app, event)
            MenuPrincipal;     % reabre o menu
            delete(app);  % fecha esta janela
        end

        % Button pushed function: CalcularButton
        function CalcularButtonPushed(app, event)
            a = app.AEdit.Value;
            b = app.BEdit.Value;
            app.ResultadoField.Value = a + b;
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 426 573];
            app.UIFigure.Name = 'MATLAB App';

            % Create VoltarButton
            app.VoltarButton = uibutton(app.UIFigure, 'push');
            app.VoltarButton.ButtonPushedFcn = createCallbackFcn(app, @VoltarButtonPushed, true);
            app.VoltarButton.Position = [180 53 100 23];
            app.VoltarButton.Text = 'Voltar ao Menu';

            % Create AEdit
            app.AEdit = uieditfield(app.UIFigure, 'numeric');
            app.AEdit.Position = [180 407 100 22];

            % Create BEdit
            app.BEdit = uieditfield(app.UIFigure, 'numeric');
            app.BEdit.Position = [180 336 100 22];

            % Create Label
            app.Label = uilabel(app.UIFigure);
            app.Label.FontSize = 24;
            app.Label.Position = [222 365 15 32];
            app.Label.Text = '+';

            % Create Label_2
            app.Label_2 = uilabel(app.UIFigure);
            app.Label_2.FontSize = 24;
            app.Label_2.Position = [223 294 14 34];
            app.Label_2.Text = '=';

            % Create ResultadoField
            app.ResultadoField = uieditfield(app.UIFigure, 'numeric');
            app.ResultadoField.Editable = 'off';
            app.ResultadoField.Position = [180 259 100 22];

            % Create CalcularButton
            app.CalcularButton = uibutton(app.UIFigure, 'push');
            app.CalcularButton.ButtonPushedFcn = createCallbackFcn(app, @CalcularButtonPushed, true);
            app.CalcularButton.Position = [180 199 100 23];
            app.CalcularButton.Text = 'Calcular';

            % Create SOMALabel
            app.SOMALabel = uilabel(app.UIFigure);
            app.SOMALabel.FontSize = 24;
            app.SOMALabel.Position = [192 491 76 32];
            app.SOMALabel.Text = 'SOMA';

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