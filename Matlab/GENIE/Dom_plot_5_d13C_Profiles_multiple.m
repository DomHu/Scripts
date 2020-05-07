
% create single profiles




%% delta 13C


if(false)
%% Model #4
% 1.0xPO4
FOLDER = 'model4/'; 
exp1 = '0310_201_config_p0251b.1.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink_sulfE6';
exp2 = '0310_202_config_p0251b.5.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink_sulfE6';
exp3 = '0310_203_config_p0251b.10.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink_sulfE6';
exp4 = '0310_204_config_p0251b.15.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink_sulfE6';
exp5 = '0310_205_config_p0251b.20.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink_sulfE6';


% plot DIC_d13C
plot_fields_biogem_3d_i(strcat(FOLDER,exp1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp1))
plot_fields_biogem_3d_i(strcat(FOLDER,exp2),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp2))
plot_fields_biogem_3d_i(strcat(FOLDER,exp3),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp3))
plot_fields_biogem_3d_i(strcat(FOLDER,exp4),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp4))
plot_fields_biogem_3d_i(strcat(FOLDER,exp5),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp5))

% plot profiles in one
FOLDER = 'd13Cprofiles/';
Dom_plot_5_d13C_Profiles(strcat('PLOTS/',FOLDER,exp1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp2,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp3,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp4,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp5,'.PROFILE.200507.res'), strcat('PLOTS/',FOLDER,'Model4_1.0xPO4_d13C_EastTethys_1000m'))


% 1.5x PO4
FOLDER = 'model4/';
exp1 = '0310_206_config_p0251b.1.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep80m_sink_sulfE6';
plot_fields_biogem_3d_i(strcat(FOLDER,exp1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp1))
exp2 = '0310_207_config_p0251b.5.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep80m_sink_sulfE6';
plot_fields_biogem_3d_i(strcat(FOLDER,exp2),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp2))
exp3 = '0310_208_config_p0251b.10.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep80m_sink_sulfE6';
plot_fields_biogem_3d_i(strcat(FOLDER,exp3),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp3))
exp4 = '0310_209_config_p0251b.15.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep80m_sink_sulfE6';
plot_fields_biogem_3d_i(strcat(FOLDER,exp4),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp4))
exp5 = '0310_210_config_p0251b.20.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep80m_sink_sulfE6';
plot_fields_biogem_3d_i(strcat(FOLDER,exp5),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp5))

% plot profiles in one
FOLDER = 'd13Cprofiles/';
Dom_plot_5_d13C_Profiles(strcat('PLOTS/',FOLDER,exp1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp2,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp3,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp4,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp5,'.PROFILE.200507.res'), strcat('PLOTS/',FOLDER,'Model4_1.5xPO4_d13C_EastTethys_1000m'))


% % 2.0x PO4
FOLDER = 'model4/';
exp1 = '0310_211_config_p0251b.1.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink_sulfE6';
plot_fields_biogem_3d_i(strcat(FOLDER,exp1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp1))
exp2 = '0310_212_config_p0251b.5.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink_sulfE6';
plot_fields_biogem_3d_i(strcat(FOLDER,exp2),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp2))
exp3 = '0310_213_config_p0251b.10.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink_sulfE6';
plot_fields_biogem_3d_i(strcat(FOLDER,exp3),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp3))
exp4 = '0310_214_config_p0251b.15.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink_sulfE6';
plot_fields_biogem_3d_i(strcat(FOLDER,exp4),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp4))
exp5 = '0310_215_config_p0251b.20.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink_sulfE6';
plot_fields_biogem_3d_i(strcat(FOLDER,exp5),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp5))

% plot profiles in one
FOLDER = 'd13Cprofiles/';
Dom_plot_5_d13C_Profiles(strcat('PLOTS/',FOLDER,exp1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp2,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp3,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp4,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp5,'.PROFILE.200507.res'), strcat('PLOTS/',FOLDER,'Model4_2.0xPO4_d13C_EastTethys_1000m'))


%% Model #3
% 1xPO4
FOLDER = 'model3/';
exp1 = '0310_101_config_p0251b.1.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink';
plot_fields_biogem_3d_i(strcat(FOLDER,exp1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp1))
exp2 = '0310_102_config_p0251b.5.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink';
plot_fields_biogem_3d_i(strcat(FOLDER,exp2),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp2))
exp3 = '0310_103_config_p0251b.10.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink';
plot_fields_biogem_3d_i(strcat(FOLDER,exp3),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp3))
exp4 = '0310_104_config_p0251b.15.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink';
plot_fields_biogem_3d_i(strcat(FOLDER,exp4),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp4))
exp5 = '0310_105_config_p0251b.20.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink';
plot_fields_biogem_3d_i(strcat(FOLDER,exp5),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp5))

% plot profiles in one
%
FOLDER = 'd13Cprofiles/';
Dom_plot_5_d13C_Profiles(strcat('PLOTS/',FOLDER,exp1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp2,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp3,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp4,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp5,'.PROFILE.200507.res'), strcat('PLOTS/',FOLDER,'Model3_1.0xPO4_d13C_EastTethys_1000m'))

