function [] = plot_time_series_subplots_1SPIN_5Exps(PFolderExps, PNAME_SPIN, PNAME_OPEN1, PNAME_OPEN2, PNAME_OPEN3, PNAME_OPEN4, PNAME_OPEN5, FILENAME)
% old fun call with 6 experiments stated explicitly
% function [] = plot_time_series_subplots_1SPIN_5Exps(PEXP_SPIN, PEXP1_OPEN, PEXP2_OPEN, PEXP3_OPEN, PEXP4_OPEN, PEXP5_OPEN, PNAME_SPIN, PNAME_OPEN1, PNAME_OPEN2, PNAME_OPEN3, PNAME_OPEN4, PNAME_OPEN5, PNAME_OPEN6, FILENAME)

% PFolderExps: folder name with congigs of experiments to plot. They need
% to be in cgenie_output

% plot time-series
%clear all;

%  plot mean (true) or total (false)
plot_mean = true;

set_ylim = false;

%  set SPIN experiment years
years_SPIN = 300000;
years_SPIN_plot = 200000;

% set experiment 
% get file names in folder configs:
a=dir([ PFolderExps '/*']);
b={a.name};

higher_Corg_burial = false;
Exps_to_plot = 3; % 1 = CTRL, 2 = Emission w fixed Corg-weather; 3 = Emission w Tmp-dep weather

if(higher_Corg_burial)
    % SPIN
    PEXP_SPIN = '2904_01_fkl_ep21_1C1P1O_allFeedb_forc_atm_fixCorgweather';
    % % 0907 experiments: higher Corg burial
    % files in folder:
    %  4 -  8: CTRL
    %  9 - 13: Emission with fixed Corg-weather
    % 14 - 18: Emission with Tmp-dep Corg-weather
    PEXP1_OPEN = b{4};   % 1st and 2nd entry is . and ..
    PEXP2_OPEN = b{5};
    PEXP3_OPEN = b{6};
    PEXP4_OPEN = b{7};
    PEXP5_OPEN = b{8};
else
    % SPIN
    PEXP_SPIN = '2907_02_ALL_FB_restart';
    % % 0208 experiments: lower Corg burial
    % files in folder:
    %  3 -  7: CTRL
    %  8 - 12: Emission with fixed Corg-weather
    % 13 - 17: Emission with Tmp-dep Corg-weather
    switch Exps_to_plot
        case 1      % CTRL Exps
        	PEXP1_OPEN = b{3};   % 1st and 2nd entry is . and ..
            PEXP2_OPEN = b{4};
            PEXP3_OPEN = b{5};
            PEXP4_OPEN = b{6};
            PEXP5_OPEN = b{7};            
        case 2      % Emission w fixed Corg-weather
           	PEXP1_OPEN = b{8};   % 1st and 2nd entry is . and ..
            PEXP2_OPEN = b{9};
            PEXP3_OPEN = b{10};
            PEXP4_OPEN = b{11};
            PEXP5_OPEN = b{12};           
        case 3      % Emission w Tmp-dep weather                      
            PEXP1_OPEN = b{13};   % 1st and 2nd entry is . and ..
            PEXP2_OPEN = b{14};
            PEXP3_OPEN = b{15};
            PEXP4_OPEN = b{16};
            PEXP5_OPEN = b{17};
    end

end

% % old Experiments
% % 1805 CTRL experiments
% PEXP1_OPEN = b{3};   % 1st and 2nd entry is . and ..
% PEXP2_OPEN = b{7};
% PEXP3_OPEN = b{9};
% PEXP4_OPEN = b{11};
% PEXP5_OPEN = b{13};

% % 3006 + 1805 CTRL experiments in folder "output_FINAL_1805_0107"
% PEXP1_OPEN = b{4};   % 1st and 2nd entry is . and ..
% PEXP2_OPEN = b{6};
% PEXP3_OPEN = b{8};
% PEXP4_OPEN = b{10};
% PEXP5_OPEN = b{12};

% For Emission exps:
% PEXP1_OPEN = b{7};   % 1st and 2nd entry is . and ..
% PEXP2_OPEN = b{4};
% PEXP3_OPEN = b{8};
% PEXP4_OPEN = b{10};
% PEXP5_OPEN = b{12};


exp_SPIN = ['./cgenie_output/' PEXP_SPIN];   
exp_1_OPEN = ['./' PFolderExps '/' PEXP1_OPEN];   
exp_2_OPEN = ['./' PFolderExps '/' PEXP2_OPEN];
exp_3_OPEN = ['./' PFolderExps '/' PEXP3_OPEN];
exp_4_OPEN = ['./' PFolderExps '/' PEXP4_OPEN];
exp_5_OPEN = ['./' PFolderExps '/' PEXP5_OPEN];

% %%%% load other data

%% overturning
REF_misc_opsi_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_misc_opsi.res'),'ascii');
REF_misc_opsi_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_misc_opsi.res'),'ascii');
REF_misc_opsi_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_misc_opsi.res'),'ascii');
REF_misc_opsi_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_misc_opsi.res'),'ascii');
REF_misc_opsi_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_misc_opsi.res'),'ascii');
REF_misc_opsi_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_misc_opsi.res'),'ascii');


REF_sed_O2_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_O2.res'),'ascii');
REF_sed_O2_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_O2.res'),'ascii');
REF_sed_O2_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_O2.res'),'ascii');
REF_sed_O2_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_ocn_O2.res'),'ascii');
REF_sed_O2_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_ocn_O2.res'),'ascii');
REF_sed_O2_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_ocn_O2.res'),'ascii');

