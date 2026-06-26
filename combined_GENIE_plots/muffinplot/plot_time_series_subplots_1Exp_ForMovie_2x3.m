function [] = plot_time_series_subplots_1Exp_ForMovie_2x3(PFolderExps, PNAME_OPEN1, PNAME_OPEN2, PNAME_OPEN3, PNAME_OPEN4, PNAME_OPEN5, PNAME_OPEN6, PNAME_OPEN7, FILENAME, expIdx, PEmission_times)

% PFolderExps: folder with experiment output [default: 'cgenie_output']

str_date = [datestr(date,11), datestr(date,5), datestr(date,7)];

years_SPIN = 0;     % do not plot SPIN

Emission_times = PEmission_times;

% --- Color-blind friendly plotting style ---
expColors = [
    0.00 0.45 0.70   % blue
    0.90 0.62 0.00   % orange
    0.00 0.62 0.45   % bluish green
    0.84 0.37 0.00   % vermillion
    0.80 0.47 0.65   % purple
    0.35 0.70 0.90   % sky blue
    0.00 0.00 0.00   % black
    ];
% expStyles = {'-','--',':','-.','-','--',':'};
expStyles = {'-','-','-','-','-','-',':'};  % all lines, but CTRL dashed
expStylesRightAxis = {'--','--','--','--','--','--',':'};  % all lines, but CTRL dashed

expMarkers = {'o','s','^','d','v','>','none'};

lw = 2;

markerYears = [100 200 400 600 800];


% set experiment
% get file names in folder configs:
a=dir([ PFolderExps '/0*']);
b={a.name};


% PEXP_SPIN = b{1};
PEXP1_OPEN = b{1};
PEXP2_OPEN = b{2};
PEXP3_OPEN = b{3};
PEXP4_OPEN = b{4};
PEXP5_OPEN = b{5};
PEXP6_OPEN = b{6};
PEXP7_OPEN = b{7};

% exp_SPIN = ['./' PFolderExps '/' PEXP_SPIN];
exp_1_OPEN = ['./' PFolderExps '/' PEXP1_OPEN];
exp_2_OPEN = ['./' PFolderExps '/' PEXP2_OPEN];
exp_3_OPEN = ['./' PFolderExps '/' PEXP3_OPEN];
exp_4_OPEN = ['./' PFolderExps '/' PEXP4_OPEN];
exp_5_OPEN = ['./' PFolderExps '/' PEXP5_OPEN];
exp_6_OPEN = ['./' PFolderExps '/' PEXP6_OPEN];
exp_7_OPEN = ['./' PFolderExps '/' PEXP7_OPEN];


expNames = { ...
    PNAME_OPEN1,...
    PNAME_OPEN2,...
    PNAME_OPEN3,...
    PNAME_OPEN4,...
    PNAME_OPEN5,...
    PNAME_OPEN6,...
    PNAME_OPEN7};

NExps = numel(expNames);

% Note: SPIN is not included!
expFolders = {exp_1_OPEN, exp_2_OPEN, exp_3_OPEN, ...
    exp_4_OPEN, exp_5_OPEN, exp_6_OPEN, exp_7_OPEN};

% Define the variables you want to load and/or plot
varList = {
    'misc_opsi'
    'ocn_O2'
    'ocn_SO4'
    'ocn_H2S'
    'ocn_PO4'
    'ocn_ALK'
    'ocn_DIC'
    'ocn_DIC_13C'
    'atm_pCO2'
    'atm_pO2'
    'atm_temp'
    'ocn_temp'
    'focnsed_CaCO3'
    'sed_CaCO3'
    'focnsed_POC'
    'fsedocn_DIC'
    'fsedocn_Ca'
    'fsedocn_PO4'
    'misc_SLT'
    };

%% load data

for ivar = 1:numel(varList)
    
    for iexp = 1:numel(expFolders)
        
        fname = sprintf('biogem_series_%s.res',varList{ivar});
        
        Data.(varList{ivar}){iexp} = ...
            load(fullfile(expFolders{iexp},'biogem',fname),'ascii');
        
    end
    
end

% save time in variable
t = Data.atm_temp{2}(:,1);

