function [] = plot_time_series_subplots_1SPIN(PEXP_SPIN, PNAME_SPIN)
% plot time-series
% Example call:
% plot_time_series_subplots_2SPINs('folder_name_SPIN', 'Name to plot for SPIN1', 'NAME_of_output_file')

%clear all;

% plot mean (true) or total (false)
plot_mean = true;

% set SPIN experiment years
years_SPIN = 0;

% set experiment

exp_SPIN = ['./cgenie_output/' PEXP_SPIN];

% %%%% load other data
REF_misc_opsi_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_misc_opsi.res'),'ascii');
REF_sed_O2_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_O2.res'),'ascii');
REF_sed_SO4_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_SO4.res'),'ascii');
REF_sed_H2S_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_H2S.res'),'ascii');
REF_sed_PO4_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_PO4.res'),'ascii');
REF_sed_ALK_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_ALK.res'),'ascii');
REF_sed_DIC_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_DIC.res'),'ascii');
REF_sed_DIC_13C_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_DIC_13C.res'),'ascii');
REF_sed_pCO2_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_atm_pCO2.res'),'ascii');
REF_sed_pO2_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_atm_pO2.res'),'ascii');

% atm temp:
REF_atm_tmp_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_atm_temp.res'),'ascii');
% ocn temp:
REF_ocn_tmp_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_temp.res'),'ascii');
% POC export flux
REF_fexport_POC_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_fexport_POC.res'),'ascii');
% PO4 weathering flux
REF_weather_PO4_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_diag_weather_PO4.res'),'ascii');
% CaCO3 ocean - sediment
REF_focnsed_CaCO3_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_focnsed_CaCO3.res'),'ascii');
% mean CaCO3 wt%
REF_mean_CaCO3_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_sed_CaCO3.res'),'ascii');

%% input to calculate POC burial:
REF_focnsed_POC_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_focnsed_POC.res'),'ascii');
REF_fsedocn_DIC_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_fsedocn_DIC.res'),'ascii');
REF_fsedocn_Ca_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_fsedocn_Ca.res'),'ascii');

% calculate POC burial & convert from mol/yr to PgC/yr  (i.e. *12/10^15):
REF_POC_burial_exp1 = REF_focnsed_POC_exp1;
REF_POC_burial_exp1(:,2) = (REF_focnsed_POC_exp1(:,2) - (REF_fsedocn_DIC_exp1(:,2)-REF_fsedocn_Ca_exp1(:,2))).*12.*1e-15;

% mean POC burial of last 10 saved years (i.e. 20kyrs for a 200kyr run) (mol/yr):
x_years = 10;
Burial_POC_lastyears = REF_POC_burial_exp1(end-x_years:end,2);
format long
Mean_POC_burial_PgCpyr = mean(Burial_POC_lastyears)
Mean_POC_burial_molpyr = Mean_POC_burial_PgCpyr/12.*1e+15
% mean PO4 weathering of last 10 saved years (i.e. 20kyrs for a 200kyr run) (mol/yr):
Weather_PO4_lastyears = REF_weather_PO4_exp1(end-x_years:end,2);
Mean_PO4_weathering_molpyr = mean(Weather_PO4_lastyears)

% calculate C-burial in CaCO3 & convert from mol/yr to PgC/yr  (i.e. *12/10^15): 
REF_CaCO3_burial_exp1 = REF_focnsed_CaCO3_exp1;
REF_CaCO3_burial_exp1(:,2) = (REF_focnsed_CaCO3_exp1(:,2)-REF_fsedocn_Ca_exp1(:,2)).*12.*1e-15;

