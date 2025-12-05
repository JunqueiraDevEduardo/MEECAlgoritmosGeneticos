classdef Exercicio1App_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure             matlab.ui.Figure
        GridLayout           matlab.ui.container.GridLayout
        Seno                 matlab.ui.control.Image
        Menu                 matlab.ui.control.Image
        ValorDropDown        matlab.ui.control.DropDown
        TextArea_resumo1     matlab.ui.control.TextArea
        TextArea_Setor1      matlab.ui.control.TextArea
        TextArea_ex1         matlab.ui.control.TextArea
        ToolboxButton        matlab.ui.control.Button
        GrficoButton         matlab.ui.control.Button
        TextArea_resumo2     matlab.ui.control.TextArea
        TextArea_Setor2      matlab.ui.control.TextArea
        TextArea_Titulo      matlab.ui.control.TextArea
        SairButton           matlab.ui.control.Button
        MENUPRINCIPALButton  matlab.ui.control.Button
        TextArea_Principal   matlab.ui.control.TextArea
    end



    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: ToolboxButton
        function ToolboxButtonPushed(app, event)
            tipo = app.ValorDropDown.Value; % "Mínimo" ou "Máximo"
    
            if strcmp(tipo, 'Mínimo')
                gasenoMin_toolbox;
                valorReal = fval
            else
                gasenoMax_toolbox;
                valorReal = -fval
            end
            % Mostra uma mensagem legível para o utilizador
            msg = sprintf(['Resultados da Toolbox\n\n' ...
                        'x ótimo = %.4f rad\n' ...
                        'sin(x) = %.4f'], x, valorReal);
            uialert(app.UIFigure, msg, 'Resultado da Otimização');
        
        end

        % Callback function: MENUPRINCIPALButton, Menu
        function MENUPRINCIPALButtonPushed(app, event)
            MenuAPP;  % volta ao menu principal
            delete(app);
        end

        % Button pushed function: SairButton
        function SairButtonPushed(app, event)
            delete(app);
        end

        % Button pushed function: GrficoButton
        function GrficoButtonPushed(app, event)
            tipo = app.ValorDropDown.Value;
    
            if strcmp(tipo, 'Mínimo')
                gasenoMin_grafico;
            else
                gasenoMax_grafico;
            end
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
            app.UIFigure.Position = [100 100 967 699];
            app.UIFigure.Name = 'MATLAB App';

            % Create GridLayout
            app.GridLayout = uigridlayout(app.UIFigure);
            app.GridLayout.ColumnWidth = {'1.13x', 179, 150, 183, '1x'};
            app.GridLayout.RowHeight = {64, '1.3x', 71, '1.11x', 69, 40, '1x'};

            % Create TextArea_Principal
            app.TextArea_Principal = uitextarea(app.GridLayout);
            app.TextArea_Principal.Layout.Row = [1 7];
            app.TextArea_Principal.Layout.Column = [1 5];

            % Create MENUPRINCIPALButton
            app.MENUPRINCIPALButton = uibutton(app.GridLayout, 'push');
            app.MENUPRINCIPALButton.ButtonPushedFcn = createCallbackFcn(app, @MENUPRINCIPALButtonPushed, true);
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

            % Create SairButton
            app.SairButton = uibutton(app.GridLayout, 'push');
            app.SairButton.ButtonPushedFcn = createCallbackFcn(app, @SairButtonPushed, true);
            app.SairButton.IconAlignment = 'center';
            app.SairButton.BackgroundColor = [0.3804 0.3569 0.3569];
            app.SairButton.FontName = 'Arial Black';
            app.SairButton.FontSize = 24;
            app.SairButton.FontWeight = 'bold';
            app.SairButton.FontColor = [1 1 1];
            app.SairButton.Layout.Row = 7;
            app.SairButton.Layout.Column = 1;
            app.SairButton.Text = 'Sair';

            % Create TextArea_Titulo
            app.TextArea_Titulo = uitextarea(app.GridLayout);
            app.TextArea_Titulo.HorizontalAlignment = 'center';
            app.TextArea_Titulo.FontName = 'American Typewriter';
            app.TextArea_Titulo.FontSize = 36;
            app.TextArea_Titulo.BackgroundColor = [0.6706 0.5765 0.4039];
            app.TextArea_Titulo.Layout.Row = 1;
            app.TextArea_Titulo.Layout.Column = [1 5];
            app.TextArea_Titulo.Value = {'Optimização-Seno Com GA'};

            % Create TextArea_Setor2
            app.TextArea_Setor2 = uitextarea(app.GridLayout);
            app.TextArea_Setor2.Visible = 'off';
            app.TextArea_Setor2.Layout.Row = [3 7];
            app.TextArea_Setor2.Layout.Column = [4 5];

            % Create TextArea_resumo2
            app.TextArea_resumo2 = uitextarea(app.GridLayout);
            app.TextArea_resumo2.Editable = 'off';
            app.TextArea_resumo2.HorizontalAlignment = 'center';
            app.TextArea_resumo2.FontName = 'Arial';
            app.TextArea_resumo2.FontSize = 24;
            app.TextArea_resumo2.Layout.Row = [3 5];
            app.TextArea_resumo2.Layout.Column = [4 5];
            app.TextArea_resumo2.Value = {''; ''; 'Gráficos representados:'; ''; 'Toolbox;'; ''; 'Valor-Gráfico;'; ''};

            % Create GrficoButton
            app.GrficoButton = uibutton(app.GridLayout, 'push');
            app.GrficoButton.ButtonPushedFcn = createCallbackFcn(app, @GrficoButtonPushed, true);
            app.GrficoButton.IconAlignment = 'center';
            app.GrficoButton.WordWrap = 'on';
            app.GrficoButton.BackgroundColor = [0.4784 0.5686 0.6392];
            app.GrficoButton.FontName = 'Arial Black';
            app.GrficoButton.FontSize = 18;
            app.GrficoButton.FontWeight = 'bold';
            app.GrficoButton.Layout.Row = [6 7];
            app.GrficoButton.Layout.Column = 5;
            app.GrficoButton.Text = 'Gráfico';

            % Create ToolboxButton
            app.ToolboxButton = uibutton(app.GridLayout, 'push');
            app.ToolboxButton.ButtonPushedFcn = createCallbackFcn(app, @ToolboxButtonPushed, true);
            app.ToolboxButton.IconAlignment = 'center';
            app.ToolboxButton.WordWrap = 'on';
            app.ToolboxButton.BackgroundColor = [0.4784 0.5686 0.6392];
            app.ToolboxButton.FontName = 'Arial Black';
            app.ToolboxButton.FontSize = 18;
            app.ToolboxButton.FontWeight = 'bold';
            app.ToolboxButton.Layout.Row = [6 7];
            app.ToolboxButton.Layout.Column = 4;
            app.ToolboxButton.Text = 'Toolbox';

            % Create TextArea_ex1
            app.TextArea_ex1 = uitextarea(app.GridLayout);
            app.TextArea_ex1.Editable = 'off';
            app.TextArea_ex1.HorizontalAlignment = 'center';
            app.TextArea_ex1.FontName = 'Arial';
            app.TextArea_ex1.FontSize = 18;
            app.TextArea_ex1.Layout.Row = 2;
            app.TextArea_ex1.Layout.Column = [2 5];
            app.TextArea_ex1.Value = {'EX1:'; 'Exercício 1 da ficha, que é encontrar o mínimo/máximo da função seno usando algoritmos genéticos (GA).'; ''; 'Programa de optimização:'; 'X = GA(FITNESSFCN,NVARS,A,b,Aeq,beq,lb,ub,NONLCON,options)....'};

            % Create TextArea_Setor1
            app.TextArea_Setor1 = uitextarea(app.GridLayout);
            app.TextArea_Setor1.Visible = 'off';
            app.TextArea_Setor1.Layout.Row = [3 7];
            app.TextArea_Setor1.Layout.Column = [2 3];

            % Create TextArea_resumo1
            app.TextArea_resumo1 = uitextarea(app.GridLayout);
            app.TextArea_resumo1.Editable = 'off';
            app.TextArea_resumo1.HorizontalAlignment = 'center';
            app.TextArea_resumo1.FontName = 'Arial';
            app.TextArea_resumo1.FontSize = 24;
            app.TextArea_resumo1.Layout.Row = [6 7];
            app.TextArea_resumo1.Layout.Column = [2 3];
            app.TextArea_resumo1.Value = {'Seno:'; ''; 'Mínimo'; ''; 'Máximo'};

            % Create ValorDropDown
            app.ValorDropDown = uidropdown(app.GridLayout);
            app.ValorDropDown.Items = {'Mínimo', 'Máximo'};
            app.ValorDropDown.FontName = 'Arial Black';
            app.ValorDropDown.FontSize = 18;
            app.ValorDropDown.FontWeight = 'bold';
            app.ValorDropDown.BackgroundColor = [0.4784 0.5686 0.6392];
            app.ValorDropDown.Layout.Row = 5;
            app.ValorDropDown.Layout.Column = [2 3];
            app.ValorDropDown.Value = 'Mínimo';

            % Create Menu
            app.Menu = uiimage(app.GridLayout);
            app.Menu.ImageClickedFcn = createCallbackFcn(app, @MENUPRINCIPALButtonPushed, true);
            app.Menu.Layout.Row = 2;
            app.Menu.Layout.Column = 1;
            app.Menu.ImageSource = fullfile(pathToMLAPP, 'IconsDesign', 'home_24.png');

            % Create Seno
            app.Seno = uiimage(app.GridLayout);
            app.Seno.Layout.Row = [3 4];
            app.Seno.Layout.Column = [2 3];
            app.Seno.ImageSource = fullfile(pathToMLAPP, 'IconsDesign', 'sen.png');

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Exercicio1App_exported

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