%% Metadata
% calculate POC burial
for iexp = 1:numel(Data.focnsed_POC)
    
    Data.POC_burial{iexp} = Data.focnsed_POC{iexp};
    
    Data.POC_burial{iexp}(:,2) = ...
        ( Data.focnsed_POC{iexp}(:,2) ...
        - (Data.fsedocn_DIC{iexp}(:,2) - Data.fsedocn_Ca{iexp}(:,2)) );
    
end

% calculate CaCO3 burial
for iexp = 1:numel(Data.focnsed_CaCO3)
    
    Data.CaCO3_burial{iexp} = Data.focnsed_CaCO3{iexp};
    
    Data.CaCO3_burial{iexp}(:,2) = ...
        ( Data.focnsed_CaCO3{iexp}(:,2) - Data.fsedocn_Ca{iexp}(:,2) ) ...
        .* 12 .* 1e-15;
    
end

%% Extract values from .config file to calculate weathering rate
CtoK = 273.15;                      % convert from °C to Kelvin

par_k_Ca = 0.049;                   % constant for temperature-carbonate weathering feedback
par_R_gas_const = 8.3144598;        % (J K-1 mol-1)
par_E_a = 74.0;                     % Activation energy for silicate weathering (kJ/Mol)

vars_config = { ...
    'rg_par_ref_T0'
    'rg_par_weather_CaCO3'
    'rg_par_weather_CaSiO3'
    'rg_par_weather_CaSiO3_fracC'
    'rg_par_weather_kerogen_fracP'
    'rg_par_weather_kerogen_fracALK'};

Meta = struct();

for iexp = 1:numel(b)
    
    expID = b{iexp};
    
    cfgFile = fullfile('./cgenie_output', expID, 'archive', ...
        [expID '.config']);
    
    txt = fileread(cfgFile);
    
    Meta(iexp).name = expID;
    
    for ivar = 1:numel(vars_config)
        
        varName = vars_config{ivar};
        
        expr = [varName '\s*=\s*([-+0-9.Ee]+)'];
        tok = regexp(txt, expr, 'tokens', 'once');
        
        if ~isempty(tok)
            Meta(iexp).(varName) = str2double(tok{1});
        else
            Meta(iexp).(varName) = NaN;
            warning('Variable %s not found in %s', varName, cfgFile)
        end
        
    end
    
end

Data.Meta = Meta;   % Attach to Data for later use

% calculate different weathering fluxes
for iexp = 1:numel(Data.misc_SLT)
    % CaCO3 weathering
    Data.fweather_CaCO3{iexp} = Data.misc_SLT{iexp};
    Data.fweather_CaCO3{iexp}(:,2) = ...
        Data.Meta(iexp).rg_par_weather_CaCO3.*(1 + par_k_Ca.*(Data.misc_SLT{iexp}(:,2) - Data.Meta(iexp).rg_par_ref_T0) );
    % CaSiO3 weathering
    Data.fweather_CaSiO3{iexp} = Data.misc_SLT{iexp};
    Data.fweather_CaSiO3{iexp}(:,2) = ...
        Data.Meta(iexp).rg_par_weather_CaSiO3.* ...
        exp( 1000*par_E_a/(par_R_gas_const*(Data.Meta(iexp).rg_par_ref_T0-CtoK)^2) .* (Data.misc_SLT{iexp}(:,2) - Data.Meta(iexp).rg_par_ref_T0));
    % Kerogen weathering
    Data.fweather_kerogen{iexp} = Data.misc_SLT{iexp};
    Data.fweather_kerogen{iexp}(:,2) = Data.fweather_CaSiO3{iexp}(:,2) .* Data.Meta(iexp).rg_par_weather_CaSiO3_fracC;
    % P weathering
    Data.fweather_P{iexp} = Data.misc_SLT{iexp};
    Data.fweather_P{iexp}(:,2) = Data.fweather_kerogen{iexp}(:,2) .* Data.Meta(iexp).rg_par_weather_kerogen_fracP;
    
    % Corg-burial / Si-weathering
    Data.fracCorgBurialvsSiWeather{iexp} = Data.misc_SLT{iexp};
    Data.fracCorgBurialvsSiWeather{iexp}(:,2) = Data.POC_burial{iexp}(:,2) ./ Data.fweather_CaSiO3{iexp}(:,2);
    
    % P regeneration / P weathering
    Data.fracPregenvsPweather{iexp} = Data.misc_SLT{iexp};
    Data.fracPregenvsPweather{iexp}(:,2) = Data.fsedocn_PO4{iexp}(:,2) ./ Data.fweather_P{iexp}(:,2);
