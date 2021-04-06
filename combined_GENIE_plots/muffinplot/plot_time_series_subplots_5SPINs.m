function [] = plot_time_series_subplots_5SPINs(PEXP1_OPEN, PEXP2_OPEN, PEXP3_OPEN, PEXP4_OPEN, PEXP5_OPEN, PNAME_OPEN1, PNAME_OPEN2, PNAME_OPEN3, PNAME_OPEN4, PNAME_OPEN5, FILENAME)
% plot time-series
%clear all;

% plot mean (true) or total (false)
plot_mean = true;

% set SPIN experiment years 
years_SPIN = 0;

% set experiment 

% exp_SPIN = ['./cgenie_output/' PEXP_SPIN];   
exp_1_OPEN = ['./cgenie_output/' PEXP1_OPEN];   
exp_2_OPEN = ['./cgenie_output/' PEXP2_OPEN];
exp_3_OPEN = ['./cgenie_output/' PEXP3_OPEN];
exp_4_OPEN = ['./cgenie_output/' PEXP4_OPEN];
exp_5_OPEN = ['./cgenie_output/' PEXP5_OPEN];

% %%%% load other data

%% overturning
% REF_misc_opsi_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_misc_opsi.res'),'ascii');
REF_misc_opsi_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_misc_opsi.res'),'ascii');
REF_misc_opsi_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_misc_opsi.res'),'ascii');
REF_misc_opsi_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_misc_opsi.res'),'ascii');
REF_misc_opsi_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_misc_opsi.res'),'ascii');
REF_misc_opsi_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_misc_opsi.res'),'ascii');


% REF_sed_O2_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_O2.res'),'ascii');
REF_sed_O2_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_O2.res'),'ascii');
REF_sed_O2_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_O2.res'),'ascii');
REF_sed_O2_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_ocn_O2.res'),'ascii');
REF_sed_O2_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_ocn_O2.res'),'ascii');
REF_sed_O2_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_ocn_O2.res'),'ascii');

% REF_sed_SO4_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_SO4.res'),'ascii');
REF_sed_SO4_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_SO4.res'),'ascii');
REF_sed_SO4_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_SO4.res'),'ascii');
REF_sed_SO4_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_ocn_SO4.res'),'ascii');
REF_sed_SO4_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_ocn_SO4.res'),'ascii');
REF_sed_SO4_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_ocn_SO4.res'),'ascii');

% REF_sed_H2S_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_H2S.res'),'ascii');
REF_sed_H2S_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_H2S.res'),'ascii');
REF_sed_H2S_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_H2S.res'),'ascii');
REF_sed_H2S_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_ocn_H2S.res'),'ascii');
REF_sed_H2S_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_ocn_H2S.res'),'ascii');
REF_sed_H2S_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_ocn_H2S.res'),'ascii');

% REF_sed_PO4_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_PO4.res'),'ascii');
REF_sed_PO4_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_PO4.res'),'ascii');
REF_sed_PO4_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_PO4.res'),'ascii');
REF_sed_PO4_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_ocn_PO4.res'),'ascii');
REF_sed_PO4_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_ocn_PO4.res'),'ascii');
REF_sed_PO4_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_ocn_PO4.res'),'ascii');

% REF_sed_ALK_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_ALK.res'),'ascii');
REF_sed_ALK_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_ALK.res'),'ascii');
REF_sed_ALK_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_ALK.res'),'ascii');
REF_sed_ALK_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_ocn_ALK.res'),'ascii');
REF_sed_ALK_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_ocn_ALK.res'),'ascii');
REF_sed_ALK_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_ocn_ALK.res'),'ascii');

% REF_sed_DIC_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_DIC.res'),'ascii');
REF_sed_DIC_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_DIC.res'),'ascii');
REF_sed_DIC_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_DIC.res'),'ascii');
REF_sed_DIC_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_ocn_DIC.res'),'ascii');
REF_sed_DIC_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_ocn_DIC.res'),'ascii');
REF_sed_DIC_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_ocn_DIC.res'),'ascii');

