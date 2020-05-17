function Dom_run_plot_multiple_biogem_3d_k_ox_capac(PNAME_CONTOUR, TEXTFIG, FOLDER, run_GENIE_ana, depth_layers)
%% run from genie-matlab and have output folders to be plotted in folder genie-output/FOLDER

% make sure to set ocean depth to the range you want it in
% plot_field_SETTINGS.m when caling plot_fields_biogem_3d_k_ox_capac:
% plot_D_min = 70;         % [   0]  OPTIONAL MIN PLOTTING LIMIT (DEPTH, m)
% plot_D_max = 600;  or 400m       % [   0]  OPTIONAL MAX PLOTTING LIMIT (DEPTH, m)


%%%%%%%% NOTE: !!!!!!!!!!!!!
% 1) Remember when running the ox-cap. nanalysis to set the respective
% depth range in plot_fields_SETTINGS (could also be input of depth layers)
% 2) This is now related to the input PNAME_CONTOUR:   Remember to change the loaded abiotic results when changing the depth scale and also the color scale

% PNAME_CONTOUR     :   gives name of .mat file to safe calculated
%                       oxid.-capacities / or the name of the .mat-file to
%                       load + name of .eps-file
% TEXTFIG           :   Test for on top of figure
% FOLDER            :   subfolder in cgenie_output of result-files to be
%                       plotted
% run_GENIE_ana     :   do calculate ox-cap. or load from .mat-file
% depth_layers      :   how many GENIE depth layers to plot (adjust
%                       range of contors accordingly

% Example call:
% Dom_run_plot_multiple_biogem_3d_k_ox_capac('1_Model4_90-175m_ox_cap', 'Model #4', 'model4/', false, 1)
% running cal- ox-capacity for Model 4 for just k-level 15

% Direct Example call to get just one value for ox-capacity:
% Dom_run_plot_multiple_biogem_3d_k('ocn_H2S',19999.5,15,'',1e-6,0,100,20,'','','0410_Double_exp_H2S_k15', './configs/1_double_exp/')

plot_unadjusted = true;    % plot unadjusted results
plot_adjusted = true;      % plot adjusted results


%% calculate the oxidizing capacity:
if(run_GENIE_ana)
    %% load experiment names in folder
    % dinfo = dir('./configs/1_double_exp/');
    dinfo = dir(['cgenie_output/' FOLDER]);
    names_cell = {dinfo.name};
    exps = strcat(FOLDER, names_cell(3:end));
    
    
    %% call function to calculate oxidizing capacity
    for i=1:length(exps)
        i
        Ox_Capac_400m(i) = plot_fields_biogem_3d_k_ox_capac(exps{1,i},exps{1,i},'ocn_O2','ocn_H2S',9999.5,9999.5,0,'',1,-250,250,20,'','',PNAME_CONTOUR);
        %    plot_fields_biogem_3d_k(exps(i),'',PVAR1,'',PT1,-1,PIK,PMASK,PCSCALE,PCMIN,PCMAX,PCN,PDATA,POPT,PNAME)
    end
    save([strcat('./PLOTS/',PNAME_CONTOUR), '.mat'],'Ox_Capac_400m')
    exp1 = Ox_Capac_400m;
else
    %% load the .mat file with existing oxidizing capazity to plot if didn't run the GENIE ana
    
    % load('PLOTS/1_Double_exp_90-580m_ox_cap.mat');
    % exp1 = Ox_Capac_400m;
    
    % load results from runs I want to plot
    load([strcat('./PLOTS/',PNAME_CONTOUR), '.mat']);
    exp1 = Ox_Capac_400m;

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% plot the contour-plots

% 4 representative cGENIE experiments
cGENIE = [22.7 1; 28.4 1.5; 30.8 2.0; 33.3 2.0];
str = {'1','2','3','4'};
cGENIE_text = cGENIE;
cGENIE_text(:,2) = cGENIE_text(:,2)+0.07;
cGENIE_text(end,1)=32.8;

% data end-Permian 1.0 - 3.0 PO4
PO4 = [1.0:0.5:3.0];
CO2 = [1 5 10 15 20];
CO2 = [22.7 28.4 30.8 32.3 33.3];

% load appropriate abiotic results to adjust - depending on depth layers we are looking at
    switch depth_layers
        case 4
                load('PLOTS/Abiotic_Ox_Cap_90_560m.mat');     % 90-560m
        case 3
                load('PLOTS/Abiotic_Ox_Cap_90_410m.mat');   % 90 - 410m
        case 2
                load('PLOTS/Abiotic_Ox_Cap_90_280m.mat');   % 90 - 280m
        case 1
                load('PLOTS/Abiotic_Ox_Cap_90_175m.mat');   % 90 - 175m
    end
abiotic = Ox_Capac_400m;

% reshape and transpose, so PO4 is lines and CO2 is columns
Ox_Capac_matrix_exp1 = reshape(exp1, 5,5)';
Ox_Capac_matrix_abiotic = reshape(abiotic, 5,5)';

set(0,'defaultAxesFontSize',16)

%%  Oxidizing capacity unadjusted
if(plot_unadjusted)
figure;
hold on
% select correct color-range for depth layer
    switch depth_layers
        case 4
                caxis([-40000,100000])                                                  % unadjusted for 4 models 90 - 560m
                [C,h] = contourf(CO2,PO4,Ox_Capac_matrix_exp1,[-40000:10000:100000]);     % unadjusted for 4 models 90 - 560m
                % caxis([100000,130000])                                                 % for abiotic 90 - 560m
                % [C,h] = contourf(CO2,PO4,Ox_Capac_matrix_exp1,[100000:5000:130000]);      % for abiotic 90 - 560m
        case 3
                caxis([-20000,60000])                                                       % unadjusted for 4 models 90 - 410m
                [C,h] = contourf(CO2,PO4,Ox_Capac_matrix_exp1,[-20000:10000:60000]);      % unadjusted for 4 models 90 - 410m
                % caxis([70000,90000])                                                      % for abiotic 90 - 410m
                % [C,h] = contourf(CO2,PO4,Ox_Capac_matrix_exp1,[70000:5000:90000]);        % for abiotic 90 - 410m
        case 2
%                caxis([-20000,40000])     % unadjusted for 4 models 90 - 280m
%                [C,h] = contourf(CO2,PO4,Ox_Capac_matrix_exp1,[-20000:10000:40000]);       % unadjusted for 4 models 90 - 280m
                caxis([42000,54000])                                                      % for abiotic 90 - 280m
                [C,h] = contourf(CO2,PO4,Ox_Capac_matrix_exp1,[43000:2000:54000]);        % for abiotic 90 - 280m
        case 1
                caxis([-3000,21000])     % unadjusted for 4 models 90 - 280m
                [C,h] = contourf(CO2,PO4,Ox_Capac_matrix_exp1,[-3000:3000:21000]);          % unadjusted for 4 models 90 - 175m
    end
ylim([1 2.5])
clabel(C,h,'FontSize',16);
%    clabel(C,h,'LineStyle','--')
%    clabel(C,h,'FontSize',15,'Color','r')
%    clabel(C,h,'FontWeight','bold')
%    h.LineWidth = 2;
box on
txt = TEXTFIG;
text(0.03,0.92,txt,'FontSize',22,'Units','normalized', 'FontWeight', 'bold')
xlabel ({'East Tethys SST'}); %;'(\mumol cm^{-2}yr^{-1})'})
%    ylabel('e-folding depth (m)')
ylabel('Ocean PO_4 \times modern')
hold off

    print('-depsc', strcat('./PLOTS/',PNAME_CONTOUR));