REF_sed_SO4_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_SO4.res'),'ascii');
REF_sed_SO4_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_SO4.res'),'ascii');
REF_sed_SO4_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_SO4.res'),'ascii');
REF_sed_SO4_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_ocn_SO4.res'),'ascii');
REF_sed_SO4_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_ocn_SO4.res'),'ascii');
REF_sed_SO4_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_ocn_SO4.res'),'ascii');

REF_sed_H2S_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_H2S.res'),'ascii');
REF_sed_H2S_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_H2S.res'),'ascii');
REF_sed_H2S_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_H2S.res'),'ascii');
REF_sed_H2S_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_ocn_H2S.res'),'ascii');
REF_sed_H2S_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_ocn_H2S.res'),'ascii');
REF_sed_H2S_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_ocn_H2S.res'),'ascii');

REF_sed_PO4_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_PO4.res'),'ascii');
REF_sed_PO4_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_PO4.res'),'ascii');
REF_sed_PO4_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_PO4.res'),'ascii');
REF_sed_PO4_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_ocn_PO4.res'),'ascii');
REF_sed_PO4_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_ocn_PO4.res'),'ascii');
REF_sed_PO4_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_ocn_PO4.res'),'ascii');

REF_sed_ALK_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_ALK.res'),'ascii');
REF_sed_ALK_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_ALK.res'),'ascii');
REF_sed_ALK_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_ALK.res'),'ascii');
REF_sed_ALK_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_ocn_ALK.res'),'ascii');
REF_sed_ALK_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_ocn_ALK.res'),'ascii');
REF_sed_ALK_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_ocn_ALK.res'),'ascii');

REF_sed_DIC_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_DIC.res'),'ascii');
REF_sed_DIC_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_DIC.res'),'ascii');
REF_sed_DIC_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_DIC.res'),'ascii');
REF_sed_DIC_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_ocn_DIC.res'),'ascii');
REF_sed_DIC_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_ocn_DIC.res'),'ascii');
REF_sed_DIC_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_ocn_DIC.res'),'ascii');

REF_sed_DIC_13C_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_DIC_13C.res'),'ascii');
REF_sed_DIC_13C_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_DIC_13C.res'),'ascii');
REF_sed_DIC_13C_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_DIC_13C.res'),'ascii');
REF_sed_DIC_13C_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_ocn_DIC_13C.res'),'ascii');
REF_sed_DIC_13C_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_ocn_DIC_13C.res'),'ascii');
REF_sed_DIC_13C_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_ocn_DIC_13C.res'),'ascii');

REF_sed_pCO2_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_atm_pCO2.res'),'ascii');
REF_sed_pCO2_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_atm_pCO2.res'),'ascii');
REF_sed_pCO2_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_atm_pCO2.res'),'ascii');
REF_sed_pCO2_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_atm_pCO2.res'),'ascii');
REF_sed_pCO2_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_atm_pCO2.res'),'ascii');
REF_sed_pCO2_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_atm_pCO2.res'),'ascii');

REF_sed_pO2_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_atm_pO2.res'),'ascii');
REF_sed_pO2_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_atm_pO2.res'),'ascii');
REF_sed_pO2_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_atm_pO2.res'),'ascii');
REF_sed_pO2_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_atm_pO2.res'),'ascii');
REF_sed_pO2_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_atm_pO2.res'),'ascii');
REF_sed_pO2_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_atm_pO2.res'),'ascii');

% atm temp:
REF_atm_tmp_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_atm_temp.res'),'ascii');
REF_atm_tmp_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_atm_temp.res'),'ascii');
REF_atm_tmp_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_atm_temp.res'),'ascii');
REF_atm_tmp_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_atm_temp.res'),'ascii');
REF_atm_tmp_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_atm_temp.res'),'ascii');
REF_atm_tmp_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_atm_temp.res'),'ascii');

% ocn temp:
REF_ocn_tmp_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_temp.res'),'ascii');
REF_ocn_tmp_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_temp.res'),'ascii');
REF_ocn_tmp_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_temp.res'),'ascii');
REF_ocn_tmp_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_ocn_temp.res'),'ascii');
REF_ocn_tmp_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_ocn_temp.res'),'ascii');
REF_ocn_tmp_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_ocn_temp.res'),'ascii');

% POC export flux
REF_fexport_POC_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_fexport_POC.res'),'ascii');
REF_fexport_POC_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_fexport_POC.res'),'ascii');
REF_fexport_POC_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_fexport_POC.res'),'ascii');
REF_fexport_POC_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_fexport_POC.res'),'ascii');
REF_fexport_POC_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_fexport_POC.res'),'ascii');
REF_fexport_POC_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_fexport_POC.res'),'ascii');

% CaCO3 ocean - sediment
REF_focnsed_CaCO3_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_focnsed_CaCO3.res'),'ascii');
REF_focnsed_CaCO3_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_focnsed_CaCO3.res'),'ascii');
REF_focnsed_CaCO3_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_focnsed_CaCO3.res'),'ascii');
REF_focnsed_CaCO3_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_focnsed_CaCO3.res'),'ascii');
REF_focnsed_CaCO3_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_focnsed_CaCO3.res'),'ascii');
REF_focnsed_CaCO3_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_focnsed_CaCO3.res'),'ascii');

