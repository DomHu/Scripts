function [] = plot_time_series_subplots_1SPIN_8Exps(PFolderExps, PNAME_SPIN, PNAME_OPEN1, PNAME_OPEN2, PNAME_OPEN3, PNAME_OPEN4, PNAME_OPEN5, PNAME_OPEN6, PNAME_OPEN7, PNAME_OPEN8, FILENAME)

% PFolderExps: folder name with congigs of experiments to plot. They need
% to be in cgenie_output

% plot time-series
%clear all;

%  plot mean (true) or total (false)
plot_mean = true;

plot_ylim = false;

%  set SPIN experiment years
years_SPIN = 150000;
years_SPIN_plot = 5000;

% set experiment 
% get file names in folder configs:
a=dir([ PFolderExps '/*']);
b={a.name};

PEXP_SPIN = '0504_03_fkl_ep21_1C1P1O_allFeedb_forc_atm_Fdet18g_150k';
PEXP1_OPEN = b{3};   % 1st and 2nd entry is . and ..
PEXP2_OPEN = b{6};
PEXP3_OPEN = b{9};
PEXP4_OPEN = b{10};
PEXP5_OPEN = b{4};
PEXP6_OPEN = b{5};
PEXP7_OPEN = b{7};
PEXP8_OPEN = b{8};

% use 

exp_SPIN = ['./cgenie_output/' PEXP_SPIN];   
exp_1_OPEN = ['./' PFolderExps '/' PEXP1_OPEN];   
exp_2_OPEN = ['./' PFolderExps '/' PEXP2_OPEN];
exp_3_OPEN = ['./' PFolderExps '/' PEXP3_OPEN];
exp_4_OPEN = ['./' PFolderExps '/' PEXP4_OPEN];
exp_5_OPEN = ['./' PFolderExps '/' PEXP5_OPEN];
exp_6_OPEN = ['./' PFolderExps '/' PEXP6_OPEN];
exp_7_OPEN = ['./' PFolderExps '/' PEXP7_OPEN];
exp_8_OPEN = ['./' PFolderExps '/' PEXP8_OPEN];

% % old using cgenie_output
% exp_SPIN = ['./cgenie_output/' PEXP_SPIN];   
% exp_1_OPEN = ['./cgenie_output/' PEXP1_OPEN];   
% exp_2_OPEN = ['./cgenie_output/' PEXP2_OPEN];
% exp_3_OPEN = ['./cgenie_output/' PEXP3_OPEN];
% exp_4_OPEN = ['./cgenie_output/' PEXP4_OPEN];
% exp_5_OPEN = ['./cgenie_output/' PEXP5_OPEN];
% exp_6_OPEN = ['./cgenie_output/' PEXP6_OPEN];

% %%%% load other data

%% overturning
REF_misc_opsi_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_misc_opsi.res'),'ascii');
REF_misc_opsi_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_misc_opsi.res'),'ascii');
REF_misc_opsi_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_misc_opsi.res'),'ascii');
REF_misc_opsi_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_misc_opsi.res'),'ascii');
REF_misc_opsi_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_misc_opsi.res'),'ascii');
REF_misc_opsi_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_misc_opsi.res'),'ascii');
REF_misc_opsi_exp7 = load(fullfile(exp_6_OPEN,'/biogem/biogem_series_misc_opsi.res'),'ascii');
REF_misc_opsi_exp8 = load(fullfile(exp_7_OPEN,'/biogem/biogem_series_misc_opsi.res'),'ascii');
REF_misc_opsi_exp9 = load(fullfile(exp_8_OPEN,'/biogem/biogem_series_misc_opsi.res'),'ascii');


REF_sed_O2_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_O2.res'),'ascii');
REF_sed_O2_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_O2.res'),'ascii');
REF_sed_O2_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_O2.res'),'ascii');
REF_sed_O2_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_ocn_O2.res'),'ascii');
REF_sed_O2_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_ocn_O2.res'),'ascii');
REF_sed_O2_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_ocn_O2.res'),'ascii');
REF_sed_O2_exp7 = load(fullfile(exp_6_OPEN,'/biogem/biogem_series_ocn_O2.res'),'ascii');
REF_sed_O2_exp8 = load(fullfile(exp_7_OPEN,'/biogem/biogem_series_ocn_O2.res'),'ascii');
REF_sed_O2_exp9 = load(fullfile(exp_8_OPEN,'/biogem/biogem_series_ocn_O2.res'),'ascii');

REF_sed_SO4_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_SO4.res'),'ascii');
REF_sed_SO4_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_SO4.res'),'ascii');
REF_sed_SO4_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_SO4.res'),'ascii');
REF_sed_SO4_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_ocn_SO4.res'),'ascii');
REF_sed_SO4_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_ocn_SO4.res'),'ascii');
REF_sed_SO4_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_ocn_SO4.res'),'ascii');
REF_sed_SO4_exp7 = load(fullfile(exp_6_OPEN,'/biogem/biogem_series_ocn_SO4.res'),'ascii');
REF_sed_SO4_exp8 = load(fullfile(exp_7_OPEN,'/biogem/biogem_series_ocn_SO4.res'),'ascii');
REF_sed_SO4_exp9 = load(fullfile(exp_8_OPEN,'/biogem/biogem_series_ocn_SO4.res'),'ascii');

REF_sed_H2S_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_H2S.res'),'ascii');
REF_sed_H2S_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_H2S.res'),'ascii');
REF_sed_H2S_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_H2S.res'),'ascii');
REF_sed_H2S_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_ocn_H2S.res'),'ascii');
REF_sed_H2S_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_ocn_H2S.res'),'ascii');
REF_sed_H2S_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_ocn_H2S.res'),'ascii');
REF_sed_H2S_exp7 = load(fullfile(exp_6_OPEN,'/biogem/biogem_series_ocn_H2S.res'),'ascii');
REF_sed_H2S_exp8 = load(fullfile(exp_7_OPEN,'/biogem/biogem_series_ocn_H2S.res'),'ascii');
REF_sed_H2S_exp9 = load(fullfile(exp_8_OPEN,'/biogem/biogem_series_ocn_H2S.res'),'ascii');

REF_sed_PO4_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_PO4.res'),'ascii');
REF_sed_PO4_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_PO4.res'),'ascii');
REF_sed_PO4_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_PO4.res'),'ascii');
REF_sed_PO4_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_ocn_PO4.res'),'ascii');
REF_sed_PO4_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_ocn_PO4.res'),'ascii');
REF_sed_PO4_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_ocn_PO4.res'),'ascii');
REF_sed_PO4_exp7 = load(fullfile(exp_6_OPEN,'/biogem/biogem_series_ocn_PO4.res'),'ascii');
REF_sed_PO4_exp8 = load(fullfile(exp_7_OPEN,'/biogem/biogem_series_ocn_PO4.res'),'ascii');
REF_sed_PO4_exp9 = load(fullfile(exp_8_OPEN,'/biogem/biogem_series_ocn_PO4.res'),'ascii');

REF_sed_ALK_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_ALK.res'),'ascii');
REF_sed_ALK_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_ALK.res'),'ascii');
REF_sed_ALK_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_ALK.res'),'ascii');
REF_sed_ALK_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_ocn_ALK.res'),'ascii');
REF_sed_ALK_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_ocn_ALK.res'),'ascii');
REF_sed_ALK_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_ocn_ALK.res'),'ascii');
REF_sed_ALK_exp7 = load(fullfile(exp_6_OPEN,'/biogem/biogem_series_ocn_ALK.res'),'ascii');
REF_sed_ALK_exp8 = load(fullfile(exp_7_OPEN,'/biogem/biogem_series_ocn_ALK.res'),'ascii');
REF_sed_ALK_exp9 = load(fullfile(exp_8_OPEN,'/biogem/biogem_series_ocn_ALK.res'),'ascii');