end

if(plot_adjusted)

%%  Oxidizing capacity adjusted by abiotic values
Ox_Capac_matrix_exp1_adjusted = Ox_Capac_matrix_exp1 - Ox_Capac_matrix_abiotic;
figure;
hold on
% select correct color-range for depth layer
    switch depth_layers
        case 4
            caxis([-160000,-40000])   % adjusted for 4 models for 90 - 560m
            [C,h] = contourf(CO2,PO4,Ox_Capac_matrix_exp1_adjusted,[-160000:10000:-40000]); % adjusted for 4 models 90 - 560m
        case 3
            caxis([-100000,-20000])   % adjusted for 4 models for 90 - 410m
            [C,h] = contourf(CO2,PO4,Ox_Capac_matrix_exp1_adjusted,[-100000:10000:-20000]); % adjusted for 4 models 90 - 410m
        case 2
            caxis([-60000,-10000])    % adjusted for 4 models for 90 - 280m
            [C,h] = contourf(CO2,PO4,Ox_Capac_matrix_exp1_adjusted,[-60000:5000:-10000]); % adjusted for 4 models 90 - 280m
        case 1
            caxis([-22000,-3000])       % adjusted for 4 models for 90 - 175m
            [C,h] = contourf(CO2,PO4,Ox_Capac_matrix_exp1_adjusted,[-22000:3000:-3000]); % adjusted for 4 models 90 - 175m
    end
plot(cGENIE(:,1), cGENIE(:,2),'d','color','r','markerfacecolor','r','markersize',12)
text(cGENIE_text(:,1),cGENIE_text(:,2),str,'Color','red','FontSize',20)
clabel(C,h,'FontSize',16);
%    clabel(C,h,'LineStyle','--')
%    clabel(C,h,'FontSize',15,'Color','r')
%    clabel(C,h,'FontWeight','bold')
%    h.LineWidth = 2;
box on
txt = strcat(TEXTFIG,' adjusted');
text(0.03,0.92,txt,'FontSize',22,'Units','normalized', 'FontWeight', 'bold')
ylim([1 2.5])
xlabel ({'East Tethys SST'}); %;'(\mumol cm^{-2}yr^{-1})'})
%    ylabel('e-folding depth (m)')
ylabel('Ocean PO_4 \times modern')
hold off

    print('-depsc', strcat('./PLOTS/',PNAME_CONTOUR,'_adjusted'));

end

end