% mean CaCO3 wt%
REF_mean_CaCO3_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_sed_CaCO3.res'),'ascii');
REF_mean_CaCO3_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_sed_CaCO3.res'),'ascii');
REF_mean_CaCO3_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_sed_CaCO3.res'),'ascii');
REF_mean_CaCO3_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_sed_CaCO3.res'),'ascii');
REF_mean_CaCO3_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_sed_CaCO3.res'),'ascii');
REF_mean_CaCO3_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_sed_CaCO3.res'),'ascii');


%% input to calculate POC burial:
REF_focnsed_POC_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_focnsed_POC.res'),'ascii');
REF_focnsed_POC_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_focnsed_POC.res'),'ascii');
REF_focnsed_POC_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_focnsed_POC.res'),'ascii');
REF_focnsed_POC_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_focnsed_POC.res'),'ascii');
REF_focnsed_POC_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_focnsed_POC.res'),'ascii');
REF_focnsed_POC_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_focnsed_POC.res'),'ascii');


REF_fsedocn_DIC_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_fsedocn_DIC.res'),'ascii');
REF_fsedocn_DIC_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_fsedocn_DIC.res'),'ascii');
REF_fsedocn_DIC_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_fsedocn_DIC.res'),'ascii');
REF_fsedocn_DIC_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_fsedocn_DIC.res'),'ascii');
REF_fsedocn_DIC_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_fsedocn_DIC.res'),'ascii');
REF_fsedocn_DIC_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_fsedocn_DIC.res'),'ascii');


REF_fsedocn_Ca_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_fsedocn_Ca.res'),'ascii');
REF_fsedocn_Ca_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_fsedocn_Ca.res'),'ascii');
REF_fsedocn_Ca_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_fsedocn_Ca.res'),'ascii');
REF_fsedocn_Ca_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_fsedocn_Ca.res'),'ascii');
REF_fsedocn_Ca_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_fsedocn_Ca.res'),'ascii');
REF_fsedocn_Ca_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_fsedocn_Ca.res'),'ascii');

% calculate POC burial & convert from mol/yr to PgC/yr  (i.e. *12/10^15): 
REF_POC_burial_exp1 = REF_focnsed_POC_exp1;
REF_POC_burial_exp2 = REF_focnsed_POC_exp2;
REF_POC_burial_exp3 = REF_focnsed_POC_exp3;
REF_POC_burial_exp4 = REF_focnsed_POC_exp4;
REF_POC_burial_exp5 = REF_focnsed_POC_exp5;
REF_POC_burial_exp6 = REF_focnsed_POC_exp6;

REF_POC_burial_exp1(:,2) = (REF_focnsed_POC_exp1(:,2) - (REF_fsedocn_DIC_exp1(:,2)-REF_fsedocn_Ca_exp1(:,2))).*12.*1e-15;
REF_POC_burial_exp2(:,2) = (REF_focnsed_POC_exp2(:,2) - (REF_fsedocn_DIC_exp2(:,2)-REF_fsedocn_Ca_exp2(:,2))).*12.*1e-15;
REF_POC_burial_exp3(:,2) = (REF_focnsed_POC_exp3(:,2) - (REF_fsedocn_DIC_exp3(:,2)-REF_fsedocn_Ca_exp3(:,2))).*12.*1e-15;
REF_POC_burial_exp4(:,2) = (REF_focnsed_POC_exp4(:,2) - (REF_fsedocn_DIC_exp4(:,2)-REF_fsedocn_Ca_exp4(:,2))).*12.*1e-15;
REF_POC_burial_exp5(:,2) = (REF_focnsed_POC_exp5(:,2) - (REF_fsedocn_DIC_exp5(:,2)-REF_fsedocn_Ca_exp5(:,2))).*12.*1e-15;
REF_POC_burial_exp6(:,2) = (REF_focnsed_POC_exp6(:,2) - (REF_fsedocn_DIC_exp6(:,2)-REF_fsedocn_Ca_exp6(:,2))).*12.*1e-15;

% calculate C-burial in CaCO3 & convert from mol/yr to PgC/yr  (i.e. *12/10^15):
REF_CaCO3_burial_exp1 = REF_focnsed_CaCO3_exp1;
REF_CaCO3_burial_exp2 = REF_focnsed_CaCO3_exp2;
REF_CaCO3_burial_exp3 = REF_focnsed_CaCO3_exp3;
REF_CaCO3_burial_exp4 = REF_focnsed_CaCO3_exp4;
REF_CaCO3_burial_exp5 = REF_focnsed_CaCO3_exp5;
REF_CaCO3_burial_exp6 = REF_focnsed_CaCO3_exp6;

REF_CaCO3_burial_exp1(:,2) = (REF_focnsed_CaCO3_exp1(:,2)-REF_fsedocn_Ca_exp1(:,2)).*12.*1e-15;
REF_CaCO3_burial_exp2(:,2) = (REF_focnsed_CaCO3_exp2(:,2)-REF_fsedocn_Ca_exp2(:,2)).*12.*1e-15;
REF_CaCO3_burial_exp3(:,2) = (REF_focnsed_CaCO3_exp3(:,2)-REF_fsedocn_Ca_exp3(:,2)).*12.*1e-15;
REF_CaCO3_burial_exp4(:,2) = (REF_focnsed_CaCO3_exp4(:,2)-REF_fsedocn_Ca_exp4(:,2)).*12.*1e-15;
REF_CaCO3_burial_exp5(:,2) = (REF_focnsed_CaCO3_exp5(:,2)-REF_fsedocn_Ca_exp5(:,2)).*12.*1e-15;
REF_CaCO3_burial_exp6(:,2) = (REF_focnsed_CaCO3_exp6(:,2)-REF_fsedocn_Ca_exp6(:,2)).*12.*1e-15;