% 1.5xPO4
FOLDER = 'model3/';
exp1 = '0310_106_config_p0251b.1.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep80m_sink';
plot_fields_biogem_3d_i(strcat(FOLDER,exp1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp1))
exp2 = '0310_107_config_p0251b.5.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep80m_sink';
plot_fields_biogem_3d_i(strcat(FOLDER,exp2),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp2))
exp3 = '0310_108_config_p0251b.10.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep80m_sink';
plot_fields_biogem_3d_i(strcat(FOLDER,exp3),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp3))
exp4 = '0310_109_config_p0251b.15.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep80m_sink';
plot_fields_biogem_3d_i(strcat(FOLDER,exp4),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp4))
exp5 = '0310_110_config_p0251b.20.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep80m_sink';
plot_fields_biogem_3d_i(strcat(FOLDER,exp5),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp5))

% plot profiles in one
%
FOLDER = 'd13Cprofiles/';
Dom_plot_5_d13C_Profiles(strcat('PLOTS/',FOLDER,exp1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp2,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp3,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp4,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp5,'.PROFILE.200507.res'), strcat('PLOTS/',FOLDER,'Model3_1.5xPO4_d13C_EastTethys_1000m'))


% 2.0xPO4
FOLDER = 'model3/';
exp1 = '0310_111_config_p0251b.1.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink';
plot_fields_biogem_3d_i(strcat(FOLDER,exp1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp1))
exp2 = '0310_112_config_p0251b.5.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink';
plot_fields_biogem_3d_i(strcat(FOLDER,exp2),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp2))
exp3 = '0310_113_config_p0251b.10.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink';
plot_fields_biogem_3d_i(strcat(FOLDER,exp3),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp3))
exp4 = '0310_114_config_p0251b.15.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink';
plot_fields_biogem_3d_i(strcat(FOLDER,exp4),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp4))
exp5 = '0310_115_config_p0251b.20.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink';
plot_fields_biogem_3d_i(strcat(FOLDER,exp5),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp5))

% plot profiles in one
%
FOLDER = 'd13Cprofiles/';
Dom_plot_5_d13C_Profiles(strcat('PLOTS/',FOLDER,exp1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp2,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp3,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp4,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp5,'.PROFILE.200507.res'), strcat('PLOTS/',FOLDER,'Model3_2.0xPO4_d13C_EastTethys_1000m'))




%% Model #2
% 1.0 x PO4
FOLDER = 'model2/';
exp1 = '0310_01_config_p0251b.1.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep';
plot_fields_biogem_3d_i(strcat(FOLDER,exp1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp1))
exp2 = '0310_02_config_p0251b.5.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep';
plot_fields_biogem_3d_i(strcat(FOLDER,exp2),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp2))
exp3 = '0310_03_config_p0251b.10.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep';
plot_fields_biogem_3d_i(strcat(FOLDER,exp3),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp3))
exp4 = '0310_04_config_p0251b.15.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep';
plot_fields_biogem_3d_i(strcat(FOLDER,exp4),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp4))
exp5 = '0310_05_config_p0251b.20.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep';
plot_fields_biogem_3d_i(strcat(FOLDER,exp5),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp5))

% plot profiles in one
%
FOLDER = 'd13Cprofiles/';
Dom_plot_5_d13C_Profiles(strcat('PLOTS/',FOLDER,exp1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp2,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp3,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp4,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp5,'.PROFILE.200507.res'), strcat('PLOTS/',FOLDER,'Model2_1.0xPO4_d13C_EastTethys_1000m'))


% 1.5 x PO4
FOLDER = 'model2/';
exp1 = '0310_06_config_p0251b.1.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep';
plot_fields_biogem_3d_i(strcat(FOLDER,exp1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp1))
exp2 = '0310_07_config_p0251b.5.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep';
plot_fields_biogem_3d_i(strcat(FOLDER,exp2),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp2))
exp3 = '0310_08_config_p0251b.10.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep';
plot_fields_biogem_3d_i(strcat(FOLDER,exp3),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp3))
exp4 = '0310_09_config_p0251b.15.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep';
plot_fields_biogem_3d_i(strcat(FOLDER,exp4),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp4))
exp5 = '0310_10_config_p0251b.20.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep';
plot_fields_biogem_3d_i(strcat(FOLDER,exp5),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp5))

% plot profiles in one
%
FOLDER = 'd13Cprofiles/';
Dom_plot_5_d13C_Profiles(strcat('PLOTS/',FOLDER,exp1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp2,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp3,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp4,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp5,'.PROFILE.200507.res'), strcat('PLOTS/',FOLDER,'Model2_1.5xPO4_d13C_EastTethys_1000m'))