end

%% MAKE Emissions rates for the seven experiments
Data.emissionRate = cell(1,NExps);

for iexp = 1:NExps
    t = Data.atm_temp{iexp}(:,1);
    Data.emissionRate{iexp} = [t zeros(size(t))];
end

% Experiment 1: Papadomanolaki emission scenario
E = zeros(size(t));

% 0–20 kyr: ramp up 0 -> 0.065
idx = t <= 20000;
E(idx) = 0.065 * t(idx)/20000;

% 20–190 kyr: constant 0.065
idx = t > 20000 & t <= 190000;
E(idx) = 0.065;

% 190–210 kyr: ramp down 0.065 -> 0.02
idx = t > 190000 & t <= 210000;
E(idx) = 0.065 - (0.065-0.02)*(t(idx)-190000)/20000;

% 210–290 kyr: constant 0.02
idx = t > 210000 & t <= 290000;
E(idx) = 0.02;

% 290–370 kyr: ramp up 0.02 -> 0.075
idx = t > 290000 & t <= 370000;
E(idx) = 0.02 + (0.075-0.02)*(t(idx)-290000)/80000;

% 370–410 kyr: constant 0.075
idx = t > 370000 & t <= 410000;
E(idx) = 0.075;

% 410–490 kyr: ramp down 0.075 -> 0
idx = t > 410000 & t <= 490000;
E(idx) = 0.075*(1 - (t(idx)-410000)/80000);

Data.emissionRate{1}(:,2) = E;

% Experiment 2: constant 0.05 PgC yr-1 for 400 kyrs
Data.emissionRate{2}(:,2) = 0.05 * (Data.emissionRate{2}(:,1) <= 400000);

% Experiment 3: 0.05 PgC yr-1 ramp down over 400 kyrs
Data.emissionRate{3}(:,2) = max(0, 0.05*(1 - Data.emissionRate{3}(:,1)/400000));

% Experiment 4: 0.1 PgC yr-1 ramp down over 400 kyrs
Data.emissionRate{4}(:,2) = max(0, 0.1*(1 - Data.emissionRate{3}(:,1)/400000));

% Experiment 5: 0.05 PgC yr-1 ramp down over 800 kyrs
Data.emissionRate{5}(:,2) = max(0, 0.05*(1 - Data.emissionRate{3}(:,1)/800000));

% Experiment 6: 0.05 PgC yr-1 ramp down over 200 kyrs to 0.025, then up to 0.05, then ramp down to 0 over 500,000 yrs
E = zeros(size(t));

% 0–200 kyr: ramp down from 0.05 to 0.025
idx1 = t <= 200000;
E(idx1) = 0.05 - (0.05 - 0.025) .* (t(idx1) / 200000);

% 200–700 kyr: jump back to 0.05, then ramp down to 0 over 500 kyr
idx2 = t > 200000 & t <= 700000;
E(idx2) = 0.05 .* (1 - (t(idx2) - 200000) / 500000);

% after 700 kyr: remains 0
E(t > 700000) = 0;

Data.emissionRate{6}(:,2) = E;

% Calculate total emissions
totEm = zeros(1,numel(expIdx));

for ii = 1:numel(expIdx)
    i = expIdx(ii);
    
    t = Data.emissionRate{i}(:,1);    % yr
    E = Data.emissionRate{i}(:,2);    % PgC yr^-1
    
    totEm(ii) = trapz(t,E);           % PgC
end

%% Calculate frame distribution!
% lots of frames during the rapid early response,
% fewer during the slow recovery,

Input_data = Data.('atm_temp'){1};

