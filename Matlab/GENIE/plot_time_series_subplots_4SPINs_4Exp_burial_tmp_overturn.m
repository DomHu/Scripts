function [] = plot_time_series_subplots_4SPINs_4Exp_burial_tmp_overturn(PEXP_SPIN1, PEXP_SPIN2, PEXP_SPIN3, PEXP_SPIN4, PEXP1_OPEN, PEXP2_OPEN, PEXP3_OPEN, PEXP4_OPEN, PNAME_SPIN1, PNAME_SPIN2, PNAME_SPIN3, PNAME_SPIN4, PNAME_OPEN1, PNAME_OPEN2, PNAME_OPEN3, PNAME_OPEN4, FILENAME)
% plot time-series
%clear all;

% plot mean (true) or total (false)
plot_mean = true;

% set SPIN experiment years 
years_SPIN = 29999;

% set experiment 

exp_SPIN1 = ['./cgenie_output/' PEXP_SPIN1];   
exp_SPIN2 = ['./cgenie_output/' PEXP_SPIN2];   
exp_SPIN3 = ['./cgenie_output/' PEXP_SPIN3];
exp_SPIN4 = ['./cgenie_output/' PEXP_SPIN4];
exp_1_OPEN = ['./cgenie_output/' PEXP1_OPEN];
exp_2_OPEN = ['./cgenie_output/' PEXP2_OPEN];
exp_3_OPEN = ['./cgenie_output/' PEXP3_OPEN];
exp_4_OPEN = ['./cgenie_output/' PEXP4_OPEN];

% %%%% load other data

%% overturning
REF_misc_opsi_exp1 = load(fullfile(exp_SPIN1,'/biogem/biogem_series_misc_opsi.res'),'ascii');
REF_misc_opsi_exp2 = load(fullfile(exp_SPIN2,'/biogem/biogem_series_misc_opsi.res'),'ascii');
REF_misc_opsi_exp3 = load(fullfile(exp_SPIN3,'/biogem/biogem_series_misc_opsi.res'),'ascii');
REF_misc_opsi_exp4 = load(fullfile(exp_SPIN4,'/biogem/biogem_series_misc_opsi.res'),'ascii');
REF_misc_opsi_exp5 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_misc_opsi.res'),'ascii');
REF_misc_opsi_exp6 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_misc_opsi.res'),'ascii');
REF_misc_opsi_exp7 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_misc_opsi.res'),'ascii');
REF_misc_opsi_exp8 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_misc_opsi.res'),'ascii');


REF_sed_O2_exp1 = load(fullfile(exp_SPIN1,'/biogem/biogem_series_ocn_O2.res'),'ascii');
REF_sed_O2_exp2 = load(fullfile(exp_SPIN2,'/biogem/biogem_series_ocn_O2.res'),'ascii');
REF_sed_O2_exp3 = load(fullfile(exp_SPIN3,'/biogem/biogem_series_ocn_O2.res'),'ascii');
REF_sed_O2_exp4 = load(fullfile(exp_SPIN4,'/biogem/biogem_series_ocn_O2.res'),'ascii');
REF_sed_O2_exp5 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_O2.res'),'ascii');
REF_sed_O2_exp6 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_O2.res'),'ascii');
REF_sed_O2_exp7 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_ocn_O2.res'),'ascii');
REF_sed_O2_exp8 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_ocn_O2.res'),'ascii');

REF_sed_SO4_exp1 = load(fullfile(exp_SPIN1,'/biogem/biogem_series_ocn_SO4.res'),'ascii');
REF_sed_SO4_exp2 = load(fullfile(exp_SPIN2,'/biogem/biogem_series_ocn_SO4.res'),'ascii');
REF_sed_SO4_exp3 = load(fullfile(exp_SPIN3,'/biogem/biogem_series_ocn_SO4.res'),'ascii');
REF_sed_SO4_exp4 = load(fullfile(exp_SPIN4,'/biogem/biogem_series_ocn_SO4.res'),'ascii');
REF_sed_SO4_exp5 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_SO4.res'),'ascii');
REF_sed_SO4_exp6 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_SO4.res'),'ascii');
REF_sed_SO4_exp7 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_ocn_SO4.res'),'ascii');
REF_sed_SO4_exp8 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_ocn_SO4.res'),'ascii');

REF_sed_H2S_exp1 = load(fullfile(exp_SPIN1,'/biogem/biogem_series_ocn_H2S.res'),'ascii');
REF_sed_H2S_exp2 = load(fullfile(exp_SPIN2,'/biogem/biogem_series_ocn_H2S.res'),'ascii');
REF_sed_H2S_exp3 = load(fullfile(exp_SPIN3,'/biogem/biogem_series_ocn_H2S.res'),'ascii');
REF_sed_H2S_exp4 = load(fullfile(exp_SPIN4,'/biogem/biogem_series_ocn_H2S.res'),'ascii');
REF_sed_H2S_exp5 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_H2S.res'),'ascii');
REF_sed_H2S_exp6 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_H2S.res'),'ascii');
REF_sed_H2S_exp7 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_ocn_H2S.res'),'ascii');
REF_sed_H2S_exp8 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_ocn_H2S.res'),'ascii');

REF_sed_PO4_exp1 = load(fullfile(exp_SPIN1,'/biogem/biogem_series_ocn_PO4.res'),'ascii');
REF_sed_PO4_exp2 = load(fullfile(exp_SPIN2,'/biogem/biogem_series_ocn_PO4.res'),'ascii');
REF_sed_PO4_exp3 = load(fullfile(exp_SPIN3,'/biogem/biogem_series_ocn_PO4.res'),'ascii');
REF_sed_PO4_exp4 = load(fullfile(exp_SPIN4,'/biogem/biogem_series_ocn_PO4.res'),'ascii');
REF_sed_PO4_exp5 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_PO4.res'),'ascii');
REF_sed_PO4_exp6 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_PO4.res'),'ascii');
REF_sed_PO4_exp7 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_ocn_PO4.res'),'ascii');
REF_sed_PO4_exp8 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_ocn_PO4.res'),'ascii');

REF_sed_ALK_exp1 = load(fullfile(exp_SPIN1,'/biogem/biogem_series_ocn_ALK.res'),'ascii');
REF_sed_ALK_exp2 = load(fullfile(exp_SPIN2,'/biogem/biogem_series_ocn_ALK.res'),'ascii');
REF_sed_ALK_exp3 = load(fullfile(exp_SPIN3,'/biogem/biogem_series_ocn_ALK.res'),'ascii');
REF_sed_ALK_exp4 = load(fullfile(exp_SPIN4,'/biogem/biogem_series_ocn_ALK.res'),'ascii');
REF_sed_ALK_exp5 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_ALK.res'),'ascii');
REF_sed_ALK_exp6 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_ALK.res'),'ascii');
REF_sed_ALK_exp7 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_ocn_ALK.res'),'ascii');
REF_sed_ALK_exp8 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_ocn_ALK.res'),'ascii');

REF_sed_DIC_exp1 = load(fullfile(exp_SPIN1,'/biogem/biogem_series_ocn_DIC.res'),'ascii');
REF_sed_DIC_exp2 = load(fullfile(exp_SPIN2,'/biogem/biogem_series_ocn_DIC.res'),'ascii');
REF_sed_DIC_exp3 = load(fullfile(exp_SPIN3,'/biogem/biogem_series_ocn_DIC.res'),'ascii');
REF_sed_DIC_exp4 = load(fullfile(exp_SPIN4,'/biogem/biogem_series_ocn_DIC.res'),'ascii');
REF_sed_DIC_exp5 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_DIC.res'),'ascii');
REF_sed_DIC_exp6 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_DIC.res'),'ascii');
REF_sed_DIC_exp7 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_ocn_DIC.res'),'ascii');
REF_sed_DIC_exp8 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_ocn_DIC.res'),'ascii');