REF_sed_DIC_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_DIC.res'),'ascii');
REF_sed_DIC_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_DIC.res'),'ascii');
REF_sed_DIC_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_DIC.res'),'ascii');
REF_sed_DIC_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_ocn_DIC.res'),'ascii');
REF_sed_DIC_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_ocn_DIC.res'),'ascii');
REF_sed_DIC_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_ocn_DIC.res'),'ascii');
REF_sed_DIC_exp7 = load(fullfile(exp_6_OPEN,'/biogem/biogem_series_ocn_DIC.res'),'ascii');
REF_sed_DIC_exp8 = load(fullfile(exp_7_OPEN,'/biogem/biogem_series_ocn_DIC.res'),'ascii');
REF_sed_DIC_exp9 = load(fullfile(exp_8_OPEN,'/biogem/biogem_series_ocn_DIC.res'),'ascii');

REF_sed_DIC_13C_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_DIC_13C.res'),'ascii');
REF_sed_DIC_13C_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_DIC_13C.res'),'ascii');
REF_sed_DIC_13C_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_DIC_13C.res'),'ascii');
REF_sed_DIC_13C_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_ocn_DIC_13C.res'),'ascii');
REF_sed_DIC_13C_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_ocn_DIC_13C.res'),'ascii');
REF_sed_DIC_13C_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_ocn_DIC_13C.res'),'ascii');
REF_sed_DIC_13C_exp7 = load(fullfile(exp_6_OPEN,'/biogem/biogem_series_ocn_DIC_13C.res'),'ascii');
REF_sed_DIC_13C_exp8 = load(fullfile(exp_7_OPEN,'/biogem/biogem_series_ocn_DIC_13C.res'),'ascii');
REF_sed_DIC_13C_exp9 = load(fullfile(exp_8_OPEN,'/biogem/biogem_series_ocn_DIC_13C.res'),'ascii');

REF_sed_pCO2_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_atm_pCO2.res'),'ascii');
REF_sed_pCO2_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_atm_pCO2.res'),'ascii');
REF_sed_pCO2_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_atm_pCO2.res'),'ascii');
REF_sed_pCO2_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_atm_pCO2.res'),'ascii');
REF_sed_pCO2_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_atm_pCO2.res'),'ascii');
REF_sed_pCO2_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_atm_pCO2.res'),'ascii');
REF_sed_pCO2_exp7 = load(fullfile(exp_6_OPEN,'/biogem/biogem_series_atm_pCO2.res'),'ascii');
REF_sed_pCO2_exp8 = load(fullfile(exp_7_OPEN,'/biogem/biogem_series_atm_pCO2.res'),'ascii');
REF_sed_pCO2_exp9 = load(fullfile(exp_8_OPEN,'/biogem/biogem_series_atm_pCO2.res'),'ascii');

REF_sed_pO2_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_atm_pO2.res'),'ascii');
REF_sed_pO2_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_atm_pO2.res'),'ascii');
REF_sed_pO2_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_atm_pO2.res'),'ascii');
REF_sed_pO2_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_atm_pO2.res'),'ascii');
REF_sed_pO2_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_atm_pO2.res'),'ascii');
REF_sed_pO2_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_atm_pO2.res'),'ascii');
REF_sed_pO2_exp7 = load(fullfile(exp_6_OPEN,'/biogem/biogem_series_atm_pO2.res'),'ascii');
REF_sed_pO2_exp8 = load(fullfile(exp_7_OPEN,'/biogem/biogem_series_atm_pO2.res'),'ascii');
REF_sed_pO2_exp9 = load(fullfile(exp_8_OPEN,'/biogem/biogem_series_atm_pO2.res'),'ascii');

% atm temp:
REF_atm_tmp_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_atm_temp.res'),'ascii');
REF_atm_tmp_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_atm_temp.res'),'ascii');
REF_atm_tmp_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_atm_temp.res'),'ascii');
REF_atm_tmp_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_atm_temp.res'),'ascii');
REF_atm_tmp_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_atm_temp.res'),'ascii');
REF_atm_tmp_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_atm_temp.res'),'ascii');
REF_atm_tmp_exp7 = load(fullfile(exp_6_OPEN,'/biogem/biogem_series_atm_temp.res'),'ascii');
REF_atm_tmp_exp8 = load(fullfile(exp_7_OPEN,'/biogem/biogem_series_atm_temp.res'),'ascii');
REF_atm_tmp_exp9 = load(fullfile(exp_8_OPEN,'/biogem/biogem_series_atm_temp.res'),'ascii');

% ocn temp:
REF_ocn_tmp_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_temp.res'),'ascii');
REF_ocn_tmp_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_temp.res'),'ascii');
REF_ocn_tmp_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_temp.res'),'ascii');
REF_ocn_tmp_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_ocn_temp.res'),'ascii');
REF_ocn_tmp_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_ocn_temp.res'),'ascii');
REF_ocn_tmp_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_ocn_temp.res'),'ascii');
REF_ocn_tmp_exp7 = load(fullfile(exp_6_OPEN,'/biogem/biogem_series_ocn_temp.res'),'ascii');
REF_ocn_tmp_exp8 = load(fullfile(exp_7_OPEN,'/biogem/biogem_series_ocn_temp.res'),'ascii');
REF_ocn_tmp_exp9 = load(fullfile(exp_8_OPEN,'/biogem/biogem_series_ocn_temp.res'),'ascii');

% POC export flux
REF_fexport_POC_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_fexport_POC.res'),'ascii');
REF_fexport_POC_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_fexport_POC.res'),'ascii');
REF_fexport_POC_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_fexport_POC.res'),'ascii');
REF_fexport_POC_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_fexport_POC.res'),'ascii');
REF_fexport_POC_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_fexport_POC.res'),'ascii');
REF_fexport_POC_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_fexport_POC.res'),'ascii');
REF_fexport_POC_exp7 = load(fullfile(exp_6_OPEN,'/biogem/biogem_series_fexport_POC.res'),'ascii');
REF_fexport_POC_exp8 = load(fullfile(exp_7_OPEN,'/biogem/biogem_series_fexport_POC.res'),'ascii');
REF_fexport_POC_exp9 = load(fullfile(exp_8_OPEN,'/biogem/biogem_series_fexport_POC.res'),'ascii');

% CaCO3 ocean - sediment
REF_focnsed_CaCO3_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_focnsed_CaCO3.res'),'ascii');
REF_focnsed_CaCO3_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_focnsed_CaCO3.res'),'ascii');
REF_focnsed_CaCO3_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_focnsed_CaCO3.res'),'ascii');
REF_focnsed_CaCO3_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_focnsed_CaCO3.res'),'ascii');
REF_focnsed_CaCO3_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_focnsed_CaCO3.res'),'ascii');
REF_focnsed_CaCO3_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_focnsed_CaCO3.res'),'ascii');
REF_focnsed_CaCO3_exp7 = load(fullfile(exp_6_OPEN,'/biogem/biogem_series_focnsed_CaCO3.res'),'ascii');
REF_focnsed_CaCO3_exp8 = load(fullfile(exp_7_OPEN,'/biogem/biogem_series_focnsed_CaCO3.res'),'ascii');
REF_focnsed_CaCO3_exp9 = load(fullfile(exp_8_OPEN,'/biogem/biogem_series_focnsed_CaCO3.res'),'ascii');

% mean CaCO3 wt%
REF_mean_CaCO3_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_sed_CaCO3.res'),'ascii');
REF_mean_CaCO3_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_sed_CaCO3.res'),'ascii');
REF_mean_CaCO3_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_sed_CaCO3.res'),'ascii');
REF_mean_CaCO3_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_sed_CaCO3.res'),'ascii');
REF_mean_CaCO3_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_sed_CaCO3.res'),'ascii');
REF_mean_CaCO3_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_sed_CaCO3.res'),'ascii');
REF_mean_CaCO3_exp7 = load(fullfile(exp_6_OPEN,'/biogem/biogem_series_sed_CaCO3.res'),'ascii');
REF_mean_CaCO3_exp8 = load(fullfile(exp_7_OPEN,'/biogem/biogem_series_sed_CaCO3.res'),'ascii');
REF_mean_CaCO3_exp9 = load(fullfile(exp_8_OPEN,'/biogem/biogem_series_sed_CaCO3.res'),'ascii');


