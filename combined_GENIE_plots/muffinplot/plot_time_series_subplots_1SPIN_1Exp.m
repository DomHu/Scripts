function [] = plot_time_series_subplots_1SPIN_1Exp(PEXP_SPIN, PEXP1_OPEN, PNAME_SPIN, PNAME_OPEN1, PNAME_OUT)
% plot time-series
% Example call:
% plot_time_series_subplots_2SPINs('folder_name_SPIN', 'folder_name_Exp1', 'Name to plot for SPIN', 'Name to plot for Exp1', 'NAME_of_output_file')
% remember to set how long the SPIN is and how much of it yopu want to plot

%clear all;
% set SPIN experiment years
years_SPIN = 300000;
years_SPIN_plot = 300000;

% plot mean (true) or total (false)
plot_mean = true;



% set experiment
exp_SPIN = ['./cgenie_output/' PEXP_SPIN];
exp_1_OPEN = ['./cgenie_output/' PEXP1_OPEN];

% %%%% load other data

%% overturning
REF_misc_opsi_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_misc_opsi.res'),'ascii');
REF_misc_opsi_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_misc_opsi.res'),'ascii');


REF_sed_O2_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_O2.res'),'ascii');
REF_sed_O2_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_O2.res'),'ascii');

REF_sed_SO4_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_SO4.res'),'ascii');
REF_sed_SO4_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_SO4.res'),'ascii');

REF_sed_H2S_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_H2S.res'),'ascii');
REF_sed_H2S_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_H2S.res'),'ascii');

REF_sed_PO4_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_PO4.res'),'ascii');
REF_sed_PO4_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_PO4.res'),'ascii');

REF_sed_ALK_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_ALK.res'),'ascii');
REF_sed_ALK_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_ALK.res'),'ascii');

REF_sed_DIC_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_DIC.res'),'ascii');
REF_sed_DIC_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_DIC.res'),'ascii');

REF_sed_DIC_13C_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_DIC_13C.res'),'ascii');
REF_sed_DIC_13C_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_DIC_13C.res'),'ascii');

REF_sed_pCO2_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_atm_pCO2.res'),'ascii');
REF_sed_pCO2_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_atm_pCO2.res'),'ascii');

REF_sed_pO2_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_atm_pO2.res'),'ascii');
REF_sed_pO2_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_atm_pO2.res'),'ascii');

% atm temp:
REF_atm_tmp_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_atm_temp.res'),'ascii');
REF_atm_tmp_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_atm_temp.res'),'ascii');

% ocn temp:
REF_ocn_tmp_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_temp.res'),'ascii');
REF_ocn_tmp_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_temp.res'),'ascii');

% POC export flux
REF_fexport_POC_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_fexport_POC.res'),'ascii');
REF_fexport_POC_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_fexport_POC.res'),'ascii');


% CaCO3 ocean - sediment
REF_focnsed_CaCO3_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_focnsed_CaCO3.res'),'ascii');
REF_focnsed_CaCO3_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_focnsed_CaCO3.res'),'ascii');

% mean CaCO3 wt%
REF_mean_CaCO3_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_sed_CaCO3.res'),'ascii');
REF_mean_CaCO3_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_sed_CaCO3.res'),'ascii');


%% input to calculate POC burial:
REF_focnsed_POC_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_focnsed_POC.res'),'ascii');
REF_focnsed_POC_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_focnsed_POC.res'),'ascii');

REF_fsedocn_DIC_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_fsedocn_DIC.res'),'ascii');
REF_fsedocn_DIC_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_fsedocn_DIC.res'),'ascii');

REF_fsedocn_Ca_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_fsedocn_Ca.res'),'ascii');
REF_fsedocn_Ca_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_fsedocn_Ca.res'),'ascii');

% calculate POC burial & convert from mol/yr to PgC/yr  (i.e. *12/10^15):
REF_POC_burial_exp1 = REF_focnsed_POC_exp1;
REF_POC_burial_exp2 = REF_focnsed_POC_exp2;

REF_POC_burial_exp1(:,2) = (REF_focnsed_POC_exp1(:,2) - (REF_fsedocn_DIC_exp1(:,2)-REF_fsedocn_Ca_exp1(:,2))).*12.*1e-15;
REF_POC_burial_exp2(:,2) = (REF_focnsed_POC_exp2(:,2) - (REF_fsedocn_DIC_exp2(:,2)-REF_fsedocn_Ca_exp2(:,2))).*12.*1e-15;