REF_sed_DIC_13C_exp1 = load(fullfile(exp_SPIN1,'/biogem/biogem_series_ocn_DIC_13C.res'),'ascii');
REF_sed_DIC_13C_exp2 = load(fullfile(exp_SPIN2,'/biogem/biogem_series_ocn_DIC_13C.res'),'ascii');
REF_sed_DIC_13C_exp3 = load(fullfile(exp_SPIN3,'/biogem/biogem_series_ocn_DIC_13C.res'),'ascii');
REF_sed_DIC_13C_exp4 = load(fullfile(exp_SPIN4,'/biogem/biogem_series_ocn_DIC_13C.res'),'ascii');
REF_sed_DIC_13C_exp5 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_DIC_13C.res'),'ascii');
REF_sed_DIC_13C_exp6 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_DIC_13C.res'),'ascii');
REF_sed_DIC_13C_exp7 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_ocn_DIC_13C.res'),'ascii');
REF_sed_DIC_13C_exp8 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_ocn_DIC_13C.res'),'ascii');

REF_sed_pCO2_exp1 = load(fullfile(exp_SPIN1,'/biogem/biogem_series_atm_pCO2.res'),'ascii');
REF_sed_pCO2_exp2 = load(fullfile(exp_SPIN2,'/biogem/biogem_series_atm_pCO2.res'),'ascii');
REF_sed_pCO2_exp3 = load(fullfile(exp_SPIN3,'/biogem/biogem_series_atm_pCO2.res'),'ascii');
REF_sed_pCO2_exp4 = load(fullfile(exp_SPIN4,'/biogem/biogem_series_atm_pCO2.res'),'ascii');
REF_sed_pCO2_exp5 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_atm_pCO2.res'),'ascii');
REF_sed_pCO2_exp6 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_atm_pCO2.res'),'ascii');
REF_sed_pCO2_exp7 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_atm_pCO2.res'),'ascii');
REF_sed_pCO2_exp8 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_atm_pCO2.res'),'ascii');

REF_sed_pO2_exp1 = load(fullfile(exp_SPIN1,'/biogem/biogem_series_atm_pO2.res'),'ascii');
REF_sed_pO2_exp2 = load(fullfile(exp_SPIN2,'/biogem/biogem_series_atm_pO2.res'),'ascii');
REF_sed_pO2_exp3 = load(fullfile(exp_SPIN3,'/biogem/biogem_series_atm_pO2.res'),'ascii');
REF_sed_pO2_exp4 = load(fullfile(exp_SPIN4,'/biogem/biogem_series_atm_pO2.res'),'ascii');
REF_sed_pO2_exp5 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_atm_pO2.res'),'ascii');
REF_sed_pO2_exp6 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_atm_pO2.res'),'ascii');
REF_sed_pO2_exp7 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_atm_pO2.res'),'ascii');
REF_sed_pO2_exp8 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_atm_pO2.res'),'ascii');

% atm temp:
REF_atm_tmp_exp1 = load(fullfile(exp_SPIN1,'/biogem/biogem_series_atm_temp.res'),'ascii');
REF_atm_tmp_exp2 = load(fullfile(exp_SPIN2,'/biogem/biogem_series_atm_temp.res'),'ascii');
REF_atm_tmp_exp3 = load(fullfile(exp_SPIN3,'/biogem/biogem_series_atm_temp.res'),'ascii');
REF_atm_tmp_exp4 = load(fullfile(exp_SPIN4,'/biogem/biogem_series_atm_temp.res'),'ascii');
REF_atm_tmp_exp5 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_atm_temp.res'),'ascii');
REF_atm_tmp_exp6 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_atm_temp.res'),'ascii');
REF_atm_tmp_exp7 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_atm_temp.res'),'ascii');
REF_atm_tmp_exp8 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_atm_temp.res'),'ascii');

% ocn temp:
REF_ocn_tmp_exp1 = load(fullfile(exp_SPIN1,'/biogem/biogem_series_ocn_temp.res'),'ascii');
REF_ocn_tmp_exp2 = load(fullfile(exp_SPIN2,'/biogem/biogem_series_ocn_temp.res'),'ascii');
REF_ocn_tmp_exp3 = load(fullfile(exp_SPIN3,'/biogem/biogem_series_ocn_temp.res'),'ascii');
REF_ocn_tmp_exp4 = load(fullfile(exp_SPIN4,'/biogem/biogem_series_ocn_temp.res'),'ascii');
REF_ocn_tmp_exp5 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_temp.res'),'ascii');
REF_ocn_tmp_exp6 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_temp.res'),'ascii');
REF_ocn_tmp_exp7 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_ocn_temp.res'),'ascii');
REF_ocn_tmp_exp8 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_ocn_temp.res'),'ascii');

% POC export flux
REF_fexport_POC_exp1 = load(fullfile(exp_SPIN1,'/biogem/biogem_series_fexport_POC.res'),'ascii');
REF_fexport_POC_exp2 = load(fullfile(exp_SPIN2,'/biogem/biogem_series_fexport_POC.res'),'ascii');
REF_fexport_POC_exp3 = load(fullfile(exp_SPIN3,'/biogem/biogem_series_fexport_POC.res'),'ascii');
REF_fexport_POC_exp4 = load(fullfile(exp_SPIN4,'/biogem/biogem_series_fexport_POC.res'),'ascii');
REF_fexport_POC_exp5 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_fexport_POC.res'),'ascii');
REF_fexport_POC_exp6 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_fexport_POC.res'),'ascii');
REF_fexport_POC_exp7 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_fexport_POC.res'),'ascii');
REF_fexport_POC_exp8 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_fexport_POC.res'),'ascii');

% CaCO3 wt%
REF_sed_CaCO3_exp1 = load(fullfile(exp_SPIN1,'/biogem/biogem_series_sed_CaCO3.res'),'ascii');
REF_sed_CaCO3_exp2 = load(fullfile(exp_SPIN2,'/biogem/biogem_series_sed_CaCO3.res'),'ascii');
REF_sed_CaCO3_exp3 = load(fullfile(exp_SPIN3,'/biogem/biogem_series_sed_CaCO3.res'),'ascii');
REF_sed_CaCO3_exp4 = load(fullfile(exp_SPIN4,'/biogem/biogem_series_sed_CaCO3.res'),'ascii');
REF_sed_CaCO3_exp5 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_sed_CaCO3.res'),'ascii');
REF_sed_CaCO3_exp6 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_sed_CaCO3.res'),'ascii');
REF_sed_CaCO3_exp7 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_sed_CaCO3.res'),'ascii');
REF_sed_CaCO3_exp8 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_sed_CaCO3.res'),'ascii');

%% input to calculate POC burial:
REF_focnsed_POC_exp1 = load(fullfile(exp_SPIN1,'/biogem/biogem_series_focnsed_POC.res'),'ascii');
REF_focnsed_POC_exp2 = load(fullfile(exp_SPIN2,'/biogem/biogem_series_focnsed_POC.res'),'ascii');
REF_focnsed_POC_exp3 = load(fullfile(exp_SPIN3,'/biogem/biogem_series_focnsed_POC.res'),'ascii');
REF_focnsed_POC_exp4 = load(fullfile(exp_SPIN4,'/biogem/biogem_series_focnsed_POC.res'),'ascii');
REF_focnsed_POC_exp5 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_focnsed_POC.res'),'ascii');
REF_focnsed_POC_exp6 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_focnsed_POC.res'),'ascii');
REF_focnsed_POC_exp7 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_focnsed_POC.res'),'ascii');
REF_focnsed_POC_exp8 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_focnsed_POC.res'),'ascii');


REF_fsedocn_DIC_exp1 = load(fullfile(exp_SPIN1,'/biogem/biogem_series_fsedocn_DIC.res'),'ascii');
REF_fsedocn_DIC_exp2 = load(fullfile(exp_SPIN2,'/biogem/biogem_series_fsedocn_DIC.res'),'ascii');
REF_fsedocn_DIC_exp3 = load(fullfile(exp_SPIN3,'/biogem/biogem_series_fsedocn_DIC.res'),'ascii');
REF_fsedocn_DIC_exp4 = load(fullfile(exp_SPIN4,'/biogem/biogem_series_fsedocn_DIC.res'),'ascii');
REF_fsedocn_DIC_exp5 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_fsedocn_DIC.res'),'ascii');
REF_fsedocn_DIC_exp6 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_fsedocn_DIC.res'),'ascii');
REF_fsedocn_DIC_exp7 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_fsedocn_DIC.res'),'ascii');
REF_fsedocn_DIC_exp8 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_fsedocn_DIC.res'),'ascii');