% PO4 weathering flux
REF_weather_PO4_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_diag_weather_PO4.res'),'ascii');
REF_weather_PO4_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_diag_weather_PO4.res'),'ascii');
REF_weather_PO4_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_diag_weather_PO4.res'),'ascii');
REF_weather_PO4_exp4 = load(fullfile(exp_3_OPEN,'/biogem/biogem_series_diag_weather_PO4.res'),'ascii');
REF_weather_PO4_exp5 = load(fullfile(exp_4_OPEN,'/biogem/biogem_series_diag_weather_PO4.res'),'ascii');
REF_weather_PO4_exp6 = load(fullfile(exp_5_OPEN,'/biogem/biogem_series_diag_weather_PO4.res'),'ascii');


% calculate length up experiments
time_exps = max([REF_misc_opsi_exp2(end,1), REF_misc_opsi_exp3(end,1),  REF_misc_opsi_exp4(end,1), REF_misc_opsi_exp5(end,1), REF_misc_opsi_exp6(end,1)]);
xaxis_lim = years_SPIN + time_exps;

%% split in three figures:

set(0,'defaultLineLineWidth', 2)
set(0,'DefaultAxesFontSize',10)

%%
fig1=figure;
grid on
hold on

% atm temp.
subplot(3, 2, 1)
plot(REF_atm_tmp_exp1(:,1),REF_atm_tmp_exp1(:,2),'k', ...
    REF_atm_tmp_exp2(:,1)+years_SPIN,REF_atm_tmp_exp2(:,2),'r--',  ...
    REF_atm_tmp_exp3(:,1)+years_SPIN,REF_atm_tmp_exp3(:,2),'g--', ...
     REF_atm_tmp_exp4(:,1)+years_SPIN,REF_atm_tmp_exp4(:,2),'b:',  ...
    REF_atm_tmp_exp5(:,1)+years_SPIN,REF_atm_tmp_exp5(:,2),'m:', ...
     REF_atm_tmp_exp6(:,1)+years_SPIN,REF_atm_tmp_exp6(:,2),'c:'); 
ylabel({'Mean air'; 'temp (°C)'});
xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
if(set_ylim)
    ylim([11.0 12.0]);
end

% atm. CO2
subplot(3, 2, 2)
plot(REF_sed_pCO2_exp1(:,1),REF_sed_pCO2_exp1(:,3)*1e+6,'k', ...
    REF_sed_pCO2_exp2(:,1)+years_SPIN,REF_sed_pCO2_exp2(:,3)*1e+6,'r--',  ...
    REF_sed_pCO2_exp3(:,1)+years_SPIN,REF_sed_pCO2_exp3(:,3)*1e+6,'g--', ...
     REF_sed_pCO2_exp4(:,1)+years_SPIN,REF_sed_pCO2_exp4(:,3)*1e+6,'b:',  ...
    REF_sed_pCO2_exp5(:,1)+years_SPIN,REF_sed_pCO2_exp5(:,3)*1e+6,'m:', ...
     REF_sed_pCO2_exp6(:,1)+years_SPIN,REF_sed_pCO2_exp6(:,3)*1e+6,'c:'); 
ylabel({'pCO2'; '(ppm)'});
xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
if(set_ylim)
    ylim([275 300]);
end

% global min overturning (Sv)4
subplot(3, 2, 3)
plot(REF_misc_opsi_exp1(:,1),REF_misc_opsi_exp1(:,2),'k', ...
    REF_misc_opsi_exp2(:,1)+years_SPIN,REF_misc_opsi_exp2(:,2),'r--',  ...
    REF_misc_opsi_exp3(:,1)+years_SPIN,REF_misc_opsi_exp3(:,2),'g--', ...
    REF_misc_opsi_exp4(:,1)+years_SPIN,REF_misc_opsi_exp4(:,2),'b:',  ...
    REF_misc_opsi_exp5(:,1)+years_SPIN,REF_misc_opsi_exp5(:,2),'m:',  ...
    REF_misc_opsi_exp6(:,1)+years_SPIN,REF_misc_opsi_exp6(:,2),'c:'); 
ylabel({'global min'; 'overturn (Sv)'});
xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
if(set_ylim)
    ylim([-45.7 -45.55]);
end

% atm. O2
subplot(3, 2, 4)
plot(REF_sed_pO2_exp1(:,1),REF_sed_pO2_exp1(:,3),'k', ...
    REF_sed_pO2_exp2(:,1)+years_SPIN,REF_sed_pO2_exp2(:,3),'r--',  ...
    REF_sed_pO2_exp3(:,1)+years_SPIN,REF_sed_pO2_exp3(:,3),'g--', ...
     REF_sed_pO2_exp4(:,1)+years_SPIN,REF_sed_pO2_exp4(:,3),'b:',  ...
    REF_sed_pO2_exp5(:,1)+years_SPIN,REF_sed_pO2_exp5(:,3),'m:', ...
     REF_sed_pO2_exp6(:,1)+years_SPIN,REF_sed_pO2_exp6(:,3),'c:'); 
ylabel({'pO2'; '(atm)'});
xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
% ylim([0.2 0.22])
hleg=legend(PNAME_SPIN, ...
    PNAME_OPEN1, ...
    PNAME_OPEN2, ...
    PNAME_OPEN3, ...
    PNAME_OPEN4, ...
    PNAME_OPEN5); 