%% split in three figures:
if(true)
    set(0,'defaultLineLineWidth', 2)
    set(0,'DefaultAxesFontSize',10)
    
    %% Figure 1: Boundary conditions
    fig1 = figure;
    grid on
    hold on
    
    % atm temp.
    subplot(4, 2, 1)
    plot(REF_atm_tmp_exp1(:,1),REF_atm_tmp_exp1(:,2),'k--');
    ylabel({'Mean air'; 'temp (°C)'});
    ylim([0 20])
    
    % atm. CO2
    subplot(4, 2, 2)
    plot(REF_sed_pCO2_exp1(:,1),REF_sed_pCO2_exp1(:,3)*1e+6,'k--');
    ylabel({'pCO2'; '(ppm)'});
    ylim([0 2000])
    
    % global min overturning (Sv)
    subplot(4, 2, 3)
    plot(REF_misc_opsi_exp1(:,1),REF_misc_opsi_exp1(:,2),'k--');
    ylabel({'global min'; 'overturn (Sv)'});
    ylim([-60 -30])
    
%     % global max overturning (Sv)
%     subplot(3,2, 4)
%     plot(REF_misc_opsi_exp1(:,1),REF_misc_opsi_exp1(:,3),'k--');
%     ylabel({'global max'; 'overturn (Sv)'});
%     ylim([30 60])
    
    % atm. O2
    subplot(4, 2, 4)
    plot(REF_sed_pO2_exp1(:,1),REF_sed_pO2_exp1(:,3),'k--');
    ylabel({'pO2'; '(atm)'});
    ylim([0.2 0.22])
    
    % PO4
    subplot(4,2,5)
    if(plot_mean) % mean (mol/kg)
        plot(REF_sed_PO4_exp1(:,1),REF_sed_PO4_exp1(:,3)*1e+6,'k--');
        ylabel({'PO_4'; '(\mumol kg^{-1})'});
        ylim([0 5.0])
    else % total (mol)
        plot(REF_sed_PO4_exp1(:,1),REF_sed_PO4_exp1(:,2),'k--')
        ylabel('PO_4 (mol)');
    end
    hleg=legend(PNAME_SPIN);
    set(hleg,'FontSize',8);
    set(hleg,'Location','SouthEast');
    
   	% d13C
    subplot(4,2, 6)
    plot(REF_sed_DIC_13C_exp1(:,1),REF_sed_DIC_13C_exp1(:,3),'k--');
    ylabel({'global DIC 13C'; 'permil'});
   	ylim([-1.5 1.5])

    
    % PO4 weathering
    subplot(4, 2, 7)
    plot(REF_weather_PO4_exp1(:,1),REF_weather_PO4_exp1(:,2),'k--');
    ylabel({'PO_4 weathering'; '(mol yr-1)'});
    
    if(plot_mean)  % mean (mol/kg)
        print(fig1, '-dpsc2', ['PLOTS/01_' PEXP_SPIN '_1BC.ps']);
    else
        print(fig1,'-dpsc2', ['PLOTS/01_' PEXP_SPIN '_Total_1BC.ps']);
    end
    
    
    %% Figure 2: C-cycling
    fig2=figure;
    grid on
    hold on
    
    % global POC export flux (mol yr-1)
    subplot(3, 2, 1)
    plot(REF_fexport_POC_exp1(:,1),REF_fexport_POC_exp1(:,2),'k--');
    ylabel({'global POC'; 'export (mol yr-1)'});
  	ylim([0 5E+15])
    
    % POC depositional flux
    subplot(3, 2, 2)
    plot(REF_focnsed_POC_exp1(:,1),REF_focnsed_POC_exp1(:,2)*12*1e-15,'k--');
    ylabel({'POC deposition'; '(PgC yr^{-1})'});
   	ylim([0 5.0])

    % POC burial
    subplot(3,2, 3)
    plot(REF_POC_burial_exp1(:,1),REF_POC_burial_exp1(:,2),'k--');
    ylabel({'OM burial'; '(PgC yr^{-1})'});
   	ylim([0 1.5])
    
    % focnsed_CaCO3
    subplot(3,2, 4)
    plot(REF_focnsed_CaCO3_exp1(:,1),REF_focnsed_CaCO3_exp1(:,2)*12*1e-15,'k--');
    ylabel({'CaCO3 deposition'; '(PgC yr^{-1})'});
    ylim([0 2.0])

    % C-burial in CaCO3
    subplot(3,2, 5)
    plot(REF_CaCO3_burial_exp1(:,1),REF_CaCO3_burial_exp1(:,2),'k--');
    ylabel({'CaCO3 burial'; '(PgC yr^{-1})'});
  	ylim([0 2.0])

    % mean CaCO3 wt%
    subplot(3,2, 6)
    plot(REF_mean_CaCO3_exp1(:,1),REF_mean_CaCO3_exp1(:,2),'k--');
    ylabel({'Mean CaCO_3'; '(wt%)'});
    ylim([0 70.0])
    

    if(plot_mean)  % mean (mol/kg)
        print(fig2, '-dpsc2', ['PLOTS/02_' PEXP_SPIN '_2Ccycle.ps']);
    else
        print(fig2,'-dpsc2', ['PLOTS/02_' PEXP_SPIN '_Total_2Ccyle.ps']);
    end
    
    
    %% Figure 3: Biogeochemistry
    fig3 = figure;
    grid on
    hold on
    
    subplot(3,2,1)
    if(plot_mean) % mean (mol/kg)
        plot(REF_sed_O2_exp1(:,1),REF_sed_O2_exp1(:,3)*1e+6,'k--');
        ylabel({'O_2'; '(\mumol kg^{-1})'});
        ylim([0 250]);
        %        ylabel('(\mumol kg^{-1})');
    else
        % total (mol)
        plot(REF_sed_O2_exp1(:,1),REF_sed_O2_exp1(:,2),'k--')
        ylabel('O_2 (mol)');
    end
    
    subplot(3,2,2)
    if(plot_mean)  % mean (mol/kg)
        plot(REF_sed_SO4_exp1(:,1),REF_sed_SO4_exp1(:,3)*1e+6,'k--');
        ylabel({'SO_4'; '(\mumol kg^{-1})'});
 %       ylim([14900 15100]);
    else    % total (mol)
        plot(REF_sed_SO4_exp1(:,1),REF_sed_SO4_exp1(:,2),'k--')
        ylabel('SO_4 (mol)');
    end
    
    subplot(3,2,3)
    if(plot_mean) % mean (mol/kg)
        plot(REF_sed_H2S_exp1(:,1),REF_sed_H2S_exp1(:,3)*1e+6,'k--');
        ylabel({'H_2S'; '(\mumol kg^{-1})'});