REF_fsedocn_Ca_exp1 = load(fullfile(exp_SPIN1,'/biogem/biogem_series_fsedocn_Ca.res'),'ascii');
REF_fsedocn_Ca_exp2 = load(fullfile(exp_SPIN2,'/biogem/biogem_series_fsedocn_Ca.res'),'ascii');
REF_fsedocn_Ca_exp3 = load(fullfile(exp_SPIN3,'/biogem/biogem_series_fsedocn_Ca.res'),'ascii');
REF_fsedocn_Ca_exp4 = load(fullfile(exp_SPIN4,'/biogem/biogem_series_fsedocn_Ca.res'),'ascii');
REF_fsedocn_Ca_exp5 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_fsedocn_Ca.res'),'ascii');
REF_fsedocn_Ca_exp6 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_fsedocn_Ca.res'),'ascii');
REF_fsedocn_Ca_exp7 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_fsedocn_Ca.res'),'ascii');
REF_fsedocn_Ca_exp8 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_fsedocn_Ca.res'),'ascii');

% calculate POC burial & convert from mol/yr to PgC/yr  (i.e. *12/10^15): 
REF_POC_burial_exp1 = REF_focnsed_POC_exp1;
REF_POC_burial_exp2 = REF_focnsed_POC_exp2;
REF_POC_burial_exp3 = REF_focnsed_POC_exp3;
REF_POC_burial_exp4 = REF_focnsed_POC_exp4;
REF_POC_burial_exp5 = REF_focnsed_POC_exp5;
REF_POC_burial_exp6 = REF_focnsed_POC_exp6;
REF_POC_burial_exp7 = REF_focnsed_POC_exp7;
REF_POC_burial_exp8 = REF_focnsed_POC_exp8;

% in mol yr-1
REF_POC_burial_exp1_molpyr(:,2) = (REF_focnsed_POC_exp1(:,2) - (REF_fsedocn_DIC_exp1(:,2)-REF_fsedocn_Ca_exp1(:,2)));
REF_POC_burial_exp2_molpyr(:,2) = (REF_focnsed_POC_exp2(:,2) - (REF_fsedocn_DIC_exp2(:,2)-REF_fsedocn_Ca_exp2(:,2)));
REF_POC_burial_exp3_molpyr(:,2) = (REF_focnsed_POC_exp3(:,2) - (REF_fsedocn_DIC_exp3(:,2)-REF_fsedocn_Ca_exp3(:,2)));
REF_POC_burial_exp4_molpyr(:,2) = (REF_focnsed_POC_exp4(:,2) - (REF_fsedocn_DIC_exp4(:,2)-REF_fsedocn_Ca_exp4(:,2)));
REF_POC_burial_exp5_molpyr(:,2) = (REF_focnsed_POC_exp5(:,2) - (REF_fsedocn_DIC_exp5(:,2)-REF_fsedocn_Ca_exp5(:,2)));
REF_POC_burial_exp6_molpyr(:,2) = (REF_focnsed_POC_exp6(:,2) - (REF_fsedocn_DIC_exp6(:,2)-REF_fsedocn_Ca_exp6(:,2)));
REF_POC_burial_exp7_molpyr(:,2) = (REF_focnsed_POC_exp7(:,2) - (REF_fsedocn_DIC_exp7(:,2)-REF_fsedocn_Ca_exp7(:,2)));
REF_POC_burial_exp8_molpyr(:,2) = (REF_focnsed_POC_exp8(:,2) - (REF_fsedocn_DIC_exp8(:,2)-REF_fsedocn_Ca_exp8(:,2)));

% Calculate mean burial of last 2kyrs
Avg_Corg_burial_exp1 = mean(REF_POC_burial_exp1_molpyr(end-4:end,2));
Avg_Corg_burial_exp2 = mean(REF_POC_burial_exp2_molpyr(end-4:end,2));
Avg_Corg_burial_exp3 = mean(REF_POC_burial_exp3_molpyr(end-4:end,2));
Avg_Corg_burial_exp4 = mean(REF_POC_burial_exp4_molpyr(end-4:end,2));
Avg_Corg_burial_exp5 = mean(REF_POC_burial_exp5_molpyr(end-4:end,2));
Avg_Corg_burial_exp6 = mean(REF_POC_burial_exp6_molpyr(end-4:end,2));
Avg_Corg_burial_exp7 = mean(REF_POC_burial_exp7_molpyr(end-4:end,2));
Avg_Corg_burial_exp8 = mean(REF_POC_burial_exp8_molpyr(end-4:end,2));

% in PgC yr-1
REF_POC_burial_exp1(:,2) = (REF_focnsed_POC_exp1(:,2) - (REF_fsedocn_DIC_exp1(:,2)-REF_fsedocn_Ca_exp1(:,2))).*12.*1e-15;
REF_POC_burial_exp2(:,2) = (REF_focnsed_POC_exp2(:,2) - (REF_fsedocn_DIC_exp2(:,2)-REF_fsedocn_Ca_exp2(:,2))).*12.*1e-15;
REF_POC_burial_exp3(:,2) = (REF_focnsed_POC_exp3(:,2) - (REF_fsedocn_DIC_exp3(:,2)-REF_fsedocn_Ca_exp3(:,2))).*12.*1e-15;
REF_POC_burial_exp4(:,2) = (REF_focnsed_POC_exp4(:,2) - (REF_fsedocn_DIC_exp4(:,2)-REF_fsedocn_Ca_exp4(:,2))).*12.*1e-15;
REF_POC_burial_exp5(:,2) = (REF_focnsed_POC_exp5(:,2) - (REF_fsedocn_DIC_exp5(:,2)-REF_fsedocn_Ca_exp5(:,2))).*12.*1e-15;
REF_POC_burial_exp6(:,2) = (REF_focnsed_POC_exp6(:,2) - (REF_fsedocn_DIC_exp6(:,2)-REF_fsedocn_Ca_exp6(:,2))).*12.*1e-15;
REF_POC_burial_exp7(:,2) = (REF_focnsed_POC_exp7(:,2) - (REF_fsedocn_DIC_exp7(:,2)-REF_fsedocn_Ca_exp7(:,2))).*12.*1e-15;
REF_POC_burial_exp8(:,2) = (REF_focnsed_POC_exp8(:,2) - (REF_fsedocn_DIC_exp8(:,2)-REF_fsedocn_Ca_exp8(:,2))).*12.*1e-15;

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
%plot(REF_sed_pCO2(:,1),REF_sed_pCO2(:,3)*1e+6,'b--',REF_sed_pCO2_exp2(:,1),REF_sed_pCO2_exp2(:,3)*1e+6,'r' ); 
plot(REF_atm_tmp_exp1(:,1),REF_atm_tmp_exp1(:,2),'b--', ...
    REF_atm_tmp_exp2(:,1),REF_atm_tmp_exp2(:,2),'b:',  ...
    REF_atm_tmp_exp3(:,1),REF_atm_tmp_exp3(:,2),'r--', ...
     REF_atm_tmp_exp4(:,1),REF_atm_tmp_exp4(:,2),'r:',  ...
    REF_atm_tmp_exp5(:,1)+years_SPIN,REF_atm_tmp_exp5(:,2),'b--', ...
     REF_atm_tmp_exp6(:,1)+years_SPIN,REF_atm_tmp_exp6(:,2),'b:', ...
     REF_atm_tmp_exp7(:,1)+years_SPIN,REF_atm_tmp_exp7(:,2),'r--', ...
     REF_atm_tmp_exp8(:,1)+years_SPIN,REF_atm_tmp_exp8(:,2),'r:'); 
%xlabel('years ');
ylabel({'Mean air'; 'temp (°C)'});
% xlim([10000 120000])
% set(gca,'Ytick',10:1:30)
% set(gca,'YtickLabel',{'10', '', '','','','15','','','','','20','','','','','25','','','','','30'})
% set(gca,'xticklabel',{[]})
txt = '(a)';
text(0.03,0.15,txt,'FontSize',12,'Units','normalized')

