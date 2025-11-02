classdef MenuAPP_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure            matlab.ui.Figure
        Exerccio2Button     matlab.ui.control.Button
        Exerccio1Button     matlab.ui.control.Button
        MENUPRINCIPALLabel  matlab.ui.control.Label
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function MenuApp(app)
            
        end

        % Button pushed function: Exerccio1Button
        function Exerccio1ButtonPushed(app, event)
            Exercicio1App;  % abre a app do exercício 1
            delete(app);    % fecha o menu principal
        end

        % Button pushed function: Exerccio2Button
        function Exerccio2ButtonPushed(app, event)
            Exercicio2App;
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

            % Create MENUPRINCIPALLabel
            app.MENUPRINCIPALLabel = uilabel(app.UIFigure);
            app.MENUPRINCIPALLabel.FontSize = 30;
            app.MENUPRINCIPALLabel.Position = [194 378 256 62];
            app.MENUPRINCIPALLabel.Text = 'MENU PRINCIPAL';

            % Create Exerccio1Button
            app.Exerccio1Button = uibutton(app.UIFigure, 'push');
            app.Exerccio1Button.ButtonPushedFcn = createCallbackFcn(app, @Exerccio1ButtonPushed, true);
            app.Exerccio1Button.FontSize = 18;
            app.Exerccio1Button.Position = [271 262 104 30];
            app.Exerccio1Button.Text = 'Exercício 1';

            % Create Exerccio2Button
            app.Exerccio2Button = uibutton(app.UIFigure, 'push');
            app.Exerccio2Button.ButtonPushedFcn = createCallbackFcn(app, @Exerccio2ButtonPushed, true);
            app.Exerccio2Button.FontSize = 18;
            app.Exerccio2Button.Position = [271 170 104 30];
            app.Exerccio2Button.Text = 'Exercício 2';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = MenuAPP_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @MenuApp)

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