% 2.0 x PO4
FOLDER = 'model2/';
exp1 = '0310_11_config_p0251b.1.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep';
plot_fields_biogem_3d_i(strcat(FOLDER,exp1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp1))
exp2 = '0310_12_config_p0251b.5.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep';
plot_fields_biogem_3d_i(strcat(FOLDER,exp2),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp2))
exp3 = '0310_13_config_p0251b.10.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep';
plot_fields_biogem_3d_i(strcat(FOLDER,exp3),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp3))
exp4 = '0310_14_config_p0251b.15.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep';
plot_fields_biogem_3d_i(strcat(FOLDER,exp4),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp4))
exp5 = '0310_15_config_p0251b.20.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep';
plot_fields_biogem_3d_i(strcat(FOLDER,exp5),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp5))

% plot profiles in one
%
FOLDER = 'd13Cprofiles/';
Dom_plot_5_d13C_Profiles(strcat('PLOTS/',FOLDER,exp1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp2,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp3,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp4,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp5,'.PROFILE.200507.res'), strcat('PLOTS/',FOLDER,'Model2_2.0xPO4_d13C_EastTethys_1000m'))



%% Model #1
% 1x PO4
FOLDER = 'model1/';
exp1 = '0410_01_config_p0251b.1.0CO2_1.0PO4Fe.SPIN_nosulf';
exp2 = '0410_02_config_p0251b.5.0CO2_1.0PO4Fe.SPIN_nosulf';
exp3 = '0410_03_config_p0251b.10.0CO2_1.0PO4Fe.SPIN_nosulf';
exp4 = '0410_04_config_p0251b.15.0CO2_1.0PO4Fe.SPIN_nosulf';
exp5 = '0410_05_config_p0251b.20.0CO2_1.0PO4Fe.SPIN_nosulf';

plot_fields_biogem_3d_i(strcat(FOLDER,exp1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp1))
plot_fields_biogem_3d_i(strcat(FOLDER,exp2),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp2))
plot_fields_biogem_3d_i(strcat(FOLDER,exp3),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp3))
plot_fields_biogem_3d_i(strcat(FOLDER,exp4),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp4))
plot_fields_biogem_3d_i(strcat(FOLDER,exp5),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp5))

% plot profiles in one
FOLDER = 'd13Cprofiles/';
Dom_plot_5_d13C_Profiles(strcat('PLOTS/',FOLDER,exp1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp2,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp3,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp4,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp5,'.PROFILE.200507.res'), strcat('PLOTS/',FOLDER,'Model1_1.0xPO4_d13C_EastTethys_1000m'))

% 1.5x PO4
FOLDER = 'model1/';
exp1 = '0410_06_config_p0251b.1.0CO2_1.5PO4Fe.SPIN_nosulf';
plot_fields_biogem_3d_i(strcat(FOLDER,exp1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp1))
exp2 = '0410_07_config_p0251b.5.0CO2_1.5PO4Fe.SPIN_nosulf';
plot_fields_biogem_3d_i(strcat(FOLDER,exp2),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp2))
exp3 = '0410_08_config_p0251b.10.0CO2_1.5PO4Fe.SPIN_nosulf';
plot_fields_biogem_3d_i(strcat(FOLDER,exp3),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp3))
exp4 = '0410_09_config_p0251b.15.0CO2_1.5PO4Fe.SPIN_nosulf';
plot_fields_biogem_3d_i(strcat(FOLDER,exp4),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp4))
exp5 = '0410_10_config_p0251b.20.0CO2_1.5PO4Fe.SPIN_nosulf';
plot_fields_biogem_3d_i(strcat(FOLDER,exp5),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp5))

% plot profiles in one

FOLDER = 'd13Cprofiles/';
Dom_plot_5_d13C_Profiles(strcat('PLOTS/',FOLDER,exp1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp2,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp3,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp4,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp5,'.PROFILE.200507.res'), strcat('PLOTS/',FOLDER,'Model1_1.5xPO4_d13C_EastTethys_1000m'))


% 2.0x PO4
FOLDER = 'model1/';
exp1 = '0410_11_config_p0251b.1.0CO2_2.0PO4Fe.SPIN_nosulf';
plot_fields_biogem_3d_i(strcat(FOLDER,exp1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp1))
exp2 = '0410_12_config_p0251b.5.0CO2_2.0PO4Fe.SPIN_nosulf';
plot_fields_biogem_3d_i(strcat(FOLDER,exp2),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp2))
exp3 = '0410_13_config_p0251b.10.0CO2_2.0PO4Fe.SPIN_nosulf';
plot_fields_biogem_3d_i(strcat(FOLDER,exp3),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp3))
exp4 = '0410_14_config_p0251b.15.0CO2_2.0PO4Fe.SPIN_nosulf';
plot_fields_biogem_3d_i(strcat(FOLDER,exp4),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp4))
exp5 = '0410_15_config_p0251b.20.0CO2_2.0PO4Fe.SPIN_nosulf';
plot_fields_biogem_3d_i(strcat(FOLDER,exp5),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp5))

% plot profiles in one
FOLDER = 'd13Cprofiles/';
Dom_plot_5_d13C_Profiles(strcat('PLOTS/',FOLDER,exp1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp2,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp3,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp4,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp5,'.PROFILE.200507.res'), strcat('PLOTS/',FOLDER,'Model1_2.0xPO4_d13C_EastTethys_1000m'))


end