% atm. CO2
subplot(3, 2, 2)
plot(REF_sed_pCO2_exp1(:,1),REF_sed_pCO2_exp1(:,3)*1e+6,'b--', ...
    REF_sed_pCO2_exp2(:,1),REF_sed_pCO2_exp2(:,3)*1e+6,'b:',  ...
    REF_sed_pCO2_exp3(:,1),REF_sed_pCO2_exp3(:,3)*1e+6,'r--', ...
     REF_sed_pCO2_exp4(:,1),REF_sed_pCO2_exp4(:,3)*1e+6,'r:',  ...
    REF_sed_pCO2_exp5(:,1)+years_SPIN,REF_sed_pCO2_exp5(:,3)*1e+6,'b--', ...
     REF_sed_pCO2_exp6(:,1)+years_SPIN,REF_sed_pCO2_exp6(:,3)*1e+6,'b:', ...
     REF_sed_pCO2_exp7(:,1)+years_SPIN,REF_sed_pCO2_exp7(:,3)*1e+6,'r--', ...
     REF_sed_pCO2_exp8(:,1)+years_SPIN,REF_sed_pCO2_exp8(:,3)*1e+6,'r:'); 
%plot(REF_sed_pCO2_exp1(:,1),REF_sed_pCO2_exp1(:,3)*1e+6,'b--',REF_sed_pCO2_exp2(:,1),REF_sed_pCO2_exp2(:,3)*1e+6,'r',REF_sed_pCO2_exp3(:,1),REF_sed_pCO2_exp3(:,3)*1e+6,'r--',REF_sed_pCO2_exp4(:,1),REF_sed_pCO2_exp4(:,3)*1e+6,'r:'); 
%xlabel('years ');
ylabel({'pCO2'; '(ppm)'});
% xlim([10000 120000])
% ylim([0 2000])
% set(gca,'Ytick',0:100:2000)
% set(gca,'YtickLabel',{'0', '', '','','','500','','','','','1000','','','','','1500','','','','','2000'})
% set(gca,'xticklabel',{[]})
txt = '(c)';
text(0.03,0.15,txt,'FontSize',12,'Units','normalized') 


% global min overturning (Sv)
subplot(3, 2, 3)
%plot(REF_sed_pCO2(:,1),REF_sed_pCO2(:,3)*1e+6,'b--',REF_sed_pCO2_exp2(:,1),REF_sed_pCO2_exp2(:,3)*1e+6,'r' ); 
plot(REF_misc_opsi_exp1(:,1),REF_misc_opsi_exp1(:,2),'b--', ...
    REF_misc_opsi_exp2(:,1),REF_misc_opsi_exp2(:,2),'b:',  ...
    REF_misc_opsi_exp3(:,1),REF_misc_opsi_exp3(:,2),'r--', ...
    REF_misc_opsi_exp4(:,1),REF_misc_opsi_exp4(:,2),'r:',  ...
    REF_misc_opsi_exp5(:,1)+years_SPIN,REF_misc_opsi_exp5(:,2),'b--',  ...
    REF_misc_opsi_exp6(:,1)+years_SPIN,REF_misc_opsi_exp6(:,2),'b:',  ...
    REF_misc_opsi_exp7(:,1)+years_SPIN,REF_misc_opsi_exp7(:,2),'r--',  ...
    REF_misc_opsi_exp8(:,1)+years_SPIN,REF_misc_opsi_exp8(:,2),'r:'); 
%plot(REF_sed_pCO2_exp1(:,1),REF_sed_pCO2_exp1(:,3)*1e+6,'b--',REF_sed_pCO2_exp2(:,1),REF_sed_pCO2_exp2(:,3)*1e+6,'r',REF_sed_pCO2_exp3(:,1),REF_sed_pCO2_exp3(:,3)*1e+6,'r--',REF_sed_pCO2_exp4(:,1),REF_sed_pCO2_exp4(:,3)*1e+6,'r:'); 
%xlabel('years ');
ylabel({'global min'; 'overturn (Sv)'});
% xlim([10000 120000])
% set(gca,'Ytick',10:1:30)
% set(gca,'YtickLabel',{'10', '', '','','','15','','','','','20','','','','','25','','','','','30'})
% set(gca,'xticklabel',{[]})
txt = '(a)';
text(0.03,0.15,txt,'FontSize',12,'Units','normalized')

% global max overturning (Sv)
subplot(3,2, 4)
plot(REF_misc_opsi_exp1(:,1),REF_misc_opsi_exp1(:,3),'b--', ...
    REF_misc_opsi_exp2(:,1),REF_misc_opsi_exp2(:,3),'b:',  ...
    REF_misc_opsi_exp3(:,1),REF_misc_opsi_exp3(:,3),'r--', ...
    REF_misc_opsi_exp4(:,1),REF_misc_opsi_exp4(:,3),'r:',  ...
    REF_misc_opsi_exp5(:,1)+years_SPIN,REF_misc_opsi_exp5(:,3),'b--',  ...
    REF_misc_opsi_exp6(:,1)+years_SPIN,REF_misc_opsi_exp6(:,3),'b:',  ...
    REF_misc_opsi_exp7(:,1)+years_SPIN,REF_misc_opsi_exp7(:,3),'r--',  ...
    REF_misc_opsi_exp8(:,1)+years_SPIN,REF_misc_opsi_exp8(:,3),'r:'); 
%xlabel('years ');
ylabel({'global max'; 'overturn (Sv)'});
% xlim([10000 120000])
% ylim([-5 2])
% set(gca,'xticklabel',{[]})
% set(gca,'Ytick',0:1:20)
% set(gca,'YtickLabel',{'0', '', '','','','5','','','','','10','','','','','15','','','','','20'})
txt = '(b)';
text(0.03,0.15,txt,'FontSize',12,'Units','normalized')
% set(gca,'YtickLabel',{[]})

% global POC export flux (mol yr-1) 
subplot(3, 2, 5)
%plot(REF_sed_pCO2(:,1),REF_sed_pCO2(:,3)*1e+6,'b--',REF_sed_pCO2_exp2(:,1),REF_sed_pCO2_exp2(:,3)*1e+6,'r' ); 
plot(REF_fexport_POC_exp1(:,1),REF_fexport_POC_exp1(:,2),'b--', ...
    REF_fexport_POC_exp2(:,1),REF_fexport_POC_exp2(:,2),'b:',  ...
    REF_fexport_POC_exp3(:,1),REF_fexport_POC_exp3(:,2),'r--',  ...
    REF_fexport_POC_exp4(:,1),REF_fexport_POC_exp4(:,2),'r:',  ...
    REF_fexport_POC_exp5(:,1)+years_SPIN,REF_fexport_POC_exp5(:,2),'b--',  ...
    REF_fexport_POC_exp6(:,1)+years_SPIN,REF_fexport_POC_exp6(:,2),'b:',  ...
    REF_fexport_POC_exp7(:,1)+years_SPIN,REF_fexport_POC_exp7(:,2),'r--',  ...
    REF_fexport_POC_exp8(:,1)+years_SPIN,REF_fexport_POC_exp8(:,2),'r:'); 
%plot(REF_sed_pCO2_exp1(:,1),REF_sed_pCO2_exp1(:,3)*1e+6,'b--',REF_sed_pCO2_exp2(:,1),REF_sed_pCO2_exp2(:,3)*1e+6,'r',REF_sed_pCO2_exp3(:,1),REF_sed_pCO2_exp3(:,3)*1e+6,'r--',REF_sed_pCO2_exp4(:,1),REF_sed_pCO2_exp4(:,3)*1e+6,'r:'); 
%xlabel('years ');
ylabel({'global POC'; 'export (mol yr-1)'});
% xlim([10000 120000])
% set(gca,'Ytick',10:1:30)
% set(gca,'YtickLabel',{'10', '', '','','','15','','','','','20','','','','','25','','','','','30'})
% set(gca,'xticklabel',{[]})
txt = '(c)';
text(0.03,0.15,txt,'FontSize',12,'Units','normalized')

