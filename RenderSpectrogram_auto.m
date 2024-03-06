classdef RenderSpectrogram_auto < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure  matlab.ui.Figure
    end

    
    properties (Access = private)
        CallingApp;
        myAxes;

    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app, caller, path, x_e, time, TF, w, N_sp, Nbins_sp, Nwindows, W_enc, t_start, freq_sp, fCut, sp_max, threshold_Sp_video, t_start_Det, t_end_Det)
            app.CallingApp = caller;

            
            M = size(W_enc,2);
            order = sqrt(size(W_enc,1))-1;


            %% Figure settings
            mapWidth = 1400;
            mapHeight = 600;

            app.myAxes=axes(app.UIFigure);
            app.myAxes.Units = 'pixels';
            app.myAxes.Position = [100 150 mapWidth mapHeight]; % [left bottom width height]

            %xlim(app.myAxes,[-180 180])
            %ylim(app.myAxes,[-90 90])
           % xlabel(app.myAxes,'Time (sec)','FontSize',14)
           % ylabel(app.myAxes,'Frequency (Hz)','FontSize',14)
          %  set(app.myAxes,'Fontsize',22)


            marg = 50;
            rect = [-marg-40, -marg-20, mapWidth+2.6*marg, mapHeight+2.6*marg];

            xLine_ind = round(0.3*N_sp);

            %% Main Loop

            videoFileName = 'spectrogram_test.mp4';
            fullFileName  = fullfile(path,videoFileName);
            writerObj = VideoWriter(fullFileName, 'MPEG-4');
            writerObj.FrameRate = 2/TF.Twin;
            writerObj.Quality = 100;

            open(writerObj)


            Sp_frame = zeros(N_sp,Nbins_sp); % a variable to store the spectrogram of each frame

            index = 0; % index for x_e

            if app.CallingApp.logFile_loaded == true % if the logFile is loaded --> draw white lines at detection times
                for n=1:Nwindows-1 % the last frame is discarded because the last time-window is empty

                    % TF transform
                    X = zeros(TF.Nfft,M);
                    for m=1:M
                        x_temp = x_e(index+1:index+TF.Nwin,m);
                        x_w    = x_temp'.*w;
                        X(:,m) = fft(x_w,TF.Nfft);
                    end

                    % Encode to SHs
                    S = zeros((order+1)^2,Nbins_sp);
                    for k=1:Nbins_sp
                        S(:,k) = W_enc(:,:,k)*X(k,:).';
                    end
                    Omni = S(1,:);

                    % Create Spectrogram
                    Omni_sp = Omni./sp_max;

                    if n<=N_sp
                        Sp_frame(n,:) = 20*log10(abs(Omni_sp));
                    else
                        Sp_frame(1:end-1,:) = Sp_frame(2:end,:);
                        Sp_frame(end,:) = 20*log10(abs(Omni_sp));
                    end

                    % Plot and save frame in video
                    if n>=N_sp
                        time_frame = time(n-N_sp+1:n)+t_start;
                        surf(app.myAxes,time_frame,freq_sp,Sp_frame.',"EdgeColor","none")
                        xlim(app.myAxes,[time_frame(1) time_frame(end)])
                        ylim(app.myAxes,[0 fCut])
                        clim(app.myAxes,[threshold_Sp_video 0])
                        view(app.myAxes,2)
                        colormap(app.myAxes,'jet');
                        xlabel(app.myAxes,'Time (sec)','FontSize',18)
                        ylabel(app.myAxes,'Frequency (Hz)','FontSize',18)
                        set(app.myAxes,'Fontsize',18)

                        % add a red line at 30% of frame
                        xline(app.myAxes,time_frame(xLine_ind),'r','Linewidth',5);


                        % add white lines at the start of detections
                        xline(app.myAxes,t_start_Det,'w-.','start','FontSize',20,'Linewidth',3);
                        xline(app.myAxes,t_end_Det,'w-.','end','FontSize',20,'Linewidth',3);


                        if app.CallingApp.withaxesButton_2.Value == true
                            F = getframe(app.myAxes,rect);
                        elseif app.CallingApp.withoutaxesButton_2.Value == true
                            F = getframe(app.myAxes,[0 0 mapWidth mapHeight]);
                        end

                        app.CallingApp.LabelProgress_3.Text = ['Rendered ' num2str(fix(ceil(n/(Nwindows-1)*100)*10^3)/10^3) '%'];

                        writeVideo(writerObj,F);
                    end

                    index  = index + TF.hopsize;
                end



            else
                for n=1:Nwindows-1 % the last frame is discarded because the last time-window is empty

                    % TF transform
                    X = zeros(TF.Nfft,M);
                    for m=1:M
                        x_temp = x_e(index+1:index+TF.Nwin,m);
                        x_w    = x_temp'.*w;
                        X(:,m) = fft(x_w,TF.Nfft);
                    end

                    % Encode to SHs
                    S = zeros((order+1)^2,Nbins_sp);
                    for k=1:Nbins_sp
                        S(:,k) = W_enc(:,:,k)*X(k,:).';
                    end
                    Omni = S(1,:);

                    % Create Spectrogram
                    Omni_sp = Omni./sp_max;

                    if n<=N_sp
                        Sp_frame(n,:) = 20*log10(abs(Omni_sp));
                    else
                        Sp_frame(1:end-1,:) = Sp_frame(2:end,:);
                        Sp_frame(end,:) = 20*log10(abs(Omni_sp));
                    end

                    % Plot and save frame in video
                    if n>=N_sp
                        time_frame = time(n-N_sp+1:n)+t_start;
                        surf(app.myAxes,time_frame,freq_sp,Sp_frame.',"EdgeColor","none")
                        xlim(app.myAxes,[time_frame(1) time_frame(end)])
                        ylim(app.myAxes,[0 fCut])
                        clim(app.myAxes,[threshold_Sp_video 0])
                        view(app.myAxes,2)
                        colormap(app.myAxes,'jet');
                        xlabel(app.myAxes,'Time (sec)','FontSize',18)
                        ylabel(app.myAxes,'Frequency (Hz)','FontSize',18)
                        set(app.myAxes,'Fontsize',18)

                        % add a red line at 30% of frame
                        xline(app.myAxes,time_frame(xLine_ind),'r','Linewidth',5);


                        if app.CallingApp.withaxesButton_2.Value == true
                            F = getframe(app.myAxes,rect);
                        elseif app.CallingApp.withoutaxesButton_2.Value == true
                            F = getframe(app.myAxes,[0 0 mapWidth mapHeight]);
                        end

                        app.CallingApp.LabelProgress_3.Text = ['Rendered ' num2str(fix(ceil(n/(Nwindows-1)*100)*10^3)/10^3) '%'];

                        writeVideo(writerObj,F);
                    end

                    index  = index + TF.hopsize;
                end
            end

            close(writerObj);

            %%

            delete(app)
        
        end

        % Close request function: UIFigure
        function UIFigureCloseRequest(app, event)
            app.CallingApp.CreateandexportspectrogramButton.Enable = 'on';
            delete(app)
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [50 100 1550 840];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.Resize = 'off';
            app.UIFigure.CloseRequestFcn = createCallbackFcn(app, @UIFigureCloseRequest, true);

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = RenderSpectrogram_auto(varargin)

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