% REF_sed_DIC_13C_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_DIC_13C.res'),'ascii');
REF_sed_DIC_13C_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_DIC_13C.res'),'ascii');
REF_sed_DIC_13C_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_DIC_13C.res'),'ascii');
REF_sed_DIC_13C_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_ocn_DIC_13C.res'),'ascii');
REF_sed_DIC_13C_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_ocn_DIC_13C.res'),'ascii');
REF_sed_DIC_13C_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_ocn_DIC_13C.res'),'ascii');

% REF_sed_pCO2_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_atm_pCO2.res'),'ascii');
REF_sed_pCO2_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_atm_pCO2.res'),'ascii');
REF_sed_pCO2_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_atm_pCO2.res'),'ascii');
REF_sed_pCO2_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_atm_pCO2.res'),'ascii');
REF_sed_pCO2_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_atm_pCO2.res'),'ascii');
REF_sed_pCO2_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_atm_pCO2.res'),'ascii');

% REF_sed_pO2_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_atm_pO2.res'),'ascii');
REF_sed_pO2_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_atm_pO2.res'),'ascii');
REF_sed_pO2_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_atm_pO2.res'),'ascii');
REF_sed_pO2_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_atm_pO2.res'),'ascii');
REF_sed_pO2_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_atm_pO2.res'),'ascii');
REF_sed_pO2_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_atm_pO2.res'),'ascii');

% atm temp:
% REF_atm_tmp_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_atm_temp.res'),'ascii');
REF_atm_tmp_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_atm_temp.res'),'ascii');
REF_atm_tmp_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_atm_temp.res'),'ascii');
REF_atm_tmp_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_atm_temp.res'),'ascii');
REF_atm_tmp_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_atm_temp.res'),'ascii');
REF_atm_tmp_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_atm_temp.res'),'ascii');

% ocn temp:
% REF_ocn_tmp_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_temp.res'),'ascii');
REF_ocn_tmp_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_temp.res'),'ascii');
REF_ocn_tmp_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_temp.res'),'ascii');
REF_ocn_tmp_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_ocn_temp.res'),'ascii');
REF_ocn_tmp_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_ocn_temp.res'),'ascii');
REF_ocn_tmp_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_ocn_temp.res'),'ascii');

% POC export flux
% REF_fexport_POC_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_fexport_POC.res'),'ascii');
REF_fexport_POC_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_fexport_POC.res'),'ascii');
REF_fexport_POC_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_fexport_POC.res'),'ascii');
REF_fexport_POC_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_fexport_POC.res'),'ascii');
REF_fexport_POC_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_fexport_POC.res'),'ascii');
REF_fexport_POC_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_fexport_POC.res'),'ascii');


%% input to calculate POC burial:
% REF_focnsed_POC_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_focnsed_POC.res'),'ascii');
REF_focnsed_POC_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_focnsed_POC.res'),'ascii');
REF_focnsed_POC_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_focnsed_POC.res'),'ascii');
REF_focnsed_POC_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_focnsed_POC.res'),'ascii');
REF_focnsed_POC_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_focnsed_POC.res'),'ascii');
REF_focnsed_POC_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_focnsed_POC.res'),'ascii');

% REF_fsedocn_DIC_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_fsedocn_DIC.res'),'ascii');
REF_fsedocn_DIC_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_fsedocn_DIC.res'),'ascii');
REF_fsedocn_DIC_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_fsedocn_DIC.res'),'ascii');
REF_fsedocn_DIC_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_fsedocn_DIC.res'),'ascii');
REF_fsedocn_DIC_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_fsedocn_DIC.res'),'ascii');
REF_fsedocn_DIC_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_fsedocn_DIC.res'),'ascii');

% REF_fsedocn_Ca_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_fsedocn_Ca.res'),'ascii');
REF_fsedocn_Ca_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_fsedocn_Ca.res'),'ascii');
REF_fsedocn_Ca_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_fsedocn_Ca.res'),'ascii');
REF_fsedocn_Ca_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_fsedocn_Ca.res'),'ascii');
REF_fsedocn_Ca_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_fsedocn_Ca.res'),'ascii');
REF_fsedocn_Ca_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_fsedocn_Ca.res'),'ascii');

