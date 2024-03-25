classdef main_AutoMode < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        InputSettingsPanel              matlab.ui.container.Panel
        LoadaudiofileButton             matlab.ui.control.Button
        tausecEditField                 matlab.ui.control.NumericEditField
        PresetsDropDown                 matlab.ui.control.DropDown
        LoadArrayButton                 matlab.ui.control.Button
        Label_3                         matlab.ui.control.Label
        PresetsDropDownLabel            matlab.ui.control.Label
        EditArrayButton                 matlab.ui.control.Button
        LoadlogfileButton               matlab.ui.control.Button
        ButtonGroup_3                   matlab.ui.container.ButtonGroup
        RAVENButton                     matlab.ui.control.RadioButton
        AdobeAuditionButton_2           matlab.ui.control.RadioButton
        AnalysisPanel                   matlab.ui.container.Panel
        EncodingDropDownLabel           matlab.ui.control.Label
        MaxgaindBEditFieldLabel         matlab.ui.control.Label
        samplesLabel                    matlab.ui.control.Label
        samplesEditField                matlab.ui.control.NumericEditField
        TimewindowmsecLabel             matlab.ui.control.Label
        TimewindowmsecEditField         matlab.ui.control.NumericEditField
        EncodingDropDown                matlab.ui.control.DropDown
        MaxgaindBEditField              matlab.ui.control.NumericEditField
        DoneLamp                        matlab.ui.control.Lamp
        DoneLampLabel                   matlab.ui.control.Label
        RunanalysisButton               matlab.ui.control.Button
        DetectionsFoundLabel            matlab.ui.control.Label
        SpectrograminspectionPanel      matlab.ui.container.Panel
        DetectionEditField              matlab.ui.control.NumericEditField
        DetectionEditFieldLabel         matlab.ui.control.Label
        f_cutHzEditField                matlab.ui.control.NumericEditField
        f_cutHzEditFieldLabel           matlab.ui.control.Label
        SelectchannelDropDown           matlab.ui.control.DropDown
        ChannelLabel                    matlab.ui.control.Label
        PlayButton                      matlab.ui.control.Button
        StopButton                      matlab.ui.control.Button
        EditFieldThreshold_2            matlab.ui.control.NumericEditField
        ThresholddBSlider_2             matlab.ui.control.Slider
        ThresholddBSliderLabel_2        matlab.ui.control.Label
        PlotspectrogramButton           matlab.ui.control.Button
        PowermapvideoPanel              matlab.ui.container.Panel
        DoneLamp_4Label                 matlab.ui.control.Label
        msecEditFieldLabel              matlab.ui.control.Label
        f_startHzEditField              matlab.ui.control.NumericEditField
        f_endHzEditField                matlab.ui.control.NumericEditField
        Label                           matlab.ui.control.Label
        Label_2                         matlab.ui.control.Label
        MethodDropDown                  matlab.ui.control.DropDown
        SHorderDropDown                 matlab.ui.control.DropDown
        N_sourcesMUSICEditField         matlab.ui.control.NumericEditField
        AvgwindowsEditFieldLabel        matlab.ui.control.Label
        N_sourcesMUSICEditFieldLabel    matlab.ui.control.Label
        GridDropDown                    matlab.ui.control.DropDown
        GridDropDownLabel               matlab.ui.control.Label
        ColormapDropDownLabel           matlab.ui.control.Label
        ColormapDropDown                matlab.ui.control.DropDown
        MethodDropDownLabel             matlab.ui.control.Label
        SHorderDropDownLabel            matlab.ui.control.Label
        EditFieldThreshold              matlab.ui.control.NumericEditField
        ThresholddBSlider               matlab.ui.control.Slider
        altnormCheckBox                 matlab.ui.control.CheckBox
        AvgwindowsEditField             matlab.ui.control.NumericEditField
        msecEditField                   matlab.ui.control.NumericEditField
        ButtonGroup                     matlab.ui.container.ButtonGroup
        withoutaxesButton               matlab.ui.control.RadioButton
        withaxesButton                  matlab.ui.control.RadioButton
        CreateandexportpowermapsButton  matlab.ui.control.Button
        DoneLamp_2                      matlab.ui.control.Lamp
        DoneLamp_2Label                 matlab.ui.control.Label
        f_endHzEditFieldLabel           matlab.ui.control.Label
        f_startHzEditFieldLabel         matlab.ui.control.Label
        ThresholddBSliderLabel          matlab.ui.control.Label
        LabelDetectionNumber            matlab.ui.control.Label
        LabelProgress                   matlab.ui.control.Label
        LabelProgress_2                 matlab.ui.control.Label
        ExportambifilesButton           matlab.ui.control.Button
        DoneLamp_4                      matlab.ui.control.Lamp
        ScrollingSpectrogramvideoPanel  matlab.ui.container.Panel
        TimewindowmsecEditField_2Label  matlab.ui.control.Label
        TimewindowmsecEditField_2       matlab.ui.control.NumericEditField
        Label_4                         matlab.ui.control.Label
        FramelengthsecEditField         matlab.ui.control.NumericEditField
        FramelengthsecEditFieldLabel    matlab.ui.control.Label
        f_cutHzEditField_2              matlab.ui.control.NumericEditField
        f_cutHzEditField_2Label         matlab.ui.control.Label
        ThresholddBEditField            matlab.ui.control.NumericEditField
        ThresholddBEditFieldLabel       matlab.ui.control.Label
        t_startsecEditField             matlab.ui.control.NumericEditField
        t_endsecEditField               matlab.ui.control.NumericEditField
        t_endsecEditFieldLabel          matlab.ui.control.Label
        t_startsecEditFieldLabel        matlab.ui.control.Label
        ButtonGroup_2                   matlab.ui.container.ButtonGroup
        withoutaxesButton_2             matlab.ui.control.RadioButton
        withaxesButton_2                matlab.ui.control.RadioButton
        CreateandexportspectrogramButton  matlab.ui.control.Button
        LabelProgress_3                 matlab.ui.control.Label
        DoneLamp_3                      matlab.ui.control.Lamp
        DoneLamp_3Label                 matlab.ui.control.Label
        UIAxes                          matlab.ui.control.UIAxes
    end

    properties (Access = private) 
        %%% Properties that can be accessed by callback functions as app.property
        %%% (to share data between functions)

        DialogBoxApp;
        PowermapApp;
        SpectrogramApp;

        % Audio file
        isAmbisonic; 
        x;  % hydrophone signals or ambisonic signals
        Fs; % sampling frequency
        M;  % number of channels
      %  N;  % number of samples
        duration;
        channel; % active channel
        time_vec;


        % Log file
        t_start_Det;
        t_end_Det;
        f_start_Det;
        f_end_Det;
        Ndet;
        Labels;
        

        % Array
        hydro_dirs_rad;
        R; % array radius in meters
        c0;
        arrayType;
        order;

        % Analysis
        xDet;
        Twin;
        Nwin;
        hopsize;
        fps;
        XDet; % TF-domain signals 
        NwindowsDet;
        timeDet; % to timeDet
        freq;
        sDet;
        SDet; % SH signals in TF-domain % to SDet
        OmniDet; % Omni in TF-domain % to OmniDet
        omniDet; % omni in time domain % to omniDet
        DetNum;
 
        % Spectrogram
        threshold_Sp;  % clim

        % Powermap
        nb_av;
        F=struct('cdata',[],'colormap',[]); % frame data
        threshold; % clim
        col; % colormap

       
    end
    

    properties (Access = public)
        logFile_loaded; 
    end


    methods (Access = public)

        function f_al = findAliasFreq(~,aziM,eleV,Q,R,c0)
            [px,py,pz] = sph2cart(aziM, eleV, R);
            pm  = [px py pz].';
            d=[];
            for q=1:Q-1
                for qq=q+1:Q
                    d = [d sqrt(sum((pm(:,q)-pm(:,qq)).^2))];
                end
            end
            d_min = min(d); % minimum distance between sensors
            f_al = round(c0/2/d_min,0);
        end

        function updateAngle(app,angle_deg,i,j)
            % index i: hydrophone
            % index j: azi or elev
            angle_rad = angle_deg*pi/180;
            app.hydro_dirs_rad(i,j) = angle_rad;
        end

        function updateRCType(app,Radius,C0,Baffle)
            app.R=Radius;
            app.c0 = C0;
            if Baffle == true
                app.arrayType = 'rigid';
            else
                app.arrayType = 'open';
            end
        end

        function dirs = getHydroDirs(app)
            dirs = app.hydro_dirs_rad;
        end
        
        function setFData(app,FF)
            app.F = FF;
        end
        
        function [thresh, colorm] = getPowermapPar(app)
            thresh = app.threshold;
            colorm = app.col;
        end
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            app.isAmbisonic = false;
            app.logFile_loaded = false;
            app.t_start_Det=[];
            app.t_end_Det=[];

            % Spectrogram
            app.threshold_Sp = app.EditFieldThreshold_2.Value;

            % Powermap
            app.threshold = app.ThresholddBSlider.Value;
            app.col = app.ColormapDropDown.Value;
            app.nb_av = app.AvgwindowsEditField.Value;
        end

        % Button pushed function: LoadaudiofileButton
        function LoadaudiofileButtonPushed(app, event)
           
            %% Load audio file
            [file_in,path_in] = uigetfile('*.wav');
            fileName = fullfile(path_in,file_in);
            [app.x,app.Fs] = audioread(fileName);
            app.M = size(app.x,2);
            N = size(app.x,1);
            app.duration = N/app.Fs; % duration in seconds
            app.time_vec = 0:1/app.Fs:app.duration-1/app.Fs; % in seconds

            % display(['Number of channels: ' num2str(app.M)])

            %%  Update time window size (in samples)
            app.Twin = 1e-3*app.TimewindowmsecEditField.Value; % window duration in seconds
            app.Nwin = round(app.Twin*app.Fs); % window number of samples
            if mod(app.Nwin,2) == 1 % Nwin must be even number
                app.Nwin  = app.Nwin+1;
            end
            app.samplesEditField.Value = app.Nwin;

            %%  Update fps and averaging time (in windows and msec) 
            app.fps = round(2/app.Twin);
            app.msecEditField.Value = (app.nb_av+1)*app.Twin/2*1000; % averaging time in msec


            %% Update duration in Scrolling Spectrogram panel
            app.t_endsecEditField.Value = app.duration;
            app.Label_4.Text = ['< ' num2str(app.duration) ' sec'];


            %% Update presets based on number of channels
            switch  app.M
                case 4
                    app.PresetsDropDown.Items = {'4-hydrophone (t-design)','FOA'};
                    app.PresetsDropDown.Value = '4-hydrophone (t-design)';
                    app.LoadArrayButton.Enable = "on";
                case 9
                    app.PresetsDropDown.Items = {'HOA (2nd order)'};
                    app.PresetsDropDown.Value = 'HOA (2nd order)';
                    app.RunanalysisButton.Enable = "on";
                    app.isAmbisonic = true;
                    app.order = 2;
                    app.SelectchannelDropDown.Items = {'omni','1','2','3','4','5','6','7','8'};
                    app.SelectchannelDropDown.Value = 'omni';
                    app.channel = app.SelectchannelDropDown.Value;
                    app.SHorderDropDown.Items = arrayfun(@num2str, 1:app.order , 'UniformOutput', 0);
                    app.SHorderDropDown.Value = arrayfun(@num2str, app.order , 'UniformOutput', 0);
                case 16
                    app.PresetsDropDown.Items = {'16-hydrophone (t-design)','HOA (3rd order)'};
                    app.PresetsDropDown.Value = '16-hydrophone (t-design)';
                    app.LoadArrayButton.Enable = "on";
                case 20
                    app.PresetsDropDown.Items = {'20-hydrophone (t-design)'};
                    app.PresetsDropDown.Value = '20-hydrophone (t-design)';
                    app.LoadArrayButton.Enable = "on";
                case 25
                    app.PresetsDropDown.Items = {'HOA (4th order)'};
                    app.PresetsDropDown.Value = 'HOA (4th order)';
                    app.RunanalysisButton.Enable = "on";
                    app.isAmbisonic = true;
                    app.order = 4;
                    app.SelectchannelDropDown.Items = {'omni','1','2','3','4','5','6','7','8','9','10','11','12',...
                        '13','14','15','16','17','18','19','20','21','22','23','24'};
                    app.SelectchannelDropDown.Value = 'omni';
                    app.channel = app.SelectchannelDropDown.Value;
                    app.SHorderDropDown.Items = arrayfun(@num2str, 1:app.order , 'UniformOutput', 0);
                    app.SHorderDropDown.Value = arrayfun(@num2str, app.order , 'UniformOutput', 0);
                case 36
                    app.PresetsDropDown.Items = {'HOA (5th order)'};
                    app.PresetsDropDown.Value = 'HOA (5th order)';
                    app.RunanalysisButton.Enable = "on";
                    app.isAmbisonic = true;
                    app.order = 5;
                    app.SelectchannelDropDown.Items = {'omni','1','2','3','4','5','6','7','8','9','10','11','12',...
                        '13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','32','33','34','35'};
                    app.SelectchannelDropDown.Value = 'omni';
                    app.channel = app.SelectchannelDropDown.Value;
                    app.SHorderDropDown.Items = arrayfun(@num2str, 1:app.order , 'UniformOutput', 0);
                    app.SHorderDropDown.Value = arrayfun(@num2str, app.order , 'UniformOutput', 0);
                case 49
                    app.PresetsDropDown.Items = {'HOA (6th order)'};
                    app.PresetsDropDown.Value = 'HOA (6th order)';
                    app.RunanalysisButton.Enable = "on";
                    app.isAmbisonic = true;
                    app.order = 6;
                    app.SelectchannelDropDown.Items = {'omni','1','2','3','4','5','6','7','8','9','10','11','12',...
                        '13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30',...
                        '31','32','33','34','35','36','37','38','39','40','46','47','48'};
                    app.SelectchannelDropDown.Value = 'omni';
                    app.channel = app.SelectchannelDropDown.Value;
                    app.SHorderDropDown.Items = arrayfun(@num2str, 1:app.order , 'UniformOutput', 0);
                    app.SHorderDropDown.Value = arrayfun(@num2str, app.order , 'UniformOutput', 0);
                case 64
                    app.PresetsDropDown.Items = {'HOA (7th order)'};
                    app.PresetsDropDown.Value = 'HOA (7th order)';
                    app.RunanalysisButton.Enable = "on";
                    app.isAmbisonic = true;
                    app.order = 7;
                    app.SelectchannelDropDown.Items = {'omni','1','2','3','4','5','6','7','8','9','10','11','12',...
                        '13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30',...
                        '31','32','33','34','35','36','37','38','39','40','46','47','48','49','50','51','52','53',...
                        '54','55','56','57','58','59','60','61','62','63'};
                    app.SelectchannelDropDown.Value = 'omni';
                    app.channel = app.SelectchannelDropDown.Value;
                    app.SHorderDropDown.Items = arrayfun(@num2str, 1:app.order , 'UniformOutput', 0);
                    app.SHorderDropDown.Value = arrayfun(@num2str, app.order , 'UniformOutput', 0);
            end


            %%
            app.PresetsDropDown.Enable = "on";            
            app.CreateandexportspectrogramButton.Enable = "on";
        end

        % Value changed function: PresetsDropDown
        function PresetsDropDownValueChanged(app, event)
            preset = app.PresetsDropDown.Value;

            switch  preset
                case  "FOA"
                    app.LoadArrayButton.Enable = "off";
                    app.EditArrayButton.Enable = "off";
                    app.RunanalysisButton.Enable = "on";
                    app.isAmbisonic = true;
                    app.order = 1;
                    app.SelectchannelDropDown.Items = {'omni','1','2','3'};
                    app.SelectchannelDropDown.Value = 'omni';
                    app.channel = app.SelectchannelDropDown.Value;
                    app.SHorderDropDown.Items = arrayfun(@num2str, 1:app.order , 'UniformOutput', 0);
                    app.SHorderDropDown.Value = arrayfun(@num2str, app.order , 'UniformOutput', 0);
                case  "HOA (3rd order)"
                    app.LoadArrayButton.Enable = "off";
                    app.EditArrayButton.Enable = "off";
                    app.RunanalysisButton.Enable = "on";
                    app.isAmbisonic = true;
                    app.order = 3;
                    app.SelectchannelDropDown.Items = {'omni','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15'};
                    app.SelectchannelDropDown.Value = 'omni';
                    app.channel = app.SelectchannelDropDown.Value;
                    app.SHorderDropDown.Items = arrayfun(@num2str, 1:app.order , 'UniformOutput', 0);
                    app.SHorderDropDown.Value = arrayfun(@num2str, app.order , 'UniformOutput', 0);
                otherwise
                    app.LoadArrayButton.Enable = "on";
                    app.RunanalysisButton.Enable = "off";
                    app.isAmbisonic = false;
            end

        end

        % Button pushed function: LoadArrayButton
        function LoadArrayButtonPushed(app, event)
               
         %% Load correct array and update f_end (=f_alias)    

         switch app.PresetsDropDown.Value
             case "4-hydrophone (t-design)"
                app.SelectchannelDropDown.Items = {'omni','1','2','3','4'};
                app.SelectchannelDropDown.Value = 'omni';
                app.channel = app.SelectchannelDropDown.Value;
                % Load array
                load t_design_xyz_Q4_rot.mat
                [azim,elev,~] = cart2sph(xyz(:,1),xyz(:,2),xyz(:,3));
                app.hydro_dirs_rad = [azim, elev];
                app.R = 0.173;
                app.c0 = 1536.4;
                app.arrayType = 'open';
                app.order = floor(sqrt(size(xyz,1))-1);
                app.SHorderDropDown.Items = arrayfun(@num2str, 1:app.order , 'UniformOutput', 0);
                app.SHorderDropDown.Value = arrayfun(@num2str, app.order , 'UniformOutput', 0);
                % Update Labels
                app.Label.Text = '> 500 Hz';
                f_alias = findAliasFreq(app,app.hydro_dirs_rad(:,1),app.hydro_dirs_rad(:,2),app.M,app.R,app.c0);
                app.Label_2.Text = ['< ' num2str(f_alias) ' Hz'];
             case "16-hydrophone (t-design)"
                app.SelectchannelDropDown.Items = {'omni','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16'};
                app.SelectchannelDropDown.Value = 'omni';
                app.channel = app.SelectchannelDropDown.Value;
                % Load array
                load t_design_xyz_Q16.mat
                [azim,elev,~] = cart2sph(xyz(:,1),xyz(:,2),xyz(:,3));
                app.hydro_dirs_rad = [azim, elev];
                app.R = 0.3;
                app.c0 = 1480;
                app.arrayType = 'rigid';
                app.order = floor(sqrt(size(xyz,1))-1);
                app.SHorderDropDown.Items = arrayfun(@num2str, 1:app.order , 'UniformOutput', 0);
                app.SHorderDropDown.Value = arrayfun(@num2str, app.order , 'UniformOutput', 0);
                % Update Labels
                app.Label.Text = '> 300 Hz';
                f_alias = findAliasFreq(app,app.hydro_dirs_rad(:,1),app.hydro_dirs_rad(:,2),app.M,app.R,app.c0);
                app.Label_2.Text = ['< ' num2str(f_alias) ' Hz'];
             case "20-hydrophone (t-design)"
                app.SelectchannelDropDown.Items = {'omni','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20'};
                app.SelectchannelDropDown.Value = 'omni';
                app.channel = app.SelectchannelDropDown.Value;
                % Load array
                load t_design_xyz_Q20_rot.mat
                [azim,elev,~] = cart2sph(xyz(:,1),xyz(:,2),xyz(:,3));
                app.hydro_dirs_rad = [azim, elev];
                app.R = 0.216;
                app.c0 = 1536.4;
                app.arrayType = 'rigid';
                app.order = floor(sqrt(size(xyz,1))-1);
                app.SHorderDropDown.Items = arrayfun(@num2str, 1:app.order , 'UniformOutput', 0);
                app.SHorderDropDown.Value = arrayfun(@num2str, app.order , 'UniformOutput', 0);
                % Update Labels
                 app.Label.Text = '> 300 Hz';
                f_alias = findAliasFreq(app,app.hydro_dirs_rad(:,1),app.hydro_dirs_rad(:,2),app.M,app.R,app.c0);
                app.Label_2.Text = ['< ' num2str(f_alias) ' Hz'];
         end


        app.EditArrayButton.Enable = "on";
        app.RunanalysisButton.Enable = "on";
        end

        % Button pushed function: EditArrayButton
        function EditArrayButtonPushed(app, event)
            app.EditArrayButton.Enable = 'off';

            hydro_dirs_deg = app.hydro_dirs_rad*180/pi;
            app.DialogBoxApp = DialogBoxCoordinates_auto(app, hydro_dirs_deg, app.R, app.c0, app.arrayType);

        end

        % Button pushed function: LoadlogfileButton
        function LoadlogfileButtonPushed(app, event)
           
            %% Load log file
            
            if app.RAVENButton.Value == true
                [file_in,path_in] = uigetfile('*.txt');
                fileName = fullfile(path_in,file_in);

                LOG0 = readmatrix(fileName);
                LOG = [ [0 0.5 500 1000]; LOG0]; % adding a dummy detection at t=0sec

                app.t_start_Det = max(0,LOG(:,1)-app.tausecEditField.Value);   % extend by tau | use max() to avoid negative times
                app.t_end_Det   = LOG(:,2)+app.tausecEditField.Value;   % extend by tau

                app.f_start_Det = LOG(:,3);
                app.f_end_Det = LOG(:,4);

                app.Ndet = size(LOG,1);
                app.Labels = cell(app.Ndet,1);
                for n=1:app.Ndet
                    app.Labels{n} = num2str(app.t_start_Det(n));
                end
            elseif app.AdobeAuditionButton_2.Value == true
                [file_in,path_in] = uigetfile('*.csv');
                fileName = fullfile(path_in,file_in);

                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% OLD .csv type %%%%%%%%%%%%%%%
               % LOG0 = readmatrix(fileName);
               % F_sampling = LOG0(1,5);
               % LOG = [ [NaN  NaN  0 0.5*F_sampling  F_sampling  NaN NaN]; LOG0]; % adding a dummy detection at t=0sec

               % app.Ndet = size(LOG,1);

               % app.t_start_Det = max(0,LOG(:,3)./F_sampling-app.tausecEditField.Value);
               % app.t_end_Det   = app.t_start_Det + LOG(:,4)./F_sampling+app.tausecEditField.Value;
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                LOG0 = readtable(fileName);

                Fs_char = LOG0.TimeFormat{1};
                tf=1; i=0;
                while tf==1
                    i=i+1;
                    [~,tf] = str2num(Fs_char(1:i));
                end
                F_sampling = str2double(Fs_char(1:i-2));

                app.Ndet = size(LOG0,1)+1; % including the dummy detection

                tmp1 = max(0,LOG0.Start./F_sampling-app.tausecEditField.Value);
                app.t_start_Det  = [0; tmp1];
                tmp2   = tmp1 + LOG0.Duration./F_sampling+app.tausecEditField.Value;
                app.t_end_Det  = [0.5; tmp2];

                app.f_start_Det = 200*ones(app.Ndet,1);
                app.f_end_Det   = 2500*ones(app.Ndet,1);

                app.Labels = cell(app.Ndet,1);
                for n=1:app.Ndet
                    app.Labels{n} = num2str(app.t_start_Det(n));
                end

            end

            app.logFile_loaded = true;
        end

        % Value changed function: TimewindowmsecEditField
        function TimewindowmsecEditFieldValueChanged(app, event)
            app.Twin = 1e-3*app.TimewindowmsecEditField.Value;
            app.Nwin = round(app.Twin*app.Fs); % window number of samples
            if mod(app.Nwin,8) ~= 0 % Nwin must be divisible by 8
                app.Nwin  = app.Nwin-mod(app.Nwin,8);
            end
            app.samplesEditField.Value = app.Nwin;

            %%%%%%%%%%%%%%%%%%%%%%%%%%%
            app.fps = round(2/app.Twin); % rounding the frame rate
            app.msecEditField.Value = (app.nb_av+1)*app.Twin/2*1000; % averaging time in msec
        end

        % Button pushed function: RunanalysisButton
        function RunanalysisButtonPushed(app, event)
            app.DoneLamp.Color = [0.65 0.65 0.65];

            if app.isAmbisonic==false

                %% Segment file into Ndet files
                app.xDet = cell(app.Ndet,1);
                for n=1:app.Ndet
                    [~,i_t1]= min(abs(app.time_vec-app.t_start_Det(n)));
                    [~,i_t2]= min(abs(app.time_vec-app.t_end_Det(n)));
                    app.xDet{n} = app.x(i_t1:i_t2,:);
                end

                %% TF transform
                app.hopsize = app.Nwin/2;

                app.XDet = cell(app.Ndet,1);
                app.NwindowsDet =zeros(app.Ndet,1);
                app.timeDet = cell(app.Ndet,1);
                for n=1:app.Ndet

                    x_n = app.xDet{n};
                    N_n = size(x_n,1); % number of samples
                    Nwindows = length(0:app.hopsize:N_n)+1; % number of time windows

                    X = zeros(app.Nwin,Nwindows,app.M);
                    for m=1:app.M
                        [X(:,:,m),time,freq_full] = stft(x_n(:,m),app.Nwin,app.hopsize,app.Fs);
                    end
                    app.XDet{n} = X(1:app.Nwin/2+1,:,:);

                    app.NwindowsDet(n) = length(time);  %% = Nwindows
                    app.timeDet{n} = time;
                end

                app.freq = freq_full(1:app.Nwin/2+1);
                Nbins = length(app.freq);

                % display(['Nwindows, Nbins: ' num2str(Nwindows), num2str(Nbins) ])

                %% Encode to SHs
                aziElev2aziPolar = @(dirs) [dirs(:,1) pi/2-dirs(:,2)]; % function to convert from azimuth-elevation to azimuth-inclination

                Y_hydro = sqrt(4*pi)*getSH(app.order,aziElev2aziPolar(app.hydro_dirs_rad),'real');

                if app.EncodingDropDown.Value == "transpose"
                    Ye_hydro = (1/app.M)*Y_hydro.'; % for uniform array
                elseif app.EncodingDropDown.Value == "pinv (for gen2)"
                    Ye_hydro = pinv(Y_hydro); % for any array
                end


                %%%%%%%%%% Same as arraySHTfiltersTheory_radInverse_hydro
                kR = 2*pi*app.freq*app.R/app.c0;
                bN = sphModalCoeffs(app.order, kR, app.arrayType)/(4*pi);
                a_dB = app.MaxgaindBEditField.Value;
                alpha = sqrt(app.M)*10^(a_dB/20);
                beta = sqrt((1-sqrt(1-1/alpha^2))/(1+sqrt(1-1/alpha^2)));
                wN = conj(bN)./(abs(bN).^2 + beta^2*ones(Nbins,app.order+1));

                W_enc = zeros((app.order+1)^2,app.M,Nbins);
                for k=1:Nbins
                    W_enc(:,:,k)= diag(replicatePerOrder(wN(k,:),2))*Ye_hydro;
                end

                app.SDet = cell(app.Ndet,1);
                for n=1:app.Ndet
                    X_n = app.XDet{n};
                    S = zeros((app.order+1)^2,app.NwindowsDet(n),Nbins);
                    for k=1:Nbins
                        S(:,:,k) = W_enc(:,:,k)*squeeze(X_n(k,:,:)).';
                    end
                    app.SDet{n} = S;
                end

                %% Get the Omnis for the spectrogram
                app.OmniDet = cell(app.Ndet,1);
                app.omniDet = cell(app.Ndet,1);

                for n=1:app.Ndet

                    S_n = app.SDet{n};
                    Omni = squeeze(S_n(1,:,:)).';
                    app.OmniDet{n} = Omni;

                    %%%% ISTFT
                    temp = Omni;
                    temp(end,:) = real(temp(end,:));
                    temp = [temp; conj(temp(end-1:-1:2,:))];
                    omni = real(istft(temp,app.Nwin,app.hopsize));
                    app.omniDet{n} = omni;
                   % display(['omni dimensions: ' num2str(size(omni))])
                end


            elseif app.isAmbisonic==true

                %% Segment file into Ndet files
                app.sDet = cell(app.Ndet,1);
                for n=1:app.Ndet
                    [~,i_t1]= min(abs(app.time_vec-app.t_start_Det(n)));
                    [~,i_t2]= min(abs(app.time_vec-app.t_end_Det(n)));
                    app.sDet{n} = app.x(i_t1:i_t2,:);
                end


                %% TF transform
                app.hopsize = app.Nwin/2;

                app.SDet = cell(app.Ndet,1);
                app.NwindowsDet =zeros(app.Ndet,1);
                app.timeDet = cell(app.Ndet,1);
                for n=1:app.Ndet

                    s_n = app.sDet{n};
                    N_n = size(s_n,1); % number of samples
                    Nwindows = length(0:app.hopsize:N_n)+1; % number of time windows

                    S = zeros(app.Nwin,Nwindows,app.M);
                    for m=1:app.M
                        [S(:,:,m),time,freq_full] = stft(s_n(:,m),app.Nwin,app.hopsize,app.Fs);
                    end
                    Stmp =  S(1:app.Nwin/2+1,:,:);
                    app.SDet{n} = permute(Stmp,[3 2 1]);

                    app.NwindowsDet(n) = length(time);  %% = Nwindows
                    app.timeDet{n} = time;
                end

                app.freq = freq_full(1:app.Nwin/2+1);
                %  Nbins = length(app.freq);

                %% Get the Omnis for the spectrogram
                app.OmniDet = cell(app.Ndet,1);
                app.omniDet = cell(app.Ndet,1);

                for n=1:app.Ndet

                    s_n = app.sDet{n};
                    omni = s_n(:,1);
                    app.omniDet{n} = omni;

                    S_n = app.SDet{n};
                    Omni = squeeze(S_n(1,:,:)).';
                    app.OmniDet{n} = Omni;

                end


            end


            %% Update f_start and f_end fields
            app.DetNum = app.DetectionEditField.Value;
            app.f_startHzEditField.Value = app.f_start_Det(app.DetNum);
            app.f_endHzEditField.Value = app.f_end_Det(app.DetNum);

            %%
            app.DetectionsFoundLabel.Text = ['Number of detections = ' num2str(app.Ndet)];
            app.DoneLamp.Color = [0 1 0];
            app.PlotspectrogramButton.Enable = "on";
            app.SelectchannelDropDown.Enable = "on";
            app.PlayButton.Enable = "on";
            app.StopButton.Enable = "on";
            app.CreateandexportpowermapsButton.Enable = "on";
            app.ExportambifilesButton.Enable = "on";

        end

        % Value changed function: DetectionEditField
        function DetectionEditFieldValueChanged(app, event)
            app.DetNum = app.DetectionEditField.Value;

            app.f_startHzEditField.Value = app.f_start_Det(app.DetNum);
            app.f_endHzEditField.Value = app.f_end_Det(app.DetNum);
        end

        % Value changed function: SelectchannelDropDown
        function SelectchannelDropDownValueChanged(app, event)
            app.channel = app.SelectchannelDropDown.Value;
        end

        % Button pushed function: PlayButton
        function PlayButtonPushed(app, event)
            n = app.DetectionEditField.Value; % or app.DetNum

            if app.isAmbisonic==false
                x_n = app.xDet{n};
                if app.channel == "omni"
                    soundsc(app.omniDet{n},app.Fs);
                else
                    soundsc(x_n(:,str2double(app.channel)),app.Fs);
                end
            elseif app.isAmbisonic==true
                s_n = app.sDet{n};
                if app.channel == "omni"
                    soundsc(app.omniDet{n},app.Fs);
                else
                    soundsc(s_n(:,str2double(app.channel)),app.Fs);
                end
            end
        end

        % Button pushed function: StopButton
        function StopButtonPushed(app, event)
            clear sound;
        end

        % Value changed function: EditFieldThreshold_2
        function EditFieldThreshold_2ValueChanged(app, event)
            if app.EditFieldThreshold_2.Value >=-100 && app.EditFieldThreshold_2.Value <=-0.1
                app.ThresholddBSlider_2.Value = app.EditFieldThreshold_2.Value;
                app.threshold_Sp = app.EditFieldThreshold_2.Value;
            end
        end

        % Value changed function: ThresholddBSlider_2
        function ThresholddBSlider_2ValueChanged(app, event)
           app.threshold_Sp = app.ThresholddBSlider_2.Value;
           app.EditFieldThreshold_2.Value = app.ThresholddBSlider_2.Value;
        end

        % Value changing function: ThresholddBSlider_2
        function ThresholddBSlider_2ValueChanging(app, event)
            app.threshold_Sp = event.Value;
            app.EditFieldThreshold_2.Value = event.Value;
            clim(app.UIAxes,[app.threshold_Sp 0])
        end

        % Button pushed function: PlotspectrogramButton
        function PlotspectrogramButtonPushed(app, event)
            n = app.DetectionEditField.Value; % or app.DetNum

            if app.isAmbisonic==false
                X_n = app.XDet{n};
                Omni_n = app.OmniDet{n};
                time_n = app.timeDet{n};

                fCut = app.f_cutHzEditField.Value;
                [~,i_fCut]= min(abs(app.freq-fCut));
                freq_sp= app.freq(1:i_fCut);

                if  app.SelectchannelDropDown.Value == "omni"
                    Omni_sp = Omni_n(1:i_fCut,:);
                    Omni_sp = Omni_sp./max(max(abs(Omni_sp)));
                    surf(app.UIAxes,time_n,freq_sp,20*log10(abs(Omni_sp)),"EdgeColor","none")
                    xlim(app.UIAxes,[0 time_n(end)])
                    ylim(app.UIAxes,[0 fCut])
                    view(app.UIAxes,2)
                    colormap(app.UIAxes,'jet');
                    clim(app.UIAxes,[app.threshold_Sp 0])
                else
                    X_sp = X_n(1:i_fCut,:,:);
                    X_sp = X_sp/max(max(max(abs(X_sp))));
                    surf(app.UIAxes,time_n,freq_sp,20*log10(abs(X_sp(:,:,str2double(app.channel)))),"EdgeColor","none")
                    xlim(app.UIAxes,[0 time_n(end)])
                    ylim(app.UIAxes,[0 fCut])
                    view(app.UIAxes,2)
                    colormap(app.UIAxes,'jet');
                    clim(app.UIAxes,[app.threshold_Sp 0])
                end
            elseif  app.isAmbisonic==true
                Stmp = app.SDet{n};
                S_n = permute(Stmp,[3 2 1]);
                Omni_n = app.OmniDet{n};
                time_n = app.timeDet{n};

                fCut = app.f_cutHzEditField.Value;
                [~,i_fCut]= min(abs(app.freq-fCut));
                freq_sp= app.freq(1:i_fCut);

                if  app.SelectchannelDropDown.Value == "omni"
                    Omni_sp = Omni_n(1:i_fCut,:);
                    Omni_sp = Omni_sp./max(max(abs(Omni_sp)));
                    surf(app.UIAxes,time_n,freq_sp,20*log10(abs(Omni_sp)),"EdgeColor","none")
                    xlim(app.UIAxes,[0 time_n(end)])
                    ylim(app.UIAxes,[0 fCut])
                    view(app.UIAxes,2)
                    colormap(app.UIAxes,'jet');
                    clim(app.UIAxes,[app.threshold_Sp 0])
                else

                    S_sp = S_n(1:i_fCut,:,:);
                    S_sp = S_sp/max(max(max(abs(S_sp))));
                    surf(app.UIAxes,time_n,freq_sp,20*log10(abs(S_sp(:,:,str2double(app.channel)))),"EdgeColor","none")
                    xlim(app.UIAxes,[0 time_n(end)])
                    ylim(app.UIAxes,[0 fCut])
                    view(app.UIAxes,2)
                    colormap(app.UIAxes,'jet');
                    clim(app.UIAxes,[app.threshold_Sp 0])
                end

            end
        end

        % Value changed function: f_startHzEditField
        function f_startHzEditFieldValueChanged(app, event)
            n = app.DetNum;
            app.f_start_Det(n) = app.f_startHzEditField.Value;
        end

        % Value changed function: f_endHzEditField
        function f_endHzEditFieldValueChanged(app, event)
            n = app.DetNum;
            app.f_end_Det(n) = app.f_endHzEditField.Value;
        end

        % Value changed function: ColormapDropDown
        function ColormapDropDownValueChanged(app, event)
            app.col = app.ColormapDropDown.Value;
        end

        % Value changed function: EditFieldThreshold
        function EditFieldThresholdValueChanged(app, event)
            if app.EditFieldThreshold.Value >=-30 && app.EditFieldThreshold.Value <=-0.1
            app.ThresholddBSlider.Value = app.EditFieldThreshold.Value;
            app.threshold = app.EditFieldThreshold.Value;
            end
        end

        % Value changed function: ThresholddBSlider
        function ThresholddBSliderValueChanged(app, event)
            app.threshold = app.ThresholddBSlider.Value;
            app.EditFieldThreshold.Value = app.ThresholddBSlider.Value;
            % display(['threshold = ' num2str(app.threshold)])
        end

        % Value changing function: ThresholddBSlider
        function ThresholddBSliderValueChanging(app, event)
            app.threshold  = event.Value;
            app.EditFieldThreshold.Value = event.Value;
        end

        % Value changed function: AvgwindowsEditField
        function AvgwindowsEditFieldValueChanged(app, event)
            app.nb_av = app.AvgwindowsEditField.Value;
            app.msecEditField.Value = (app.nb_av+1)*app.Twin/2*1000; % averaging time in msec
        end

        % Button pushed function: CreateandexportpowermapsButton
        function CreateandexportpowermapsButtonPushed(app, event)
            app.CreateandexportpowermapsButton.Enable = 'off';
            app.DoneLamp_2.Color = [0.65 0.65 0.65];

            % Select directory to save the videos, the text file, and the edl
            selpath = uigetdir;

            %%%% Prepare the text file
            txt_FileName = "project.txt";
            txt_fullFileName  = fullfile(selpath,txt_FileName);


            aziElev2aziPolar = @(dirs) [dirs(:,1) pi/2-dirs(:,2)]; % function to convert from azimuth-elevation to azimuth-inclination

            switch app.GridDropDown.Value
                case "coarse uniform"  % Steering directions in uniform grid
                    phi_deg = -180:9:180; % azimuth
                    phi = phi_deg*pi/180;
                    theta_deg = -90:9:90; % elevation (as in Matlab)
                    theta = theta_deg*pi/180;
                    [PHI, THETA] = meshgrid(phi,theta);
                    grid_dirs = [PHI(:) THETA(:)];
                    L = length(grid_dirs);
                case "fine uniform"  % Steering directions in uniform grid
                    phi_deg = -180:2:180; % azimuth
                    phi = phi_deg*pi/180;
                    theta_deg = -90:2:90; % elevation (as in Matlab)
                    theta = theta_deg*pi/180;
                    [PHI, THETA] = meshgrid(phi,theta);
                    grid_dirs = [PHI(:) THETA(:)];
                    L = length(grid_dirs);
                case "coarse t-design" % Steering directions in t-design grid
                    % Uniform grid for plotting
                    phi_deg = -180:2:180; % azimuth
                    phi = phi_deg*pi/180;
                    theta_deg = -90:2:90; % elevation (as in Matlab)
                    theta = theta_deg*pi/180;
                    [PHI, THETA] = meshgrid(phi,theta);
                    % Load t-design grid
                    Tdesign = loadSphGrid('N040_M840_Octa.dat');
                    grid_dirs_tdesign = Tdesign.aziElev;
                    phi_edge = (-pi:pi/5:pi)'; % azimuth
                    theta_edge = (-pi/2:pi/5:pi/2)';
                    grid_dirs_up = [phi_edge pi/2*ones(length(phi_edge),1)];
                    grid_dirs_down = [phi_edge -pi/2*ones(length(phi_edge),1)];
                    grid_dirs_left = [-pi*ones(length(theta_edge(2:end-1)),1) theta_edge(2:end-1)];
                    grid_dirs_right = [pi*ones(length(theta_edge(2:end-1)),1) theta_edge(2:end-1)];
                    grid_dirs_edges = [grid_dirs_up; grid_dirs_down; grid_dirs_left; grid_dirs_right];
                    grid_dirs = [grid_dirs_tdesign; grid_dirs_edges]; % add the extra directions for the edges
                    L = length(grid_dirs);
                case  "fine t-design" % Steering directions in t-design grid
                    % Uniform grid for plotting
                    phi_deg = -180:2:180; % azimuth
                    phi = phi_deg*pi/180;
                    theta_deg = -90:2:90; % elevation (as in Matlab)
                    theta = theta_deg*pi/180;
                    [PHI, THETA] = meshgrid(phi,theta);
                    % Load t-design grid
                    Tdesign = loadSphGrid('N100_M5100_Tetra.dat');
                    grid_dirs_tdesign = Tdesign.aziElev;
                    phi_edge = (-pi:pi/5:pi)'; % azimuth
                    theta_edge = (-pi/2:pi/5:pi/2)';
                    grid_dirs_up = [phi_edge pi/2*ones(length(phi_edge),1)];
                    grid_dirs_down = [phi_edge -pi/2*ones(length(phi_edge),1)];
                    grid_dirs_left = [-pi*ones(length(theta_edge(2:end-1)),1) theta_edge(2:end-1)];
                    grid_dirs_right = [pi*ones(length(theta_edge(2:end-1)),1) theta_edge(2:end-1)];
                    grid_dirs_edges = [grid_dirs_up; grid_dirs_down; grid_dirs_left; grid_dirs_right];
                    grid_dirs = [grid_dirs_tdesign; grid_dirs_edges]; % add the extra directions for the edges
                    L = length(grid_dirs);
            end


            % Weights for hypercardioid
            Y_grid = sqrt(4*pi)*getSH(app.order,aziElev2aziPolar(grid_dirs),'real');
            W_hc = Y_grid./(app.order+1)^2;

            % Selection of highest order for powermap
            orderN = str2double(app.SHorderDropDown.Value);
            N_comp = (orderN+1)^2;


            %% Loop over detection number

            line_counter=1; % for the text file
            for n=1:app.Ndet

                app.LabelDetectionNumber.Text = ['Detection # ' num2str(n)];

                %% Beamforming parameters

                % Time range
                T = app.NwindowsDet(n); % number of frames

                % Frequency range
                [~,indf1]=min(abs( app.freq-app.f_start_Det(n)));
                [~,indf2]=min(abs(app.freq-app.f_end_Det(n)));
                indf=indf1:indf2;

                K = length(indf); % number of frequencies to average over

                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                % Use a subset of frequencies for lighter computation
                if K>50
                    K_approx = 40;
                    df=floor(K/K_approx);
                    indf=indf1:df:indf2;
                    K = length(indf);
                end
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                S_n = app.SDet{n};

                %%  Beamforming

                switch app.MethodDropDown.Value
                    case "SH-Beamforming"
                        P_avf = zeros(L,T);
                        for tt=1:T
                            power = abs(W_hc(:,1:N_comp)*squeeze(S_n(1:N_comp,tt,indf))).^2;
                            P_avf(:,tt) = mean(power,2);
                            app.LabelProgress.Text = ['Processed ' num2str(fix(round(tt/T*100)*10^3)/10^3) '%'];
                            pause(eps)
                        end
                    case "SH-MVDR"
                        a_tau = 0.8; % temporal smoothing constant
                        P_avf = zeros(L,T);
                        COV_old = zeros(N_comp,N_comp,K);
                        for tt=1:T
                            temp_p = zeros(K,L);
                            for kk=1:K
                                Sk =  S_n(1:N_comp,tt,indf(kk));
                                COV_new = Sk*Sk'+1e-6*eye(N_comp);
                                if tt==1
                                    COV = COV_new;
                                else
                                    COV = (1-a_tau)*COV_new + a_tau*COV_old(:,:,kk);
                                end
                                COV_old(:,:,kk)=COV;
                                tempk_p = zeros(1,L);
                                for l = 1:L
                                    w_hc = W_hc(l,1:N_comp).';
                                    invC_w = COV\w_hc;
                                    wH_invC_w = w_hc'*invC_w;
                                    tempk_p(l) = abs(1/wH_invC_w);
                                end
                                temp_p(kk,:)=tempk_p;
                            end
                            P_avf(:,tt) = mean(temp_p,1);
                            app.LabelProgress.Text = ['Processed ' num2str(fix(round(tt/T*100)*10^3)/10^3) '%'];
                            pause(eps)
                        end
                    case "SH-MUSIC"
                        nSrc = app.N_sourcesMUSICEditField.Value;
                        a_tau = 0.8; % temporal smoothing constant
                        P_avf = zeros(L,T);
                        COV_old = zeros(N_comp,N_comp,K);
                        for tt=1:T
                            temp_p = zeros(K,L);
                            for kk=1:K
                                Sk =  S_n(1:N_comp,tt,indf(kk));
                                COV_new = Sk*Sk'+1e-6*eye(N_comp);
                                if tt==1
                                    COV = COV_new;
                                else
                                    COV = (1-a_tau)*COV_new + a_tau*COV_old(:,:,kk);
                                end
                                COV_old(:,:,kk)=COV;
                                [U,~] = svd(COV); % eigenvalue decomposition with svd
                                Un = U(:,(nSrc+1):N_comp); % Noise subspace
                                tempk_p = zeros(1,L);
                                for l = 1:L
                                    w_hc = W_hc(l,1:N_comp).';
                                    tempk_p(l) = abs(1/(w_hc'*(Un*Un')*w_hc)); % pseudospectrum
                                end
                                temp_p(kk,:)=tempk_p;
                            end
                            P_avf(:,tt) = mean(temp_p,1);
                            app.LabelProgress.Text = ['Processed ' num2str(fix(round(tt/T*100)*10^3)/10^3) '%'];
                            pause(eps)
                        end
                    case "CroPaC"
                        M_rot = zeros(N_comp,N_comp,L);
                        for l=1:L
                            Rot = euler2rotationMatrix(grid_dirs(l,1), -grid_dirs(l,2), 0, 'zyx'); % yaw-pitch-roll
                            M_rot(:,:,l) = getSHrotMtx(Rot, orderN, 'real');
                        end
                        P_avf = zeros(L,T);
                        for tt=1:T
                            St = squeeze(S_n(1:N_comp,tt,indf));
                            for l=1:L
                                St_rot = M_rot(:,:,l)*St;
                                G_num = 2/sqrt(3)*real(conj(St_rot(1,:)).*St_rot(4,:));
                                G_den = abs(St_rot(1,:)).^2 + sum(abs(St_rot(2:4,:)/sqrt(3)).^2);
                                G = max(0,G_num./(G_den+eps));
                                P_avf(l,tt) = mean(G);
                            end
                            app.LabelProgress.Text = ['Processed ' num2str(fix(round(tt/T*100)*10^3)/10^3) '%'];
                            pause(eps)
                        end
                end



                % Temporal smoothing 
                P_avf = movmean(P_avf,app.nb_av,2); % no averaging for nb_av=1

                % Normalization
                if app.altnormCheckBox.Value == false
                    P_avfn = P_avf./max(max(P_avf));
                elseif app.altnormCheckBox.Value == true
                    P_avfn = P_avf./max(P_avf);
                end


                %% Calling the RenderPowermap app to create the powermap
                app.PowermapApp = RenderPowermap_auto(app,T,grid_dirs,PHI,THETA,P_avfn);


                %% %%%%%%% Save as video

                label = app.Labels{n};
                videoFileName = ['powermap_' label 'sec.mp4'];
                ClipNames{n} = videoFileName;
                fullFileName  = fullfile(selpath,videoFileName);
                writerObj = VideoWriter(fullFileName, 'MPEG-4');
                % writerObj.FrameRate = 25; % ---> frames should update every 40 ms
                writerObj.FrameRate = app.fps;
                writerObj.Quality = 100;

                open(writerObj)
                writeVideo(writerObj,app.F);
                close(writerObj);


                %%%% Write in text file
                n_strPadded = sprintf( '%03d', line_counter) ;
                lines = [n_strPadded '   ' videoFileName '  ' num2str(app.t_start_Det(n)) '  ' num2str(app.t_end_Det(n))  '  ' num2str(writerObj.FrameCount)];
                writelines(lines,txt_fullFileName,WriteMode="append")

                line_counter = line_counter+1;
                n_strPadded_next = sprintf( '%03d', line_counter);
                writelines(n_strPadded_next,txt_fullFileName,WriteMode="append")

                line_counter = line_counter+1;


            end


            %% Create the edl file
            opacity = 50; %%% could be entered by user
            N_frames = app.NwindowsDet-1;


            % clip lines
            for n=1:app.Ndet
                clip_in{n}  = '00:00:00:00';
                clip_out{n} = frames_to_timecode(N_frames(n),app.fps);
                time_in{n}  = seconds_to_timecode(app.t_start_Det(n),app.fps);
                time_out{n} = timecode_addition(time_in{n},clip_out{n},app.fps);
            end

            % black lines
            for n=1:app.Ndet-1
                bl_in{n}  = '00:00:00:00';
                bl_out{n} = timecode_difference(time_in{n+1},time_out{n},app.fps);
                bl_time_in{n}  = time_out{n};  % or plus one frame
                bl_time_out{n} = time_in{n+1}; % or minus one frame
            end


            % Write in edl file
            edl_FileName = "testEDL.edl";
            edl_fullFileName  = fullfile(selpath,edl_FileName);

            % write header
            writelines('TITLE: testing edl' ,edl_fullFileName,WriteMode="append")
            writelines('FCM: NON-DROP FRAME' ,edl_fullFileName,WriteMode="append")
            writelines('' ,edl_fullFileName,WriteMode="append") % blank

            line_count= 1;
            for n=1:app.Ndet-1

                % clip lines
                n_strPadded = sprintf( '%03d', line_count);
                lines = [n_strPadded  '    AX  B  C      '   clip_in{n} '  ' clip_out{n} '  ' time_in{n} '  ' time_out{n}];
                writelines(lines,edl_fullFileName,WriteMode="append")
                writelines(['* FROM CLIP NAME: ' ClipNames{n}] ,edl_fullFileName,WriteMode="append")
                writelines(['* OPACITY LEVEL AT 00:00:00:00 IS  ' num2str(opacity) '%    (REEL AX)'] ,edl_fullFileName,WriteMode="append")
                writelines('* AUDIO LEVEL AT 00:00:00:00 IS  -0.00 DB  (REEL AX A1)' ,edl_fullFileName,WriteMode="append")
                writelines('' ,edl_fullFileName,WriteMode="append") % blank
                line_count= line_count+1;

                % black lines
                n_strPadded = sprintf( '%03d', line_count);
                lines = [n_strPadded  '    BL  V  C      '   bl_in{n} '  ' bl_out{n} '  ' bl_time_in{n} '  ' bl_time_out{n}];
                writelines(lines,edl_fullFileName,WriteMode="append")
                writelines('' ,edl_fullFileName,WriteMode="append") % blank
                line_count= line_count+1;
            end

            % For last clip
            n_strPadded = sprintf( '%03d', line_count);
            lines = [n_strPadded  '    AX  B  C      '   clip_in{app.Ndet} '  ' clip_out{app.Ndet} '  ' time_in{app.Ndet} '  ' time_out{app.Ndet}];
            writelines(lines,edl_fullFileName,WriteMode="append")
            writelines(['* FROM CLIP NAME: ' ClipNames{app.Ndet} ] ,edl_fullFileName,WriteMode="append")
            writelines(['* OPACITY LEVEL AT 00:00:00:00 IS  ' num2str(opacity) '%    (REEL AX)'] ,edl_fullFileName,WriteMode="append")
            writelines('* AUDIO LEVEL AT 00:00:00:00 IS  -0.00 DB  (REEL AX A1)' ,edl_fullFileName,WriteMode="append")

            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            app.DoneLamp_2.Color = [0 1 0];
            app.CreateandexportpowermapsButton.Enable = 'on';
        end

        % Button pushed function: ExportambifilesButton
        function ExportambifilesButtonPushed(app, event)
            app.ExportambifilesButton.Enable = 'off';
            app.DoneLamp_4.Color = [0.65 0.65 0.65];

            % Select directory to save the videos, the text file, and the edl
            selpath = uigetdir;



            if app.isAmbisonic==false
                for n=1:app.Ndet
                    S_n = app.SDet{n};
                    s_n=[];
                    for j=1:size(S_n,1) % loop over ambisonic components
                        temp = squeeze(S_n(j,:,:)).';
                        %%%% ISTFT
                        temp(end,:) = real(temp(end,:));
                        temp = [temp; conj(temp(end-1:-1:2,:))];
                        s_nj = real(istft(temp,app.Nwin,app.hopsize)); % ambisonic component j
                        s_n = [s_n s_nj]; % collecting all ambisonic components
                    end

                    label = app.Labels{n};
                    ambiFileName = ['ambi_' label 'sec.wav'];
                    fullFileName  = fullfile(selpath,ambiFileName);
                    audiowrite(fullFileName, s_n, app.Fs,'BitsPerSample',32);
                end
            elseif app.isAmbisonic==true
                for n=1:app.Ndet
                    s_n = app.sDet{n};

                    label = app.Labels{n};
                    ambiFileName = ['ambi_' label 'sec.wav'];
                    fullFileName  = fullfile(selpath,ambiFileName);
                    audiowrite(fullFileName, s_n, app.Fs,'BitsPerSample',32);
                end

            end


            app.DoneLamp_4.Color = [0 1 0];
            app.ExportambifilesButton.Enable = 'on';
        end

        % Button pushed function: CreateandexportspectrogramButton
        function CreateandexportspectrogramButtonPushed(app, event)
            app.CreateandexportspectrogramButton.Enable = 'off';
            app.DoneLamp_3.Color = [0.65 0.65 0.65];

            % Select directory to save the videos
            selpath = uigetdir;


            %% Take a segment of the file
            t_start = app.t_startsecEditField.Value;    % in seconds
            t_end   = app.t_endsecEditField.Value;      % in seconds

            [~,i_t1]= min(abs(app.time_vec-t_start));
            [~,i_t2]= min(abs(app.time_vec-t_end));

            xL = app.x(i_t1:i_t2,:);
            time_vecL = app.time_vec(i_t1:i_t2);
            N = size(xL,1); % number of samples
            dur = N/app.Fs; % duration in seconds

            %% TF transform parameters

            TF.Twin = 1e-3*app.TimewindowmsecEditField_2.Value; % window duration in seconds
            TF.Nwin = round(TF.Twin*app.Fs); % window number of samples
            if mod(TF.Nwin,2) == 1 % Nwin must be even number
                TF.Nwin = TF.Nwin+1;
            end
            TF.hopsize = TF.Nwin/2;
            TF.Nfft = TF.Nwin;
            
            x_e = [zeros(TF.hopsize,app.M);xL;zeros(TF.Nwin,app.M)]; % extended vector x
            w = sqrt(hanning(TF.Nwin,'periodic')'); % fft window
            Nwindows = floor((length(x_e)-TF.Nwin)/TF.hopsize)+1; %%% should be equal to length(time)

            time = (0:Nwindows-1)*TF.hopsize/app.Fs;
            % Nwindows = length(time);
            freq_full = (0:TF.Nfft-1)*app.Fs/TF.Nfft;
            freqL = freq_full(1:TF.Nwin/2+1);
            NbinsL = length(freqL);

            %% SHT parameters
            aziElev2aziPolar = @(dirs) [dirs(:,1) pi/2-dirs(:,2)]; % function to convert from azimuth-elevation to azimuth-inclination

            Y_hydro = sqrt(4*pi)*getSH(app.order,aziElev2aziPolar(app.hydro_dirs_rad),'real');
            Ye_hydro = (1/app.M)*Y_hydro.';

            %%%%%%%%%% Same as arraySHTfiltersTheory_radInverse_hydro
            kR = 2*pi*freqL*app.R/app.c0;
            bN = sphModalCoeffs(app.order, kR, app.arrayType)/(4*pi);
            a_dB = 0;
            alpha = sqrt(app.M)*10^(a_dB/20);
            beta = sqrt((1-sqrt(1-1/alpha^2))/(1+sqrt(1-1/alpha^2)));
            wN = conj(bN)./(abs(bN).^2 + beta^2*ones(NbinsL,app.order+1));

            W_enc = zeros((app.order+1)^2,app.M,NbinsL); 
            for k=1:NbinsL
                W_enc(:,:,k)= diag(replicatePerOrder(wN(k,:),2))*Ye_hydro;    
            end

            %% Spectrogram parameters

            %%%%%%%%% Remove frequencies above fCut for faster computation
            fCut = app.f_cutHzEditField_2.Value;

            [~,i_fCut]= min(abs(freqL-fCut));
            freq_sp = freqL(1:i_fCut);
            Nbins_sp = length(freq_sp);

            threshold_Sp_video = app.ThresholddBEditField.Value; % user defined
            % sp_max = 30; % a value for normalization (determined experimentally)

            %%%%%%%%% Find sp_max experimentally %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            [~,i_max_x] = max(x_e);
            i_1 = min(i_max_x);
            x_test = x_e(i_1-0.5*app.Fs:i_1+0.5*app.Fs,:); % get a 1-sec segment around the highest peak

            for m=1:app.M
                X_test(:,:,m) = stft(x_test(:,m),TF.Nwin,TF.hopsize,app.Fs);
            end

            for k=1:Nbins_sp
                S_test(:,:,k) = W_enc(:,:,k)*squeeze(X_test(k,:,:)).' ;
            end
            Omni_test = squeeze(S_test(1,:,:));

            sp_max = 1.1*max(max(abs(Omni_test)));
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            %% Spectrogram video parameters

            interval_sp = app.FramelengthsecEditField.Value; % in seconds
            N_sp = round(2*interval_sp/TF.Twin+1); % number of time-windows in a frame
            


            %% Calling the RenderSpectrogram app to create the scrolling spectrogram
            app.SpectrogramApp = RenderSpectrogram_auto(app,selpath,x_e, time, TF, w, N_sp, Nbins_sp, Nwindows, W_enc, t_start, freq_sp, fCut, sp_max, threshold_Sp_video,app.t_start_Det,app.t_end_Det);



            app.DoneLamp_3.Color = [0 1 0];
            app.CreateandexportspectrogramButton.Enable = 'on';

        end

        % Close request function: UIFigure
        function MainAppCloseRequest(app, event)
            % Delete all apps
            delete(app.DialogBoxApp)    
            delete(app.PowermapApp)
            delete(app)
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.AutoResizeChildren = 'off';
            app.UIFigure.Color = [0.9412 0.9412 0.9412];
            app.UIFigure.Position = [300 300 1097 680];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.CloseRequestFcn = createCallbackFcn(app, @MainAppCloseRequest, true);
            app.UIFigure.Scrollable = 'on';

            % Create UIAxes
            app.UIAxes = uiaxes(app.UIFigure);
            xlabel(app.UIAxes, 'Time (sec)')
            ylabel(app.UIAxes, 'Frequency (Hz)')
            zlabel(app.UIAxes, 'Z')
            app.UIAxes.View = [0 -90];
            app.UIAxes.TickLabelInterpreter = 'latex';
            app.UIAxes.FontSize = 14;
            app.UIAxes.Position = [14 615 1075 289];

            % Create ScrollingSpectrogramvideoPanel
            app.ScrollingSpectrogramvideoPanel = uipanel(app.UIFigure);
            app.ScrollingSpectrogramvideoPanel.AutoResizeChildren = 'off';
            app.ScrollingSpectrogramvideoPanel.TitlePosition = 'centertop';
            app.ScrollingSpectrogramvideoPanel.Title = 'Scrolling Spectrogram video';
            app.ScrollingSpectrogramvideoPanel.FontSize = 18;
            app.ScrollingSpectrogramvideoPanel.Position = [535 15 555 206];

            % Create DoneLamp_3Label
            app.DoneLamp_3Label = uilabel(app.ScrollingSpectrogramvideoPanel);
            app.DoneLamp_3Label.HorizontalAlignment = 'right';
            app.DoneLamp_3Label.Position = [465 48 33 22];
            app.DoneLamp_3Label.Text = 'Done';

            % Create DoneLamp_3
            app.DoneLamp_3 = uilamp(app.ScrollingSpectrogramvideoPanel);
            app.DoneLamp_3.Position = [513 47 23 23];
            app.DoneLamp_3.Color = [0.651 0.651 0.651];

            % Create LabelProgress_3
            app.LabelProgress_3 = uilabel(app.ScrollingSpectrogramvideoPanel);
            app.LabelProgress_3.HorizontalAlignment = 'center';
            app.LabelProgress_3.Position = [292 15 131 22];
            app.LabelProgress_3.Text = '';

            % Create CreateandexportspectrogramButton
            app.CreateandexportspectrogramButton = uibutton(app.ScrollingSpectrogramvideoPanel, 'push');
            app.CreateandexportspectrogramButton.ButtonPushedFcn = createCallbackFcn(app, @CreateandexportspectrogramButtonPushed, true);
            app.CreateandexportspectrogramButton.FontSize = 14;
            app.CreateandexportspectrogramButton.Enable = 'off';
            app.CreateandexportspectrogramButton.Position = [244 47 212 25];
            app.CreateandexportspectrogramButton.Text = 'Create and export spectrogram';

            % Create ButtonGroup_2
            app.ButtonGroup_2 = uibuttongroup(app.ScrollingSpectrogramvideoPanel);
            app.ButtonGroup_2.AutoResizeChildren = 'off';
            app.ButtonGroup_2.BorderType = 'none';
            app.ButtonGroup_2.TitlePosition = 'centertop';
            app.ButtonGroup_2.Position = [347 81 189 37];

            % Create withaxesButton_2
            app.withaxesButton_2 = uiradiobutton(app.ButtonGroup_2);
            app.withaxesButton_2.Text = 'with axes';
            app.withaxesButton_2.Position = [16 9 73 22];
            app.withaxesButton_2.Value = true;

            % Create withoutaxesButton_2
            app.withoutaxesButton_2 = uiradiobutton(app.ButtonGroup_2);
            app.withoutaxesButton_2.Text = 'without axes';
            app.withoutaxesButton_2.Position = [100 9 90 22];

            % Create t_startsecEditFieldLabel
            app.t_startsecEditFieldLabel = uilabel(app.ScrollingSpectrogramvideoPanel);
            app.t_startsecEditFieldLabel.HorizontalAlignment = 'right';
            app.t_startsecEditFieldLabel.Position = [27 137 67 22];
            app.t_startsecEditFieldLabel.Text = 't_start (sec)';

            % Create t_endsecEditFieldLabel
            app.t_endsecEditFieldLabel = uilabel(app.ScrollingSpectrogramvideoPanel);
            app.t_endsecEditFieldLabel.HorizontalAlignment = 'right';
            app.t_endsecEditFieldLabel.Position = [180 137 63 22];
            app.t_endsecEditFieldLabel.Text = 't_end (sec)';

            % Create t_endsecEditField
            app.t_endsecEditField = uieditfield(app.ScrollingSpectrogramvideoPanel, 'numeric');
            app.t_endsecEditField.Limits = [0 Inf];
            app.t_endsecEditField.HorizontalAlignment = 'center';
            app.t_endsecEditField.Position = [255 137 50 22];

            % Create t_startsecEditField
            app.t_startsecEditField = uieditfield(app.ScrollingSpectrogramvideoPanel, 'numeric');
            app.t_startsecEditField.Limits = [0 Inf];
            app.t_startsecEditField.HorizontalAlignment = 'center';
            app.t_startsecEditField.Position = [106 137 50 22];

            % Create ThresholddBEditFieldLabel
            app.ThresholddBEditFieldLabel = uilabel(app.ScrollingSpectrogramvideoPanel);
            app.ThresholddBEditFieldLabel.HorizontalAlignment = 'right';
            app.ThresholddBEditFieldLabel.Position = [50 26 83 22];
            app.ThresholddBEditFieldLabel.Text = 'Threshold (dB)';

            % Create ThresholddBEditField
            app.ThresholddBEditField = uieditfield(app.ScrollingSpectrogramvideoPanel, 'numeric');
            app.ThresholddBEditField.Limits = [-Inf 0];
            app.ThresholddBEditField.HorizontalAlignment = 'center';
            app.ThresholddBEditField.Position = [140 26 42 22];
            app.ThresholddBEditField.Value = -50;

            % Create f_cutHzEditField_2Label
            app.f_cutHzEditField_2Label = uilabel(app.ScrollingSpectrogramvideoPanel);
            app.f_cutHzEditField_2Label.HorizontalAlignment = 'right';
            app.f_cutHzEditField_2Label.Position = [362 136 55 22];
            app.f_cutHzEditField_2Label.Text = 'f_cut (Hz)';

            % Create f_cutHzEditField_2
            app.f_cutHzEditField_2 = uieditfield(app.ScrollingSpectrogramvideoPanel, 'numeric');
            app.f_cutHzEditField_2.Limits = [0 Inf];
            app.f_cutHzEditField_2.RoundFractionalValues = 'on';
            app.f_cutHzEditField_2.HorizontalAlignment = 'center';
            app.f_cutHzEditField_2.Position = [432 136 51 22];
            app.f_cutHzEditField_2.Value = 6000;

            % Create FramelengthsecEditFieldLabel
            app.FramelengthsecEditFieldLabel = uilabel(app.ScrollingSpectrogramvideoPanel);
            app.FramelengthsecEditFieldLabel.HorizontalAlignment = 'right';
            app.FramelengthsecEditFieldLabel.Position = [29 59 104 22];
            app.FramelengthsecEditFieldLabel.Text = 'Frame length (sec)';

            % Create FramelengthsecEditField
            app.FramelengthsecEditField = uieditfield(app.ScrollingSpectrogramvideoPanel, 'numeric');
            app.FramelengthsecEditField.Limits = [0 Inf];
            app.FramelengthsecEditField.HorizontalAlignment = 'center';
            app.FramelengthsecEditField.Position = [141 59 40 22];
            app.FramelengthsecEditField.Value = 10;

            % Create Label_4
            app.Label_4 = uilabel(app.ScrollingSpectrogramvideoPanel);
            app.Label_4.HorizontalAlignment = 'center';
            app.Label_4.Position = [249 110 82 22];
            app.Label_4.Text = '';

            % Create TimewindowmsecEditField_2
            app.TimewindowmsecEditField_2 = uieditfield(app.ScrollingSpectrogramvideoPanel, 'numeric');
            app.TimewindowmsecEditField_2.Limits = [0 Inf];
            app.TimewindowmsecEditField_2.RoundFractionalValues = 'on';
            app.TimewindowmsecEditField_2.HorizontalAlignment = 'center';
            app.TimewindowmsecEditField_2.Position = [141 89 41 22];
            app.TimewindowmsecEditField_2.Value = 80;

            % Create TimewindowmsecEditField_2Label
            app.TimewindowmsecEditField_2Label = uilabel(app.ScrollingSpectrogramvideoPanel);
            app.TimewindowmsecEditField_2Label.HorizontalAlignment = 'right';
            app.TimewindowmsecEditField_2Label.Position = [13 89 115 22];
            app.TimewindowmsecEditField_2Label.Text = 'Time window (msec)';

            % Create PowermapvideoPanel
            app.PowermapvideoPanel = uipanel(app.UIFigure);
            app.PowermapvideoPanel.AutoResizeChildren = 'off';
            app.PowermapvideoPanel.TitlePosition = 'centertop';
            app.PowermapvideoPanel.Title = 'Powermap video';
            app.PowermapvideoPanel.FontSize = 18;
            app.PowermapvideoPanel.Position = [535 232 554 384];

            % Create DoneLamp_4
            app.DoneLamp_4 = uilamp(app.PowermapvideoPanel);
            app.DoneLamp_4.Position = [512 58 23 23];
            app.DoneLamp_4.Color = [0.651 0.651 0.651];

            % Create ExportambifilesButton
            app.ExportambifilesButton = uibutton(app.PowermapvideoPanel, 'push');
            app.ExportambifilesButton.ButtonPushedFcn = createCallbackFcn(app, @ExportambifilesButtonPushed, true);
            app.ExportambifilesButton.FontSize = 14;
            app.ExportambifilesButton.Enable = 'off';
            app.ExportambifilesButton.Position = [339 57 120 25];
            app.ExportambifilesButton.Text = 'Export ambi files';

            % Create LabelProgress_2
            app.LabelProgress_2 = uilabel(app.PowermapvideoPanel);
            app.LabelProgress_2.HorizontalAlignment = 'center';
            app.LabelProgress_2.Position = [209 19 131 22];
            app.LabelProgress_2.Text = '';

            % Create LabelProgress
            app.LabelProgress = uilabel(app.PowermapvideoPanel);
            app.LabelProgress.HorizontalAlignment = 'center';
            app.LabelProgress.Position = [99 18 131 22];
            app.LabelProgress.Text = '';

            % Create LabelDetectionNumber
            app.LabelDetectionNumber = uilabel(app.PowermapvideoPanel);
            app.LabelDetectionNumber.Position = [24 18 98 22];
            app.LabelDetectionNumber.Text = '';

            % Create ThresholddBSliderLabel
            app.ThresholddBSliderLabel = uilabel(app.PowermapvideoPanel);
            app.ThresholddBSliderLabel.HorizontalAlignment = 'right';
            app.ThresholddBSliderLabel.FontSize = 14;
            app.ThresholddBSliderLabel.Position = [34 162 96 22];
            app.ThresholddBSliderLabel.Text = 'Threshold (dB)';

            % Create f_startHzEditFieldLabel
            app.f_startHzEditFieldLabel = uilabel(app.PowermapvideoPanel);
            app.f_startHzEditFieldLabel.HorizontalAlignment = 'right';
            app.f_startHzEditFieldLabel.Position = [24 322 63 22];
            app.f_startHzEditFieldLabel.Text = 'f_start (Hz)';

            % Create f_endHzEditFieldLabel
            app.f_endHzEditFieldLabel = uilabel(app.PowermapvideoPanel);
            app.f_endHzEditFieldLabel.HorizontalAlignment = 'right';
            app.f_endHzEditFieldLabel.Position = [173 322 59 22];
            app.f_endHzEditFieldLabel.Text = 'f_end (Hz)';

            % Create DoneLamp_2Label
            app.DoneLamp_2Label = uilabel(app.PowermapvideoPanel);
            app.DoneLamp_2Label.HorizontalAlignment = 'right';
            app.DoneLamp_2Label.Position = [232 59 33 22];
            app.DoneLamp_2Label.Text = 'Done';

            % Create DoneLamp_2
            app.DoneLamp_2 = uilamp(app.PowermapvideoPanel);
            app.DoneLamp_2.Position = [280 58 23 23];
            app.DoneLamp_2.Color = [0.651 0.651 0.651];

            % Create CreateandexportpowermapsButton
            app.CreateandexportpowermapsButton = uibutton(app.PowermapvideoPanel, 'push');
            app.CreateandexportpowermapsButton.ButtonPushedFcn = createCallbackFcn(app, @CreateandexportpowermapsButtonPushed, true);
            app.CreateandexportpowermapsButton.FontSize = 14;
            app.CreateandexportpowermapsButton.Enable = 'off';
            app.CreateandexportpowermapsButton.Position = [23 57 207 25];
            app.CreateandexportpowermapsButton.Text = 'Create and export powermaps';

            % Create ButtonGroup
            app.ButtonGroup = uibuttongroup(app.PowermapvideoPanel);
            app.ButtonGroup.AutoResizeChildren = 'off';
            app.ButtonGroup.BorderType = 'none';
            app.ButtonGroup.TitlePosition = 'centertop';
            app.ButtonGroup.Position = [346 94 189 37];

            % Create withaxesButton
            app.withaxesButton = uiradiobutton(app.ButtonGroup);
            app.withaxesButton.Text = 'with axes';
            app.withaxesButton.Position = [16 9 73 22];

            % Create withoutaxesButton
            app.withoutaxesButton = uiradiobutton(app.ButtonGroup);
            app.withoutaxesButton.Text = 'without axes';
            app.withoutaxesButton.Position = [100 9 90 22];
            app.withoutaxesButton.Value = true;

            % Create msecEditField
            app.msecEditField = uieditfield(app.PowermapvideoPanel, 'numeric');
            app.msecEditField.Limits = [0 Inf];
            app.msecEditField.HorizontalAlignment = 'center';
            app.msecEditField.Position = [268 101 39 22];

            % Create AvgwindowsEditField
            app.AvgwindowsEditField = uieditfield(app.PowermapvideoPanel, 'numeric');
            app.AvgwindowsEditField.Limits = [1 Inf];
            app.AvgwindowsEditField.RoundFractionalValues = 'on';
            app.AvgwindowsEditField.ValueChangedFcn = createCallbackFcn(app, @AvgwindowsEditFieldValueChanged, true);
            app.AvgwindowsEditField.HorizontalAlignment = 'center';
            app.AvgwindowsEditField.Position = [167 102 37 22];
            app.AvgwindowsEditField.Value = 1;

            % Create altnormCheckBox
            app.altnormCheckBox = uicheckbox(app.PowermapvideoPanel);
            app.altnormCheckBox.Text = 'alt norm';
            app.altnormCheckBox.FontSize = 14;
            app.altnormCheckBox.Position = [426 166 73 22];

            % Create ThresholddBSlider
            app.ThresholddBSlider = uislider(app.PowermapvideoPanel);
            app.ThresholddBSlider.Limits = [-20 -0.1];
            app.ThresholddBSlider.MajorTicks = [-20 -10 0];
            app.ThresholddBSlider.MajorTickLabels = {'-20', '-10', '0'};
            app.ThresholddBSlider.ValueChangedFcn = createCallbackFcn(app, @ThresholddBSliderValueChanged, true);
            app.ThresholddBSlider.ValueChangingFcn = createCallbackFcn(app, @ThresholddBSliderValueChanging, true);
            app.ThresholddBSlider.MinorTicks = [-20 -19 -18 -17 -16 -15 -14 -13 -12 -11 -10 -9 -8 -7 -6 -5 -4 -3 -2 -1 0];
            app.ThresholddBSlider.FontName = 'Times';
            app.ThresholddBSlider.FontSize = 14;
            app.ThresholddBSlider.Position = [190 176 204 3];
            app.ThresholddBSlider.Value = -3;

            % Create EditFieldThreshold
            app.EditFieldThreshold = uieditfield(app.PowermapvideoPanel, 'numeric');
            app.EditFieldThreshold.ValueChangedFcn = createCallbackFcn(app, @EditFieldThresholdValueChanged, true);
            app.EditFieldThreshold.HorizontalAlignment = 'center';
            app.EditFieldThreshold.Position = [136 163 43 22];
            app.EditFieldThreshold.Value = -3;

            % Create SHorderDropDownLabel
            app.SHorderDropDownLabel = uilabel(app.PowermapvideoPanel);
            app.SHorderDropDownLabel.HorizontalAlignment = 'right';
            app.SHorderDropDownLabel.FontSize = 14;
            app.SHorderDropDownLabel.Position = [304 288 61 22];
            app.SHorderDropDownLabel.Text = 'SH order';

            % Create MethodDropDownLabel
            app.MethodDropDownLabel = uilabel(app.PowermapvideoPanel);
            app.MethodDropDownLabel.HorizontalAlignment = 'right';
            app.MethodDropDownLabel.FontSize = 14;
            app.MethodDropDownLabel.Position = [304 322 53 22];
            app.MethodDropDownLabel.Text = 'Method';

            % Create ColormapDropDown
            app.ColormapDropDown = uidropdown(app.PowermapvideoPanel);
            app.ColormapDropDown.Items = {'Parula', 'Jet', 'Turbo', 'Gray', 'Hot', 'Summer', 'Winter', 'Bone'};
            app.ColormapDropDown.ValueChangedFcn = createCallbackFcn(app, @ColormapDropDownValueChanged, true);
            app.ColormapDropDown.FontSize = 14;
            app.ColormapDropDown.Position = [346 216 121 22];
            app.ColormapDropDown.Value = 'Hot';

            % Create ColormapDropDownLabel
            app.ColormapDropDownLabel = uilabel(app.PowermapvideoPanel);
            app.ColormapDropDownLabel.HorizontalAlignment = 'right';
            app.ColormapDropDownLabel.FontSize = 14;
            app.ColormapDropDownLabel.Position = [264 216 67 22];
            app.ColormapDropDownLabel.Text = 'Colormap';

            % Create GridDropDownLabel
            app.GridDropDownLabel = uilabel(app.PowermapvideoPanel);
            app.GridDropDownLabel.HorizontalAlignment = 'right';
            app.GridDropDownLabel.FontSize = 14;
            app.GridDropDownLabel.Position = [46 216 32 22];
            app.GridDropDownLabel.Text = 'Grid';

            % Create GridDropDown
            app.GridDropDown = uidropdown(app.PowermapvideoPanel);
            app.GridDropDown.Items = {'coarse uniform', 'fine uniform', 'coarse t-design', 'fine t-design'};
            app.GridDropDown.FontSize = 14;
            app.GridDropDown.Position = [93 216 137 22];
            app.GridDropDown.Value = 'coarse t-design';

            % Create N_sourcesMUSICEditFieldLabel
            app.N_sourcesMUSICEditFieldLabel = uilabel(app.PowermapvideoPanel);
            app.N_sourcesMUSICEditFieldLabel.HorizontalAlignment = 'right';
            app.N_sourcesMUSICEditFieldLabel.Position = [295 257 120 22];
            app.N_sourcesMUSICEditFieldLabel.Text = 'N_sources (MUSIC)';

            % Create AvgwindowsEditFieldLabel
            app.AvgwindowsEditFieldLabel = uilabel(app.PowermapvideoPanel);
            app.AvgwindowsEditFieldLabel.HorizontalAlignment = 'right';
            app.AvgwindowsEditFieldLabel.Position = [73 102 83 22];
            app.AvgwindowsEditFieldLabel.Text = 'Avg (windows)';

            % Create N_sourcesMUSICEditField
            app.N_sourcesMUSICEditField = uieditfield(app.PowermapvideoPanel, 'numeric');
            app.N_sourcesMUSICEditField.Limits = [0 Inf];
            app.N_sourcesMUSICEditField.RoundFractionalValues = 'on';
            app.N_sourcesMUSICEditField.HorizontalAlignment = 'center';
            app.N_sourcesMUSICEditField.Position = [425 257 41 22];
            app.N_sourcesMUSICEditField.Value = 1;

            % Create SHorderDropDown
            app.SHorderDropDown = uidropdown(app.PowermapvideoPanel);
            app.SHorderDropDown.Items = {};
            app.SHorderDropDown.FontSize = 14;
            app.SHorderDropDown.Position = [384 288 82 22];
            app.SHorderDropDown.Value = {};

            % Create MethodDropDown
            app.MethodDropDown = uidropdown(app.PowermapvideoPanel);
            app.MethodDropDown.Items = {'SH-Beamforming', 'SH-MVDR', 'SH-MUSIC', 'CroPaC'};
            app.MethodDropDown.FontSize = 14;
            app.MethodDropDown.Position = [369 322 149 22];
            app.MethodDropDown.Value = 'SH-MUSIC';

            % Create Label_2
            app.Label_2 = uilabel(app.PowermapvideoPanel);
            app.Label_2.HorizontalAlignment = 'center';
            app.Label_2.Position = [232 291 61 22];
            app.Label_2.Text = '';

            % Create Label
            app.Label = uilabel(app.PowermapvideoPanel);
            app.Label.HorizontalAlignment = 'center';
            app.Label.Position = [93 291 67 22];
            app.Label.Text = '';

            % Create f_endHzEditField
            app.f_endHzEditField = uieditfield(app.PowermapvideoPanel, 'numeric');
            app.f_endHzEditField.ValueChangedFcn = createCallbackFcn(app, @f_endHzEditFieldValueChanged, true);
            app.f_endHzEditField.HorizontalAlignment = 'center';
            app.f_endHzEditField.Position = [241 322 47 22];
            app.f_endHzEditField.Value = 6000;

            % Create f_startHzEditField
            app.f_startHzEditField = uieditfield(app.PowermapvideoPanel, 'numeric');
            app.f_startHzEditField.ValueChangedFcn = createCallbackFcn(app, @f_startHzEditFieldValueChanged, true);
            app.f_startHzEditField.HorizontalAlignment = 'center';
            app.f_startHzEditField.Position = [99 322 50 22];

            % Create msecEditFieldLabel
            app.msecEditFieldLabel = uilabel(app.PowermapvideoPanel);
            app.msecEditFieldLabel.HorizontalAlignment = 'right';
            app.msecEditFieldLabel.Position = [217 101 40 22];
            app.msecEditFieldLabel.Text = '(msec)';

            % Create DoneLamp_4Label
            app.DoneLamp_4Label = uilabel(app.PowermapvideoPanel);
            app.DoneLamp_4Label.HorizontalAlignment = 'right';
            app.DoneLamp_4Label.Position = [464 59 33 22];
            app.DoneLamp_4Label.Text = 'Done';

            % Create SpectrograminspectionPanel
            app.SpectrograminspectionPanel = uipanel(app.UIFigure);
            app.SpectrograminspectionPanel.AutoResizeChildren = 'off';
            app.SpectrograminspectionPanel.TitlePosition = 'centertop';
            app.SpectrograminspectionPanel.Title = 'Spectrogram inspection';
            app.SpectrograminspectionPanel.FontSize = 18;
            app.SpectrograminspectionPanel.Position = [14 19 508 233];

            % Create PlotspectrogramButton
            app.PlotspectrogramButton = uibutton(app.SpectrograminspectionPanel, 'push');
            app.PlotspectrogramButton.ButtonPushedFcn = createCallbackFcn(app, @PlotspectrogramButtonPushed, true);
            app.PlotspectrogramButton.FontSize = 14;
            app.PlotspectrogramButton.Enable = 'off';
            app.PlotspectrogramButton.Position = [234 22 123 25];
            app.PlotspectrogramButton.Text = 'Plot spectrogram';

            % Create ThresholddBSliderLabel_2
            app.ThresholddBSliderLabel_2 = uilabel(app.SpectrograminspectionPanel);
            app.ThresholddBSliderLabel_2.HorizontalAlignment = 'right';
            app.ThresholddBSliderLabel_2.Position = [33 76 83 22];
            app.ThresholddBSliderLabel_2.Text = 'Threshold (dB)';

            % Create ThresholddBSlider_2
            app.ThresholddBSlider_2 = uislider(app.SpectrograminspectionPanel);
            app.ThresholddBSlider_2.Limits = [-100 -0.1];
            app.ThresholddBSlider_2.MajorTicks = [-100 -50 0];
            app.ThresholddBSlider_2.MajorTickLabels = {'-100', '-50', '0'};
            app.ThresholddBSlider_2.ValueChangedFcn = createCallbackFcn(app, @ThresholddBSlider_2ValueChanged, true);
            app.ThresholddBSlider_2.ValueChangingFcn = createCallbackFcn(app, @ThresholddBSlider_2ValueChanging, true);
            app.ThresholddBSlider_2.MinorTicks = [-100 -90 -80 -70 -60 -50 -40 -30 -20 -10 0];
            app.ThresholddBSlider_2.FontName = 'Times';
            app.ThresholddBSlider_2.Position = [180 87 203 3];
            app.ThresholddBSlider_2.Value = -50;

            % Create EditFieldThreshold_2
            app.EditFieldThreshold_2 = uieditfield(app.SpectrograminspectionPanel, 'numeric');
            app.EditFieldThreshold_2.Limits = [-Inf -0.1];
            app.EditFieldThreshold_2.ValueChangedFcn = createCallbackFcn(app, @EditFieldThreshold_2ValueChanged, true);
            app.EditFieldThreshold_2.HorizontalAlignment = 'center';
            app.EditFieldThreshold_2.Position = [122 77 43 22];
            app.EditFieldThreshold_2.Value = -50;

            % Create StopButton
            app.StopButton = uibutton(app.SpectrograminspectionPanel, 'push');
            app.StopButton.ButtonPushedFcn = createCallbackFcn(app, @StopButtonPushed, true);
            app.StopButton.Enable = 'off';
            app.StopButton.Position = [331 113 100 23];
            app.StopButton.Text = 'Stop';

            % Create PlayButton
            app.PlayButton = uibutton(app.SpectrograminspectionPanel, 'push');
            app.PlayButton.ButtonPushedFcn = createCallbackFcn(app, @PlayButtonPushed, true);
            app.PlayButton.Enable = 'off';
            app.PlayButton.Position = [218 113 100 23];
            app.PlayButton.Text = 'Play';

            % Create ChannelLabel
            app.ChannelLabel = uilabel(app.SpectrograminspectionPanel);
            app.ChannelLabel.HorizontalAlignment = 'right';
            app.ChannelLabel.FontSize = 14;
            app.ChannelLabel.Position = [32 113 57 22];
            app.ChannelLabel.Text = 'Channel';

            % Create SelectchannelDropDown
            app.SelectchannelDropDown = uidropdown(app.SpectrograminspectionPanel);
            app.SelectchannelDropDown.Items = {};
            app.SelectchannelDropDown.ValueChangedFcn = createCallbackFcn(app, @SelectchannelDropDownValueChanged, true);
            app.SelectchannelDropDown.Enable = 'off';
            app.SelectchannelDropDown.Position = [109 114 76 22];
            app.SelectchannelDropDown.Value = {};

            % Create f_cutHzEditFieldLabel
            app.f_cutHzEditFieldLabel = uilabel(app.SpectrograminspectionPanel);
            app.f_cutHzEditFieldLabel.HorizontalAlignment = 'right';
            app.f_cutHzEditFieldLabel.Position = [71 24 55 22];
            app.f_cutHzEditFieldLabel.Text = 'f_cut (Hz)';

            % Create f_cutHzEditField
            app.f_cutHzEditField = uieditfield(app.SpectrograminspectionPanel, 'numeric');
            app.f_cutHzEditField.Limits = [0 Inf];
            app.f_cutHzEditField.RoundFractionalValues = 'on';
            app.f_cutHzEditField.HorizontalAlignment = 'center';
            app.f_cutHzEditField.Position = [141 24 51 22];
            app.f_cutHzEditField.Value = 6000;

            % Create DetectionEditFieldLabel
            app.DetectionEditFieldLabel = uilabel(app.SpectrograminspectionPanel);
            app.DetectionEditFieldLabel.HorizontalAlignment = 'right';
            app.DetectionEditFieldLabel.FontSize = 14;
            app.DetectionEditFieldLabel.Position = [32 156 77 22];
            app.DetectionEditFieldLabel.Text = 'Detection #';

            % Create DetectionEditField
            app.DetectionEditField = uieditfield(app.SpectrograminspectionPanel, 'numeric');
            app.DetectionEditField.Limits = [0 Inf];
            app.DetectionEditField.ValueChangedFcn = createCallbackFcn(app, @DetectionEditFieldValueChanged, true);
            app.DetectionEditField.HorizontalAlignment = 'center';
            app.DetectionEditField.FontSize = 14;
            app.DetectionEditField.Position = [133 155 45 22];
            app.DetectionEditField.Value = 1;

            % Create AnalysisPanel
            app.AnalysisPanel = uipanel(app.UIFigure);
            app.AnalysisPanel.AutoResizeChildren = 'off';
            app.AnalysisPanel.TitlePosition = 'centertop';
            app.AnalysisPanel.Title = 'Analysis';
            app.AnalysisPanel.FontSize = 18;
            app.AnalysisPanel.Position = [14 272 507 157];

            % Create DetectionsFoundLabel
            app.DetectionsFoundLabel = uilabel(app.AnalysisPanel);
            app.DetectionsFoundLabel.Position = [218 9 275 22];
            app.DetectionsFoundLabel.Text = '';

            % Create RunanalysisButton
            app.RunanalysisButton = uibutton(app.AnalysisPanel, 'push');
            app.RunanalysisButton.ButtonPushedFcn = createCallbackFcn(app, @RunanalysisButtonPushed, true);
            app.RunanalysisButton.FontSize = 14;
            app.RunanalysisButton.Enable = 'off';
            app.RunanalysisButton.Position = [218 42 111 25];
            app.RunanalysisButton.Text = 'Run analysis';

            % Create DoneLampLabel
            app.DoneLampLabel = uilabel(app.AnalysisPanel);
            app.DoneLampLabel.HorizontalAlignment = 'right';
            app.DoneLampLabel.Position = [337 43 33 22];
            app.DoneLampLabel.Text = 'Done';

            % Create DoneLamp
            app.DoneLamp = uilamp(app.AnalysisPanel);
            app.DoneLamp.Position = [385 44 20 20];
            app.DoneLamp.Color = [0.651 0.651 0.651];

            % Create MaxgaindBEditField
            app.MaxgaindBEditField = uieditfield(app.AnalysisPanel, 'numeric');
            app.MaxgaindBEditField.HorizontalAlignment = 'center';
            app.MaxgaindBEditField.FontSize = 14;
            app.MaxgaindBEditField.Position = [118 15 46 22];

            % Create EncodingDropDown
            app.EncodingDropDown = uidropdown(app.AnalysisPanel);
            app.EncodingDropDown.Items = {'transpose', 'pinv (for gen2)'};
            app.EncodingDropDown.FontSize = 14;
            app.EncodingDropDown.Position = [90 52 95 22];
            app.EncodingDropDown.Value = 'transpose';

            % Create TimewindowmsecEditField
            app.TimewindowmsecEditField = uieditfield(app.AnalysisPanel, 'numeric');
            app.TimewindowmsecEditField.Limits = [0 Inf];
            app.TimewindowmsecEditField.ValueChangedFcn = createCallbackFcn(app, @TimewindowmsecEditFieldValueChanged, true);
            app.TimewindowmsecEditField.HorizontalAlignment = 'center';
            app.TimewindowmsecEditField.FontSize = 14;
            app.TimewindowmsecEditField.Position = [161 89 58 22];
            app.TimewindowmsecEditField.Value = 33.33;

            % Create TimewindowmsecLabel
            app.TimewindowmsecLabel = uilabel(app.AnalysisPanel);
            app.TimewindowmsecLabel.HorizontalAlignment = 'right';
            app.TimewindowmsecLabel.FontSize = 14;
            app.TimewindowmsecLabel.Position = [15 89 133 22];
            app.TimewindowmsecLabel.Text = 'Time window (msec)';

            % Create samplesEditField
            app.samplesEditField = uieditfield(app.AnalysisPanel, 'numeric');
            app.samplesEditField.Editable = 'off';
            app.samplesEditField.HorizontalAlignment = 'center';
            app.samplesEditField.FontSize = 14;
            app.samplesEditField.Position = [308 90 49 22];

            % Create samplesLabel
            app.samplesLabel = uilabel(app.AnalysisPanel);
            app.samplesLabel.HorizontalAlignment = 'right';
            app.samplesLabel.FontSize = 14;
            app.samplesLabel.Position = [231 88 65 22];
            app.samplesLabel.Text = '(samples)';

            % Create MaxgaindBEditFieldLabel
            app.MaxgaindBEditFieldLabel = uilabel(app.AnalysisPanel);
            app.MaxgaindBEditFieldLabel.HorizontalAlignment = 'right';
            app.MaxgaindBEditFieldLabel.FontSize = 14;
            app.MaxgaindBEditFieldLabel.Position = [15 16 91 22];
            app.MaxgaindBEditFieldLabel.Text = 'Max gain (dB)';

            % Create EncodingDropDownLabel
            app.EncodingDropDownLabel = uilabel(app.AnalysisPanel);
            app.EncodingDropDownLabel.HorizontalAlignment = 'right';
            app.EncodingDropDownLabel.FontSize = 14;
            app.EncodingDropDownLabel.Position = [15 52 64 22];
            app.EncodingDropDownLabel.Text = 'Encoding';

            % Create InputSettingsPanel
            app.InputSettingsPanel = uipanel(app.UIFigure);
            app.InputSettingsPanel.AutoResizeChildren = 'off';
            app.InputSettingsPanel.BorderColor = [0.502 0.502 0.502];
            app.InputSettingsPanel.TitlePosition = 'centertop';
            app.InputSettingsPanel.Title = 'Input Settings';
            app.InputSettingsPanel.BackgroundColor = [0.9412 0.9412 0.9412];
            app.InputSettingsPanel.Scrollable = 'on';
            app.InputSettingsPanel.FontSize = 18;
            app.InputSettingsPanel.Position = [14 448 507 168];

            % Create ButtonGroup_3
            app.ButtonGroup_3 = uibuttongroup(app.InputSettingsPanel);
            app.ButtonGroup_3.AutoResizeChildren = 'off';
            app.ButtonGroup_3.BorderType = 'none';
            app.ButtonGroup_3.Position = [164 12 209 30];

            % Create AdobeAuditionButton_2
            app.AdobeAuditionButton_2 = uiradiobutton(app.ButtonGroup_3);
            app.AdobeAuditionButton_2.Text = 'Adobe Audition';
            app.AdobeAuditionButton_2.Position = [8 6 103 22];
            app.AdobeAuditionButton_2.Value = true;

            % Create RAVENButton
            app.RAVENButton = uiradiobutton(app.ButtonGroup_3);
            app.RAVENButton.Text = 'RAVEN';
            app.RAVENButton.Position = [119 7 61 22];

            % Create LoadlogfileButton
            app.LoadlogfileButton = uibutton(app.InputSettingsPanel, 'push');
            app.LoadlogfileButton.ButtonPushedFcn = createCallbackFcn(app, @LoadlogfileButtonPushed, true);
            app.LoadlogfileButton.FontSize = 14;
            app.LoadlogfileButton.Position = [35 15 107 25];
            app.LoadlogfileButton.Text = 'Load log file';

            % Create EditArrayButton
            app.EditArrayButton = uibutton(app.InputSettingsPanel, 'push');
            app.EditArrayButton.ButtonPushedFcn = createCallbackFcn(app, @EditArrayButtonPushed, true);
            app.EditArrayButton.FontSize = 14;
            app.EditArrayButton.Enable = 'off';
            app.EditArrayButton.Position = [345 64 97 25];
            app.EditArrayButton.Text = 'Edit Array';

            % Create PresetsDropDownLabel
            app.PresetsDropDownLabel = uilabel(app.InputSettingsPanel);
            app.PresetsDropDownLabel.HorizontalAlignment = 'right';
            app.PresetsDropDownLabel.FontSize = 14;
            app.PresetsDropDownLabel.Enable = 'off';
            app.PresetsDropDownLabel.Position = [181 108 52 22];
            app.PresetsDropDownLabel.Text = 'Presets';

            % Create Label_3
            app.Label_3 = uilabel(app.InputSettingsPanel);
            app.Label_3.HorizontalAlignment = 'right';
            app.Label_3.Position = [36 62 59 22];
            app.Label_3.Text = 'tau (sec)';

            % Create LoadArrayButton
            app.LoadArrayButton = uibutton(app.InputSettingsPanel, 'push');
            app.LoadArrayButton.ButtonPushedFcn = createCallbackFcn(app, @LoadArrayButtonPushed, true);
            app.LoadArrayButton.FontSize = 14;
            app.LoadArrayButton.Enable = 'off';
            app.LoadArrayButton.Position = [240 63 100 25];
            app.LoadArrayButton.Text = 'Load Array';

            % Create PresetsDropDown
            app.PresetsDropDown = uidropdown(app.InputSettingsPanel);
            app.PresetsDropDown.Items = {};
            app.PresetsDropDown.ValueChangedFcn = createCallbackFcn(app, @PresetsDropDownValueChanged, true);
            app.PresetsDropDown.Enable = 'off';
            app.PresetsDropDown.FontSize = 14;
            app.PresetsDropDown.Position = [240 108 203 22];
            app.PresetsDropDown.Value = {};

            % Create tausecEditField
            app.tausecEditField = uieditfield(app.InputSettingsPanel, 'numeric');
            app.tausecEditField.HorizontalAlignment = 'center';
            app.tausecEditField.Position = [101 62 40 22];

            % Create LoadaudiofileButton
            app.LoadaudiofileButton = uibutton(app.InputSettingsPanel, 'push');
            app.LoadaudiofileButton.ButtonPushedFcn = createCallbackFcn(app, @LoadaudiofileButtonPushed, true);
            app.LoadaudiofileButton.FontSize = 14;
            app.LoadaudiofileButton.Position = [35 106 107 25];
            app.LoadaudiofileButton.Text = 'Load audio file';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = main_AutoMode

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