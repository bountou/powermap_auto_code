classdef DialogBoxCoordinates_auto < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                      matlab.ui.Figure
        RadiusmEditField              matlab.ui.control.NumericEditField
        SpeedofsoundmsEditField       matlab.ui.control.NumericEditField
        SpeedofsoundmsEditFieldLabel  matlab.ui.control.Label
        BaffleCheckBox                matlab.ui.control.CheckBox
        RadiusmEditFieldLabel         matlab.ui.control.Label
        OKButton                      matlab.ui.control.Button
        EditField_40                  matlab.ui.control.NumericEditField
        Label_20                      matlab.ui.control.Label
        EditField_39                  matlab.ui.control.NumericEditField
        EditField_38                  matlab.ui.control.NumericEditField
        Label_19                      matlab.ui.control.Label
        EditField_37                  matlab.ui.control.NumericEditField
        EditField_36                  matlab.ui.control.NumericEditField
        Label_18                      matlab.ui.control.Label
        EditField_35                  matlab.ui.control.NumericEditField
        EditField_34                  matlab.ui.control.NumericEditField
        Label_17                      matlab.ui.control.Label
        EditField_33                  matlab.ui.control.NumericEditField
        EditField_32                  matlab.ui.control.NumericEditField
        Label_16                      matlab.ui.control.Label
        EditField_31                  matlab.ui.control.NumericEditField
        EditField_30                  matlab.ui.control.NumericEditField
        Label_15                      matlab.ui.control.Label
        EditField_29                  matlab.ui.control.NumericEditField
        EditField_28                  matlab.ui.control.NumericEditField
        Label_14                      matlab.ui.control.Label
        EditField_27                  matlab.ui.control.NumericEditField
        EditField_26                  matlab.ui.control.NumericEditField
        Label_13                      matlab.ui.control.Label
        EditField_25                  matlab.ui.control.NumericEditField
        EditField_24                  matlab.ui.control.NumericEditField
        Label_12                      matlab.ui.control.Label
        EditField_23                  matlab.ui.control.NumericEditField
        EditField_22                  matlab.ui.control.NumericEditField
        Label_11                      matlab.ui.control.Label
        EditField_21                  matlab.ui.control.NumericEditField
        elevdegLabel_2                matlab.ui.control.Label
        azidegLabel_2                 matlab.ui.control.Label
        elevdegLabel                  matlab.ui.control.Label
        azidegLabel                   matlab.ui.control.Label
        EditField_20                  matlab.ui.control.NumericEditField
        Label_10                      matlab.ui.control.Label
        EditField_19                  matlab.ui.control.NumericEditField
        EditField_18                  matlab.ui.control.NumericEditField
        Label_9                       matlab.ui.control.Label
        EditField_17                  matlab.ui.control.NumericEditField
        EditField_16                  matlab.ui.control.NumericEditField
        Label_8                       matlab.ui.control.Label
        EditField_15                  matlab.ui.control.NumericEditField
        EditField_14                  matlab.ui.control.NumericEditField
        Label_7                       matlab.ui.control.Label
        EditField_13                  matlab.ui.control.NumericEditField
        EditField_12                  matlab.ui.control.NumericEditField
        Label_6                       matlab.ui.control.Label
        EditField_11                  matlab.ui.control.NumericEditField
        EditField_10                  matlab.ui.control.NumericEditField
        Label_5                       matlab.ui.control.Label
        EditField_9                   matlab.ui.control.NumericEditField
        EditField_8                   matlab.ui.control.NumericEditField
        Label_4                       matlab.ui.control.Label
        EditField_7                   matlab.ui.control.NumericEditField
        EditField_6                   matlab.ui.control.NumericEditField
        Label_3                       matlab.ui.control.Label
        EditField_5                   matlab.ui.control.NumericEditField
        EditField_4                   matlab.ui.control.NumericEditField
        Label_2                       matlab.ui.control.Label
        EditField_3                   matlab.ui.control.NumericEditField
        EditField_2                   matlab.ui.control.NumericEditField
        EditField                     matlab.ui.control.NumericEditField
        Label                         matlab.ui.control.Label
    end

    
    properties (Access = private)
        CallingApp;
        M;
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app, caller, Hdirs_deg, Radius, C0, Type)
            app.CallingApp = caller;


            app.RadiusmEditField.Value = Radius;
            app.SpeedofsoundmsEditField.Value = C0;
            

            if Type == "rigid"
                app.BaffleCheckBox.Value = true;
            end

            app.M = size(Hdirs_deg,1); % number of hydrophones


            if app.M == 4
                app.EditField.Value = Hdirs_deg(1,1);
                app.EditField_2.Value = Hdirs_deg(1,2);
                app.EditField_4.Value = Hdirs_deg(2,1);
                app.EditField_3.Value = Hdirs_deg(2,2);
                app.EditField_6.Value = Hdirs_deg(3,1);
                app.EditField_5.Value = Hdirs_deg(3,2);
                app.EditField_8.Value = Hdirs_deg(4,1);
                app.EditField_7.Value = Hdirs_deg(4,2);
                app.EditField_10.Enable = "off";
                app.EditField_9.Enable = "off";
                app.EditField_12.Enable = "off";
                app.EditField_11.Enable = "off";
                app.EditField_14.Enable = "off";
                app.EditField_13.Enable = "off";
                app.EditField_16.Enable = "off";
                app.EditField_15.Enable = "off";
                app.EditField_18.Enable = "off";
                app.EditField_17.Enable = "off";
                app.EditField_20.Enable = "off";
                app.EditField_19.Enable = "off";
                app.EditField_22.Enable = "off";
                app.EditField_21.Enable = "off";
                app.EditField_24.Enable = "off";
                app.EditField_23.Enable = "off";
                app.EditField_26.Enable = "off";
                app.EditField_25.Enable = "off";
                app.EditField_28.Enable = "off";
                app.EditField_27.Enable = "off";
                app.EditField_30.Enable = "off";
                app.EditField_29.Enable = "off";
                app.EditField_32.Enable = "off";
                app.EditField_31.Enable = "off";
                app.EditField_34.Enable = "off";
                app.EditField_33.Enable = "off";
                app.EditField_36.Enable = "off";
                app.EditField_35.Enable = "off";
                app.EditField_38.Enable = "off";
                app.EditField_37.Enable = "off";
                app.EditField_40.Enable = "off";
                app.EditField_39.Enable = "off";
            elseif app.M == 16
                app.EditField.Value = Hdirs_deg(1,1);
                app.EditField_2.Value = Hdirs_deg(1,2);
                app.EditField_4.Value = Hdirs_deg(2,1);
                app.EditField_3.Value = Hdirs_deg(2,2);
                app.EditField_6.Value = Hdirs_deg(3,1);
                app.EditField_5.Value = Hdirs_deg(3,2);
                app.EditField_8.Value = Hdirs_deg(4,1);
                app.EditField_7.Value = Hdirs_deg(4,2);
                app.EditField_10.Value = Hdirs_deg(5,1);
                app.EditField_9.Value = Hdirs_deg(5,2);
                app.EditField_12.Value = Hdirs_deg(6,1);
                app.EditField_11.Value = Hdirs_deg(6,2);
                app.EditField_14.Value = Hdirs_deg(7,1);
                app.EditField_13.Value = Hdirs_deg(7,2);
                app.EditField_16.Value = Hdirs_deg(8,1);
                app.EditField_15.Value = Hdirs_deg(8,2);
                app.EditField_18.Value = Hdirs_deg(9,1);
                app.EditField_17.Value = Hdirs_deg(9,2);
                app.EditField_20.Value = Hdirs_deg(10,1);
                app.EditField_19.Value = Hdirs_deg(10,2);
                app.EditField_22.Value = Hdirs_deg(11,1);
                app.EditField_21.Value = Hdirs_deg(11,2);
                app.EditField_24.Value = Hdirs_deg(12,1);
                app.EditField_23.Value = Hdirs_deg(12,2);
                app.EditField_26.Value = Hdirs_deg(13,1);
                app.EditField_25.Value = Hdirs_deg(13,2);
                app.EditField_28.Value = Hdirs_deg(14,1);
                app.EditField_27.Value = Hdirs_deg(14,2);
                app.EditField_30.Value = Hdirs_deg(15,1);
                app.EditField_29.Value = Hdirs_deg(15,2);
                app.EditField_32.Value = Hdirs_deg(16,1);
                app.EditField_31.Value = Hdirs_deg(16,2);
                app.EditField_34.Enable = "off";
                app.EditField_33.Enable = "off";
                app.EditField_36.Enable = "off";
                app.EditField_35.Enable = "off";
                app.EditField_38.Enable = "off";
                app.EditField_37.Enable = "off";
                app.EditField_40.Enable = "off";
                app.EditField_39.Enable = "off";
            elseif app.M == 20
                app.EditField.Value = Hdirs_deg(1,1);
                app.EditField_2.Value = Hdirs_deg(1,2);
                app.EditField_4.Value = Hdirs_deg(2,1);
                app.EditField_3.Value = Hdirs_deg(2,2);
                app.EditField_6.Value = Hdirs_deg(3,1);
                app.EditField_5.Value = Hdirs_deg(3,2);
                app.EditField_8.Value = Hdirs_deg(4,1);
                app.EditField_7.Value = Hdirs_deg(4,2);
                app.EditField_10.Value = Hdirs_deg(5,1);
                app.EditField_9.Value = Hdirs_deg(5,2);
                app.EditField_12.Value = Hdirs_deg(6,1);
                app.EditField_11.Value = Hdirs_deg(6,2);
                app.EditField_14.Value = Hdirs_deg(7,1);
                app.EditField_13.Value = Hdirs_deg(7,2);
                app.EditField_16.Value = Hdirs_deg(8,1);
                app.EditField_15.Value = Hdirs_deg(8,2);
                app.EditField_18.Value = Hdirs_deg(9,1);
                app.EditField_17.Value = Hdirs_deg(9,2);
                app.EditField_20.Value = Hdirs_deg(10,1);
                app.EditField_19.Value = Hdirs_deg(10,2);
                app.EditField_22.Value = Hdirs_deg(11,1);
                app.EditField_21.Value = Hdirs_deg(11,2);
                app.EditField_24.Value = Hdirs_deg(12,1);
                app.EditField_23.Value = Hdirs_deg(12,2);
                app.EditField_26.Value = Hdirs_deg(13,1);
                app.EditField_25.Value = Hdirs_deg(13,2);
                app.EditField_28.Value = Hdirs_deg(14,1);
                app.EditField_27.Value = Hdirs_deg(14,2);
                app.EditField_30.Value = Hdirs_deg(15,1);
                app.EditField_29.Value = Hdirs_deg(15,2);
                app.EditField_32.Value = Hdirs_deg(16,1);
                app.EditField_31.Value = Hdirs_deg(16,2);
                app.EditField_34.Value = Hdirs_deg(17,1);
                app.EditField_33.Value = Hdirs_deg(17,2);
                app.EditField_36.Value = Hdirs_deg(18,1);
                app.EditField_35.Value = Hdirs_deg(18,2);
                app.EditField_38.Value = Hdirs_deg(19,1);
                app.EditField_37.Value = Hdirs_deg(19,2);
                app.EditField_40.Value = Hdirs_deg(20,1);
                app.EditField_39.Value = Hdirs_deg(20,2);
            end



        end

        % Button pushed function: OKButton
        function OKButtonPushed(app, event)

            updateRCType(app.CallingApp,app.RadiusmEditField.Value ,app.SpeedofsoundmsEditField.Value ,app.BaffleCheckBox.Value)

            if app.M == 4
                updateAngle(app.CallingApp,app.EditField.Value,1,1);
                updateAngle(app.CallingApp,app.EditField_2.Value,1,2);
                updateAngle(app.CallingApp,app.EditField_4.Value,2,1);
                updateAngle(app.CallingApp,app.EditField_3.Value,2,2);
                updateAngle(app.CallingApp,app.EditField_6.Value,3,1);
                updateAngle(app.CallingApp,app.EditField_5.Value,3,2);
                updateAngle(app.CallingApp,app.EditField_8.Value,4,1);
                updateAngle(app.CallingApp,app.EditField_7.Value,4,2);
            elseif app.M == 16
                updateAngle(app.CallingApp,app.EditField.Value,1,1);
                updateAngle(app.CallingApp,app.EditField_2.Value,1,2);
                updateAngle(app.CallingApp,app.EditField_4.Value,2,1);
                updateAngle(app.CallingApp,app.EditField_3.Value,2,2);
                updateAngle(app.CallingApp,app.EditField_6.Value,3,1);
                updateAngle(app.CallingApp,app.EditField_5.Value,3,2);
                updateAngle(app.CallingApp,app.EditField_8.Value,4,1);
                updateAngle(app.CallingApp,app.EditField_7.Value,4,2);
                updateAngle(app.CallingApp,app.EditField_10.Value,5,1);
                updateAngle(app.CallingApp,app.EditField_9.Value,5,2);
                updateAngle(app.CallingApp,app.EditField_12.Value,6,1);
                updateAngle(app.CallingApp,app.EditField_11.Value,6,2);
                updateAngle(app.CallingApp,app.EditField_14.Value,7,1);
                updateAngle(app.CallingApp,app.EditField_13.Value,7,2);
                updateAngle(app.CallingApp,app.EditField_16.Value,8,1);
                updateAngle(app.CallingApp,app.EditField_15.Value,8,2);
                updateAngle(app.CallingApp,app.EditField_18.Value,9,1);
                updateAngle(app.CallingApp,app.EditField_17.Value,9,2);
                updateAngle(app.CallingApp,app.EditField_20.Value,10,1);
                updateAngle(app.CallingApp,app.EditField_19.Value,10,2);
                updateAngle(app.CallingApp,app.EditField_22.Value,11,1);
                updateAngle(app.CallingApp,app.EditField_21.Value,11,2);
                updateAngle(app.CallingApp,app.EditField_24.Value,12,1);
                updateAngle(app.CallingApp,app.EditField_23.Value,12,2);
                updateAngle(app.CallingApp,app.EditField_26.Value,13,1);
                updateAngle(app.CallingApp,app.EditField_25.Value,13,2);
                updateAngle(app.CallingApp,app.EditField_28.Value,14,1);
                updateAngle(app.CallingApp,app.EditField_27.Value,14,2);
                updateAngle(app.CallingApp,app.EditField_30.Value,15,1);
                updateAngle(app.CallingApp,app.EditField_29.Value,15,2);
                updateAngle(app.CallingApp,app.EditField_32.Value,16,1);
                updateAngle(app.CallingApp,app.EditField_31.Value,16,2);
            elseif app.M == 20
                updateAngle(app.CallingApp,app.EditField.Value,1,1);
                updateAngle(app.CallingApp,app.EditField_2.Value,1,2);
                updateAngle(app.CallingApp,app.EditField_4.Value,2,1);
                updateAngle(app.CallingApp,app.EditField_3.Value,2,2);
                updateAngle(app.CallingApp,app.EditField_6.Value,3,1);
                updateAngle(app.CallingApp,app.EditField_5.Value,3,2);
                updateAngle(app.CallingApp,app.EditField_8.Value,4,1);
                updateAngle(app.CallingApp,app.EditField_7.Value,4,2);
                updateAngle(app.CallingApp,app.EditField_10.Value,5,1);
                updateAngle(app.CallingApp,app.EditField_9.Value,5,2);
                updateAngle(app.CallingApp,app.EditField_12.Value,6,1);
                updateAngle(app.CallingApp,app.EditField_11.Value,6,2);
                updateAngle(app.CallingApp,app.EditField_14.Value,7,1);
                updateAngle(app.CallingApp,app.EditField_13.Value,7,2);
                updateAngle(app.CallingApp,app.EditField_16.Value,8,1);
                updateAngle(app.CallingApp,app.EditField_15.Value,8,2);
                updateAngle(app.CallingApp,app.EditField_18.Value,9,1);
                updateAngle(app.CallingApp,app.EditField_17.Value,9,2);
                updateAngle(app.CallingApp,app.EditField_20.Value,10,1);
                updateAngle(app.CallingApp,app.EditField_19.Value,10,2);     
                updateAngle(app.CallingApp,app.EditField_22.Value,11,1);
                updateAngle(app.CallingApp,app.EditField_21.Value,11,2);
                updateAngle(app.CallingApp,app.EditField_24.Value,12,1);
                updateAngle(app.CallingApp,app.EditField_23.Value,12,2);
                updateAngle(app.CallingApp,app.EditField_26.Value,13,1);
                updateAngle(app.CallingApp,app.EditField_25.Value,13,2);
                updateAngle(app.CallingApp,app.EditField_28.Value,14,1);
                updateAngle(app.CallingApp,app.EditField_27.Value,14,2);
                updateAngle(app.CallingApp,app.EditField_30.Value,15,1);
                updateAngle(app.CallingApp,app.EditField_29.Value,15,2);
                updateAngle(app.CallingApp,app.EditField_32.Value,16,1);
                updateAngle(app.CallingApp,app.EditField_31.Value,16,2);
                updateAngle(app.CallingApp,app.EditField_34.Value,17,1);
                updateAngle(app.CallingApp,app.EditField_33.Value,17,2);
                updateAngle(app.CallingApp,app.EditField_36.Value,18,1);
                updateAngle(app.CallingApp,app.EditField_35.Value,18,2);
                updateAngle(app.CallingApp,app.EditField_38.Value,19,1);
                updateAngle(app.CallingApp,app.EditField_37.Value,19,2);
                updateAngle(app.CallingApp,app.EditField_40.Value,20,1);
                updateAngle(app.CallingApp,app.EditField_39.Value,20,2);
            end

            Dirs = getHydroDirs(app.CallingApp);

            % Find aliasing frequency and update f_end and Label2
            f_alias = findAliasFreq(app.CallingApp, ...
                Dirs(:,1),Dirs(:,2), ...
                app.M,app.RadiusmEditField.Value, ...
                app.SpeedofsoundmsEditField.Value);

           % app.CallingApp.f_endHzEditField.Value = f_alias;
           % setfEnd(app.CallingApp,f_alias);
            app.CallingApp.Label_2.Text = ['< ' num2str(f_alias) ' Hz'];

            app.CallingApp.EditArrayButton.Enable = 'on';
            delete(app)
        end

        % Close request function: UIFigure
        function DialogAppBoxCloseRequest(app, event)
            app.CallingApp.EditArrayButton.Enable = 'on';
            delete(app)
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 439 557];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.CloseRequestFcn = createCallbackFcn(app, @DialogAppBoxCloseRequest, true);

            % Create Label
            app.Label = uilabel(app.UIFigure);
            app.Label.HorizontalAlignment = 'right';
            app.Label.Position = [40 389 25 22];
            app.Label.Text = '1.';

            % Create EditField
            app.EditField = uieditfield(app.UIFigure, 'numeric');
            app.EditField.Position = [80 389 50 22];

            % Create EditField_2
            app.EditField_2 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_2.Position = [142 389 50 22];

            % Create EditField_3
            app.EditField_3 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_3.Position = [143 356 50 22];

            % Create Label_2
            app.Label_2 = uilabel(app.UIFigure);
            app.Label_2.HorizontalAlignment = 'right';
            app.Label_2.Position = [40 356 25 22];
            app.Label_2.Text = '2.';

            % Create EditField_4
            app.EditField_4 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_4.Position = [80 356 50 22];

            % Create EditField_5
            app.EditField_5 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_5.Position = [143 319 50 22];

            % Create Label_3
            app.Label_3 = uilabel(app.UIFigure);
            app.Label_3.HorizontalAlignment = 'right';
            app.Label_3.Position = [40 319 25 22];
            app.Label_3.Text = '3.';

            % Create EditField_6
            app.EditField_6 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_6.Position = [80 319 50 22];

            % Create EditField_7
            app.EditField_7 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_7.Position = [143 283 50 22];

            % Create Label_4
            app.Label_4 = uilabel(app.UIFigure);
            app.Label_4.HorizontalAlignment = 'right';
            app.Label_4.Position = [40 283 25 22];
            app.Label_4.Text = '4.';

            % Create EditField_8
            app.EditField_8 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_8.Position = [80 283 50 22];

            % Create EditField_9
            app.EditField_9 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_9.Position = [143 250 50 22];

            % Create Label_5
            app.Label_5 = uilabel(app.UIFigure);
            app.Label_5.HorizontalAlignment = 'right';
            app.Label_5.Position = [40 250 25 22];
            app.Label_5.Text = '5.';

            % Create EditField_10
            app.EditField_10 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_10.Position = [80 250 50 22];

            % Create EditField_11
            app.EditField_11 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_11.Position = [143 213 50 22];

            % Create Label_6
            app.Label_6 = uilabel(app.UIFigure);
            app.Label_6.HorizontalAlignment = 'right';
            app.Label_6.Position = [40 213 25 22];
            app.Label_6.Text = '6.';

            % Create EditField_12
            app.EditField_12 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_12.Position = [80 213 50 22];

            % Create EditField_13
            app.EditField_13 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_13.Position = [143 178 50 22];

            % Create Label_7
            app.Label_7 = uilabel(app.UIFigure);
            app.Label_7.HorizontalAlignment = 'right';
            app.Label_7.Position = [40 178 25 22];
            app.Label_7.Text = '7.';

            % Create EditField_14
            app.EditField_14 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_14.Position = [80 178 50 22];

            % Create EditField_15
            app.EditField_15 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_15.Position = [143 145 50 22];

            % Create Label_8
            app.Label_8 = uilabel(app.UIFigure);
            app.Label_8.HorizontalAlignment = 'right';
            app.Label_8.Position = [40 145 25 22];
            app.Label_8.Text = '8.';

            % Create EditField_16
            app.EditField_16 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_16.Position = [80 145 50 22];

            % Create EditField_17
            app.EditField_17 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_17.Position = [143 108 50 22];

            % Create Label_9
            app.Label_9 = uilabel(app.UIFigure);
            app.Label_9.HorizontalAlignment = 'right';
            app.Label_9.Position = [40 108 25 22];
            app.Label_9.Text = '9.';

            % Create EditField_18
            app.EditField_18 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_18.Position = [80 108 50 22];

            % Create EditField_19
            app.EditField_19 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_19.Position = [143 72 50 22];

            % Create Label_10
            app.Label_10 = uilabel(app.UIFigure);
            app.Label_10.HorizontalAlignment = 'right';
            app.Label_10.Position = [40 72 25 22];
            app.Label_10.Text = '10.';

            % Create EditField_20
            app.EditField_20 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_20.Position = [80 72 50 22];

            % Create azidegLabel
            app.azidegLabel = uilabel(app.UIFigure);
            app.azidegLabel.HorizontalAlignment = 'center';
            app.azidegLabel.Position = [81 419 50 22];
            app.azidegLabel.Text = 'azi (deg)';

            % Create elevdegLabel
            app.elevdegLabel = uilabel(app.UIFigure);
            app.elevdegLabel.HorizontalAlignment = 'center';
            app.elevdegLabel.Position = [143 419 57 22];
            app.elevdegLabel.Text = 'elev (deg)';

            % Create azidegLabel_2
            app.azidegLabel_2 = uilabel(app.UIFigure);
            app.azidegLabel_2.HorizontalAlignment = 'center';
            app.azidegLabel_2.Position = [288 419 50 22];
            app.azidegLabel_2.Text = 'azi (deg)';

            % Create elevdegLabel_2
            app.elevdegLabel_2 = uilabel(app.UIFigure);
            app.elevdegLabel_2.HorizontalAlignment = 'center';
            app.elevdegLabel_2.Position = [351 419 57 22];
            app.elevdegLabel_2.Text = 'elev (deg)';

            % Create EditField_21
            app.EditField_21 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_21.Position = [349 389 53 22];

            % Create Label_11
            app.Label_11 = uilabel(app.UIFigure);
            app.Label_11.HorizontalAlignment = 'right';
            app.Label_11.Position = [247 389 25 22];
            app.Label_11.Text = '11.';

            % Create EditField_22
            app.EditField_22 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_22.Position = [287 389 53 22];

            % Create EditField_23
            app.EditField_23 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_23.Position = [350 356 53 22];

            % Create Label_12
            app.Label_12 = uilabel(app.UIFigure);
            app.Label_12.HorizontalAlignment = 'right';
            app.Label_12.Position = [247 356 25 22];
            app.Label_12.Text = '12.';

            % Create EditField_24
            app.EditField_24 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_24.Position = [287 356 53 22];

            % Create EditField_25
            app.EditField_25 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_25.Position = [350 319 53 22];

            % Create Label_13
            app.Label_13 = uilabel(app.UIFigure);
            app.Label_13.HorizontalAlignment = 'right';
            app.Label_13.Position = [247 319 25 22];
            app.Label_13.Text = '13.';

            % Create EditField_26
            app.EditField_26 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_26.Position = [287 319 53 22];

            % Create EditField_27
            app.EditField_27 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_27.Position = [350 283 53 22];

            % Create Label_14
            app.Label_14 = uilabel(app.UIFigure);
            app.Label_14.HorizontalAlignment = 'right';
            app.Label_14.Position = [247 283 25 22];
            app.Label_14.Text = '14.';

            % Create EditField_28
            app.EditField_28 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_28.Position = [287 283 53 22];

            % Create EditField_29
            app.EditField_29 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_29.Position = [350 250 53 22];

            % Create Label_15
            app.Label_15 = uilabel(app.UIFigure);
            app.Label_15.HorizontalAlignment = 'right';
            app.Label_15.Position = [247 250 25 22];
            app.Label_15.Text = '15.';

            % Create EditField_30
            app.EditField_30 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_30.Position = [287 250 53 22];

            % Create EditField_31
            app.EditField_31 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_31.Position = [350 213 53 22];

            % Create Label_16
            app.Label_16 = uilabel(app.UIFigure);
            app.Label_16.HorizontalAlignment = 'right';
            app.Label_16.Position = [247 213 25 22];
            app.Label_16.Text = '16.';

            % Create EditField_32
            app.EditField_32 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_32.Position = [287 213 53 22];

            % Create EditField_33
            app.EditField_33 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_33.Position = [350 178 53 22];

            % Create Label_17
            app.Label_17 = uilabel(app.UIFigure);
            app.Label_17.HorizontalAlignment = 'right';
            app.Label_17.Position = [247 178 25 22];
            app.Label_17.Text = '17.';

            % Create EditField_34
            app.EditField_34 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_34.Position = [287 178 53 22];

            % Create EditField_35
            app.EditField_35 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_35.Position = [350 145 53 22];

            % Create Label_18
            app.Label_18 = uilabel(app.UIFigure);
            app.Label_18.HorizontalAlignment = 'right';
            app.Label_18.Position = [247 145 25 22];
            app.Label_18.Text = '18.';

            % Create EditField_36
            app.EditField_36 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_36.Position = [287 145 53 22];

            % Create EditField_37
            app.EditField_37 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_37.Position = [350 108 53 22];

            % Create Label_19
            app.Label_19 = uilabel(app.UIFigure);
            app.Label_19.HorizontalAlignment = 'right';
            app.Label_19.Position = [247 108 25 22];
            app.Label_19.Text = '19.';

            % Create EditField_38
            app.EditField_38 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_38.Position = [287 108 53 22];

            % Create EditField_39
            app.EditField_39 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_39.Position = [350 72 53 22];

            % Create Label_20
            app.Label_20 = uilabel(app.UIFigure);
            app.Label_20.HorizontalAlignment = 'right';
            app.Label_20.Position = [247 72 25 22];
            app.Label_20.Text = '20.';

            % Create EditField_40
            app.EditField_40 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_40.Position = [287 72 53 22];

            % Create OKButton
            app.OKButton = uibutton(app.UIFigure, 'push');
            app.OKButton.ButtonPushedFcn = createCallbackFcn(app, @OKButtonPushed, true);
            app.OKButton.Position = [164 23 100 23];
            app.OKButton.Text = 'OK';

            % Create RadiusmEditFieldLabel
            app.RadiusmEditFieldLabel = uilabel(app.UIFigure);
            app.RadiusmEditFieldLabel.HorizontalAlignment = 'right';
            app.RadiusmEditFieldLabel.Position = [72 494 62 22];
            app.RadiusmEditFieldLabel.Text = 'Radius (m)';

            % Create BaffleCheckBox
            app.BaffleCheckBox = uicheckbox(app.UIFigure);
            app.BaffleCheckBox.Text = 'Baffle';
            app.BaffleCheckBox.FontSize = 14;
            app.BaffleCheckBox.Position = [313 473 58 22];

            % Create SpeedofsoundmsEditFieldLabel
            app.SpeedofsoundmsEditFieldLabel = uilabel(app.UIFigure);
            app.SpeedofsoundmsEditFieldLabel.HorizontalAlignment = 'right';
            app.SpeedofsoundmsEditFieldLabel.Position = [71 463 120 22];
            app.SpeedofsoundmsEditFieldLabel.Text = 'Speed of sound (m/s)';

            % Create SpeedofsoundmsEditField
            app.SpeedofsoundmsEditField = uieditfield(app.UIFigure, 'numeric');
            app.SpeedofsoundmsEditField.Position = [201 463 55 22];

            % Create RadiusmEditField
            app.RadiusmEditField = uieditfield(app.UIFigure, 'numeric');
            app.RadiusmEditField.Position = [201 494 55 22];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = DialogBoxCoordinates_auto(varargin)

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @(app)startupFcn(app, varargin{:}))

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