set(hleg,'FontSize',8);
set(hleg,'Location','SouthEast');

txt = '(c)';
text(0.03,0.15,txt,'FontSize',12,'Units','normalized') 

% PO4
subplot(3,2,5)
if(plot_mean) % mean (mol/kg)
    plot(REF_sed_PO4_exp1(:,1),REF_sed_PO4_exp1(:,3)*1e+6,'k', ...
         REF_sed_PO4_exp2(:,1)+years_SPIN,REF_sed_PO4_exp2(:,3)*1e+6,'r--',  ...
         REF_sed_PO4_exp3(:,1)+years_SPIN,REF_sed_PO4_exp3(:,3)*1e+6,'g--', ...
         REF_sed_PO4_exp4(:,1)+years_SPIN,REF_sed_PO4_exp4(:,3)*1e+6,'b:',  ...
         REF_sed_PO4_exp5(:,1)+years_SPIN,REF_sed_PO4_exp5(:,3)*1e+6,'m:' ,  ...
         REF_sed_PO4_exp6(:,1)+years_SPIN,REF_sed_PO4_exp6(:,3)*1e+6,'c:'); 
         ylabel({'PO_4'; '(\mumol kg^{-1})'});
%        ylabel('(\mumol kg^{-1})');
else % total (mol)
    plot(REF_sed_PO4_exp1(:,1),REF_sed_PO4_exp1(:,2),'k',...
        REF_sed_PO4_exp2(:,1)+years_SPIN,REF_sed_PO4_exp2(:,2),'r--', ...
        REF_sed_PO4_exp3(:,1)+years_SPIN,REF_sed_PO4_exp3(:,2),'g--',...
        REF_sed_PO4_exp4(:,1)+years_SPIN,REF_sed_PO4_exp4(:,2),'b:', ...
        REF_sed_PO4_exp5(:,1)+years_SPIN,REF_sed_PO4_exp5(:,2),'m:', ...
     	REF_sed_PO4_exp6(:,1)+years_SPIN,REF_sed_PO4_exp6(:,2),'c:')
    ylabel('PO_4 (mol)');
end
% set(gca,'xticklabel',{[]})
xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 


subplot(3,2, 6)
plot(REF_sed_DIC_13C_exp1(:,1),REF_sed_DIC_13C_exp1(:,3),'k',  ...
    REF_sed_DIC_13C_exp2(:,1)+years_SPIN,REF_sed_DIC_13C_exp2(:,3),'r--',  ...
    REF_sed_DIC_13C_exp3(:,1)+years_SPIN,REF_sed_DIC_13C_exp3(:,3),'g--',  ...
    REF_sed_DIC_13C_exp4(:,1)+years_SPIN,REF_sed_DIC_13C_exp4(:,3),'b:',  ...
    REF_sed_DIC_13C_exp5(:,1)+years_SPIN,REF_sed_DIC_13C_exp5(:,3),'m:',  ...
    REF_sed_DIC_13C_exp6(:,1)+years_SPIN,REF_sed_DIC_13C_exp6(:,3),'c:'); 
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
plot(REF_fexport_POC_exp1(:,1),REF_fexport_POC_exp1(:,2)*12*1e-15,'k', ...
    REF_fexport_POC_exp2(:,1)+years_SPIN,REF_fexport_POC_exp2(:,2)*12*1e-15,'r--',  ...
    REF_fexport_POC_exp3(:,1)+years_SPIN,REF_fexport_POC_exp3(:,2)*12*1e-15,'g--',  ...
    REF_fexport_POC_exp4(:,1)+years_SPIN,REF_fexport_POC_exp4(:,2)*12*1e-15,'b:',  ...
    REF_fexport_POC_exp5(:,1)+years_SPIN,REF_fexport_POC_exp5(:,2)*12*1e-15,'m:',  ...
    REF_fexport_POC_exp6(:,1)+years_SPIN,REF_fexport_POC_exp6(:,2)*12*1e-15,'c:'); 
%xlabel('years ');
ylabel({'global POC'; 'export (PgC yr-1)'});
xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
if(set_ylim)
if(higher_Corg_burial)
    ylim([8.8 9.1])   % higher Corg burial
else
    ylim([9.4 9.65])    % lower Corg burial
end
end
% POC depositional flux
subplot(3, 2, 3)
    plot(REF_focnsed_POC_exp1(:,1),REF_focnsed_POC_exp1(:,2)*12*1e-15,'k', ...
         REF_focnsed_POC_exp2(:,1)+years_SPIN,REF_focnsed_POC_exp2(:,2)*12*1e-15,'r--', ...
         REF_focnsed_POC_exp3(:,1)+years_SPIN,REF_focnsed_POC_exp3(:,2)*12*1e-15,'g--', ...
         REF_focnsed_POC_exp4(:,1)+years_SPIN,REF_focnsed_POC_exp4(:,2)*12*1e-15,'b:', ...
         REF_focnsed_POC_exp5(:,1)+years_SPIN,REF_focnsed_POC_exp5(:,2)*12*1e-15,'m:', ...
         REF_focnsed_POC_exp6(:,1)+years_SPIN,REF_focnsed_POC_exp6(:,2)*12*1e-15,'c:'); 
        ylabel({'POC deposition'; '(PgC yr^{-1})'});
xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
if(set_ylim)
    ylim([1.1 1.6]);
end