% PO4
subplot(3,2,6)
if(plot_mean) % mean (mol/kg)
    plot(REF_sed_PO4_exp1(:,1),REF_sed_PO4_exp1(:,3)*1e+6,'b--', ...
         REF_sed_PO4_exp2(:,1),REF_sed_PO4_exp2(:,3)*1e+6,'b:',  ...
         REF_sed_PO4_exp3(:,1),REF_sed_PO4_exp3(:,3)*1e+6,'r--', ...
         REF_sed_PO4_exp4(:,1),REF_sed_PO4_exp4(:,3)*1e+6,'r:',  ...
         REF_sed_PO4_exp5(:,1)+years_SPIN,REF_sed_PO4_exp5(:,3)*1e+6,'b--' ,  ...
         REF_sed_PO4_exp6(:,1)+years_SPIN,REF_sed_PO4_exp6(:,3)*1e+6,'b:' ,  ...
         REF_sed_PO4_exp7(:,1)+years_SPIN,REF_sed_PO4_exp7(:,3)*1e+6,'r--',  ...
         REF_sed_PO4_exp8(:,1)+years_SPIN,REF_sed_PO4_exp8(:,3)*1e+6,'r:'); 
         ylabel({'PO_4'; '(\mumol kg^{-1})'});
%        ylabel('(\mumol kg^{-1})');
else % total (mol)
    plot(REF_sed_PO4_exp1(:,1),REF_sed_PO4_exp1(:,2),'b--',...
        REF_sed_PO4_exp2(:,1),REF_sed_PO4_exp2(:,2),'b:', ...
        REF_sed_PO4_exp3(:,1),REF_sed_PO4_exp3(:,2),'r--',...
        REF_sed_PO4_exp4(:,1),REF_sed_PO4_exp4(:,2),'r:', ...
        REF_sed_PO4_exp5(:,1)+years_SPIN,REF_sed_PO4_exp5(:,2),'b--', ...
     	REF_sed_PO4_exp6(:,1)+years_SPIN,REF_sed_PO4_exp6(:,2),'b:', ...
     	REF_sed_PO4_exp7(:,1)+years_SPIN,REF_sed_PO4_exp7(:,2),'r--', ...
     	REF_sed_PO4_exp8(:,1)+years_SPIN,REF_sed_PO4_exp8(:,2),'r:')
    ylabel('PO_4 (mol)');
end
% set(gca,'xticklabel',{[]})
% xlim([10000 120000])
% ylim([3 5])
% set(gca,'Ytick',[3.0 4.0 5.0])
% set(gca,'YtickLabel',{'3.0','4.0','5.0'})
txt = '(h)';
text(0.03,0.15,txt,'FontSize',12,'Units','normalized') 
% hleg=legend(PNAME_SPIN, ...
%     PNAME_OPEN1, ...
%     PNAME_OPEN2, ...
%     PNAME_OPEN3, ...
%     PNAME_OPEN4, ...
%     PNAME_OPEN5, ...
%     PNAME_OPEN6); 
% %hleg=legend('0606-02 Archer SPIN - No OMEN - fast sinking', '2308-07 Archer SPIN - No OMEN - fast sinking - solid fields closedCaCO3', '2308-09 with OMEN - solid fields - invariant k1 = 0.015 closedCaCO3', '2308-11  with OMEN - solid fields - Boudreau depth closedCaCO3'); 
% set(hleg,'FontSize',8);
% set(hleg,'Location','SouthEast');



if(plot_mean)  % mean (mol/kg)
    print('-depsc', ['PLOTS/timeseries/' FILENAME '_MEAN_1']);
else
    print('-depsc', ['PLOTS/timeseries/' FILENAME '_1']);
end


%%
figure
grid on
hold on

% POC depositional flux
subplot(3, 2, 1)
    plot(REF_focnsed_POC_exp1(:,1),REF_focnsed_POC_exp1(:,2)*12*1e-15,'b--', ...
         REF_focnsed_POC_exp2(:,1),REF_focnsed_POC_exp2(:,2)*12*1e-15,'b:', ...
         REF_focnsed_POC_exp3(:,1),REF_focnsed_POC_exp3(:,2)*12*1e-15,'r--', ...
         REF_focnsed_POC_exp4(:,1),REF_focnsed_POC_exp4(:,2)*12*1e-15,'r:', ...
         REF_focnsed_POC_exp5(:,1)+years_SPIN,REF_focnsed_POC_exp5(:,2)*12*1e-15,'b--', ...
         REF_focnsed_POC_exp6(:,1)+years_SPIN,REF_focnsed_POC_exp6(:,2)*12*1e-15,'b:', ...
         REF_focnsed_POC_exp7(:,1)+years_SPIN,REF_focnsed_POC_exp7(:,2)*12*1e-15,'r--', ...
         REF_focnsed_POC_exp8(:,1)+years_SPIN,REF_focnsed_POC_exp8(:,2)*12*1e-15,'r:'); 
        ylabel({'POC deposition'; '(PgC yr^{-1})'});

% xlim([10000 120000])
% set(gca,'Ytick',10:1:30)
% set(gca,'YtickLabel',{'10', '', '','','','15','','','','','20','','','','','25','','','','','30'})
% set(gca,'xticklabel',{[]})
txt = '(c)';
text(0.03,0.15,txt,'FontSize',12,'Units','normalized')


subplot(3,2, 2)
plot(REF_sed_DIC_13C_exp1(:,1),REF_sed_DIC_13C_exp1(:,3),'b--',  ...
    REF_sed_DIC_13C_exp2(:,1),REF_sed_DIC_13C_exp2(:,3),'b:',  ...
    REF_sed_DIC_13C_exp3(:,1),REF_sed_DIC_13C_exp3(:,3),'r--',  ...
    REF_sed_DIC_13C_exp4(:,1),REF_sed_DIC_13C_exp4(:,3),'r:',  ...
    REF_sed_DIC_13C_exp5(:,1)+years_SPIN,REF_sed_DIC_13C_exp5(:,3),'b--',  ...
    REF_sed_DIC_13C_exp6(:,1)+years_SPIN,REF_sed_DIC_13C_exp6(:,3),'b:',  ...
    REF_sed_DIC_13C_exp7(:,1)+years_SPIN,REF_sed_DIC_13C_exp7(:,3),'r--',  ...
    REF_sed_DIC_13C_exp8(:,1)+years_SPIN,REF_sed_DIC_13C_exp8(:,3),'r:'); 
%xlabel('years ');
ylabel({'global DIC 13C'; 'permil'});
% xlim([10000 120000])
% ylim([-5 2])
% set(gca,'xticklabel',{[]})
% set(gca,'Ytick',0:1:20)
% set(gca,'YtickLabel',{'0', '', '','','','5','','','','','10','','','','','15','','','','','20'})
txt = '(b)';
text(0.03,0.15,txt,'FontSize',12,'Units','normalized')


subplot(3,2, 3)
%plot(REF(:,1),REF(:,3)*1e+6,'b--')
%plot(REF_sed_pO2(:,1),REF_sed_pO2(:,3),'b--',REF_sed_pO2_exp2(:,1),REF_sed_pO2_exp2(:,3),'r' );
plot(REF_POC_burial_exp1(:,1),REF_POC_burial_exp1(:,2),'b--', ...
    REF_POC_burial_exp2(:,1),REF_POC_burial_exp2(:,2),'b:', ...
    REF_POC_burial_exp3(:,1),REF_POC_burial_exp3(:,2),'r--', ...
    REF_POC_burial_exp4(:,1),REF_POC_burial_exp4(:,2),'r:', ...
    REF_POC_burial_exp5(:,1)+years_SPIN,REF_POC_burial_exp5(:,2),'b--', ...
    REF_POC_burial_exp6(:,1)+years_SPIN,REF_POC_burial_exp6(:,2),'b:', ...
    REF_POC_burial_exp7(:,1)+years_SPIN,REF_POC_burial_exp7(:,2),'r--', ...
    REF_POC_burial_exp8(:,1)+years_SPIN,REF_POC_burial_exp8(:,2),'r:');
%plot(REF_sed_pO2_exp1(:,1),REF_sed_pO2_exp1(:,3),'b--',REF_sed_pO2_exp2(:,1),REF_sed_pO2_exp2(:,3),'r',REF_sed_pO2_exp3(:,1),REF_sed_pO2_exp3(:,3),'r--',REF_sed_pO2_exp4(:,1),REF_sed_pO2_exp4(:,3),'r:'); 
%xlabel('years ');
ylabel({'OM burial'; '(PgC yr^{-1})'});
% xlim([10000 120000])
% ylim([0.0 2.5])
% set(gca,'YtickLabel',{[]})
% set(gca,'xticklabel',{[]})
% set(gca,'Ytick',0:0.1:1.0)
% set(gca,'YtickLabel',{'0', '', '','','','0.5','','','','','1.0'})
txt = '(d)';
text(0.03,0.15,txt,'FontSize',12,'Units','normalized') 