%% input to calculate POC burial:
REF_focnsed_POC_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_focnsed_POC.res'),'ascii');
REF_focnsed_POC_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_focnsed_POC.res'),'ascii');
REF_focnsed_POC_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_focnsed_POC.res'),'ascii');
REF_focnsed_POC_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_focnsed_POC.res'),'ascii');
REF_focnsed_POC_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_focnsed_POC.res'),'ascii');
REF_focnsed_POC_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_focnsed_POC.res'),'ascii');
REF_focnsed_POC_exp7 = load(fullfile(exp_6_OPEN,'/biogem/biogem_series_focnsed_POC.res'),'ascii');
REF_focnsed_POC_exp8 = load(fullfile(exp_7_OPEN,'/biogem/biogem_series_focnsed_POC.res'),'ascii');
REF_focnsed_POC_exp9 = load(fullfile(exp_8_OPEN,'/biogem/biogem_series_focnsed_POC.res'),'ascii');


REF_fsedocn_DIC_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_fsedocn_DIC.res'),'ascii');
REF_fsedocn_DIC_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_fsedocn_DIC.res'),'ascii');
REF_fsedocn_DIC_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_fsedocn_DIC.res'),'ascii');
REF_fsedocn_DIC_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_fsedocn_DIC.res'),'ascii');
REF_fsedocn_DIC_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_fsedocn_DIC.res'),'ascii');
REF_fsedocn_DIC_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_fsedocn_DIC.res'),'ascii');
REF_fsedocn_DIC_exp7 = load(fullfile(exp_6_OPEN,'/biogem/biogem_series_fsedocn_DIC.res'),'ascii');
REF_fsedocn_DIC_exp8 = load(fullfile(exp_7_OPEN,'/biogem/biogem_series_fsedocn_DIC.res'),'ascii');
REF_fsedocn_DIC_exp9 = load(fullfile(exp_8_OPEN,'/biogem/biogem_series_fsedocn_DIC.res'),'ascii');


REF_fsedocn_Ca_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_fsedocn_Ca.res'),'ascii');
REF_fsedocn_Ca_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_fsedocn_Ca.res'),'ascii');
REF_fsedocn_Ca_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_fsedocn_Ca.res'),'ascii');
REF_fsedocn_Ca_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_fsedocn_Ca.res'),'ascii');
REF_fsedocn_Ca_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_fsedocn_Ca.res'),'ascii');
REF_fsedocn_Ca_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_fsedocn_Ca.res'),'ascii');
REF_fsedocn_Ca_exp7 = load(fullfile(exp_6_OPEN,'/biogem/biogem_series_fsedocn_Ca.res'),'ascii');
REF_fsedocn_Ca_exp8 = load(fullfile(exp_7_OPEN,'/biogem/biogem_series_fsedocn_Ca.res'),'ascii');
REF_fsedocn_Ca_exp9 = load(fullfile(exp_8_OPEN,'/biogem/biogem_series_fsedocn_Ca.res'),'ascii');

% calculate POC burial & convert from mol/yr to PgC/yr  (i.e. *12/10^15): 
REF_POC_burial_exp1 = REF_focnsed_POC_exp1;
REF_POC_burial_exp2 = REF_focnsed_POC_exp2;
REF_POC_burial_exp3 = REF_focnsed_POC_exp3;
REF_POC_burial_exp4 = REF_focnsed_POC_exp4;
REF_POC_burial_exp5 = REF_focnsed_POC_exp5;
REF_POC_burial_exp6 = REF_focnsed_POC_exp6;
REF_POC_burial_exp7 = REF_focnsed_POC_exp7;
REF_POC_burial_exp8 = REF_focnsed_POC_exp8;
REF_POC_burial_exp9 = REF_focnsed_POC_exp9;

REF_POC_burial_exp1(:,2) = (REF_focnsed_POC_exp1(:,2) - (REF_fsedocn_DIC_exp1(:,2)-REF_fsedocn_Ca_exp1(:,2))).*12.*1e-15;
REF_POC_burial_exp2(:,2) = (REF_focnsed_POC_exp2(:,2) - (REF_fsedocn_DIC_exp2(:,2)-REF_fsedocn_Ca_exp2(:,2))).*12.*1e-15;
REF_POC_burial_exp3(:,2) = (REF_focnsed_POC_exp3(:,2) - (REF_fsedocn_DIC_exp3(:,2)-REF_fsedocn_Ca_exp3(:,2))).*12.*1e-15;
REF_POC_burial_exp4(:,2) = (REF_focnsed_POC_exp4(:,2) - (REF_fsedocn_DIC_exp4(:,2)-REF_fsedocn_Ca_exp4(:,2))).*12.*1e-15;
REF_POC_burial_exp5(:,2) = (REF_focnsed_POC_exp5(:,2) - (REF_fsedocn_DIC_exp5(:,2)-REF_fsedocn_Ca_exp5(:,2))).*12.*1e-15;
REF_POC_burial_exp6(:,2) = (REF_focnsed_POC_exp6(:,2) - (REF_fsedocn_DIC_exp6(:,2)-REF_fsedocn_Ca_exp6(:,2))).*12.*1e-15;
REF_POC_burial_exp7(:,2) = (REF_focnsed_POC_exp7(:,2) - (REF_fsedocn_DIC_exp7(:,2)-REF_fsedocn_Ca_exp7(:,2))).*12.*1e-15;
REF_POC_burial_exp8(:,2) = (REF_focnsed_POC_exp8(:,2) - (REF_fsedocn_DIC_exp8(:,2)-REF_fsedocn_Ca_exp8(:,2))).*12.*1e-15;
REF_POC_burial_exp9(:,2) = (REF_focnsed_POC_exp9(:,2) - (REF_fsedocn_DIC_exp9(:,2)-REF_fsedocn_Ca_exp9(:,2))).*12.*1e-15;

% calculate C-burial in CaCO3 & convert from mol/yr to PgC/yr  (i.e. *12/10^15):
REF_CaCO3_burial_exp1 = REF_focnsed_CaCO3_exp1;
REF_CaCO3_burial_exp2 = REF_focnsed_CaCO3_exp2;
REF_CaCO3_burial_exp3 = REF_focnsed_CaCO3_exp3;
REF_CaCO3_burial_exp4 = REF_focnsed_CaCO3_exp4;
REF_CaCO3_burial_exp5 = REF_focnsed_CaCO3_exp5;
REF_CaCO3_burial_exp6 = REF_focnsed_CaCO3_exp6;
REF_CaCO3_burial_exp7 = REF_focnsed_CaCO3_exp7;
REF_CaCO3_burial_exp8 = REF_focnsed_CaCO3_exp8;
REF_CaCO3_burial_exp9 = REF_focnsed_CaCO3_exp9;

REF_CaCO3_burial_exp1(:,2) = (REF_focnsed_CaCO3_exp1(:,2)-REF_fsedocn_Ca_exp1(:,2)).*12.*1e-15;
REF_CaCO3_burial_exp2(:,2) = (REF_focnsed_CaCO3_exp2(:,2)-REF_fsedocn_Ca_exp2(:,2)).*12.*1e-15;
REF_CaCO3_burial_exp3(:,2) = (REF_focnsed_CaCO3_exp3(:,2)-REF_fsedocn_Ca_exp3(:,2)).*12.*1e-15;
REF_CaCO3_burial_exp4(:,2) = (REF_focnsed_CaCO3_exp4(:,2)-REF_fsedocn_Ca_exp4(:,2)).*12.*1e-15;
REF_CaCO3_burial_exp5(:,2) = (REF_focnsed_CaCO3_exp5(:,2)-REF_fsedocn_Ca_exp5(:,2)).*12.*1e-15;
REF_CaCO3_burial_exp6(:,2) = (REF_focnsed_CaCO3_exp6(:,2)-REF_fsedocn_Ca_exp6(:,2)).*12.*1e-15;
REF_CaCO3_burial_exp7(:,2) = (REF_focnsed_CaCO3_exp7(:,2)-REF_fsedocn_Ca_exp7(:,2)).*12.*1e-15;
REF_CaCO3_burial_exp8(:,2) = (REF_focnsed_CaCO3_exp8(:,2)-REF_fsedocn_Ca_exp8(:,2)).*12.*1e-15;
REF_CaCO3_burial_exp9(:,2) = (REF_focnsed_CaCO3_exp9(:,2)-REF_fsedocn_Ca_exp9(:,2)).*12.*1e-15;