subplot(3,2, 5)
plot(REF_POC_burial_exp1(:,1),REF_POC_burial_exp1(:,2),'k', ...
    REF_POC_burial_exp2(:,1)+years_SPIN,REF_POC_burial_exp2(:,2),'r--', ...
    REF_POC_burial_exp3(:,1)+years_SPIN,REF_POC_burial_exp3(:,2),'g--', ...
    REF_POC_burial_exp4(:,1)+years_SPIN,REF_POC_burial_exp4(:,2),'b:', ...
    REF_POC_burial_exp5(:,1)+years_SPIN,REF_POC_burial_exp5(:,2),'m:', ...
    REF_POC_burial_exp6(:,1)+years_SPIN,REF_POC_burial_exp6(:,2),'c:');
ylabel({'OM burial'; '(PgC yr^{-1})'});
xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
if(set_ylim)
    ylim([0.0 0.4]);
end

%%%%%%%%%%%%
%%%%%%%%%%%% CaCO3
%%%%%%%%%%%%

% mean CaCO3 wt%
subplot(3,2, 2)
plot(REF_mean_CaCO3_exp1(:,1),REF_mean_CaCO3_exp1(:,2),'k', ...
    REF_mean_CaCO3_exp2(:,1)+years_SPIN,REF_mean_CaCO3_exp2(:,2),'r--', ...
    REF_mean_CaCO3_exp3(:,1)+years_SPIN,REF_mean_CaCO3_exp3(:,2),'g--', ...
    REF_mean_CaCO3_exp4(:,1)+years_SPIN,REF_mean_CaCO3_exp4(:,2),'b:', ...
    REF_mean_CaCO3_exp5(:,1)+years_SPIN,REF_mean_CaCO3_exp5(:,2),'m:', ...
    REF_mean_CaCO3_exp6(:,1)+years_SPIN,REF_mean_CaCO3_exp6(:,2),'c:');
ylabel({'Mean CaCO_3'; '(wt%)'});
xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
if(set_ylim)
    ylim([21 26]);
end

% focnsed_CaCO3
subplot(3,2, 4)
    plot(REF_focnsed_CaCO3_exp1(:,1),REF_focnsed_CaCO3_exp1(:,2)*12*1e-15,'k', ...
         REF_focnsed_CaCO3_exp2(:,1)+years_SPIN,REF_focnsed_CaCO3_exp2(:,2)*12*1e-15,'r--', ...
         REF_focnsed_CaCO3_exp3(:,1)+years_SPIN,REF_focnsed_CaCO3_exp3(:,2)*12*1e-15,'g--', ...
         REF_focnsed_CaCO3_exp4(:,1)+years_SPIN,REF_focnsed_CaCO3_exp4(:,2)*12*1e-15,'b:', ...
         REF_focnsed_CaCO3_exp5(:,1)+years_SPIN,REF_focnsed_CaCO3_exp5(:,2)*12*1e-15,'m:', ...
         REF_focnsed_CaCO3_exp6(:,1)+years_SPIN,REF_focnsed_CaCO3_exp6(:,2)*12*1e-15,'c:'); 
        ylabel({'CaCO3 deposition'; '(PgC yr^{-1})'});
xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
if(set_ylim)
    ylim([1.04 1.12]);
end

subplot(3,2, 6)
plot(REF_CaCO3_burial_exp1(:,1),REF_CaCO3_burial_exp1(:,2),'k', ...
    REF_CaCO3_burial_exp2(:,1)+years_SPIN,REF_CaCO3_burial_exp2(:,2),'r--', ...
    REF_CaCO3_burial_exp3(:,1)+years_SPIN,REF_CaCO3_burial_exp3(:,2),'g--', ...
    REF_CaCO3_burial_exp4(:,1)+years_SPIN,REF_CaCO3_burial_exp4(:,2),'b:', ...
    REF_CaCO3_burial_exp5(:,1)+years_SPIN,REF_CaCO3_burial_exp5(:,2),'m:', ...
    REF_CaCO3_burial_exp6(:,1)+years_SPIN,REF_CaCO3_burial_exp6(:,2),'c:');
ylabel({'CaCO3 burial'; '(PgC yr^{-1})'});
xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
if(set_ylim)
    ylim([0 0.2]);
end
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
    plot(REF_sed_O2_exp1(:,1),REF_sed_O2_exp1(:,3)*1e+6,'k', ...
         REF_sed_O2_exp2(:,1)+years_SPIN,REF_sed_O2_exp2(:,3)*1e+6,'r--', ...
         REF_sed_O2_exp3(:,1)+years_SPIN,REF_sed_O2_exp3(:,3)*1e+6,'g--', ...
         REF_sed_O2_exp4(:,1)+years_SPIN,REF_sed_O2_exp4(:,3)*1e+6,'b:',  ...
         REF_sed_O2_exp5(:,1)+years_SPIN,REF_sed_O2_exp5(:,3)*1e+6,'m:',  ...
         REF_sed_O2_exp6(:,1)+years_SPIN,REF_sed_O2_exp6(:,3)*1e+6,'c:'); 
        ylabel({'O_2'; '(\mumol kg^{-1})'});
%        ylabel('(\mumol kg^{-1})');
else
    % total (mol)
    plot(REF_sed_O2_exp1(:,1),REF_sed_O2_exp1(:,2),'k', ...
         REF_sed_O2_exp2(:,1)+years_SPIN,REF_sed_O2_exp2(:,2),'r--', ...
         REF_sed_O2_exp3(:,1)+years_SPIN,REF_sed_O2_exp3(:,2),'g--', ...
         REF_sed_O2_exp4(:,1)+years_SPIN,REF_sed_O2_exp4(:,2),'b:', ...
         REF_sed_O2_exp5(:,1)+years_SPIN,REF_sed_O2_exp5(:,2),'m:', ...
         REF_sed_O2_exp6(:,1)+years_SPIN,REF_sed_O2_exp6(:,2),'c:')
     ylabel('O_2 (mol)');