if false    % 81 sec movie with first 10kyrs veryy long
    nFrames = 250;
    idx = round(linspace(1,size(Input_data,1),nFrames));    % Choose nFrames rows that are evenly distributed throughout the available output
    idx_frameTimes = unique(idx);
    frameTimes = Input_data(idx_frameTimes,1);     % extract the corresponding times
end 

%% ------------------------------------------------------------------------
% Define movie frame times
% 0–200 kyr   : ~30 s
% 200–400 kyr : ~15 s
% 400–800 kyr : ~15 s
% All selected frameTimes are snapped to existing model output times
%% ------------------------------------------------------------------------

fps = 5;

t0 = 0;
t1 = 200000;
t2 = 400000;
t3 = 800000;

nFrames1 = 30 * fps;   % 150 frames
nFrames2 = 15 * fps;   % 75 frames
nFrames3 = 15 * fps;   % 75 frames

modelTimes = Input_data(:,1);

% ----- 0–200 kyr --------------------------------------------------------
targetTimes1 = linspace(t0,t1,nFrames1);

idx1 = zeros(size(targetTimes1));
for i = 1:numel(targetTimes1)
    [~,idx1(i)] = min(abs(modelTimes - targetTimes1(i)));
end
idx1 = unique(idx1,'stable');

% ----- 200–400 kyr ------------------------------------------------------
targetTimes2 = linspace(t1,t2,nFrames2+1);
targetTimes2 = targetTimes2(2:end);  % avoid duplicate 200 kyr

idx2 = zeros(size(targetTimes2));
for i = 1:numel(targetTimes2)
    [~,idx2(i)] = min(abs(modelTimes - targetTimes2(i)));
end
idx2 = unique(idx2,'stable');

% ----- 400–800 kyr ------------------------------------------------------
targetTimes3 = linspace(t2,t3,nFrames3+1);
targetTimes3 = targetTimes3(2:end);  % avoid duplicate 400 kyr

idx3 = zeros(size(targetTimes3));
for i = 1:numel(targetTimes3)
    [~,idx3(i)] = min(abs(modelTimes - targetTimes3(i)));
end
idx3 = unique(idx3,'stable');

% ----- Combine ----------------------------------------------------------
idx_frameTimes = unique([idx1(:); idx2(:); idx3(:)],'stable');

frameTimes = modelTimes(idx_frameTimes);

fprintf('Movie contains %d frames (%.1f s at %d fps).\n', ...
    numel(frameTimes), numel(frameTimes)/fps, fps);


%%  PLOT FIGURE

set(0,'defaultLineLineWidth', 2)
set(0,'DefaultAxesFontSize',14)

for k=1:length(idx_frameTimes)
    fig1 = figure(...
        'Position',[100 100 2048 620],...
        'Color','w','visible','off');
    
    % Emission rate & SAT
    subplot(2, 3, 1)
    plotVar2Y(Data,...
        'emissionRate',2,1,{'Emission'; '(PgC yr^{-1})'},...
        'atm_temp',2,1,{'SAT';'(°C)'},...
        years_SPIN,...
        expColors,expStyles,expStylesRightAxis,expMarkers,...
        lw,markerYears,expIdx,Emission_times, idx_frameTimes(k))
    
    % P-regen / P-weather
    subplot(2, 3, 2)
    plotVar(Data,'fracPregenvsPweather',2,1, ...
        years_SPIN,expColors,expStyles,...
        expMarkers,lw,markerYears,expIdx, Emission_times, idx_frameTimes(k))
    ylabel({'P^{reg} / P^{w}'; '(-)'});
    
    % PO4 mean (mol/kg)
    subplot(2,3,3)
    plotVar(Data,'ocn_PO4',3,1e+6, ...
        years_SPIN,expColors,expStyles,...
        expMarkers,lw,markerYears,expIdx, Emission_times, idx_frameTimes(k))
    ylabel({'PO_4'; '(\mumol kg^{-1})'});
    
    % Corg burial
    subplot(2,3,4)
    plotVar(Data,'POC_burial',2,12 .* 1e-15, ...
        years_SPIN,expColors,expStyles,...
        expMarkers,lw,markerYears,expIdx, Emission_times, idx_frameTimes(k))
    ylabel({'C_{org} burial'; '(PgC yr^{-1})'});
    
    % Corg burial / Si weathering (mol / mol)
    subplot(2,3,5)
    plotVar(Data,'fracCorgBurialvsSiWeather',2,1, ...
        years_SPIN,expColors,expStyles,...
        expMarkers,lw,markerYears,expIdx, Emission_times, idx_frameTimes(k))
    ylabel({'C_{org}^b / Si^{w}'; '(-)'});
    xlabel('Time (ky)')
    
    % d13C of DIC surface
    subplot(2,3,6)
    plotVar(Data,'ocn_DIC_13C',6,1, ...
        years_SPIN,expColors,expStyles,...
        expMarkers,lw,markerYears,expIdx, Emission_times, idx_frameTimes(k))
    ylabel({'Surface DIC 13C'; '(‰)'});
    xlabel('Time (ky)')
    
    
    %    print(fig1, '-depsc', ['PLOTS/TimeSeries/' str_date '_' FILENAME '_1_Emi_Ccyclenew']);
    set(fig1,'PaperPositionMode','auto')
    print(fig1,'-dpng','-r96',['PLOTS/ForMovie/TimeSeries/' str_date '_' FILENAME '_frame' num2str(k,'%04.f') '.png'])
    
    close all