% calculate length up experiments
time_exps = REF_misc_opsi_exp2(end,1);
xaxis_lim = years_SPIN + time_exps;

% set color for CTRLs
color_ctrls = copper(4);

% set color for Exps

%% split in three figures:
if(true)
set(0,'defaultLineLineWidth', 1)
set(0,'DefaultAxesFontSize',10)

%%
fig1=figure;
grid on
hold on

% atm temp.
subplot(3, 2, 1)
plot(REF_atm_tmp_exp1(:,1),REF_atm_tmp_exp1(:,2),'k'); hold on;
hold on;
plot(    REF_atm_tmp_exp2(:,1)+years_SPIN,REF_atm_tmp_exp2(:,2), 'Color',color_ctrls(1,:));
plot(    REF_atm_tmp_exp3(:,1)+years_SPIN,REF_atm_tmp_exp3(:,2), 'Color',color_ctrls(2,:));
plot(     REF_atm_tmp_exp4(:,1)+years_SPIN,REF_atm_tmp_exp4(:,2), 'Color',color_ctrls(3,:));
plot(    REF_atm_tmp_exp5(:,1)+years_SPIN,REF_atm_tmp_exp5(:,2), 'Color',color_ctrls(4,:));
plot(     REF_atm_tmp_exp6(:,1)+years_SPIN,REF_atm_tmp_exp6(:,2),'r--');
plot(     REF_atm_tmp_exp7(:,1)+years_SPIN,REF_atm_tmp_exp7(:,2),'b--');
plot(     REF_atm_tmp_exp8(:,1)+years_SPIN,REF_atm_tmp_exp8(:,2),'m-.');
plot(     REF_atm_tmp_exp9(:,1)+years_SPIN,REF_atm_tmp_exp9(:,2),'c:'); 
ylabel({'Mean air'; 'temp (°C)'});
xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
% ylim([0 20]);

% atm. CO2
subplot(3, 2, 2)
plot(REF_sed_pCO2_exp1(:,1),REF_sed_pCO2_exp1(:,3)*1e+6,'k'); hold on;
hold on;
plot(    REF_sed_pCO2_exp2(:,1)+years_SPIN,REF_sed_pCO2_exp2(:,3)*1e+6,'--', 'Color',color_ctrls(1,:));
plot(    REF_sed_pCO2_exp3(:,1)+years_SPIN,REF_sed_pCO2_exp3(:,3)*1e+6,'--', 'Color',color_ctrls(2,:));
plot(     REF_sed_pCO2_exp4(:,1)+years_SPIN,REF_sed_pCO2_exp4(:,3)*1e+6,'--', 'Color',color_ctrls(3,:));
plot(    REF_sed_pCO2_exp5(:,1)+years_SPIN,REF_sed_pCO2_exp5(:,3)*1e+6,'--', 'Color',color_ctrls(4,:));
plot(     REF_sed_pCO2_exp6(:,1)+years_SPIN,REF_sed_pCO2_exp6(:,3)*1e+6,'r--');
plot(     REF_sed_pCO2_exp7(:,1)+years_SPIN,REF_sed_pCO2_exp7(:,3)*1e+6,'b--');
plot(     REF_sed_pCO2_exp8(:,1)+years_SPIN,REF_sed_pCO2_exp8(:,3)*1e+6,'m-.');
plot(     REF_sed_pCO2_exp9(:,1)+years_SPIN,REF_sed_pCO2_exp9(:,3)*1e+6,'c:'); 
ylabel({'pCO2'; '(ppm)'});
xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
% ylim([1000 1200])


% global min overturning (Sv)
subplot(3, 2, 3)
plot(REF_misc_opsi_exp1(:,1),REF_misc_opsi_exp1(:,2),'k'); hold on;
hold on;
plot(    REF_misc_opsi_exp2(:,1)+years_SPIN,REF_misc_opsi_exp2(:,2),'--', 'Color',color_ctrls(1,:));
plot(    REF_misc_opsi_exp3(:,1)+years_SPIN,REF_misc_opsi_exp3(:,2),'--', 'Color',color_ctrls(2,:));
plot(    REF_misc_opsi_exp4(:,1)+years_SPIN,REF_misc_opsi_exp4(:,2),'--', 'Color',color_ctrls(3,:));
plot(    REF_misc_opsi_exp5(:,1)+years_SPIN,REF_misc_opsi_exp5(:,2),'--', 'Color',color_ctrls(4,:));
plot(    REF_misc_opsi_exp6(:,1)+years_SPIN,REF_misc_opsi_exp6(:,2),'r--');
plot(    REF_misc_opsi_exp7(:,1)+years_SPIN,REF_misc_opsi_exp7(:,2),'b--');
plot(    REF_misc_opsi_exp8(:,1)+years_SPIN,REF_misc_opsi_exp8(:,2),'m-.');
plot(    REF_misc_opsi_exp9(:,1)+years_SPIN,REF_misc_opsi_exp9(:,2),'c:'); 
ylabel({'global min'; 'overturn (Sv)'});
xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
% ylim([-45 -40])


% atm. O2
subplot(3, 2, 4)
plot(REF_sed_pO2_exp1(:,1),REF_sed_pO2_exp1(:,3),'k'); hold on;
hold on;
plot(REF_sed_pO2_exp2(:,1)+years_SPIN,REF_sed_pO2_exp2(:,3),'--', 'Color',color_ctrls(1,:));
plot(REF_sed_pO2_exp3(:,1)+years_SPIN,REF_sed_pO2_exp3(:,3),'--', 'Color',color_ctrls(2,:));
plot( REF_sed_pO2_exp4(:,1)+years_SPIN,REF_sed_pO2_exp4(:,3),'--', 'Color',color_ctrls(3,:));
plot(REF_sed_pO2_exp5(:,1)+years_SPIN,REF_sed_pO2_exp5(:,3),'--', 'Color',color_ctrls(4,:));
plot( REF_sed_pO2_exp6(:,1)+years_SPIN,REF_sed_pO2_exp6(:,3),'r--');
plot( REF_sed_pO2_exp7(:,1)+years_SPIN,REF_sed_pO2_exp7(:,3),'b--');
plot( REF_sed_pO2_exp8(:,1)+years_SPIN,REF_sed_pO2_exp8(:,3),'m-.');
plot( REF_sed_pO2_exp9(:,1)+years_SPIN,REF_sed_pO2_exp9(:,3),'c:'); 
%plot(REF_sed_pCO2_exp1(:,1),REF_sed_pCO2_exp1(:,3)*1e+6,'k',REF_sed_pCO2_exp2(:,1),REF_sed_pCO2_exp2(:,3)*1e+6,'r',REF_sed_pCO2_exp3(:,1),REF_sed_pCO2_exp3(:,3)*1e+6,'--', 'Color',color_ctrls(2,:),REF_sed_pCO2_exp4(:,1),REF_sed_pCO2_exp4(:,3)*1e+6,'--', 'Color',color_ctrls(3,:)); 
%xlabel('years ');
ylabel({'pO2'; '(atm)'});
xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
% ylim([0.2 0.22])
hleg=legend(PNAME_SPIN, ...
    PNAME_OPEN1, ...
    PNAME_OPEN2, ...
    PNAME_OPEN3, ...
    PNAME_OPEN4, ...
    PNAME_OPEN5, ...
    PNAME_OPEN6, ...
    PNAME_OPEN7, ...
    PNAME_OPEN8); 