% benthic O2
subplot(3, 2, 4)
    plot(REF_sed_O2_exp1(:,1),REF_sed_O2_exp1(:,5)*1e+6,'b--', ...
         REF_sed_O2_exp2(:,1),REF_sed_O2_exp2(:,5)*1e+6,'b:', ...
         REF_sed_O2_exp3(:,1),REF_sed_O2_exp3(:,5)*1e+6,'r--', ...
         REF_sed_O2_exp4(:,1),REF_sed_O2_exp4(:,5)*1e+6,'r:',  ...
         REF_sed_O2_exp5(:,1)+years_SPIN,REF_sed_O2_exp5(:,5)*1e+6,'b--',  ...
         REF_sed_O2_exp6(:,1)+years_SPIN,REF_sed_O2_exp6(:,5)*1e+6,'b:',  ...
         REF_sed_O2_exp7(:,1)+years_SPIN,REF_sed_O2_exp7(:,5)*1e+6,'r--',  ...
         REF_sed_O2_exp8(:,1)+years_SPIN,REF_sed_O2_exp8(:,5)*1e+6,'r:'); 
     ylabel({'ben. O_2'; '(\mumol kg^{-1})'});
% xlim([10000 120000])
% set(gca,'Ytick',10:1:30)
% set(gca,'YtickLabel',{'10', '', '','','','15','','','','','20','','','','','25','','','','','30'})
% set(gca,'xticklabel',{[]})
txt = '(c)';
text(0.03,0.15,txt,'FontSize',12,'Units','normalized')


subplot(3,2, 5)
%plot(REF(:,1),REF(:,3)*1e+6,'b--')
%plot(REF_sed_pO2(:,1),REF_sed_pO2(:,3),'b--',REF_sed_pO2_exp2(:,1),REF_sed_pO2_exp2(:,3),'r' );
plot(REF_POC_burial_exp1(:,1),REF_POC_burial_exp1(:,2),'b--', ...
    REF_POC_burial_exp2(:,1),REF_POC_burial_exp2(:,2),'b:', ...
    REF_POC_burial_exp3(:,1),REF_POC_burial_exp3(:,2),'r--', ...
    REF_POC_burial_exp4(:,1),REF_POC_burial_exp4(:,2),'r:', ...
    REF_POC_burial_exp5(:,1)+years_SPIN,REF_POC_burial_exp5(:,2),'b--', ...
    REF_POC_burial_exp6(:,1)+years_SPIN,REF_POC_burial_exp6(:,2),'b:', ...
    REF_POC_burial_exp7(:,1)+years_SPIN,REF_POC_burial_exp7(:,2),'r--', ...
    REF_POC_burial_exp8(:,1)+years_SPIN,REF_POC_burial_exp8(:,2),'r:');
%plot(REF_sed_pO2_exp1(:,1),REF_sed_pO2_exp1(:,3),'b--',REF_sed_pO2_exp2(:,1),REF_sed_pO2_exp2(:,3),'r',REF_sed_pO2_exp3(:,1),REF_sed_pO2_exp3(:,3),'r--',REF_sed_pO2_exp4(:,1),REF_sed_pO2_exp4(:,3),'r:'); 
%xlabel('years ');
ylabel({'just for legend'; '(OM burial)'});
% xlim([10000 120000])
%ylim([0.5 0.57])
% set(gca,'YtickLabel',{[]})
% set(gca,'xticklabel',{[]})
% set(gca,'Ytick',0:0.1:1.0)
% set(gca,'YtickLabel',{'0', '', '','','','0.5','','','','','1.0'})
txt = '(d)';
text(0.03,0.15,txt,'FontSize',12,'Units','normalized') 
hleg=legend(PNAME_OPEN1, ...
     PNAME_OPEN2, ...
     PNAME_OPEN3, ...
     PNAME_OPEN4); 
% PNAME_SPIN1, ...
%     PNAME_SPIN2, ...
%     PNAME_SPIN3, ...
%     PNAME_SPIN4); %, ...
%     PNAME_OPEN1, ...
%     PNAME_OPEN2, ...
%     PNAME_OPEN3, ...
%     PNAME_OPEN4); 
%hleg=legend('0606-02 Archer SPIN - No OMEN - fast sinking', '2308-07 Archer SPIN - No OMEN - fast sinking - solid fields closedCaCO3', '2308-09 with OMEN - solid fields - invariant k1 = 0.015 closedCaCO3', '2308-11  with OMEN - solid fields - Boudreau depth closedCaCO3'); 
set(hleg,'FontSize',8);
set(hleg,'Location','SouthEast');

subplot(3,2, 6)
%plot(REF(:,1),REF(:,3)*1e+6,'b--')
%plot(REF_sed_pO2(:,1),REF_sed_pO2(:,3),'b--',REF_sed_pO2_exp2(:,1),REF_sed_pO2_exp2(:,3),'r' );
plot(REF_sed_CaCO3_exp1(:,1),REF_sed_CaCO3_exp1(:,2),'b--', ...
    REF_sed_CaCO3_exp2(:,1),REF_sed_CaCO3_exp2(:,2),'b:', ...
    REF_sed_CaCO3_exp3(:,1),REF_sed_CaCO3_exp3(:,2),'r--', ...
    REF_sed_CaCO3_exp4(:,1),REF_sed_CaCO3_exp4(:,2),'r:', ...
    REF_sed_CaCO3_exp5(:,1)+years_SPIN,REF_sed_CaCO3_exp5(:,2),'b--', ...
    REF_sed_CaCO3_exp6(:,1)+years_SPIN,REF_sed_CaCO3_exp6(:,2),'b:', ...
    REF_sed_CaCO3_exp7(:,1)+years_SPIN,REF_sed_CaCO3_exp7(:,2),'r--', ...
    REF_sed_CaCO3_exp8(:,1)+years_SPIN,REF_sed_CaCO3_exp8(:,2),'r:');
%plot(REF_sed_pO2_exp1(:,1),REF_sed_pO2_exp1(:,3),'b--',REF_sed_pO2_exp2(:,1),REF_sed_pO2_exp2(:,3),'r',REF_sed_pO2_exp3(:,1),REF_sed_pO2_exp3(:,3),'r--',REF_sed_pO2_exp4(:,1),REF_sed_pO2_exp4(:,3),'r:'); 
%xlabel('years ');
ylabel({'CaCO_3'; '(wt%)'});
% xlim([10000 120000])
%ylim([0.5 0.57])


if(plot_mean)  % mean (mol/kg)
    print('-depsc', ['PLOTS/timeseries/' FILENAME '_MEAN_2']);
else
    print('-depsc', ['PLOTS/timeseries/' FILENAME '_2']);
end


%%
figure
grid on
hold on

subplot(3,2,1)
if(plot_mean) % mean (mol/kg)
    plot(REF_sed_O2_exp1(:,1),REF_sed_O2_exp1(:,3)*1e+6,'b--', ...
         REF_sed_O2_exp2(:,1),REF_sed_O2_exp2(:,3)*1e+6,'b:', ...
         REF_sed_O2_exp3(:,1),REF_sed_O2_exp3(:,3)*1e+6,'r--', ...
         REF_sed_O2_exp4(:,1),REF_sed_O2_exp4(:,3)*1e+6,'r:',  ...
         REF_sed_O2_exp5(:,1)+years_SPIN,REF_sed_O2_exp5(:,3)*1e+6,'b--',  ...
         REF_sed_O2_exp6(:,1)+years_SPIN,REF_sed_O2_exp6(:,3)*1e+6,'b:',  ...
         REF_sed_O2_exp7(:,1)+years_SPIN,REF_sed_O2_exp7(:,3)*1e+6,'r--',  ...
         REF_sed_O2_exp8(:,1)+years_SPIN,REF_sed_O2_exp8(:,3)*1e+6,'r:'); 
        ylabel({'O_2'; '(\mumol kg^{-1})'});
