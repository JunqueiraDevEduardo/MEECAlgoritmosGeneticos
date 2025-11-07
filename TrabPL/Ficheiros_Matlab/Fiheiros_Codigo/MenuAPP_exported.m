classdef MenuAPP_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure             matlab.ui.Figure
        GridLayout           matlab.ui.container.GridLayout
        DespachoeconmicosemperdasdaredemultiplicadoresdeLagrangeRecorrendoToolboxdeOtimizaodoMATLABLabel  matlab.ui.control.Label
        DeterminaodomnimoedomximodafunosenoRecorrendoToolboxdeOtimizaodoMATLABLabel  matlab.ui.control.Label
        SemprequeclicladoserretornadooutromenuprincipalLabel  matlab.ui.control.Label
        SairButton           matlab.ui.control.Button
        MENUPRINCIPALButton  matlab.ui.control.Button
        Exerccio2Button      matlab.ui.control.Button
        Exerccio1Button      matlab.ui.control.Button
        APPMatlabAlgoritmosGenticosLabel  matlab.ui.control.Label
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
            Exercicio2App;%abre a app do exercício 2
            delete(app);% defcha o menu principal
        end

        % Callback function: MENUPRINCIPALButton, UIFigure
        function MenuButtonPushed(app, event)
            MenuAPP;%retorna sempre ao menu principal 
        end

        % Button pushed function: SairButton
        function SairButtonPushed(app, event)
            delete(app);    % fecha o menu principal
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
            app.UIFigure.ButtonDownFcn = createCallbackFcn(app, @MenuButtonPushed, true);

            % Create GridLayout
            app.GridLayout = uigridlayout(app.UIFigure);
            app.GridLayout.ColumnWidth = {'1.13x', 179, 150, 183, '1x'};
            app.GridLayout.RowHeight = {62, '1.3x', 71, '1.11x', 69, '1x'};

            % Create APPMatlabAlgoritmosGenticosLabel
            app.APPMatlabAlgoritmosGenticosLabel = uilabel(app.GridLayout);
            app.APPMatlabAlgoritmosGenticosLabel.BackgroundColor = [0 1 0];
            app.APPMatlabAlgoritmosGenticosLabel.HorizontalAlignment = 'center';
            app.APPMatlabAlgoritmosGenticosLabel.FontSize = 30;
            app.APPMatlabAlgoritmosGenticosLabel.FontWeight = 'bold';
            app.APPMatlabAlgoritmosGenticosLabel.Layout.Row = 1;
            app.APPMatlabAlgoritmosGenticosLabel.Layout.Column = [2 4];
            app.APPMatlabAlgoritmosGenticosLabel.Text = 'APP-Matlab-Algoritmos-Genéticos';

            % Create Exerccio1Button
            app.Exerccio1Button = uibutton(app.GridLayout, 'push');
            app.Exerccio1Button.ButtonPushedFcn = createCallbackFcn(app, @Exerccio1ButtonPushed, true);
            app.Exerccio1Button.IconAlignment = 'center';
            app.Exerccio1Button.BackgroundColor = [0.651 0.651 0.651];
            app.Exerccio1Button.FontSize = 18;
            app.Exerccio1Button.FontWeight = 'bold';
            app.Exerccio1Button.FontAngle = 'italic';
            app.Exerccio1Button.Layout.Row = 4;
            app.Exerccio1Button.Layout.Column = 2;
            app.Exerccio1Button.Text = 'Exercício 1';

            % Create Exerccio2Button
            app.Exerccio2Button = uibutton(app.GridLayout, 'push');
            app.Exerccio2Button.ButtonPushedFcn = createCallbackFcn(app, @Exerccio2ButtonPushed, true);
            app.Exerccio2Button.IconAlignment = 'center';
            app.Exerccio2Button.BackgroundColor = [0.651 0.651 0.651];
            app.Exerccio2Button.FontSize = 18;
            app.Exerccio2Button.FontWeight = 'bold';
            app.Exerccio2Button.FontAngle = 'italic';
            app.Exerccio2Button.Layout.Row = 4;
            app.Exerccio2Button.Layout.Column = 4;
            app.Exerccio2Button.Text = 'Exercício 2';

            % Create MENUPRINCIPALButton
            app.MENUPRINCIPALButton = uibutton(app.GridLayout, 'push');
            app.MENUPRINCIPALButton.ButtonPushedFcn = createCallbackFcn(app, @MenuButtonPushed, true);
            app.MENUPRINCIPALButton.BackgroundColor = [0.8 0.8 0.8];
            app.MENUPRINCIPALButton.FontSize = 16;
            app.MENUPRINCIPALButton.FontWeight = 'bold';
            app.MENUPRINCIPALButton.Layout.Row = 2;
            app.MENUPRINCIPALButton.Layout.Column = 3;
            app.MENUPRINCIPALButton.Text = 'MENU PRINCIPAL';

            % Create SairButton
            app.SairButton = uibutton(app.GridLayout, 'push');
            app.SairButton.ButtonPushedFcn = createCallbackFcn(app, @SairButtonPushed, true);
            app.SairButton.BackgroundColor = [0.8 0.8 0.8];
            app.SairButton.FontSize = 18;
            app.SairButton.FontWeight = 'bold';
            app.SairButton.Layout.Row = 6;
            app.SairButton.Layout.Column = 3;
            app.SairButton.Text = 'Sair';

            % Create SemprequeclicladoserretornadooutromenuprincipalLabel
            app.SemprequeclicladoserretornadooutromenuprincipalLabel = uilabel(app.GridLayout);
            app.SemprequeclicladoserretornadooutromenuprincipalLabel.VerticalAlignment = 'top';
            app.SemprequeclicladoserretornadooutromenuprincipalLabel.WordWrap = 'on';
            app.SemprequeclicladoserretornadooutromenuprincipalLabel.Layout.Row = 2;
            app.SemprequeclicladoserretornadooutromenuprincipalLabel.Layout.Column = 2;
            app.SemprequeclicladoserretornadooutromenuprincipalLabel.Text = 'Sempre que é cliclado será retornado outro menu principal';

            % Create DeterminaodomnimoedomximodafunosenoRecorrendoToolboxdeOtimizaodoMATLABLabel
            app.DeterminaodomnimoedomximodafunosenoRecorrendoToolboxdeOtimizaodoMATLABLabel = uilabel(app.GridLayout);
            app.DeterminaodomnimoedomximodafunosenoRecorrendoToolboxdeOtimizaodoMATLABLabel.VerticalAlignment = 'top';
            app.DeterminaodomnimoedomximodafunosenoRecorrendoToolboxdeOtimizaodoMATLABLabel.WordWrap = 'on';
            app.DeterminaodomnimoedomximodafunosenoRecorrendoToolboxdeOtimizaodoMATLABLabel.Layout.Row = 5;
            app.DeterminaodomnimoedomximodafunosenoRecorrendoToolboxdeOtimizaodoMATLABLabel.Layout.Column = 2;
            app.DeterminaodomnimoedomximodafunosenoRecorrendoToolboxdeOtimizaodoMATLABLabel.Text = {'Determinação do mínimo e do máximo da função seno'; 'Recorrendo à Toolbox de Otimização do MATLAB'};

            % Create DespachoeconmicosemperdasdaredemultiplicadoresdeLagrangeRecorrendoToolboxdeOtimizaodoMATLABLabel
            app.DespachoeconmicosemperdasdaredemultiplicadoresdeLagrangeRecorrendoToolboxdeOtimizaodoMATLABLabel = uilabel(app.GridLayout);
            app.DespachoeconmicosemperdasdaredemultiplicadoresdeLagrangeRecorrendoToolboxdeOtimizaodoMATLABLabel.VerticalAlignment = 'top';
            app.DespachoeconmicosemperdasdaredemultiplicadoresdeLagrangeRecorrendoToolboxdeOtimizaodoMATLABLabel.WordWrap = 'on';
            app.DespachoeconmicosemperdasdaredemultiplicadoresdeLagrangeRecorrendoToolboxdeOtimizaodoMATLABLabel.Layout.Row = 5;
            app.DespachoeconmicosemperdasdaredemultiplicadoresdeLagrangeRecorrendoToolboxdeOtimizaodoMATLABLabel.Layout.Column = 4;
            app.DespachoeconmicosemperdasdaredemultiplicadoresdeLagrangeRecorrendoToolboxdeOtimizaodoMATLABLabel.Text = 'Despacho económico sem perdas da rede multiplicadores de Lagrange. Recorrendo à Toolbox de Otimização do MATLAB';

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