%hleg=legend('0606-02 Archer SPIN - No OMEN - fast sinking', '2308-07 Archer SPIN - No OMEN - fast sinking - solid fields closedCaCO3', '2308-09 with OMEN - solid fields - invariant k1 = 0.015 closedCaCO3', '2308-11  with OMEN - solid fields - Boudreau depth closedCaCO3'); 
set(hleg,'FontSize',8);
set(hleg,'Location','SouthEast');

txt = '(c)';
text(0.03,0.15,txt,'FontSize',12,'Units','normalized') 

% PO4
subplot(3,2,5)
if(plot_mean) % mean (mol/kg)
    plot(REF_sed_PO4_exp1(:,1),REF_sed_PO4_exp1(:,3)*1e+6,'k'); hold on;
hold on;
plot(     REF_sed_PO4_exp2(:,1)+years_SPIN,REF_sed_PO4_exp2(:,3)*1e+6,'k'); hold on;
plot(REF_sed_PO4_exp3(:,1)+years_SPIN,REF_sed_PO4_exp3(:,3)*1e+6,'--', 'Color',color_ctrls(2,:));
plot(REF_sed_PO4_exp4(:,1)+years_SPIN,REF_sed_PO4_exp4(:,3)*1e+6,'--', 'Color',color_ctrls(3,:));
plot(REF_sed_PO4_exp5(:,1)+years_SPIN,REF_sed_PO4_exp5(:,3)*1e+6,'--', 'Color',color_ctrls(4,:) );
plot(REF_sed_PO4_exp6(:,1)+years_SPIN,REF_sed_PO4_exp6(:,3)*1e+6,'r--' );
plot(REF_sed_PO4_exp7(:,1)+years_SPIN,REF_sed_PO4_exp7(:,3)*1e+6,'b--' );
plot(REF_sed_PO4_exp8(:,1)+years_SPIN,REF_sed_PO4_exp8(:,3)*1e+6,'m-.' );
plot(REF_sed_PO4_exp9(:,1)+years_SPIN,REF_sed_PO4_exp9(:,3)*1e+6,'c:'); 
         ylabel({'PO_4'; '(\mumol kg^{-1})'});
%        ylabel('(\mumol kg^{-1})');
else % total (mol)
%     plot(REF_sed_PO4_exp1(:,1),REF_sed_PO4_exp1(:,2),'k',...
%         REF_sed_PO4_exp2(:,1)+years_SPIN,REF_sed_PO4_exp2(:,2),'--', 'Color',color_ctrls(1,:));
%         REF_sed_PO4_exp3(:,1)+years_SPIN,REF_sed_PO4_exp3(:,2),'--', 'Color',color_ctrls(2,:),...
%         REF_sed_PO4_exp4(:,1)+years_SPIN,REF_sed_PO4_exp4(:,2),'--', 'Color',color_ctrls(3,:));
%         REF_sed_PO4_exp5(:,1)+years_SPIN,REF_sed_PO4_exp5(:,2),'--', 'Color',color_ctrls(4,:));
%      	REF_sed_PO4_exp6(:,1)+years_SPIN,REF_sed_PO4_exp6(:,2),'r--');
%      	REF_sed_PO4_exp7(:,1)+years_SPIN,REF_sed_PO4_exp7(:,2),'b--')
%     ylabel('PO_4 (mol)');
end
% set(gca,'xticklabel',{[]})
xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 


subplot(3,2, 6)
plot(REF_sed_DIC_13C_exp1(:,1),REF_sed_DIC_13C_exp1(:,3),'k'); hold on;
hold on;
plot(REF_sed_DIC_13C_exp2(:,1)+years_SPIN,REF_sed_DIC_13C_exp2(:,3),'--', 'Color',color_ctrls(1,:));
plot(REF_sed_DIC_13C_exp3(:,1)+years_SPIN,REF_sed_DIC_13C_exp3(:,3),'--', 'Color',color_ctrls(2,:));
plot(REF_sed_DIC_13C_exp4(:,1)+years_SPIN,REF_sed_DIC_13C_exp4(:,3),'--', 'Color',color_ctrls(3,:));
plot(REF_sed_DIC_13C_exp5(:,1)+years_SPIN,REF_sed_DIC_13C_exp5(:,3),'--', 'Color',color_ctrls(4,:));
plot(REF_sed_DIC_13C_exp6(:,1)+years_SPIN,REF_sed_DIC_13C_exp6(:,3),'r--');
plot(REF_sed_DIC_13C_exp7(:,1)+years_SPIN,REF_sed_DIC_13C_exp7(:,3),'b--');
plot(REF_sed_DIC_13C_exp8(:,1)+years_SPIN,REF_sed_DIC_13C_exp8(:,3),'m-.');
plot(REF_sed_DIC_13C_exp9(:,1)+years_SPIN,REF_sed_DIC_13C_exp9(:,3),'c:'); 
%xlabel('years ');
ylabel({'global DIC 13C'; 'permil'});
xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 


if(plot_mean)  % mean (mol/kg)
    print(fig1, '-depsc', ['PLOTS/' FILENAME '_1BC']);
else
    print(fig1, '-depsc', ['PLOTS/' FILENAME '_1BC_Total']);
end


%%
fig2=figure;
grid on
hold on

% global POC export flux (PgC yr-1) 
subplot(3, 2, 1)
plot(REF_fexport_POC_exp1(:,1),REF_fexport_POC_exp1(:,2)*12*1e-15,'k'); hold on;
hold on;
plot(REF_fexport_POC_exp2(:,1)+years_SPIN,REF_fexport_POC_exp2(:,2)*12*1e-15,'--', 'Color',color_ctrls(1,:));
plot(REF_fexport_POC_exp3(:,1)+years_SPIN,REF_fexport_POC_exp3(:,2)*12*1e-15,'--', 'Color',color_ctrls(2,:));
plot(REF_fexport_POC_exp4(:,1)+years_SPIN,REF_fexport_POC_exp4(:,2)*12*1e-15,'--', 'Color',color_ctrls(3,:));
plot(REF_fexport_POC_exp5(:,1)+years_SPIN,REF_fexport_POC_exp5(:,2)*12*1e-15,'--', 'Color',color_ctrls(4,:));
plot(REF_fexport_POC_exp6(:,1)+years_SPIN,REF_fexport_POC_exp6(:,2)*12*1e-15,'r--');
plot(REF_fexport_POC_exp7(:,1)+years_SPIN,REF_fexport_POC_exp7(:,2)*12*1e-15,'b--');
plot(REF_fexport_POC_exp8(:,1)+years_SPIN,REF_fexport_POC_exp8(:,2)*12*1e-15,'m-.');
plot(REF_fexport_POC_exp9(:,1)+years_SPIN,REF_fexport_POC_exp9(:,2)*12*1e-15,'c:'); 
%xlabel('years ');
ylabel({'global POC'; 'export (PgC yr-1)'});
xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
% xlim([years_SPIN-years_SPIN_plot years_SPIN+10000]) 


% POC depositional flux
subplot(3, 2, 3)
    plot(REF_focnsed_POC_exp1(:,1),REF_focnsed_POC_exp1(:,2)*12*1e-15,'k'); hold on;