% calculate POC burial & convert from mol/yr to PgC/yr  (i.e. *12/10^15): 
% REF_POC_burial_exp1 = REF_focnsed_POC_exp1;
REF_POC_burial_exp2 = REF_focnsed_POC_exp2;
REF_POC_burial_exp3 = REF_focnsed_POC_exp3;
REF_POC_burial_exp4 = REF_focnsed_POC_exp4;
REF_POC_burial_exp5 = REF_focnsed_POC_exp5;
REF_POC_burial_exp6 = REF_focnsed_POC_exp6;

% REF_POC_burial_exp1(:,2) = (REF_focnsed_POC_exp1(:,2) - (REF_fsedocn_DIC_exp1(:,2)-REF_fsedocn_Ca_exp1(:,2))).*12.*1e-15;
REF_POC_burial_exp2(:,2) = (REF_focnsed_POC_exp2(:,2) - (REF_fsedocn_DIC_exp2(:,2)-REF_fsedocn_Ca_exp2(:,2))).*12.*1e-15;
REF_POC_burial_exp3(:,2) = (REF_focnsed_POC_exp3(:,2) - (REF_fsedocn_DIC_exp3(:,2)-REF_fsedocn_Ca_exp3(:,2))).*12.*1e-15;
REF_POC_burial_exp4(:,2) = (REF_focnsed_POC_exp4(:,2) - (REF_fsedocn_DIC_exp4(:,2)-REF_fsedocn_Ca_exp4(:,2))).*12.*1e-15;
REF_POC_burial_exp5(:,2) = (REF_focnsed_POC_exp5(:,2) - (REF_fsedocn_DIC_exp5(:,2)-REF_fsedocn_Ca_exp5(:,2))).*12.*1e-15;
REF_POC_burial_exp6(:,2) = (REF_focnsed_POC_exp6(:,2) - (REF_fsedocn_DIC_exp6(:,2)-REF_fsedocn_Ca_exp6(:,2))).*12.*1e-15;

% CaCO3 stuff:
REF_focnsed_CaCO3_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_focnsed_CaCO3.res'),'ascii');
REF_focnsed_CaCO3_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_focnsed_CaCO3.res'),'ascii');
REF_focnsed_CaCO3_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_focnsed_CaCO3.res'),'ascii');
REF_focnsed_CaCO3_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_focnsed_CaCO3.res'),'ascii');
REF_focnsed_CaCO3_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_focnsed_CaCO3.res'),'ascii');

% calculate C-burial in CaCO3 & convert from mol/yr to PgC/yr  (i.e. *12/10^15):
REF_CaCO3_burial_exp2 = REF_focnsed_CaCO3_exp2;
REF_CaCO3_burial_exp3 = REF_focnsed_CaCO3_exp3;
REF_CaCO3_burial_exp4 = REF_focnsed_CaCO3_exp4;
REF_CaCO3_burial_exp5 = REF_focnsed_CaCO3_exp5;
REF_CaCO3_burial_exp6 = REF_focnsed_CaCO3_exp6;

REF_CaCO3_burial_exp2(:,2) = (REF_focnsed_CaCO3_exp2(:,2)-REF_fsedocn_Ca_exp2(:,2)).*12.*1e-15;
REF_CaCO3_burial_exp3(:,2) = (REF_focnsed_CaCO3_exp3(:,2)-REF_fsedocn_Ca_exp3(:,2)).*12.*1e-15;
REF_CaCO3_burial_exp4(:,2) = (REF_focnsed_CaCO3_exp4(:,2)-REF_fsedocn_Ca_exp4(:,2)).*12.*1e-15;
REF_CaCO3_burial_exp5(:,2) = (REF_focnsed_CaCO3_exp5(:,2)-REF_fsedocn_Ca_exp5(:,2)).*12.*1e-15;
REF_CaCO3_burial_exp6(:,2) = (REF_focnsed_CaCO3_exp6(:,2)-REF_fsedocn_Ca_exp6(:,2)).*12.*1e-15;

% mean CaCO3 wt%
REF_mean_CaCO3_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_sed_CaCO3.res'),'ascii');
REF_mean_CaCO3_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_sed_CaCO3.res'),'ascii');
REF_mean_CaCO3_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_sed_CaCO3.res'),'ascii');
REF_mean_CaCO3_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_sed_CaCO3.res'),'ascii');
REF_mean_CaCO3_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_sed_CaCO3.res'),'ascii');


%% split in three figures:
if(true)
set(0,'defaultLineLineWidth', 2)
set(0,'DefaultAxesFontSize',10)