end
xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
if(set_ylim)
    ylim([150 174]);
end

subplot(3,2,2)
if(plot_mean)  % mean (mol/kg)
	plot(REF_sed_SO4_exp1(:,1),REF_sed_SO4_exp1(:,3)*1e+6,'k', ...
         REF_sed_SO4_exp2(:,1)+years_SPIN,REF_sed_SO4_exp2(:,3)*1e+6,'r--', ...
         REF_sed_SO4_exp3(:,1)+years_SPIN,REF_sed_SO4_exp3(:,3)*1e+6,'g--', ...
         REF_sed_SO4_exp4(:,1)+years_SPIN,REF_sed_SO4_exp4(:,3)*1e+6,'b:',  ...
         REF_sed_SO4_exp5(:,1)+years_SPIN,REF_sed_SO4_exp5(:,3)*1e+6,'m:',  ...
         REF_sed_SO4_exp6(:,1)+years_SPIN,REF_sed_SO4_exp6(:,3)*1e+6,'c:'); 
         ylabel({'SO_4'; '(\mumol kg^{-1})'});
%        ylabel('(\mumol kg^{-1})');
else    % total (mol)
    plot(REF_sed_SO4_exp1(:,1),REF_sed_SO4_exp1(:,2),'k',...
        REF_sed_SO4_exp2(:,1)+years_SPIN,REF_sed_SO4_exp2(:,2),'r--',...
        REF_sed_SO4_exp3(:,1)+years_SPIN,REF_sed_SO4_exp3(:,2),'g--',...
        REF_sed_SO4_exp4(:,1)+years_SPIN,REF_sed_SO4_exp4(:,2),'b:', ...
        REF_sed_SO4_exp5(:,1)+years_SPIN,REF_sed_SO4_exp5(:,2),'m:',...
     	REF_sed_SO4_exp6(:,1)+years_SPIN,REF_sed_SO4_exp6(:,2),'c:')
    ylabel('SO_4 (mol)');
end
xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
if(set_ylim)
    ylim([1.4998E+4 1.502E+4]);
end

subplot(3,2,3)
if(plot_mean) % mean (mol/kg)
	plot(REF_sed_H2S_exp1(:,1),REF_sed_H2S_exp1(:,3)*1e+6,'k', ...
         REF_sed_H2S_exp2(:,1)+years_SPIN,REF_sed_H2S_exp2(:,3)*1e+6,'r--',  ...
         REF_sed_H2S_exp3(:,1)+years_SPIN,REF_sed_H2S_exp3(:,3)*1e+6,'g--', ...
         REF_sed_H2S_exp4(:,1)+years_SPIN,REF_sed_H2S_exp4(:,3)*1e+6,'b:',  ...
         REF_sed_H2S_exp5(:,1)+years_SPIN,REF_sed_H2S_exp5(:,3)*1e+6,'m:',  ...
         REF_sed_H2S_exp6(:,1)+years_SPIN,REF_sed_H2S_exp6(:,3)*1e+6,'c:');
         ylabel({'H_2S'; '(\mumol kg^{-1})'});
%        ylabel('(\mumol kg^{-1})');
else % total (mol)
    plot(REF_sed_H2S_exp1(:,1),REF_sed_H2S_exp1(:,2),'k',...
        REF_sed_H2S_exp2(:,1)+years_SPIN,REF_sed_H2S_exp2(:,2),'r--', ...
        REF_sed_H2S_exp3(:,1)+years_SPIN,REF_sed_H2S_exp3(:,2),'g--', ...
        REF_sed_H2S_exp4(:,1)+years_SPIN,REF_sed_H2S_exp4(:,2),'b:', ...
        REF_sed_H2S_exp5(:,1)+years_SPIN,REF_sed_H2S_exp5(:,2),'m:', ...
     	REF_sed_H2S_exp6(:,1)+years_SPIN,REF_sed_H2S_exp6(:,2),'c:')
    ylabel('H_2S (mol)');
end
% set(gca,'xticklabel',{[]})
xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
if(set_ylim)
    ylim([0 0.1]);
end

% benthic O2
subplot(3, 2, 4)
    plot(REF_sed_O2_exp1(:,1),REF_sed_O2_exp1(:,5)*1e+6,'k', ...
         REF_sed_O2_exp2(:,1)+years_SPIN,REF_sed_O2_exp2(:,5)*1e+6,'r--', ...
         REF_sed_O2_exp3(:,1)+years_SPIN,REF_sed_O2_exp3(:,5)*1e+6,'g--', ...
         REF_sed_O2_exp4(:,1)+years_SPIN,REF_sed_O2_exp4(:,5)*1e+6,'b:',  ...
         REF_sed_O2_exp5(:,1)+years_SPIN,REF_sed_O2_exp5(:,5)*1e+6,'m:',  ...
         REF_sed_O2_exp6(:,1)+years_SPIN,REF_sed_O2_exp6(:,5)*1e+6,'c:'); 
     ylabel({'ben. O_2'; '(\mumol kg^{-1})'});
xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
if(set_ylim)
    ylim([135 170]);
end