hold on;
plot(REF_focnsed_POC_exp2(:,1)+years_SPIN,REF_focnsed_POC_exp2(:,2)*12*1e-15,'--', 'Color',color_ctrls(1,:));
plot(REF_focnsed_POC_exp3(:,1)+years_SPIN,REF_focnsed_POC_exp3(:,2)*12*1e-15,'--', 'Color',color_ctrls(2,:));
plot(REF_focnsed_POC_exp4(:,1)+years_SPIN,REF_focnsed_POC_exp4(:,2)*12*1e-15,'--', 'Color',color_ctrls(3,:));
plot(REF_focnsed_POC_exp5(:,1)+years_SPIN,REF_focnsed_POC_exp5(:,2)*12*1e-15,'--', 'Color',color_ctrls(4,:));
plot(REF_focnsed_POC_exp6(:,1)+years_SPIN,REF_focnsed_POC_exp6(:,2)*12*1e-15,'r--');
plot(REF_focnsed_POC_exp7(:,1)+years_SPIN,REF_focnsed_POC_exp7(:,2)*12*1e-15,'b--');
plot(REF_focnsed_POC_exp8(:,1)+years_SPIN,REF_focnsed_POC_exp8(:,2)*12*1e-15,'m-.');
plot(REF_focnsed_POC_exp9(:,1)+years_SPIN,REF_focnsed_POC_exp9(:,2)*12*1e-15,'c:'); 
        ylabel({'POC deposition'; '(PgC yr^{-1})'});
xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
% xlim([years_SPIN-years_SPIN_plot years_SPIN+10000]) 


subplot(3,2, 5)
plot(REF_POC_burial_exp1(:,1),REF_POC_burial_exp1(:,2),'k'); hold on;
plot(REF_POC_burial_exp2(:,1)+years_SPIN,REF_POC_burial_exp2(:,2),'--', 'Color',color_ctrls(1,:));
plot(REF_POC_burial_exp3(:,1)+years_SPIN,REF_POC_burial_exp3(:,2),'--', 'Color',color_ctrls(2,:));
plot(REF_POC_burial_exp4(:,1)+years_SPIN,REF_POC_burial_exp4(:,2),'--', 'Color',color_ctrls(3,:));
plot(REF_POC_burial_exp5(:,1)+years_SPIN,REF_POC_burial_exp5(:,2),'--', 'Color',color_ctrls(4,:));
plot(REF_POC_burial_exp6(:,1)+years_SPIN,REF_POC_burial_exp6(:,2),'r--');
plot(REF_POC_burial_exp7(:,1)+years_SPIN,REF_POC_burial_exp7(:,2),'b--');
plot(REF_POC_burial_exp8(:,1)+years_SPIN,REF_POC_burial_exp8(:,2),'m-.');
plot(REF_POC_burial_exp9(:,1)+years_SPIN,REF_POC_burial_exp9(:,2),'c:');
ylabel({'OM burial'; '(PgC yr^{-1})'});
xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
% xlim([years_SPIN-years_SPIN_plot years_SPIN+10000]) 
% % ylim([0.0 2.5])


%%%%%%%%%%%%
%%%%%%%%%%%% CaCO3
%%%%%%%%%%%%

% mean CaCO3 wt%
subplot(3,2, 2)
plot(REF_mean_CaCO3_exp1(:,1),REF_mean_CaCO3_exp1(:,2),'k'); hold on;
plot(REF_mean_CaCO3_exp2(:,1)+years_SPIN,REF_mean_CaCO3_exp2(:,2),'--', 'Color',color_ctrls(1,:));
plot(REF_mean_CaCO3_exp3(:,1)+years_SPIN,REF_mean_CaCO3_exp3(:,2),'--', 'Color',color_ctrls(2,:));
plot(REF_mean_CaCO3_exp4(:,1)+years_SPIN,REF_mean_CaCO3_exp4(:,2),'--', 'Color',color_ctrls(3,:));
plot(REF_mean_CaCO3_exp5(:,1)+years_SPIN,REF_mean_CaCO3_exp5(:,2),'--', 'Color',color_ctrls(4,:));
plot(REF_mean_CaCO3_exp6(:,1)+years_SPIN,REF_mean_CaCO3_exp6(:,2),'r--');
plot(REF_mean_CaCO3_exp7(:,1)+years_SPIN,REF_mean_CaCO3_exp7(:,2),'b--');
plot(REF_mean_CaCO3_exp8(:,1)+years_SPIN,REF_mean_CaCO3_exp8(:,2),'m-.');
plot(REF_mean_CaCO3_exp9(:,1)+years_SPIN,REF_mean_CaCO3_exp9(:,2),'c:');
ylabel({'Mean CaCO_3'; '(wt%)'});
xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
% xlim([years_SPIN-years_SPIN_plot years_SPIN+10000]) 

% focnsed_CaCO3
subplot(3,2, 4)
    plot(REF_focnsed_CaCO3_exp1(:,1),REF_focnsed_CaCO3_exp1(:,2)*12*1e-15,'k'); hold on;
plot(REF_focnsed_CaCO3_exp2(:,1)+years_SPIN,REF_focnsed_CaCO3_exp2(:,2)*12*1e-15,'--', 'Color',color_ctrls(1,:));
plot(REF_focnsed_CaCO3_exp3(:,1)+years_SPIN,REF_focnsed_CaCO3_exp3(:,2)*12*1e-15,'--', 'Color',color_ctrls(2,:));
plot(REF_focnsed_CaCO3_exp4(:,1)+years_SPIN,REF_focnsed_CaCO3_exp4(:,2)*12*1e-15,'--', 'Color',color_ctrls(3,:));
plot(REF_focnsed_CaCO3_exp5(:,1)+years_SPIN,REF_focnsed_CaCO3_exp5(:,2)*12*1e-15,'--', 'Color',color_ctrls(4,:));
plot(REF_focnsed_CaCO3_exp6(:,1)+years_SPIN,REF_focnsed_CaCO3_exp6(:,2)*12*1e-15,'r--');
plot(REF_focnsed_CaCO3_exp7(:,1)+years_SPIN,REF_focnsed_CaCO3_exp7(:,2)*12*1e-15,'b--');
plot(REF_focnsed_CaCO3_exp8(:,1)+years_SPIN,REF_focnsed_CaCO3_exp8(:,2)*12*1e-15,'m-.');
plot(REF_focnsed_CaCO3_exp9(:,1)+years_SPIN,REF_focnsed_CaCO3_exp9(:,2)*12*1e-15,'c:'); 
        ylabel({'CaCO3 deposition'; '(PgC yr^{-1})'});

xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
% xlim([years_SPIN-years_SPIN_plot years_SPIN+10000]) 


subplot(3,2, 6)
plot(REF_CaCO3_burial_exp1(:,1),REF_CaCO3_burial_exp1(:,2),'k'); hold on;
plot(REF_CaCO3_burial_exp2(:,1)+years_SPIN,REF_CaCO3_burial_exp2(:,2),'--', 'Color',color_ctrls(1,:));
plot(REF_CaCO3_burial_exp3(:,1)+years_SPIN,REF_CaCO3_burial_exp3(:,2),'--', 'Color',color_ctrls(2,:));
plot(REF_CaCO3_burial_exp4(:,1)+years_SPIN,REF_CaCO3_burial_exp4(:,2),'--', 'Color',color_ctrls(3,:));
plot(REF_CaCO3_burial_exp5(:,1)+years_SPIN,REF_CaCO3_burial_exp5(:,2),'--', 'Color',color_ctrls(4,:));
plot(REF_CaCO3_burial_exp6(:,1)+years_SPIN,REF_CaCO3_burial_exp6(:,2),'r--');
plot(REF_CaCO3_burial_exp7(:,1)+years_SPIN,REF_CaCO3_burial_exp7(:,2),'b--');
plot(REF_CaCO3_burial_exp8(:,1)+years_SPIN,REF_CaCO3_burial_exp8(:,2),'m-.');
plot(REF_CaCO3_burial_exp9(:,1)+years_SPIN,REF_CaCO3_burial_exp9(:,2),'c:');
ylabel({'CaCO3 burial'; '(PgC yr^{-1})'});
xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
% xlim([years_SPIN-years_SPIN_plot years_SPIN+10000]) 
% % ylim([0.0 2.5])

if(plot_mean)  % mean (mol/kg)
    print(fig2, '-depsc', ['PLOTS/' FILENAME '_2Ccyle']);
else
    print(fig2, '-depsc', ['PLOTS/' FILENAME '_2Ccyle_Total']);