%        ylim([0 40]);
    else % total (mol)
        plot(REF_sed_H2S_exp1(:,1),REF_sed_H2S_exp1(:,2),'k--')
        ylabel('H_2S (mol)');
    end
    
    % benthic O2
    subplot(3, 2, 4)
    plot(REF_sed_O2_exp1(:,1),REF_sed_O2_exp1(:,5)*1e+6,'k--');
    ylabel({'ben. O_2'; '(\mumol kg^{-1})'});
    ylim([0 250]);
    
    subplot(3,2,5)
    if(plot_mean)  % mean (mol/kg)
        plot(REF_sed_ALK_exp1(:,1),REF_sed_ALK_exp1(:,3)*1e+6,'k--');
        ylabel({'ALK'; '(\mumol kg^{-1})'});
%        ylim([2200 2600]);
    else
        plot(REF_sed_ALK_exp1(:,1),REF_sed_ALK_exp1(:,2),'k--')
        ylabel('ALK (mol)');
    end
    xlabel('Time');
    
    subplot(3,2,6)
    if(plot_mean)  % mean (mol/kg)
        plot(REF_sed_DIC_exp1(:,1),REF_sed_DIC_exp1(:,3)*1e+6,'k--');
        ylabel({'DIC'; '(\mumol kg^{-1})'});
%        ylim([2200 2600]);
    else
        plot(REF_sed_DIC_exp1(:,1),REF_sed_DIC_exp1(:,2),'k--')
        ylabel('DIC (mol)');
    end
    xlabel('Time');
    
    
    if(plot_mean)  % mean (mol/kg)
        print(fig3, '-dpsc2', ['PLOTS/03_' PEXP_SPIN '_3Biochem.ps']);
    else
        print(fig3, '-dpsc2', ['PLOTS/03_' PEXP_SPIN '_Total_3Biochem.ps']);
    end
    
end