end

end


function plotVar(Data,varName,col,scaleFactor,years_SPIN,...
    expColors,expStyles,expMarkers,...
    lw,markerYears,expIdx, Emission_times, idx_frameTimes)

% Determine global min/max across ALL experiments
ymin = inf;
ymax = -inf;

for iexp = 1:numel(Data.(varName))
    
    y_all = Data.(varName){iexp}(:,col) * scaleFactor;
    
    ymin = min(ymin, min(y_all,[],'omitnan'));
    ymax = max(ymax, max(y_all,[],'omitnan'));
    
end

hold on
box on

for iexp = expIdx
    
    x = (Data.(varName){iexp}(1:idx_frameTimes,1) + years_SPIN)/1000;
    y = Data.(varName){iexp}(1:idx_frameTimes,col) * scaleFactor;
    
    markerIdx = zeros(size(markerYears));
    for ii = 1:numel(markerYears)
        [~,markerIdx(ii)] = min(abs(x-markerYears(ii)));
    end
    
    plot(x,y,...
        'Color',expColors(iexp,:),...
        'LineStyle',expStyles{iexp},...
        'LineWidth',lw,...
        'Marker',expMarkers{iexp},...
        'MarkerIndices',unique(markerIdx),...
        'MarkerSize',4);
end
% Add a small padding
dy = ymax - ymin;

if dy == 0
    dy = abs(ymax)*0.05;
end

% Plot emission timing markers
if exist('Emission_times','var') && ~isempty(Emission_times)
    
    for i = 1:numel(Emission_times)
        
        xline(Emission_times(i), ...
            '--', ...
            'Color',[0.6 0.6 0.6], ...
            'LineWidth',0.75);
        
    end
    
end

% yline(y(1), ...
%             '--', ...
%             'Color',[0 0 0], ...
%             'LineWidth',0.75);
ylim([ymin-0.05*dy ymax+0.05*dy])
xlim([0 800])

end


function plotVar2Y(Data,...
    varLeft,colLeft,scaleLeft,yLabelLeft,...
    varRight,colRight,scaleRight,yLabelRight,...
    years_SPIN,...
    expColors,expStyles,expStylesRight,expMarkers,...
    lw,markerYears,expIdx,Emission_times, idx_frameTimes)
%     (Data,varName,col,scaleFactor,years_SPIN,...
%     expColors,expStyles,expMarkers,...
%     lw,markerYears,expIdx, Emission_times)

% rightColor = [0.85 0.33 0.10];   % reddish/orange
rightColor = [0.55 0.00 0.55];  % purple

% Determine global min/max across ALL experiments
% Left axis
yminL = inf; ymaxL = -inf;
for iexp = 1:numel(Data.(varLeft))
    y = Data.(varLeft){iexp}(:,colLeft)*scaleLeft;
    yminL = min(yminL,min(y,[],'omitnan'));
    ymaxL = max(ymaxL,max(y,[],'omitnan'));