%        ylabel('(\mumol kg^{-1})');
else
    % total (mol)
    plot(REF_sed_O2_exp1(:,1),REF_sed_O2_exp1(:,2),'b--', ...
         REF_sed_O2_exp2(:,1),REF_sed_O2_exp2(:,2),'b:', ...
         REF_sed_O2_exp3(:,1),REF_sed_O2_exp3(:,2),'r--', ...
         REF_sed_O2_exp4(:,1),REF_sed_O2_exp4(:,2),'r:', ...
         REF_sed_O2_exp5(:,1)+years_SPIN,REF_sed_O2_exp5(:,2),'b--', ...
         REF_sed_O2_exp6(:,1)+years_SPIN,REF_sed_O2_exp6(:,2),'b:', ...
         REF_sed_O2_exp7(:,1)+years_SPIN,REF_sed_O2_exp7(:,2),'r--', ...
         REF_sed_O2_exp8(:,1)+years_SPIN,REF_sed_O2_exp8(:,2),'r:')
     ylabel('O_2 (mol)');
end
% set(gca,'xticklabel',{[]})
% xlim([10000 120000])
% ylim([0 50])
% set(gca,'Ytick',0:10:50)
% set(gca,'YtickLabel',{'0','10','20','30','40','50'})
%% set(gca,'Ytick',[0 25 50])
%% set(gca,'YtickLabel',{'0','25','50'})
txt = '(e)';
text(0.03,0.15,txt,'FontSize',12,'Units','normalized') 

subplot(3,2,2)
if(plot_mean)  % mean (mol/kg)
	plot(REF_sed_SO4_exp1(:,1),REF_sed_SO4_exp1(:,3)*1e+6,'b--', ...
         REF_sed_SO4_exp2(:,1),REF_sed_SO4_exp2(:,3)*1e+6,'b:', ...
         REF_sed_SO4_exp3(:,1),REF_sed_SO4_exp3(:,3)*1e+6,'r--', ...
         REF_sed_SO4_exp4(:,1),REF_sed_SO4_exp4(:,3)*1e+6,'r:',  ...
         REF_sed_SO4_exp5(:,1)+years_SPIN,REF_sed_SO4_exp5(:,3)*1e+6,'b--',  ...
         REF_sed_SO4_exp6(:,1)+years_SPIN,REF_sed_SO4_exp6(:,3)*1e+6,'b:' ,  ...
         REF_sed_SO4_exp7(:,1)+years_SPIN,REF_sed_SO4_exp7(:,3)*1e+6,'r--',  ...
         REF_sed_SO4_exp8(:,1)+years_SPIN,REF_sed_SO4_exp8(:,3)*1e+6,'r:'); 
         ylabel({'SO_4'; '(\mumol kg^{-1})'});
%        ylabel('(\mumol kg^{-1})');
else    % total (mol)
    plot(REF_sed_SO4_exp1(:,1),REF_sed_SO4_exp1(:,2),'b--',...
        REF_sed_SO4_exp2(:,1),REF_sed_SO4_exp2(:,2),'b:',...
        REF_sed_SO4_exp3(:,1),REF_sed_SO4_exp3(:,2),'r--',...
        REF_sed_SO4_exp4(:,1),REF_sed_SO4_exp4(:,2),'r:', ...
        REF_sed_SO4_exp5(:,1)+years_SPIN,REF_sed_SO4_exp5(:,2),'b--',...
     	REF_sed_SO4_exp6(:,1)+years_SPIN,REF_sed_SO4_exp6(:,2),'b:',...
     	REF_sed_SO4_exp7(:,1)+years_SPIN,REF_sed_SO4_exp7(:,2),'r--',...
     	REF_sed_SO4_exp8(:,1)+years_SPIN,REF_sed_SO4_exp8(:,2),'r:')
    ylabel('SO_4 (mol)');
end
% set(gca,'xticklabel',{[]})
% xlim([10000 120000])
% ylim([28800 29200])
% set(gca,'Ytick',28800:100:29200)
% set(gca,'YtickLabel',{'28800','','29000','','29200'})
% % set(gca,'Ytick',[28800 29000 29200])
% % set(gca,'YtickLabel',{'28800','29000','29200'})
txt = '(f)';
text(0.03,0.15,txt,'FontSize',12,'Units','normalized') 
% hleg=legend('0412-01, 1xPO4, no sulf CONTROL', ...
%     '0412-02, 2xPO4, no sulf CONTROL', ...
%     '0412-03, 1xPO4, with sulf CONTROL', ...
%     '0412-04, 2xPO4, with sulf CONTROL', ...
%     '0412-05, 1xPO4, with sulf, from no-sulf SPIN', ...
%     '0412-06, 2xPO4, with sulf, from no-sulf SPIN'); 
% % hleg=legend('No OMEN', 'Tromp: k1 + k2 ~ w', 'Tromp: k1 ~ w', 'Boudreau: k1 + k2 ~ w', 'Boudreau: k1 ~ w', 'Stolpovsky: k1 ~ w', 'Boudreau: k1 ~ fPOC'); 
% set(hleg,'FontSize',6);
% set(hleg,'Location','SouthEast');

subplot(3,2,3)
if(plot_mean) % mean (mol/kg)
	plot(REF_sed_H2S_exp1(:,1),REF_sed_H2S_exp1(:,3)*1e+6,'b--', ...
         REF_sed_H2S_exp2(:,1),REF_sed_H2S_exp2(:,3)*1e+6,'b:',  ...
         REF_sed_H2S_exp3(:,1),REF_sed_H2S_exp3(:,3)*1e+6,'r--', ...
         REF_sed_H2S_exp4(:,1),REF_sed_H2S_exp4(:,3)*1e+6,'r:',  ...
         REF_sed_H2S_exp5(:,1)+years_SPIN,REF_sed_H2S_exp5(:,3)*1e+6,'b--',  ...
         REF_sed_H2S_exp6(:,1)+years_SPIN,REF_sed_H2S_exp6(:,3)*1e+6,'b:',  ...
         REF_sed_H2S_exp7(:,1)+years_SPIN,REF_sed_H2S_exp7(:,3)*1e+6,'r--',  ...
         REF_sed_H2S_exp8(:,1)+years_SPIN,REF_sed_H2S_exp8(:,3)*1e+6,'r:');
         ylabel({'H_2S'; '(\mumol kg^{-1})'});
%        ylabel('(\mumol kg^{-1})');
else % total (mol)
    plot(REF_sed_H2S_exp1(:,1),REF_sed_H2S_exp1(:,2),'b--',...
        REF_sed_H2S_exp2(:,1),REF_sed_H2S_exp2(:,2),'b:', ...
        REF_sed_H2S_exp3(:,1),REF_sed_H2S_exp3(:,2),'r--', ...
        REF_sed_H2S_exp4(:,1),REF_sed_H2S_exp4(:,2),'r:', ...
        REF_sed_H2S_exp5(:,1)+years_SPIN,REF_sed_H2S_exp5(:,2),'b--', ...
     	REF_sed_H2S_exp6(:,1)+years_SPIN,REF_sed_H2S_exp6(:,2),'b:', ...
     	REF_sed_H2S_exp7(:,1)+years_SPIN,REF_sed_H2S_exp7(:,2),'r--', ...
     	REF_sed_H2S_exp8(:,1)+years_SPIN,REF_sed_H2S_exp8(:,2),'r:')
    ylabel('H_2S (mol)');
end
% set(gca,'xticklabel',{[]})
% xlim([10000 120000])
% ylim([0 50])
% set(gca,'Ytick',0:10:50)
% set(gca,'YtickLabel',{'0','10','20','30','40','50'})
% % set(gca,'Ytick',[0 25 50])
% % set(gca,'YtickLabel',{'0','25','50'})
txt = '(g)';
text(0.03,0.15,txt,'FontSize',12,'Units','normalized') 

