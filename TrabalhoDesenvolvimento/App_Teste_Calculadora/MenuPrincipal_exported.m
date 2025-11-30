classdef MenuPrincipal_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure            matlab.ui.Figure
        MENUPRINCIPALLabel  matlab.ui.control.Label
        Label               matlab.ui.control.Label
        SUBTRAOButton       matlab.ui.control.Button
        SOMAButton          matlab.ui.control.Button
    end

    
    properties (Access = public)


        Property % Description
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            app.UIFigure.CloseRequestFcn = @(src,evt) delete(app);
        end

        % Button pushed function: SUBTRAOButton
        function SUBTRAOButtonPushed(app, event)
            SubtracaoApp; % abre a app de subtração
            delete(app);  % fecha o menu
        end

        % Button pushed function: SOMAButton
        function SOMAButtonPushed(app, event)
           SomaApp;      % abre a app de soma
           delete(app);  % fecha o menu
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 388 427];
            app.UIFigure.Name = 'MATLAB App';

            % Create SOMAButton
            app.SOMAButton = uibutton(app.UIFigure, 'push');
            app.SOMAButton.ButtonPushedFcn = createCallbackFcn(app, @SOMAButtonPushed, true);
            app.SOMAButton.Position = [146 249 100 23];
            app.SOMAButton.Text = 'SOMA';

            % Create SUBTRAOButton
            app.SUBTRAOButton = uibutton(app.UIFigure, 'push');
            app.SUBTRAOButton.ButtonPushedFcn = createCallbackFcn(app, @SUBTRAOButtonPushed, true);
            app.SUBTRAOButton.Position = [146 194 104 23];
            app.SUBTRAOButton.Text = 'SUBTRAÇÃO';

            % Create Label
            app.Label = uilabel(app.UIFigure);
            app.Label.Position = [153 358 25 22];
            app.Label.Text = '';

            % Create MENUPRINCIPALLabel
            app.MENUPRINCIPALLabel = uilabel(app.UIFigure);
            app.MENUPRINCIPALLabel.FontSize = 24;
            app.MENUPRINCIPALLabel.Position = [94 341 208 39];
            app.MENUPRINCIPALLabel.Text = 'MENU PRINCIPAL';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = MenuPrincipal_exported

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