end

% Right axis
yminR = inf; ymaxR = -inf;
for iexp = 1:numel(Data.(varRight))
    y = Data.(varRight){iexp}(:,colRight)*scaleRight;
    yminR = min(yminR,min(y,[],'omitnan'));
    ymaxR = max(ymaxR,max(y,[],'omitnan'));
end

% Plot left axis  - plot entire emission scenario
hold on
box on

yyaxis left


for iexp = expIdx
    
    x = (Data.(varLeft){iexp}(1:end,1)+years_SPIN)/1000;
    y = Data.(varLeft){iexp}(1:end,colLeft)*scaleLeft;
    
    markerIdx = zeros(size(markerYears));
    for ii = 1:numel(markerYears)
        [~,markerIdx(ii)] = min(abs(x-markerYears(ii)));
    end
    
    plot(x,y,...
        'Color',expColors(iexp,:),...
        'LineStyle',expStyles{iexp},...
        'LineWidth',lw,...
        'Marker',expMarkers{iexp},...
        'MarkerIndices',unique(markerIdx),...
        'MarkerSize',4);
    
end

% --- Total emissions up to current frame ---
if strcmp(varLeft,'emissionRate') && exist('idx_frameTimes','var') && ~isempty(idx_frameTimes)
    if  idx_frameTimes > 1
        tEmi = Data.emissionRate{expIdx(1)}(:,1);  % time in yr
        rEmi = Data.emissionRate{expIdx(1)}(:,2);  % emission rate in PgC yr^-1

        totalEmission = trapz(tEmi(1:idx_frameTimes),rEmi(1:idx_frameTimes));  % PgC
    else
        totalEmission = 0;
    end
% Round to nearest 250 PgC
totalEmission = 250 * round(totalEmission/250);

formatter = java.text.DecimalFormat('#,##0');
emiStr = char(formatter.format(totalEmission));

text(0.98,0.90,...
    ['Total = ' sprintf('%8s',emiStr) ' PgC'],...
    'Units','normalized',...
    'FontSize',12,...
    'Color',expColors(expIdx(1),:), ...
        'HorizontalAlignment','right');

end

% Add a small padding
dyL = ymaxL - yminL;

if dyL == 0
    dyL = abs(ymaxL)*0.05;
end
ylim([yminL-0.05*dyL ymaxL+0.05*dyL])
ylabel(yLabelLeft)
ax = gca;
ax.YAxis(1).Color = 'k';


% Plot right axis
yyaxis right

for iexp = expIdx
    x = (Data.(varRight){iexp}(1:idx_frameTimes,1)+years_SPIN)/1000;
    y = Data.(varRight){iexp}(1:idx_frameTimes,colRight)*scaleRight;
    
    if iexp==7   % CTRL
        plot(x,y,...
            'Color','k',...
            'LineStyle',expStylesRight{iexp},...
            'LineWidth',lw);
    else
        c = (y-yminR)/(ymaxR-yminR);    % normalize temp
        scatter(x,y,20,c,'filled')
        colormap(parula(256))
    end
    
end
ax.YAxis(2).Color = 'k';
% Add a small padding
dyR = ymaxR - yminR;

if dyR == 0
    dyR = abs(ymaxR)*0.05;
end
ylim([yminR-0.05*dyR ymaxR+0.05*dyR])
yticks(ceil(yminR-0.05*dyR):floor(ymaxR+0.05*dyR))

ylabel(yLabelRight)


% Plot emission timing markers
if exist('Emission_times','var') && ~isempty(Emission_times)
    
    yyaxis left
    
    yl = ylim;
    
    for i = 1:numel(Emission_times)
        plot([Emission_times(i) Emission_times(i)],...
            yl,...
            '--',...
            'Color',[0.6 0.6 0.6],...
            'LineWidth',0.75);
    end
    
    ylim(yl)

end
xlim([0 800])

% yline(y(1), ...
%             '--', ...
%             'Color',[0 0 0], ...
%             'LineWidth',0.75);


end