%%
figure
grid on
hold on

% atm temp.
subplot(3, 2, 1)
plot(REF_atm_tmp_exp2(:,1)+years_SPIN,REF_atm_tmp_exp2(:,2),'k',  ...
    REF_atm_tmp_exp3(:,1)+years_SPIN,REF_atm_tmp_exp3(:,2),'r--', ...
     REF_atm_tmp_exp4(:,1)+years_SPIN,REF_atm_tmp_exp4(:,2),'g--',  ...
    REF_atm_tmp_exp5(:,1)+years_SPIN,REF_atm_tmp_exp5(:,2),'b-.', ...
     REF_atm_tmp_exp6(:,1)+years_SPIN,REF_atm_tmp_exp6(:,2),'m:'); 
ylabel({'Mean air'; 'temp (°C)'});


% atm. CO2
subplot(3, 2, 2)
plot(REF_sed_pCO2_exp2(:,1)+years_SPIN,REF_sed_pCO2_exp2(:,3)*1e+6,'k',  ...
    REF_sed_pCO2_exp3(:,1)+years_SPIN,REF_sed_pCO2_exp3(:,3)*1e+6,'r--', ...
     REF_sed_pCO2_exp4(:,1)+years_SPIN,REF_sed_pCO2_exp4(:,3)*1e+6,'g--',  ...
    REF_sed_pCO2_exp5(:,1)+years_SPIN,REF_sed_pCO2_exp5(:,3)*1e+6,'b-.', ...
     REF_sed_pCO2_exp6(:,1)+years_SPIN,REF_sed_pCO2_exp6(:,3)*1e+6,'m:'); 
ylabel({'pCO2'; '(ppm)'});



% global min overturning (Sv)
subplot(3, 2, 3)
plot(REF_misc_opsi_exp2(:,1)+years_SPIN,REF_misc_opsi_exp2(:,2),'k',  ...
    REF_misc_opsi_exp3(:,1)+years_SPIN,REF_misc_opsi_exp3(:,2),'r--', ...
    REF_misc_opsi_exp4(:,1)+years_SPIN,REF_misc_opsi_exp4(:,2),'g--',  ...
    REF_misc_opsi_exp5(:,1)+years_SPIN,REF_misc_opsi_exp5(:,2),'b-.',  ...
    REF_misc_opsi_exp6(:,1)+years_SPIN,REF_misc_opsi_exp6(:,2),'m:'); 
ylabel({'global min'; 'overturn (Sv)'});


% atm O2
subplot(3,2, 4)
plot(REF_sed_pO2_exp2(:,1)+years_SPIN,REF_sed_pO2_exp2(:,3)*1e+6,'k',  ...
    REF_sed_pO2_exp3(:,1)+years_SPIN,REF_sed_pO2_exp3(:,3)*1e+6,'r--', ...
     REF_sed_pO2_exp4(:,1)+years_SPIN,REF_sed_pO2_exp4(:,3)*1e+6,'g--',  ...
    REF_sed_pO2_exp5(:,1)+years_SPIN,REF_sed_pO2_exp5(:,3)*1e+6,'b-.', ...
     REF_sed_pO2_exp6(:,1)+years_SPIN,REF_sed_pO2_exp6(:,3)*1e+6,'m:'); 
    ylabel({'pO2'; '(atm)'});
    ylim([0.2 0.22])


% PO4
subplot(3,2,5)
if(plot_mean) % mean (mol/kg)
    plot(REF_sed_PO4_exp2(:,1)+years_SPIN,REF_sed_PO4_exp2(:,3)*1e+6,'k',  ...
         REF_sed_PO4_exp3(:,1)+years_SPIN,REF_sed_PO4_exp3(:,3)*1e+6,'r--', ...
         REF_sed_PO4_exp4(:,1)+years_SPIN,REF_sed_PO4_exp4(:,3)*1e+6,'g--',  ...
         REF_sed_PO4_exp5(:,1)+years_SPIN,REF_sed_PO4_exp5(:,3)*1e+6,'b-.' ,  ...
         REF_sed_PO4_exp6(:,1)+years_SPIN,REF_sed_PO4_exp6(:,3)*1e+6,'m:'); 
         ylabel({'PO_4'; '(\mumol kg^{-1})'});