% calculate C-burial in CaCO3 & convert from mol/yr to PgC/yr  (i.e. *12/10^15):
REF_CaCO3_burial_exp1 = REF_focnsed_CaCO3_exp1;
REF_CaCO3_burial_exp2 = REF_focnsed_CaCO3_exp2;

REF_CaCO3_burial_exp1(:,2) = (REF_focnsed_CaCO3_exp1(:,2)-REF_fsedocn_Ca_exp1(:,2)).*12.*1e-15;
REF_CaCO3_burial_exp2(:,2) = (REF_focnsed_CaCO3_exp2(:,2)-REF_fsedocn_Ca_exp2(:,2)).*12.*1e-15;

% calculate length up experiments
time_exps = REF_misc_opsi_exp2(end,1);
xaxis_lim = years_SPIN + time_exps;

%% split in three figures:
if(true)
    set(0,'defaultLineLineWidth', 2)
    set(0,'DefaultAxesFontSize',10)
    
    %%
    fig1 = figure;
    grid on
    hold on
    
    % atm temp.
    subplot(3, 2, 1)
    plot(REF_atm_tmp_exp1(:,1),REF_atm_tmp_exp1(:,2),'k--', ...
        REF_atm_tmp_exp2(:,1)+years_SPIN,REF_atm_tmp_exp2(:,2),'k');
    ylabel({'Mean air'; 'temp (°C)'});
    xlim([years_SPIN-years_SPIN_plot xaxis_lim])
    ylim([10 20])
    
    % atm. CO2
    subplot(3, 2, 2)
    plot(REF_sed_pCO2_exp1(:,1),REF_sed_pCO2_exp1(:,3)*1e+6,'k--', ...
        REF_sed_pCO2_exp2(:,1)+years_SPIN,REF_sed_pCO2_exp2(:,3)*1e+6,'k');
    ylabel({'pCO2'; '(ppm)'});
    xlim([years_SPIN-years_SPIN_plot xaxis_lim])
    ylim([0 1200])
    
    
    % global min overturning (Sv)
    subplot(3, 2, 3)
    plot(REF_misc_opsi_exp1(:,1),REF_misc_opsi_exp1(:,2),'k--', ...
        REF_misc_opsi_exp2(:,1)+years_SPIN,REF_misc_opsi_exp2(:,2),'k');
    ylabel({'global min'; 'overturn (Sv)'});
    xlim([years_SPIN-years_SPIN_plot xaxis_lim])
    ylim([-50 -40])
    
    
    % atm. O2
    subplot(3, 2, 4)
    plot(REF_sed_pO2_exp1(:,1),REF_sed_pO2_exp1(:,3),'k--', ...
        REF_sed_pO2_exp2(:,1)+years_SPIN,REF_sed_pO2_exp2(:,3),'k');
    ylabel({'pO2'; '(atm)'});
    xlim([years_SPIN-years_SPIN_plot xaxis_lim])
    ylim([0.2 0.22])
    
    % PO4
    subplot(3,2,5)
    if(plot_mean) % mean (mol/kg)
        plot(REF_sed_PO4_exp1(:,1),REF_sed_PO4_exp1(:,3)*1e+6,'k--', ...
            REF_sed_PO4_exp2(:,1)+years_SPIN,REF_sed_PO4_exp2(:,3)*1e+6,'k');
        ylabel({'PO_4'; '(\mumol kg^{-1})'});
    else % total (mol)
        plot(REF_sed_PO4_exp1(:,1),REF_sed_PO4_exp1(:,2),'k--',...
            REF_sed_PO4_exp2(:,1)+years_SPIN,REF_sed_PO4_exp2(:,2),'k')
        ylabel('PO_4 (mol)');
    end
    xlim([years_SPIN-years_SPIN_plot xaxis_lim])
    hleg=legend(PNAME_SPIN, ...
        PNAME_OPEN1);
    set(hleg,'FontSize',8);
    set(hleg,'Location','SouthEast');
    
    % d13C
    subplot(3,2, 6)
    plot(REF_sed_DIC_13C_exp1(:,1),REF_sed_DIC_13C_exp1(:,3),'k--',  ...
        REF_sed_DIC_13C_exp2(:,1)+years_SPIN,REF_sed_DIC_13C_exp2(:,3),'k');
    ylabel({'global DIC 13C'; 'permil'});
    xlim([years_SPIN-years_SPIN_plot xaxis_lim])
    
    
    if(plot_mean)  % mean (mol/kg)
        print(fig1, '-dpsc2', ['PLOTS/01_' PNAME_OUT '_1BC_wSPIN.ps']);
    else
        print(fig1,'-dpsc2', ['PLOTS/01_' PNAME_OUT '_Total_1BC_wSPIN.ps']);
    end
    
    
    %%
    fig2=figure;
    grid on
    hold on
    
    % global POC export flux (PgC yr-1)
    subplot(3, 2, 1)
    plot(REF_fexport_POC_exp1(:,1),REF_fexport_POC_exp1(:,2)*12*1e-15,'k--', ...
        REF_fexport_POC_exp2(:,1)+years_SPIN,REF_fexport_POC_exp2(:,2)*12*1e-15,'k');
    ylabel({'global POC'; 'export (PgC yr-1)'});
    xlim([years_SPIN-years_SPIN_plot xaxis_lim])
    
    % POC depositional flux
    subplot(3, 2, 2)
    plot(REF_focnsed_POC_exp1(:,1),REF_focnsed_POC_exp1(:,2)*12*1e-15,'k--', ...
        REF_focnsed_POC_exp2(:,1)+years_SPIN,REF_focnsed_POC_exp2(:,2)*12*1e-15,'k');
    ylabel({'POC deposition'; '(PgC yr^{-1})'});
    xlim([years_SPIN-years_SPIN_plot xaxis_lim])
    
    % POC burial
    subplot(3,2, 3)
    plot(REF_POC_burial_exp1(:,1),REF_POC_burial_exp1(:,2),'k--', ...
        REF_POC_burial_exp2(:,1)+years_SPIN,REF_POC_burial_exp2(:,2),'k');
    ylabel({'OM burial'; '(PgC yr^{-1})'});
    xlim([years_SPIN-years_SPIN_plot xaxis_lim])
    
    % focnsed_CaCO3
    subplot(3,2, 4)
    plot(REF_focnsed_CaCO3_exp1(:,1),REF_focnsed_CaCO3_exp1(:,2)*12*1e-15,'k--', ...
        REF_focnsed_CaCO3_exp2(:,1)+years_SPIN,REF_focnsed_CaCO3_exp2(:,2)*12*1e-15,'k');
    ylabel({'CaCO3 deposition'; '(PgC yr^{-1})'});
    xlim([years_SPIN-years_SPIN_plot xaxis_lim])
    
    % C-burial in CaCO3
    subplot(3,2, 5)
    plot(REF_CaCO3_burial_exp1(:,1),REF_CaCO3_burial_exp1(:,2),'k--', ...
        REF_CaCO3_burial_exp2(:,1)+years_SPIN,REF_CaCO3_burial_exp2(:,2),'k');
    ylabel({'CaCO3 burial'; '(PgC yr^{-1})'});
    xlim([years_SPIN-years_SPIN_plot xaxis_lim])
    
    % mean CaCO3 wt%
    subplot(3,2, 6)
    plot(REF_mean_CaCO3_exp1(:,1),REF_mean_CaCO3_exp1(:,2),'k--', ...
        REF_mean_CaCO3_exp2(:,1)+years_SPIN,REF_mean_CaCO3_exp2(:,2),'k');
    ylabel({'Mean CaCO_3'; '(wt%)'});
    xlim([years_SPIN-years_SPIN_plot xaxis_lim])
    
    
    if(plot_mean)  % mean (mol/kg)
        print(fig2, '-dpsc2', ['PLOTS/02_' PNAME_OUT '_2Ccycle_wSPIN.ps']);
    else
        print(fig2,'-dpsc2', ['PLOTS/02_' PNAME_OUT '_Total_2Ccyle_wSPIN.ps']);
    end
    
    
    %%
    fig3 = figure;
    grid on
    hold on
    
    subplot(3,2,1)
    if(plot_mean) % mean (mol/kg)
        plot(REF_sed_O2_exp1(:,1),REF_sed_O2_exp1(:,3)*1e+6,'k--', ...
            REF_sed_O2_exp2(:,1)+years_SPIN,REF_sed_O2_exp2(:,3)*1e+6,'k');
        ylabel({'O_2'; '(\mumol kg^{-1})'});
    else
        % total (mol)
        plot(REF_sed_O2_exp1(:,1),REF_sed_O2_exp1(:,2),'k--', ...
            REF_sed_O2_exp2(:,1)+years_SPIN,REF_sed_O2_exp2(:,2),'k')
        ylabel('O_2 (mol)');
    end
    xlim([years_SPIN-years_SPIN_plot xaxis_lim])
    
    subplot(3,2,2)
    if(plot_mean)  % mean (mol/kg)
        plot(REF_sed_SO4_exp1(:,1),REF_sed_SO4_exp1(:,3)*1e+6,'k--', ...
            REF_sed_SO4_exp2(:,1)+years_SPIN,REF_sed_SO4_exp2(:,3)*1e+6,'k');
        ylabel({'SO_4'; '(\mumol kg^{-1})'});
    else    % total (mol)
        plot(REF_sed_SO4_exp1(:,1),REF_sed_SO4_exp1(:,2),'k--',...
            REF_sed_SO4_exp2(:,1)+years_SPIN,REF_sed_SO4_exp2(:,2),'k')
        ylabel('SO_4 (mol)');
    end
    xlim([years_SPIN-years_SPIN_plot xaxis_lim])
    
    subplot(3,2,3)
    if(plot_mean) % mean (mol/kg)
        plot(REF_sed_H2S_exp1(:,1),REF_sed_H2S_exp1(:,3)*1e+6,'k--', ...
            REF_sed_H2S_exp2(:,1)+years_SPIN,REF_sed_H2S_exp2(:,3)*1e+6,'k');
        ylabel({'H_2S'; '(\mumol kg^{-1})'});
    else % total (mol)
        plot(REF_sed_H2S_exp1(:,1),REF_sed_H2S_exp1(:,2),'k--',...
            REF_sed_H2S_exp2(:,1)+years_SPIN,REF_sed_H2S_exp2(:,2),'k')
        ylabel('H_2S (mol)');
    end
    xlim([years_SPIN-years_SPIN_plot xaxis_lim])
    
    % benthic O2
    subplot(3, 2, 4)
    plot(REF_sed_O2_exp1(:,1),REF_sed_O2_exp1(:,5)*1e+6,'k--', ...
        REF_sed_O2_exp2(:,1)+years_SPIN,REF_sed_O2_exp2(:,5)*1e+6,'k');
    ylabel({'ben. O_2'; '(\mumol kg^{-1})'});
    xlim([years_SPIN-years_SPIN_plot xaxis_lim])
    
    
    subplot(3,2,5)
    if(plot_mean)  % mean (mol/kg)
        plot(REF_sed_ALK_exp1(:,1),REF_sed_ALK_exp1(:,3)*1e+6,'k--', ...
            REF_sed_ALK_exp2(:,1)+years_SPIN,REF_sed_ALK_exp2(:,3)*1e+6,'k');
        ylabel({'ALK'; '(\mumol kg^{-1})'});
    else
        plot(REF_sed_ALK_exp1(:,1),REF_sed_ALK_exp1(:,2),'k--',...
            REF_sed_ALK_exp2(:,1)+years_SPIN,REF_sed_ALK_exp2(:,2),'k')
        ylabel('ALK (mol)');
    end
    xlabel('Time');
    xlim([years_SPIN-years_SPIN_plot xaxis_lim])
    
    subplot(3,2,6)
    if(plot_mean)  % mean (mol/kg)
        plot(REF_sed_DIC_exp1(:,1),REF_sed_DIC_exp1(:,3)*1e+6,'k--', ...
            REF_sed_DIC_exp2(:,1)+years_SPIN,REF_sed_DIC_exp2(:,3)*1e+6,'k');
        ylabel({'DIC'; '(\mumol kg^{-1})'});
    else
        plot(REF_sed_DIC_exp1(:,1),REF_sed_DIC_exp1(:,2),'k--',...
            REF_sed_DIC_exp2(:,1)+years_SPIN,REF_sed_DIC_exp2(:,2),'k')
        ylabel('DIC (mol)');
    end
    xlabel('Time');
    xlim([years_SPIN-years_SPIN_plot xaxis_lim])
    
    
    if(plot_mean)  % mean (mol/kg)
        print(fig3, '-dpsc2', ['PLOTS/03_' PNAME_OUT '_3Biochem_wSPIN.ps']);
    else
        print(fig3, '-dpsc2', ['PLOTS/03_' PNAME_OUT '_Total_3Biochem_wSPIN.ps']);
    end
    
end