subplot(3,2,5)
if(plot_mean)  % mean (mol/kg)
    plot(REF_sed_ALK_exp1(:,1),REF_sed_ALK_exp1(:,3)*1e+6,'k', ...
         REF_sed_ALK_exp2(:,1)+years_SPIN,REF_sed_ALK_exp2(:,3)*1e+6,'r--',  ...
         REF_sed_ALK_exp3(:,1)+years_SPIN,REF_sed_ALK_exp3(:,3)*1e+6,'g--', ...
         REF_sed_ALK_exp4(:,1)+years_SPIN,REF_sed_ALK_exp4(:,3)*1e+6,'b:',  ...
         REF_sed_ALK_exp5(:,1)+years_SPIN,REF_sed_ALK_exp5(:,3)*1e+6,'m:',  ...
         REF_sed_ALK_exp6(:,1)+years_SPIN,REF_sed_ALK_exp6(:,3)*1e+6,'c:'); 
         ylabel({'ALK'; '(\mumol kg^{-1})'});
%       ylabel('(\mumol kg^{-1})');
else
	plot(REF_sed_ALK_exp1(:,1),REF_sed_ALK_exp1(:,2),'k',...
        REF_sed_ALK_exp2(:,1)+years_SPIN,REF_sed_ALK_exp2(:,2),'r--',...
        REF_sed_ALK_exp3(:,1)+years_SPIN,REF_sed_ALK_exp3(:,2),'g--',...
        REF_sed_ALK_exp4(:,1)+years_SPIN,REF_sed_ALK_exp4(:,2),'b:', ...
        REF_sed_ALK_exp5(:,1)+years_SPIN,REF_sed_ALK_exp5(:,2),'m:',...
        REF_sed_ALK_exp6(:,1)+years_SPIN,REF_sed_ALK_exp6(:,2),'c:')
     ylabel('ALK (mol)');
end
% xlabel('Time since end of spin-up (ka)');
xlabel('Time');
xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
if(set_ylim)
    ylim([1800 1900]);
end

subplot(3,2,6)
if(plot_mean)  % mean (mol/kg)
    plot(REF_sed_DIC_exp1(:,1),REF_sed_DIC_exp1(:,3)*1e+6,'k', ...
         REF_sed_DIC_exp2(:,1)+years_SPIN,REF_sed_DIC_exp2(:,3)*1e+6,'r--',  ...
         REF_sed_DIC_exp3(:,1)+years_SPIN,REF_sed_DIC_exp3(:,3)*1e+6,'g--', ...
         REF_sed_DIC_exp4(:,1)+years_SPIN,REF_sed_DIC_exp4(:,3)*1e+6,'b:',  ...
         REF_sed_DIC_exp5(:,1)+years_SPIN,REF_sed_DIC_exp5(:,3)*1e+6,'m:',  ...
         REF_sed_DIC_exp6(:,1)+years_SPIN,REF_sed_DIC_exp6(:,3)*1e+6,'c:'); 
         ylabel({'DIC'; '(\mumol kg^{-1})'});
%        ylabel('(\mumol kg^{-1})');
else
	plot(REF_sed_DIC_exp1(:,1),REF_sed_DIC_exp1(:,2),'k',...
        REF_sed_DIC_exp2(:,1)+years_SPIN,REF_sed_DIC_exp2(:,2),'r--', ...
        REF_sed_DIC_exp3(:,1)+years_SPIN,REF_sed_DIC_exp3(:,2),'g--',...
        REF_sed_DIC_exp4(:,1)+years_SPIN,REF_sed_DIC_exp4(:,2),'b:',...
        REF_sed_DIC_exp5(:,1)+years_SPIN,REF_sed_DIC_exp5(:,2),'m:',...
        REF_sed_DIC_exp6(:,1)+years_SPIN,REF_sed_DIC_exp6(:,2),'c:')
    ylabel('DIC (mol)');
end
% xlabel('Time since end of spin-up (ka)');
xlabel('Time');
xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
if(set_ylim)
    ylim([1750 1850]);
end

if(plot_mean)  % mean (mol/kg)
    print(fig3,'-depsc', ['PLOTS/' FILENAME '_3Biochem']);
else
    print(fig3, '-depsc', ['PLOTS/' FILENAME '_3Biochem_Total']);
end



%%
fig4=figure;
grid on
hold on

% PO4 weathering
subplot(3, 2, 1)
plot(REF_weather_PO4_exp1(:,1),REF_weather_PO4_exp1(:,2),'k', ...
    REF_weather_PO4_exp2(:,1)+years_SPIN,REF_weather_PO4_exp2(:,2),'r--',  ...
    REF_weather_PO4_exp3(:,1)+years_SPIN,REF_weather_PO4_exp3(:,2),'g--',  ...
    REF_weather_PO4_exp4(:,1)+years_SPIN,REF_weather_PO4_exp4(:,2),'b:',  ...
    REF_weather_PO4_exp5(:,1)+years_SPIN,REF_weather_PO4_exp5(:,2),'m:',  ...
    REF_weather_PO4_exp6(:,1)+years_SPIN,REF_weather_PO4_exp6(:,2),'c:');
ylabel({'PO_4 weathering'; '(mol yr-1)'});
xlim([years_SPIN-years_SPIN_plot xaxis_lim])


if(plot_mean)  % mean (mol/kg)
    print(fig4,'-depsc', ['PLOTS/' FILENAME '_4Weathering']);
else
    print(fig4, '-depsc', ['PLOTS/' FILENAME '_4Weathering_Total']);
end