else % total (mol)
    plot(REF_sed_PO4_exp2(:,1)+years_SPIN,REF_sed_PO4_exp2(:,2),'k', ...
        REF_sed_PO4_exp3(:,1)+years_SPIN,REF_sed_PO4_exp3(:,2),'r--',...
        REF_sed_PO4_exp4(:,1)+years_SPIN,REF_sed_PO4_exp4(:,2),'g--', ...
        REF_sed_PO4_exp5(:,1)+years_SPIN,REF_sed_PO4_exp5(:,2),'b-.', ...
     	REF_sed_PO4_exp6(:,1)+years_SPIN,REF_sed_PO4_exp6(:,2),'m:')
    ylabel('PO_4 (mol)');
end
hleg=legend(PNAME_OPEN1, ...
    PNAME_OPEN2, ...
    PNAME_OPEN3, ...
    PNAME_OPEN4, ...
    PNAME_OPEN5); 
set(hleg,'FontSize',8);
set(hleg,'Location','SouthEast');

% d13C
subplot(3,2, 6)
plot(REF_sed_DIC_13C_exp2(:,1)+years_SPIN,REF_sed_DIC_13C_exp2(:,3),'k',  ...
    REF_sed_DIC_13C_exp3(:,1)+years_SPIN,REF_sed_DIC_13C_exp3(:,3),'r--',  ...
    REF_sed_DIC_13C_exp4(:,1)+years_SPIN,REF_sed_DIC_13C_exp4(:,3),'g--',  ...
    REF_sed_DIC_13C_exp5(:,1)+years_SPIN,REF_sed_DIC_13C_exp5(:,3),'b-.',  ...
    REF_sed_DIC_13C_exp6(:,1)+years_SPIN,REF_sed_DIC_13C_exp6(:,3),'m:'); 
%xlabel('years ');
ylabel({'global DIC 13C'; 'permil'});
    
    
if(plot_mean)  % mean (mol/kg)
    print('-depsc', ['PLOTS/' FILENAME '_1BC']);
else
    print('-depsc', ['PLOTS/' FILENAME '_Total_1BC']);
end


%%
figure
grid on
hold on


% global POC export flux 
subplot(3, 2, 1)
plot(REF_fexport_POC_exp2(:,1)+years_SPIN,REF_fexport_POC_exp2(:,2)*12*1e-15,'k',  ...
    REF_fexport_POC_exp3(:,1)+years_SPIN,REF_fexport_POC_exp3(:,2)*12*1e-15,'r--',  ...
    REF_fexport_POC_exp4(:,1)+years_SPIN,REF_fexport_POC_exp4(:,2)*12*1e-15,'g--',  ...
    REF_fexport_POC_exp5(:,1)+years_SPIN,REF_fexport_POC_exp5(:,2)*12*1e-15,'b-.',  ...
    REF_fexport_POC_exp6(:,1)+years_SPIN,REF_fexport_POC_exp6(:,2)*12*1e-15,'m:'); 
ylim([0 20])
ylabel({'global POC'; 'export (PgC yr^{-1})'});


% POC depositional flux
subplot(3, 2, 2)
    plot(REF_focnsed_POC_exp2(:,1)+years_SPIN,REF_focnsed_POC_exp2(:,2)*12*1e-15,'k', ...
         REF_focnsed_POC_exp3(:,1)+years_SPIN,REF_focnsed_POC_exp3(:,2)*12*1e-15,'r--', ...
         REF_focnsed_POC_exp4(:,1)+years_SPIN,REF_focnsed_POC_exp4(:,2)*12*1e-15,'g--', ...
         REF_focnsed_POC_exp5(:,1)+years_SPIN,REF_focnsed_POC_exp5(:,2)*12*1e-15,'b-.', ...
         REF_focnsed_POC_exp6(:,1)+years_SPIN,REF_focnsed_POC_exp6(:,2)*12*1e-15,'m:'); 
ylim([0 5])
        ylabel({'POC deposition'; '(PgC yr^{-1})'});

