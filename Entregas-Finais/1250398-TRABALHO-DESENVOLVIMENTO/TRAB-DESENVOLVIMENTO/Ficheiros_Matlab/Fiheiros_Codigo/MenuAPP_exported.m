classdef MenuAPP_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                matlab.ui.Figure
        GridLayout              matlab.ui.container.GridLayout
        Home                    matlab.ui.control.Image
        ex2icon                 matlab.ui.control.Image
        ex1icon                 matlab.ui.control.Image
        matlabicon              matlab.ui.control.Image
        matabicon2              matlab.ui.control.Image
        TextArea_Titulo         matlab.ui.control.TextArea
        TextArea_Ex1            matlab.ui.control.TextArea
        TextArea_Ex2            matlab.ui.control.TextArea
        Exerccio2Button         matlab.ui.control.Button
        MENUPRINCIPALButton     matlab.ui.control.Button
        SairButton              matlab.ui.control.Button
        Exerccio1Button         matlab.ui.control.Button
        Ex1TextAreaSetor1       matlab.ui.control.TextArea
        Ex2TextAreaSetor2       matlab.ui.control.TextArea
        TextAreaSetorPrincipal  matlab.ui.control.TextArea
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function MenuApp(app)
            
        end

        % Callback function: Exerccio1Button, ex1icon
        function Exerccio1ButtonPushed(app, event)
            Exercicio1App;  % abre a app do exercício 1
            delete(app);    % fecha o menu principal
        end

        % Callback function: Exerccio2Button, ex2icon
        function Exerccio2ButtonPushed(app, event)
            Exercicio2App;%abre a app do exercício 2
            delete(app);% defcha o menu principal
        end

        % Callback function: Home, MENUPRINCIPALButton, UIFigure
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

            % Get the file path for locating images
            pathToMLAPP = fileparts(mfilename('fullpath'));

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 958 689];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.ButtonDownFcn = createCallbackFcn(app, @MenuButtonPushed, true);

            % Create GridLayout
            app.GridLayout = uigridlayout(app.UIFigure);
            app.GridLayout.ColumnWidth = {'1.13x', 179, 150, 183, '1x'};
            app.GridLayout.RowHeight = {62, '1.3x', '1.11x', 69, '1x'};

            % Create TextAreaSetorPrincipal
            app.TextAreaSetorPrincipal = uitextarea(app.GridLayout);
            app.TextAreaSetorPrincipal.Layout.Row = [2 5];
            app.TextAreaSetorPrincipal.Layout.Column = [1 5];

            % Create Ex2TextAreaSetor2
            app.Ex2TextAreaSetor2 = uitextarea(app.GridLayout);
            app.Ex2TextAreaSetor2.HorizontalAlignment = 'center';
            app.Ex2TextAreaSetor2.FontColor = [1 1 1];
            app.Ex2TextAreaSetor2.Visible = 'off';
            app.Ex2TextAreaSetor2.Layout.Row = [2 5];
            app.Ex2TextAreaSetor2.Layout.Column = [4 5];

            % Create Ex1TextAreaSetor1
            app.Ex1TextAreaSetor1 = uitextarea(app.GridLayout);
            app.Ex1TextAreaSetor1.HorizontalAlignment = 'center';
            app.Ex1TextAreaSetor1.Visible = 'off';
            app.Ex1TextAreaSetor1.Layout.Row = [2 5];
            app.Ex1TextAreaSetor1.Layout.Column = [2 3];

            % Create Exerccio1Button
            app.Exerccio1Button = uibutton(app.GridLayout, 'push');
            app.Exerccio1Button.ButtonPushedFcn = createCallbackFcn(app, @Exerccio1ButtonPushed, true);
            app.Exerccio1Button.IconAlignment = 'center';
            app.Exerccio1Button.WordWrap = 'on';
            app.Exerccio1Button.BackgroundColor = [0.4784 0.5686 0.6392];
            app.Exerccio1Button.FontName = 'Arial Black';
            app.Exerccio1Button.FontSize = 24;
            app.Exerccio1Button.FontWeight = 'bold';
            app.Exerccio1Button.Layout.Row = 4;
            app.Exerccio1Button.Layout.Column = [2 3];
            app.Exerccio1Button.Text = 'Exercício 1';

            % Create SairButton
            app.SairButton = uibutton(app.GridLayout, 'push');
            app.SairButton.ButtonPushedFcn = createCallbackFcn(app, @SairButtonPushed, true);
            app.SairButton.IconAlignment = 'center';
            app.SairButton.BackgroundColor = [0.3804 0.3569 0.3569];
            app.SairButton.FontName = 'Arial Black';
            app.SairButton.FontSize = 24;
            app.SairButton.FontWeight = 'bold';
            app.SairButton.FontColor = [1 1 1];
            app.SairButton.Layout.Row = 5;
            app.SairButton.Layout.Column = 1;
            app.SairButton.Text = 'Sair';

            % Create MENUPRINCIPALButton
            app.MENUPRINCIPALButton = uibutton(app.GridLayout, 'push');
            app.MENUPRINCIPALButton.ButtonPushedFcn = createCallbackFcn(app, @MenuButtonPushed, true);
            app.MENUPRINCIPALButton.IconAlignment = 'center';
            app.MENUPRINCIPALButton.WordWrap = 'on';
            app.MENUPRINCIPALButton.BackgroundColor = [0.3804 0.3569 0.3569];
            app.MENUPRINCIPALButton.FontName = 'Arial Black';
            app.MENUPRINCIPALButton.FontSize = 24;
            app.MENUPRINCIPALButton.FontWeight = 'bold';
            app.MENUPRINCIPALButton.FontColor = [1 1 1];
            app.MENUPRINCIPALButton.Layout.Row = 3;
            app.MENUPRINCIPALButton.Layout.Column = 1;
            app.MENUPRINCIPALButton.Text = 'MENU PRINCIPAL';

            % Create Exerccio2Button
            app.Exerccio2Button = uibutton(app.GridLayout, 'push');
            app.Exerccio2Button.ButtonPushedFcn = createCallbackFcn(app, @Exerccio2ButtonPushed, true);
            app.Exerccio2Button.IconAlignment = 'center';
            app.Exerccio2Button.WordWrap = 'on';
            app.Exerccio2Button.BackgroundColor = [0.4784 0.5686 0.6392];
            app.Exerccio2Button.FontName = 'Arial Black';
            app.Exerccio2Button.FontSize = 24;
            app.Exerccio2Button.FontWeight = 'bold';
            app.Exerccio2Button.Layout.Row = 4;
            app.Exerccio2Button.Layout.Column = [4 5];
            app.Exerccio2Button.Text = 'Exercício 2';

            % Create TextArea_Ex2
            app.TextArea_Ex2 = uitextarea(app.GridLayout);
            app.TextArea_Ex2.Editable = 'off';
            app.TextArea_Ex2.HorizontalAlignment = 'center';
            app.TextArea_Ex2.FontName = 'Arial';
            app.TextArea_Ex2.FontSize = 18;
            app.TextArea_Ex2.Layout.Row = [2 3];
            app.TextArea_Ex2.Layout.Column = [4 5];
            app.TextArea_Ex2.Value = {''; ''; ''; ''; ''; ''; ''; ''; ''; 'EX2:'; ''; 'Despacho económico de dois geradores, resolvido por Toolbox e Algoritmos Genéticos, com comparação dos resultados'};

            % Create TextArea_Ex1
            app.TextArea_Ex1 = uitextarea(app.GridLayout);
            app.TextArea_Ex1.Editable = 'off';
            app.TextArea_Ex1.HorizontalAlignment = 'center';
            app.TextArea_Ex1.FontName = 'Arial';
            app.TextArea_Ex1.FontSize = 18;
            app.TextArea_Ex1.Layout.Row = [2 3];
            app.TextArea_Ex1.Layout.Column = [2 3];
            app.TextArea_Ex1.Value = {''; ''; ''; ''; ''; ''; ''; ''; ''; 'EX1:'; ''; 'Determinação do mínimo e do máximo da função seno'; 'Recorrendo à Toolbox de Otimização do MATLAB'};

            % Create TextArea_Titulo
            app.TextArea_Titulo = uitextarea(app.GridLayout);
            app.TextArea_Titulo.HorizontalAlignment = 'center';
            app.TextArea_Titulo.FontName = 'American Typewriter';
            app.TextArea_Titulo.FontSize = 36;
            app.TextArea_Titulo.BackgroundColor = [0.6706 0.5765 0.4039];
            app.TextArea_Titulo.Layout.Row = 1;
            app.TextArea_Titulo.Layout.Column = [1 5];
            app.TextArea_Titulo.Value = {'MATLAB Aplicação-Resolução de Exercícios '};

            % Create matabicon2
            app.matabicon2 = uiimage(app.GridLayout);
            app.matabicon2.Layout.Row = 2;
            app.matabicon2.Layout.Column = [2 3];
            app.matabicon2.ImageSource = fullfile(pathToMLAPP, 'IconsDesign', 'matlab.png');

            % Create matlabicon
            app.matlabicon = uiimage(app.GridLayout);
            app.matlabicon.Layout.Row = 2;
            app.matlabicon.Layout.Column = [4 5];
            app.matlabicon.ImageSource = fullfile(pathToMLAPP, 'IconsDesign', 'matlab.png');

            % Create ex1icon
            app.ex1icon = uiimage(app.GridLayout);
            app.ex1icon.ImageClickedFcn = createCallbackFcn(app, @Exerccio1ButtonPushed, true);
            app.ex1icon.Layout.Row = 5;
            app.ex1icon.Layout.Column = [2 3];
            app.ex1icon.ImageSource = fullfile(pathToMLAPP, 'IconsDesign', 'adjust.png');

            % Create ex2icon
            app.ex2icon = uiimage(app.GridLayout);
            app.ex2icon.ImageClickedFcn = createCallbackFcn(app, @Exerccio2ButtonPushed, true);
            app.ex2icon.Layout.Row = 5;
            app.ex2icon.Layout.Column = [4 5];
            app.ex2icon.ImageSource = fullfile(pathToMLAPP, 'IconsDesign', 'adjust.png');

            % Create Home
            app.Home = uiimage(app.GridLayout);
            app.Home.ImageClickedFcn = createCallbackFcn(app, @MenuButtonPushed, true);
            app.Home.Layout.Row = 2;
            app.Home.Layout.Column = 1;
            app.Home.ImageSource = fullfile(pathToMLAPP, 'IconsDesign', 'home_24.png');

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