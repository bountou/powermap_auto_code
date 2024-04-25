classdef RenderPowermap_auto < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure  matlab.ui.Figure
    end

    
    properties (Access = private)
        CallingApp;
        myAxes;

        Fdata=struct('cdata',[],'colormap',[]); % frame data
    end



    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app, caller, T, grid_dirs, PHI, THETA, P_avfn)
            app.CallingApp = caller;

            mapWidth = 1440;
            mapHeight = 720;

            app.myAxes=axes(app.UIFigure);
            app.myAxes.Units = 'pixels';
            app.myAxes.Position = [80 100 mapWidth mapHeight]; % [left bottom width height]

            xlim(app.myAxes,[-180 180])
            ylim(app.myAxes,[-90 90])
            xlabel(app.myAxes,'Azimuth (deg)','FontSize',14)
            ylabel(app.myAxes,'Elevation (deg)','FontSize',14)
            set(app.myAxes,'Fontsize',14)

            %% Create powermap
            % app.CallingApp.DoneLamp_2.Color = [0.65 0.65 0.65];

            marg = 50; % margins in the axes (in pixels)
            


            app.Fdata(T-1) = struct('cdata',[],'colormap',[]); % temporary solution --> remove one time window
           

            for tt=1:T-1 % temporary solution --> remove one time window

                if app.CallingApp.GridDropDown.Value == "coarse uniform" || app.CallingApp.GridDropDown.Value == "fine uniform"
                    P = reshape(P_avfn(:,tt),[size(PHI,1),size(PHI,2)]);
                else
              %  elseif app.CallingApp.GridDropDown.Value == "coarse t-design" || app.CallingApp.GridDropDown.Value == "fine t-design"
                    P = griddata(grid_dirs(:,1),grid_dirs(:,2),P_avfn(:,tt),PHI,THETA,'cubic');
                end

                %%%%%% with surf/pcolor
                h=surf(app.myAxes,PHI*180/pi,THETA*180/pi,10*log10(abs(P)));
                % h=pcolor(app.myAxes,app.PHI*180/pi,app.THETA*180/pi,10*log10(abs(P)));
                h.EdgeColor = 'interp';

                [threshold, col] = getPowermapPar(app.CallingApp);

                clim(app.myAxes,[threshold 0])
                view(app.myAxes,180,-90)   % view(app.myAxes,2)
                xlim(app.myAxes,[-180 180])
                ylim(app.myAxes,[-90 90])
                xlabel(app.myAxes,'Azimuth (deg)','FontSize',14)
                ylabel(app.myAxes,'Elevation (deg)','FontSize',14)
                set(app.myAxes,'Fontsize',14)
                colormap(app.myAxes,col);

                % set(app.myAxes,"DataAspectRatio",[1 1 1]); % this is the default
                % set(app.myAxes,"DataAspectRatioMode",'manual'); % this creates shaking video if I put it here

                if app.CallingApp.withaxesButton.Value == true
                    colorbar(app.myAxes)
                    app.Fdata(tt) = getframe(app.myAxes,[-marg -marg mapWidth+1.6*marg mapHeight+1.8*marg]); % [left bottom width height]
                elseif app.CallingApp.withoutaxesButton.Value == true
                    app.Fdata(tt) = getframe(app.myAxes,[0 0 mapWidth mapHeight]);
                end

                app.CallingApp.LabelProgress_2.Text = ['Rendered ' num2str(fix(ceil(tt/(T-1)*100)*10^3)/10^3) '%'];
                pause(eps) %%%%%%%%
            end
 
            setFData(app.CallingApp,app.Fdata);

            % app.CallingApp.DoneLamp_2.Color = [0 1 0];

            %%% Same as pressing OK
            % app.CallingApp.CreateandexportpowermapsButton.Enable = 'on';
            delete(app)

        end

        % Close request function: UIFigure
        function UIFigureCloseRequest(app, event)
            app.CallingApp.CreateandexportpowermapsButton.Enable = 'on';
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
        function app = RenderPowermap_auto(varargin)

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