% POC burial
subplot(3,2, 3)
plot(REF_POC_burial_exp2(:,1)+years_SPIN,REF_POC_burial_exp2(:,2),'k', ...
    REF_POC_burial_exp3(:,1)+years_SPIN,REF_POC_burial_exp3(:,2),'r--', ...
    REF_POC_burial_exp4(:,1)+years_SPIN,REF_POC_burial_exp4(:,2),'g--', ...
    REF_POC_burial_exp5(:,1)+years_SPIN,REF_POC_burial_exp5(:,2),'b-.', ...
    REF_POC_burial_exp6(:,1)+years_SPIN,REF_POC_burial_exp6(:,2),'m:');
ylim([-0.05 0.5])
ylabel({'OM burial'; '(PgC yr^{-1})'});


% CaCO3 depositional flux
subplot(3, 2, 4)
    plot(REF_focnsed_CaCO3_exp2(:,1)+years_SPIN,REF_focnsed_CaCO3_exp2(:,2)*12*1e-15,'k', ...
         REF_focnsed_CaCO3_exp3(:,1)+years_SPIN,REF_focnsed_CaCO3_exp3(:,2)*12*1e-15,'r--', ...
         REF_focnsed_CaCO3_exp4(:,1)+years_SPIN,REF_focnsed_CaCO3_exp4(:,2)*12*1e-15,'g--', ...
         REF_focnsed_CaCO3_exp5(:,1)+years_SPIN,REF_focnsed_CaCO3_exp5(:,2)*12*1e-15,'b-.', ...
         REF_focnsed_CaCO3_exp6(:,1)+years_SPIN,REF_focnsed_CaCO3_exp6(:,2)*12*1e-15,'m:'); 
ylim([0 5])
        ylabel({'CaCO3 deposition'; '(PgC yr^{-1})'});

        
        % C-burial in CaCO3
subplot(3, 2, 5)
plot(REF_CaCO3_burial_exp2(:,1),REF_CaCO3_burial_exp2(:,2),'k', ...
    REF_CaCO3_burial_exp3(:,1),REF_CaCO3_burial_exp3(:,2),'r--', ...
    REF_CaCO3_burial_exp4(:,1),REF_CaCO3_burial_exp4(:,2),'g--', ...
    REF_CaCO3_burial_exp5(:,1),REF_CaCO3_burial_exp5(:,2),'b-.', ...
    REF_CaCO3_burial_exp6(:,1),REF_CaCO3_burial_exp6(:,2),'m:');
    ylabel({'CaCO3 burial'; '(PgC yr^{-1})'});
ylim([-0.05 0.5])


        % mean CaCO3 wt%
    subplot(3,2, 6)
    plot(REF_mean_CaCO3_exp2(:,1),REF_mean_CaCO3_exp2(:,2),'k', ...
    REF_mean_CaCO3_exp3(:,1),REF_mean_CaCO3_exp3(:,2),'r--', ...
    REF_mean_CaCO3_exp4(:,1),REF_mean_CaCO3_exp4(:,2),'g--', ...
    REF_mean_CaCO3_exp5(:,1),REF_mean_CaCO3_exp5(:,2),'b-.', ...
    REF_mean_CaCO3_exp6(:,1),REF_mean_CaCO3_exp6(:,2),'m:');
    ylabel({'Mean CaCO_3'; '(wt%)'});


if(plot_mean)  % mean (mol/kg)
    print('-depsc', ['PLOTS/' FILENAME '_2Ccyle']);
else
    print('-depsc', ['PLOTS/' FILENAME '_Total_2Ccycle']);
end


%%
figure
grid on
hold on

% O2
subplot(3,2,1)
if(plot_mean) % mean (mol/kg)
    plot(REF_sed_O2_exp2(:,1)+years_SPIN,REF_sed_O2_exp2(:,3)*1e+6,'k', ...
         REF_sed_O2_exp3(:,1)+years_SPIN,REF_sed_O2_exp3(:,3)*1e+6,'r--', ...
         REF_sed_O2_exp4(:,1)+years_SPIN,REF_sed_O2_exp4(:,3)*1e+6,'g--',  ...
         REF_sed_O2_exp5(:,1)+years_SPIN,REF_sed_O2_exp5(:,3)*1e+6,'b-.',  ...
         REF_sed_O2_exp6(:,1)+years_SPIN,REF_sed_O2_exp6(:,3)*1e+6,'m:'); 
        ylabel({'O_2'; '(\mumol kg^{-1})'});