end


%%
fig3=figure;
grid on
hold on

subplot(3,2,1)
if(plot_mean) % mean (mol/kg)
    plot(REF_sed_O2_exp1(:,1),REF_sed_O2_exp1(:,3)*1e+6,'k'); hold on;
plot(REF_sed_O2_exp2(:,1)+years_SPIN,REF_sed_O2_exp2(:,3)*1e+6,'--', 'Color',color_ctrls(1,:));
plot(REF_sed_O2_exp3(:,1)+years_SPIN,REF_sed_O2_exp3(:,3)*1e+6,'--', 'Color',color_ctrls(2,:));
plot(REF_sed_O2_exp4(:,1)+years_SPIN,REF_sed_O2_exp4(:,3)*1e+6,'--', 'Color',color_ctrls(3,:));
plot(REF_sed_O2_exp5(:,1)+years_SPIN,REF_sed_O2_exp5(:,3)*1e+6,'--', 'Color',color_ctrls(4,:));
plot(REF_sed_O2_exp6(:,1)+years_SPIN,REF_sed_O2_exp6(:,3)*1e+6,'r--');
plot(REF_sed_O2_exp7(:,1)+years_SPIN,REF_sed_O2_exp7(:,3)*1e+6,'b--');
plot(REF_sed_O2_exp8(:,1)+years_SPIN,REF_sed_O2_exp8(:,3)*1e+6,'m-.');
plot(REF_sed_O2_exp9(:,1)+years_SPIN,REF_sed_O2_exp9(:,3)*1e+6,'c:'); 
        ylabel({'O_2'; '(\mumol kg^{-1})'});
%        ylabel('(\mumol kg^{-1})');
else
    % total (mol)
    plot(REF_sed_O2_exp1(:,1),REF_sed_O2_exp1(:,2),'k'); hold on;
plot(REF_sed_O2_exp2(:,1)+years_SPIN,REF_sed_O2_exp2(:,2),'--', 'Color',color_ctrls(1,:));
plot(REF_sed_O2_exp3(:,1)+years_SPIN,REF_sed_O2_exp3(:,2),'--', 'Color',color_ctrls(2,:));
plot(REF_sed_O2_exp4(:,1)+years_SPIN,REF_sed_O2_exp4(:,2),'--', 'Color',color_ctrls(3,:));
plot(REF_sed_O2_exp5(:,1)+years_SPIN,REF_sed_O2_exp5(:,2),'--', 'Color',color_ctrls(4,:));
plot(REF_sed_O2_exp6(:,1)+years_SPIN,REF_sed_O2_exp6(:,2),'r--');
plot(REF_sed_O2_exp7(:,1)+years_SPIN,REF_sed_O2_exp7(:,2),'b--');
plot(REF_sed_O2_exp8(:,1)+years_SPIN,REF_sed_O2_exp8(:,2),'m-.');
plot(REF_sed_O2_exp9(:,1)+years_SPIN,REF_sed_O2_exp9(:,2),'c:')
     ylabel('O_2 (mol)');
end
xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 

subplot(3,2,2)
if(plot_mean)  % mean (mol/kg)
	plot(REF_sed_SO4_exp1(:,1),REF_sed_SO4_exp1(:,3)*1e+6,'k'); hold on;
plot(REF_sed_SO4_exp2(:,1)+years_SPIN,REF_sed_SO4_exp2(:,3)*1e+6,'--', 'Color',color_ctrls(1,:));
plot(REF_sed_SO4_exp3(:,1)+years_SPIN,REF_sed_SO4_exp3(:,3)*1e+6,'--', 'Color',color_ctrls(2,:));
plot(REF_sed_SO4_exp4(:,1)+years_SPIN,REF_sed_SO4_exp4(:,3)*1e+6,'--', 'Color',color_ctrls(3,:));
plot(REF_sed_SO4_exp5(:,1)+years_SPIN,REF_sed_SO4_exp5(:,3)*1e+6,'--', 'Color',color_ctrls(4,:));
plot(REF_sed_SO4_exp6(:,1)+years_SPIN,REF_sed_SO4_exp6(:,3)*1e+6,'r--' );
plot(REF_sed_SO4_exp7(:,1)+years_SPIN,REF_sed_SO4_exp7(:,3)*1e+6,'b--');
plot(REF_sed_SO4_exp8(:,1)+years_SPIN,REF_sed_SO4_exp8(:,3)*1e+6,'m-.' );
plot(REF_sed_SO4_exp9(:,1)+years_SPIN,REF_sed_SO4_exp9(:,3)*1e+6,'c:'); 
         ylabel({'SO_4'; '(\mumol kg^{-1})'});
