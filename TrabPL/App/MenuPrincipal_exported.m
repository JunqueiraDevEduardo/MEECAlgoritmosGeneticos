classdef MenuPrincipal_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure              matlab.ui.Figure
        Valor1EditField       matlab.ui.control.NumericEditField
        Valor1EditFieldLabel  matlab.ui.control.Label
        MenuPrincipalLabel    matlab.ui.control.Label
        SubtracaoButton       matlab.ui.control.Button
        SomaButton            matlab.ui.control.Button
        Valor2EditField       matlab.ui.control.NumericEditField
        Valor2EditFieldLabel  matlab.ui.control.Label
    end

    
    properties (Access = public)


        Property % Description
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Callback function: not associated with a component
        function SomabuttonPushed(app, event)
            
        end

        % Button pushed function: SubtracaoButton
        function SubtracaoButtonPushed(app, event)
            v1 = app.Valor1EditField.Value;
            v2 = app.Valor2EditField.Value;
            % Abre o menu da subtração (tens de ter criado SubtracaoApp.mlapp)
            SubtracaoApp(v1, v2);
            % Fecha o menu principal (opcional)
            % close(app.UIFigure);
   
        end

        % Button pushed function: SomaButton
        function SomaButtonPushed(app, event)
             % Ler os valores introduzidos
             v1 = app.Valor1EditField.Value;
             v2 = app.Valor2EditField.Value;
             % Abre o menu da soma (tens de ter criado SomaApp.mlapp)
             SomaApp(v1, v2);
             % Fecha o menu principal (opcional)
             close(app.UIFigure);
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

            % Create Valor2EditFieldLabel
            app.Valor2EditFieldLabel = uilabel(app.UIFigure);
            app.Valor2EditFieldLabel.HorizontalAlignment = 'right';
            app.Valor2EditFieldLabel.Position = [49 267 85 22];
            app.Valor2EditFieldLabel.Text = 'Valor2EditField';

            % Create Valor2EditField
            app.Valor2EditField = uieditfield(app.UIFigure, 'numeric');
            app.Valor2EditField.Position = [155 267 84 22];

            % Create SomaButton
            app.SomaButton = uibutton(app.UIFigure, 'push');
            app.SomaButton.ButtonPushedFcn = createCallbackFcn(app, @SomaButtonPushed, true);
            app.SomaButton.Position = [272 277 100 22];
            app.SomaButton.Text = 'SomaButton';

            % Create SubtracaoButton
            app.SubtracaoButton = uibutton(app.UIFigure, 'push');
            app.SubtracaoButton.ButtonPushedFcn = createCallbackFcn(app, @SubtracaoButtonPushed, true);
            app.SubtracaoButton.Position = [415 277 104 22];
            app.SubtracaoButton.Text = 'SubtracaoButton';

            % Create MenuPrincipalLabel
            app.MenuPrincipalLabel = uilabel(app.UIFigure);
            app.MenuPrincipalLabel.Position = [155 410 84 22];
            app.MenuPrincipalLabel.Text = 'Menu Principal';

            % Create Valor1EditFieldLabel
            app.Valor1EditFieldLabel = uilabel(app.UIFigure);
            app.Valor1EditFieldLabel.HorizontalAlignment = 'right';
            app.Valor1EditFieldLabel.Position = [50 307 85 22];
            app.Valor1EditFieldLabel.Text = 'Valor1EditField';

            % Create Valor1EditField
            app.Valor1EditField = uieditfield(app.UIFigure, 'numeric');
            app.Valor1EditField.Position = [156 307 84 22];

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