else
    % total (mol)
    plot(REF_sed_O2_exp2(:,1)+years_SPIN,REF_sed_O2_exp2(:,2),'k', ...
         REF_sed_O2_exp3(:,1)+years_SPIN,REF_sed_O2_exp3(:,2),'r--', ...
         REF_sed_O2_exp4(:,1)+years_SPIN,REF_sed_O2_exp4(:,2),'g--', ...
         REF_sed_O2_exp5(:,1)+years_SPIN,REF_sed_O2_exp5(:,2),'b-.', ...
         REF_sed_O2_exp6(:,1)+years_SPIN,REF_sed_O2_exp6(:,2),'m:')
     ylabel('O_2 (mol)');
end

% SO4
subplot(3,2,2)
if(plot_mean)  % mean (mol/kg)
	plot(REF_sed_SO4_exp2(:,1)+years_SPIN,REF_sed_SO4_exp2(:,3)*1e+6,'k', ...
         REF_sed_SO4_exp3(:,1)+years_SPIN,REF_sed_SO4_exp3(:,3)*1e+6,'r--', ...
         REF_sed_SO4_exp4(:,1)+years_SPIN,REF_sed_SO4_exp4(:,3)*1e+6,'g--',  ...
         REF_sed_SO4_exp5(:,1)+years_SPIN,REF_sed_SO4_exp5(:,3)*1e+6,'b-.',  ...
         REF_sed_SO4_exp6(:,1)+years_SPIN,REF_sed_SO4_exp6(:,3)*1e+6,'m:' ); 
         ylabel({'SO_4'; '(\mumol kg^{-1})'});
else    % total (mol)
    plot(REF_sed_SO4_exp2(:,1)+years_SPIN,REF_sed_SO4_exp2(:,2),'k',...
        REF_sed_SO4_exp3(:,1)+years_SPIN,REF_sed_SO4_exp3(:,2),'r--',...
        REF_sed_SO4_exp4(:,1)+years_SPIN,REF_sed_SO4_exp4(:,2),'g--', ...
        REF_sed_SO4_exp5(:,1)+years_SPIN,REF_sed_SO4_exp5(:,2),'b-.',...
     	REF_sed_SO4_exp6(:,1)+years_SPIN,REF_sed_SO4_exp6(:,2),'m:')
    ylabel('SO_4 (mol)');
end

% H2S
subplot(3,2,3)
if(plot_mean) % mean (mol/kg)
	plot(REF_sed_H2S_exp2(:,1)+years_SPIN,REF_sed_H2S_exp2(:,3)*1e+6,'k',  ...
         REF_sed_H2S_exp3(:,1)+years_SPIN,REF_sed_H2S_exp3(:,3)*1e+6,'r--', ...
         REF_sed_H2S_exp4(:,1)+years_SPIN,REF_sed_H2S_exp4(:,3)*1e+6,'g--',  ...
         REF_sed_H2S_exp5(:,1)+years_SPIN,REF_sed_H2S_exp5(:,3)*1e+6,'b-.',  ...
         REF_sed_H2S_exp6(:,1)+years_SPIN,REF_sed_H2S_exp6(:,3)*1e+6,'m:');
         ylabel({'H_2S'; '(\mumol kg^{-1})'});
%        ylabel('(\mumol kg^{-1})');
else % total (mol)
    plot(REF_sed_H2S_exp2(:,1)+years_SPIN,REF_sed_H2S_exp2(:,2),'k', ...
        REF_sed_H2S_exp3(:,1)+years_SPIN,REF_sed_H2S_exp3(:,2),'r--', ...
        REF_sed_H2S_exp4(:,1)+years_SPIN,REF_sed_H2S_exp4(:,2),'g--', ...
        REF_sed_H2S_exp5(:,1)+years_SPIN,REF_sed_H2S_exp5(:,2),'b-.', ...
     	REF_sed_H2S_exp6(:,1)+years_SPIN,REF_sed_H2S_exp6(:,2),'m:')
    ylabel('H_2S (mol)');
end