%        ylabel('(\mumol kg^{-1})');
else    % total (mol)
%     plot(REF_sed_SO4_exp1(:,1),REF_sed_SO4_exp1(:,2),'k',...
%     plot(REF_sed_SO4_exp2(:,1)+years_SPIN,REF_sed_SO4_exp2(:,2),'--', 'Color',color_ctrls(1,:),...
%     plot(REF_sed_SO4_exp3(:,1)+years_SPIN,REF_sed_SO4_exp3(:,2),'--', 'Color',color_ctrls(2,:),...
%     plot(REF_sed_SO4_exp4(:,1)+years_SPIN,REF_sed_SO4_exp4(:,2),'--', 'Color',color_ctrls(3,:));
%     plot(REF_sed_SO4_exp5(:,1)+years_SPIN,REF_sed_SO4_exp5(:,2),'--', 'Color',color_ctrls(4,:),...
% plot(REF_sed_SO4_exp6(:,1)+years_SPIN,REF_sed_SO4_exp6(:,2),'r--',...
% plot(REF_sed_SO4_exp7(:,1)+years_SPIN,REF_sed_SO4_exp7(:,2),'b--',...
% plot(REF_sed_SO4_exp8(:,1)+years_SPIN,REF_sed_SO4_exp8(:,2),'m-.',...
% plot(REF_sed_SO4_exp9(:,1)+years_SPIN,REF_sed_SO4_exp9(:,2),'c:')
%     ylabel('SO_4 (mol)');
end
xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 

subplot(3,2,3)
if(plot_mean) % mean (mol/kg)
	plot(REF_sed_H2S_exp1(:,1),REF_sed_H2S_exp1(:,3)*1e+6,'k'); hold on;
plot(REF_sed_H2S_exp2(:,1)+years_SPIN,REF_sed_H2S_exp2(:,3)*1e+6,'--', 'Color',color_ctrls(1,:));
plot(REF_sed_H2S_exp3(:,1)+years_SPIN,REF_sed_H2S_exp3(:,3)*1e+6,'--', 'Color',color_ctrls(2,:));
plot(REF_sed_H2S_exp4(:,1)+years_SPIN,REF_sed_H2S_exp4(:,3)*1e+6,'--', 'Color',color_ctrls(3,:));
plot(REF_sed_H2S_exp5(:,1)+years_SPIN,REF_sed_H2S_exp5(:,3)*1e+6,'--', 'Color',color_ctrls(4,:));
plot(REF_sed_H2S_exp6(:,1)+years_SPIN,REF_sed_H2S_exp6(:,3)*1e+6,'r--');
plot(REF_sed_H2S_exp7(:,1)+years_SPIN,REF_sed_H2S_exp7(:,3)*1e+6,'b--');
plot(REF_sed_H2S_exp8(:,1)+years_SPIN,REF_sed_H2S_exp8(:,3)*1e+6,'m-.');
plot(REF_sed_H2S_exp9(:,1)+years_SPIN,REF_sed_H2S_exp9(:,3)*1e+6,'c:');
         ylabel({'H_2S'; '(\mumol kg^{-1})'});
%        ylabel('(\mumol kg^{-1})');
else % total (mol)
%     plot(REF_sed_H2S_exp1(:,1),REF_sed_H2S_exp1(:,2),'k',...
%         REF_sed_H2S_exp2(:,1)+years_SPIN,REF_sed_H2S_exp2(:,2),'--', 'Color',color_ctrls(1,:));
%         REF_sed_H2S_exp3(:,1)+years_SPIN,REF_sed_H2S_exp3(:,2),'--', 'Color',color_ctrls(2,:));
%         REF_sed_H2S_exp4(:,1)+years_SPIN,REF_sed_H2S_exp4(:,2),'--', 'Color',color_ctrls(3,:));
%         REF_sed_H2S_exp5(:,1)+years_SPIN,REF_sed_H2S_exp5(:,2),'--', 'Color',color_ctrls(4,:));
%      	REF_sed_H2S_exp6(:,1)+years_SPIN,REF_sed_H2S_exp6(:,2),'r--')
%     ylabel('H_2S (mol)');
end
% set(gca,'xticklabel',{[]})
xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 


% benthic O2
subplot(3, 2, 4)
    plot(REF_sed_O2_exp1(:,1),REF_sed_O2_exp1(:,5)*1e+6,'k'); hold on;
plot(REF_sed_O2_exp2(:,1)+years_SPIN,REF_sed_O2_exp2(:,5)*1e+6,'--', 'Color',color_ctrls(1,:));
plot(REF_sed_O2_exp3(:,1)+years_SPIN,REF_sed_O2_exp3(:,5)*1e+6,'--', 'Color',color_ctrls(2,:));
plot(REF_sed_O2_exp4(:,1)+years_SPIN,REF_sed_O2_exp4(:,5)*1e+6,'--', 'Color',color_ctrls(3,:));
plot(REF_sed_O2_exp5(:,1)+years_SPIN,REF_sed_O2_exp5(:,5)*1e+6,'--', 'Color',color_ctrls(4,:));
plot(REF_sed_O2_exp6(:,1)+years_SPIN,REF_sed_O2_exp6(:,5)*1e+6,'r--');
plot(REF_sed_O2_exp7(:,1)+years_SPIN,REF_sed_O2_exp7(:,5)*1e+6,'b--');
plot(REF_sed_O2_exp8(:,1)+years_SPIN,REF_sed_O2_exp8(:,5)*1e+6,'m-.');
plot(REF_sed_O2_exp9(:,1)+years_SPIN,REF_sed_O2_exp9(:,5)*1e+6,'c:'); 
     ylabel({'ben. O_2'; '(\mumol kg^{-1})'});
xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 



subplot(3,2,5)
if(plot_mean)  % mean (mol/kg)
    plot(REF_sed_ALK_exp1(:,1),REF_sed_ALK_exp1(:,3)*1e+6,'k'); hold on;
plot(REF_sed_ALK_exp2(:,1)+years_SPIN,REF_sed_ALK_exp2(:,3)*1e+6,'--', 'Color',color_ctrls(1,:));
plot(REF_sed_ALK_exp3(:,1)+years_SPIN,REF_sed_ALK_exp3(:,3)*1e+6,'--', 'Color',color_ctrls(2,:));
plot(REF_sed_ALK_exp4(:,1)+years_SPIN,REF_sed_ALK_exp4(:,3)*1e+6,'--', 'Color',color_ctrls(3,:));
plot(REF_sed_ALK_exp5(:,1)+years_SPIN,REF_sed_ALK_exp5(:,3)*1e+6,'--', 'Color',color_ctrls(4,:));
plot(REF_sed_ALK_exp6(:,1)+years_SPIN,REF_sed_ALK_exp6(:,3)*1e+6,'r--');
plot(REF_sed_ALK_exp7(:,1)+years_SPIN,REF_sed_ALK_exp7(:,3)*1e+6,'b--');
plot(REF_sed_ALK_exp8(:,1)+years_SPIN,REF_sed_ALK_exp8(:,3)*1e+6,'m-.');
plot(REF_sed_ALK_exp9(:,1)+years_SPIN,REF_sed_ALK_exp9(:,3)*1e+6,'c:'); 
         ylabel({'ALK'; '(\mumol kg^{-1})'});
%       ylabel('(\mumol kg^{-1})');
else
% 	plot(REF_sed_ALK_exp1(:,1),REF_sed_ALK_exp1(:,2),'k',...
%         REF_sed_ALK_exp2(:,1)+years_SPIN,REF_sed_ALK_exp2(:,2),'--', 'Color',color_ctrls(1,:),...
%         REF_sed_ALK_exp3(:,1)+years_SPIN,REF_sed_ALK_exp3(:,2),'--', 'Color',color_ctrls(2,:),...
%         REF_sed_ALK_exp4(:,1)+years_SPIN,REF_sed_ALK_exp4(:,2),'--', 'Color',color_ctrls(3,:));
%         REF_sed_ALK_exp5(:,1)+years_SPIN,REF_sed_ALK_exp5(:,2),'--', 'Color',color_ctrls(4,:),...
%         REF_sed_ALK_exp6(:,1)+years_SPIN,REF_sed_ALK_exp6(:,2),'r--')
%      ylabel('ALK (mol)');
end
% xlabel('Time since end of spin-up (ka)');
xlabel('Time');
xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 

subplot(3,2,6)
if(plot_mean)  % mean (mol/kg)
    plot(REF_sed_DIC_exp1(:,1),REF_sed_DIC_exp1(:,3)*1e+6,'k'); hold on;
plot(REF_sed_DIC_exp2(:,1)+years_SPIN,REF_sed_DIC_exp2(:,3)*1e+6,'--', 'Color',color_ctrls(1,:));
plot(REF_sed_DIC_exp3(:,1)+years_SPIN,REF_sed_DIC_exp3(:,3)*1e+6,'--', 'Color',color_ctrls(2,:));
plot(REF_sed_DIC_exp4(:,1)+years_SPIN,REF_sed_DIC_exp4(:,3)*1e+6,'--', 'Color',color_ctrls(3,:));
plot(REF_sed_DIC_exp5(:,1)+years_SPIN,REF_sed_DIC_exp5(:,3)*1e+6,'--', 'Color',color_ctrls(4,:));
plot(REF_sed_DIC_exp6(:,1)+years_SPIN,REF_sed_DIC_exp6(:,3)*1e+6,'r--');
plot(REF_sed_DIC_exp7(:,1)+years_SPIN,REF_sed_DIC_exp7(:,3)*1e+6,'b--');
plot(REF_sed_DIC_exp8(:,1)+years_SPIN,REF_sed_DIC_exp8(:,3)*1e+6,'m-.');
plot(REF_sed_DIC_exp9(:,1)+years_SPIN,REF_sed_DIC_exp9(:,3)*1e+6,'c:'); 
         ylabel({'DIC'; '(\mumol kg^{-1})'});
%        ylabel('(\mumol kg^{-1})');
else
% 	plot(REF_sed_DIC_exp1(:,1),REF_sed_DIC_exp1(:,2),'k',...
%         REF_sed_DIC_exp2(:,1)+years_SPIN,REF_sed_DIC_exp2(:,2),'--', 'Color',color_ctrls(1,:));
%         REF_sed_DIC_exp3(:,1)+years_SPIN,REF_sed_DIC_exp3(:,2),'--', 'Color',color_ctrls(2,:),...
%         REF_sed_DIC_exp4(:,1)+years_SPIN,REF_sed_DIC_exp4(:,2),'--', 'Color',color_ctrls(3,:),...
%         REF_sed_DIC_exp5(:,1)+years_SPIN,REF_sed_DIC_exp5(:,2),'--', 'Color',color_ctrls(4,:),...
%         REF_sed_DIC_exp6(:,1)+years_SPIN,REF_sed_DIC_exp6(:,2),'r--')
%     ylabel('DIC (mol)');
end
% xlabel('Time since end of spin-up (ka)');
xlabel('Time');
xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 


if(plot_mean)  % mean (mol/kg)
    print(fig3,'-depsc', ['PLOTS/' FILENAME '_3Biochem']);
else
    print(fig3, '-depsc', ['PLOTS/' FILENAME '_3Biochem_Total']);
end

end