% % PO4
% subplot(3,2,4)
% if(plot_mean) % mean (mol/kg)
%     plot(REF_sed_PO4_exp1(:,1),REF_sed_PO4_exp1(:,3)*1e+6,'b--', ...
%          REF_sed_PO4_exp2(:,1)+years_SPIN,REF_sed_PO4_exp2(:,3)*1e+6,'b--',  ...
%          REF_sed_PO4_exp3(:,1)+years_SPIN,REF_sed_PO4_exp3(:,3)*1e+6,'r--', ...
%          REF_sed_PO4_exp4(:,1)+years_SPIN,REF_sed_PO4_exp4(:,3)*1e+6,'r:',  ...
%          REF_sed_PO4_exp5(:,1)+years_SPIN,REF_sed_PO4_exp5(:,3)*1e+6,'b--' ,  ...
%          REF_sed_PO4_exp6(:,1)+years_SPIN,REF_sed_PO4_exp6(:,3)*1e+6,'b:'); 
%          ylabel({'PO_4'; '(\mumol kg^{-1})'});
% %        ylabel('(\mumol kg^{-1})');
% else % total (mol)
%     plot(REF_sed_PO4_exp1(:,1),REF_sed_PO4_exp1(:,2),'b--',...
%         REF_sed_PO4_exp2(:,1)+years_SPIN,REF_sed_PO4_exp2(:,2),'b--', ...
%         REF_sed_PO4_exp3(:,1)+years_SPIN,REF_sed_PO4_exp3(:,2),'r--',...
%         REF_sed_PO4_exp4(:,1)+years_SPIN,REF_sed_PO4_exp4(:,2),'r:', ...
%         REF_sed_PO4_exp5(:,1)+years_SPIN,REF_sed_PO4_exp5(:,2),'b--', ...
%      	REF_sed_PO4_exp6(:,1)+years_SPIN,REF_sed_PO4_exp6(:,2),'b:')
%     ylabel('PO_4 (mol)');
% end
% % set(gca,'xticklabel',{[]})
% % xlim([10000 120000])
% % ylim([3 5])
% % set(gca,'Ytick',[3.0 4.0 5.0])
% % set(gca,'YtickLabel',{'3.0','4.0','5.0'})
% txt = '(h)';
% text(0.03,0.15,txt,'FontSize',12,'Units','normalized') 
% hleg=legend(PNAME_SPIN, ...
%     PNAME_OPEN1, ...
%     PNAME_OPEN2, ...
%     PNAME_OPEN3, ...
%     PNAME_OPEN4, ...
%     PNAME_OPEN5); 
% %hleg=legend('0606-02 Archer SPIN - No OMEN - fast sinking', '2308-07 Archer SPIN - No OMEN - fast sinking - solid fields closedCaCO3', '2308-09 with OMEN - solid fields - invariant k1 = 0.015 closedCaCO3', '2308-11  with OMEN - solid fields - Boudreau depth closedCaCO3'); 
% set(hleg,'FontSize',8);
% set(hleg,'Location','SouthEast');


subplot(3,2,5)
if(plot_mean)  % mean (mol/kg)
    plot(REF_sed_ALK_exp1(:,1),REF_sed_ALK_exp1(:,3)*1e+6,'b--', ...
         REF_sed_ALK_exp2(:,1),REF_sed_ALK_exp2(:,3)*1e+6,'b:',  ...
         REF_sed_ALK_exp3(:,1),REF_sed_ALK_exp3(:,3)*1e+6,'r--', ...
         REF_sed_ALK_exp4(:,1),REF_sed_ALK_exp4(:,3)*1e+6,'r:',  ...
         REF_sed_ALK_exp5(:,1)+years_SPIN,REF_sed_ALK_exp5(:,3)*1e+6,'b--',  ...
         REF_sed_ALK_exp6(:,1)+years_SPIN,REF_sed_ALK_exp6(:,3)*1e+6,'b:',  ...
         REF_sed_ALK_exp7(:,1)+years_SPIN,REF_sed_ALK_exp7(:,3)*1e+6,'r--',  ...
         REF_sed_ALK_exp8(:,1)+years_SPIN,REF_sed_ALK_exp8(:,3)*1e+6,'r:'); 
         ylabel({'ALK'; '(\mumol kg^{-1})'});
%       ylabel('(\mumol kg^{-1})');
else
	plot(REF_sed_ALK_exp1(:,1),REF_sed_ALK_exp1(:,2),'b--',...
        REF_sed_ALK_exp2(:,1),REF_sed_ALK_exp2(:,2),'b:',...
        REF_sed_ALK_exp3(:,1),REF_sed_ALK_exp3(:,2),'r--',...
        REF_sed_ALK_exp4(:,1),REF_sed_ALK_exp4(:,2),'r:', ...
        REF_sed_ALK_exp5(:,1)+years_SPIN,REF_sed_ALK_exp5(:,2),'b--',...
        REF_sed_ALK_exp6(:,1)+years_SPIN,REF_sed_ALK_exp6(:,2),'b:',...
        REF_sed_ALK_exp7(:,1)+years_SPIN,REF_sed_ALK_exp7(:,2),'r--',...
        REF_sed_ALK_exp8(:,1)+years_SPIN,REF_sed_ALK_exp8(:,2),'r:')
     ylabel('ALK (mol)');
end
% xlabel('Time since end of spin-up (ka)');
xlabel('Time');
% xlim([10000 120000])
% set(gca,'Xtick',10000:10000:50000)
% set(gca,'XtickLabel',{'-10','0','10', '20', '30'})
% ylim([2000 2600])
% set(gca,'Ytick',2000:100:2600)
% set(gca,'YtickLabel',{'2000','','','2300','','','2600'})
txt = '(i)';
text(0.03,0.85,txt,'FontSize',12,'Units','normalized')

subplot(3,2,6)
if(plot_mean)  % mean (mol/kg)
    plot(REF_sed_DIC_exp1(:,1),REF_sed_DIC_exp1(:,3)*1e+6,'b--', ...
         REF_sed_DIC_exp2(:,1),REF_sed_DIC_exp2(:,3)*1e+6,'b:',  ...
         REF_sed_DIC_exp3(:,1),REF_sed_DIC_exp3(:,3)*1e+6,'r--', ...
         REF_sed_DIC_exp4(:,1),REF_sed_DIC_exp4(:,3)*1e+6,'r:',  ...
         REF_sed_DIC_exp5(:,1)+years_SPIN,REF_sed_DIC_exp5(:,3)*1e+6,'b--',  ...
         REF_sed_DIC_exp6(:,1)+years_SPIN,REF_sed_DIC_exp6(:,3)*1e+6,'b:',  ...
         REF_sed_DIC_exp7(:,1)+years_SPIN,REF_sed_DIC_exp7(:,3)*1e+6,'r--',  ...
         REF_sed_DIC_exp8(:,1)+years_SPIN,REF_sed_DIC_exp8(:,3)*1e+6,'r:'); 
         ylabel({'DIC'; '(\mumol kg^{-1})'});
%        ylabel('(\mumol kg^{-1})');
else
	plot(REF_sed_DIC_exp1(:,1),REF_sed_DIC_exp1(:,2),'b--',...
        REF_sed_DIC_exp2(:,1),REF_sed_DIC_exp2(:,2),'b:', ...
        REF_sed_DIC_exp3(:,1),REF_sed_DIC_exp3(:,2),'r--',...
        REF_sed_DIC_exp4(:,1),REF_sed_DIC_exp4(:,2),'r:',...
        REF_sed_DIC_exp5(:,1)+years_SPIN,REF_sed_DIC_exp5(:,2),'b--',...
        REF_sed_DIC_exp6(:,1)+years_SPIN,REF_sed_DIC_exp6(:,2),'b:',...
        REF_sed_DIC_exp6(:,1)+years_SPIN,REF_sed_DIC_exp6(:,2),'r--',...
        REF_sed_DIC_exp6(:,1)+years_SPIN,REF_sed_DIC_exp6(:,2),'r:')
    ylabel('DIC (mol)');
end
% xlabel('Time since end of spin-up (ka)');
xlabel('Time');
% xlim([10000 120000])
% set(gca,'Xtick',10000:10000:50000)
% set(gca,'XtickLabel',{'-10','0','10', '20', '30'})
% ylim([2000 2400])
% set(gca,'Ytick',2000:100:2400)
% set(gca,'YtickLabel',{'2000','','2200','','2400'})
txt = '(j)';
text(0.03,0.85,txt,'FontSize',12,'Units','normalized')


% set(gcf,'NextPlot','add');
% axes;
% h = title('Global ocean values (micromol kg**-1)');
% set(gca,'Visible','off');
% set(h,'Visible','on'); 

if(plot_mean)  % mean (mol/kg)
    print('-depsc', ['PLOTS/timeseries/' FILENAME '_MEAN_3']);
else
    print('-depsc', ['PLOTS/timeseries/' FILENAME '_3']);
end

end