% benthic O2
subplot(3, 2, 4)
    plot(REF_sed_O2_exp2(:,1)+years_SPIN,REF_sed_O2_exp2(:,5)*1e+6,'k', ...
         REF_sed_O2_exp3(:,1)+years_SPIN,REF_sed_O2_exp3(:,5)*1e+6,'r--', ...
         REF_sed_O2_exp4(:,1)+years_SPIN,REF_sed_O2_exp4(:,5)*1e+6,'g--',  ...
         REF_sed_O2_exp5(:,1)+years_SPIN,REF_sed_O2_exp5(:,5)*1e+6,'b-.',  ...
         REF_sed_O2_exp6(:,1)+years_SPIN,REF_sed_O2_exp6(:,5)*1e+6,'m:'); 
     ylabel({'ben. O_2'; '(\mumol kg^{-1})'});


subplot(3,2,5)
if(plot_mean)  % mean (mol/kg)
    plot(REF_sed_ALK_exp2(:,1)+years_SPIN,REF_sed_ALK_exp2(:,3)*1e+6,'k',  ...
         REF_sed_ALK_exp3(:,1)+years_SPIN,REF_sed_ALK_exp3(:,3)*1e+6,'r--', ...
         REF_sed_ALK_exp4(:,1)+years_SPIN,REF_sed_ALK_exp4(:,3)*1e+6,'g--',  ...
         REF_sed_ALK_exp5(:,1)+years_SPIN,REF_sed_ALK_exp5(:,3)*1e+6,'b-.',  ...
         REF_sed_ALK_exp6(:,1)+years_SPIN,REF_sed_ALK_exp6(:,3)*1e+6,'m:'); 
         ylabel({'ALK'; '(\mumol kg^{-1})'});
%       ylabel('(\mumol kg^{-1})');
else
	plot(REF_sed_ALK_exp2(:,1)+years_SPIN,REF_sed_ALK_exp2(:,2),'k',...
        REF_sed_ALK_exp3(:,1)+years_SPIN,REF_sed_ALK_exp3(:,2),'r--',...
        REF_sed_ALK_exp4(:,1)+years_SPIN,REF_sed_ALK_exp4(:,2),'g--', ...
        REF_sed_ALK_exp5(:,1)+years_SPIN,REF_sed_ALK_exp5(:,2),'b-.',...
        REF_sed_ALK_exp6(:,1)+years_SPIN,REF_sed_ALK_exp6(:,2),'m:')
     ylabel('ALK (mol)');
end


subplot(3,2,6)
if(plot_mean)  % mean (mol/kg)
    plot(REF_sed_DIC_exp2(:,1)+years_SPIN,REF_sed_DIC_exp2(:,3)*1e+6,'k',  ...
         REF_sed_DIC_exp3(:,1)+years_SPIN,REF_sed_DIC_exp3(:,3)*1e+6,'r--', ...
         REF_sed_DIC_exp4(:,1)+years_SPIN,REF_sed_DIC_exp4(:,3)*1e+6,'g--',  ...
         REF_sed_DIC_exp5(:,1)+years_SPIN,REF_sed_DIC_exp5(:,3)*1e+6,'b-.',  ...
         REF_sed_DIC_exp6(:,1)+years_SPIN,REF_sed_DIC_exp6(:,3)*1e+6,'m:'); 
         ylabel({'DIC'; '(\mumol kg^{-1})'});
%        ylabel('(\mumol kg^{-1})');
else
	plot(REF_sed_DIC_exp2(:,1)+years_SPIN,REF_sed_DIC_exp2(:,2),'k', ...
        REF_sed_DIC_exp3(:,1)+years_SPIN,REF_sed_DIC_exp3(:,2),'r--',...
        REF_sed_DIC_exp4(:,1)+years_SPIN,REF_sed_DIC_exp4(:,2),'g--',...
        REF_sed_DIC_exp5(:,1)+years_SPIN,REF_sed_DIC_exp5(:,2),'b-.',...
        REF_sed_DIC_exp6(:,1)+years_SPIN,REF_sed_DIC_exp6(:,2),'m:')
    ylabel('DIC (mol)');
end
% xlabel('Time since end of spin-up (ka)');
xlabel('Time');


if(plot_mean)  % mean (mol/kg)
    print('-depsc', ['PLOTS/' FILENAME '_3Biocehem']);
else
    print('-depsc', ['PLOTS/' FILENAME '_Total_3Biochem']);
end

end



