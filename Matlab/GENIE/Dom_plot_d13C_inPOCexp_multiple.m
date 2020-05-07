
%% delta 13C in export production flux
% just done for Model 1 and 4 as not much change is happening

%% load the d13C in POCexp from .dat files and plot against temperature'
%
% exp1 = '0310_201';
% exp2 = '0310_202';
% exp3 = '0310_203';
% exp4 = '0310_204';
% exp5 = '0310_205';

%% 1xPO4
% Model 1
exp1_M1 = '0410_01';
exp2_M1 = '0410_02';
exp3_M1 = '0410_03';
exp4_M1 = '0410_04';
exp5_M1 = '0410_05';

d13CPOC_exp1_M1 = load(fullfile('PLOTS/d13C_POCexp/Model1',exp1_M1),'ascii');
d13CPOC_exp2_M1 = load(fullfile('PLOTS/d13C_POCexp/Model1',exp2_M1),'ascii');
d13CPOC_exp3_M1 = load(fullfile('PLOTS/d13C_POCexp/Model1',exp3_M1),'ascii');
d13CPOC_exp4_M1 = load(fullfile('PLOTS/d13C_POCexp/Model1',exp4_M1),'ascii');
d13CPOC_exp5_M1 = load(fullfile('PLOTS/d13C_POCexp/Model1',exp5_M1),'ascii');

Mean_d13C_exp1_M1 = mean(d13CPOC_exp1_M1(:,5));
Mean_d13C_exp2_M1 = mean(d13CPOC_exp2_M1(:,5));
Mean_d13C_exp3_M1 = mean(d13CPOC_exp3_M1(:,5));
Mean_d13C_exp4_M1 = mean(d13CPOC_exp4_M1(:,5));
Mean_d13C_exp5_M1 = mean(d13CPOC_exp5_M1(:,5));
Mean_d13C_M1_2P = [Mean_d13C_exp1_M1 Mean_d13C_exp2_M1 Mean_d13C_exp3_M1 Mean_d13C_exp4_M1 Mean_d13C_exp5_M1 ];

%% Model 4
exp1_M4 = '0310_201';
exp2_M4 = '0310_202';
exp3_M4 = '0310_203';
exp4_M4 = '0310_204';
exp5_M4 = '0310_205';

d13CPOC_exp1_M4 = load(fullfile('PLOTS/d13C_POCexp/Model4',exp1_M4),'ascii');
d13CPOC_exp2_M4 = load(fullfile('PLOTS/d13C_POCexp/Model4',exp2_M4),'ascii');
d13CPOC_exp3_M4 = load(fullfile('PLOTS/d13C_POCexp/Model4',exp3_M4),'ascii');
d13CPOC_exp4_M4 = load(fullfile('PLOTS/d13C_POCexp/Model4',exp4_M4),'ascii');
d13CPOC_exp5_M4 = load(fullfile('PLOTS/d13C_POCexp/Model4',exp5_M4),'ascii');

Mean_d13C_exp1_M4 = mean(d13CPOC_exp1_M4(:,5));
Mean_d13C_exp2_M4 = mean(d13CPOC_exp2_M4(:,5));
Mean_d13C_exp3_M4 = mean(d13CPOC_exp3_M4(:,5));
Mean_d13C_exp4_M4 = mean(d13CPOC_exp4_M4(:,5));
Mean_d13C_exp5_M4 = mean(d13CPOC_exp5_M4(:,5));
Mean_d13C_M4_2P = [Mean_d13C_exp1_M4 Mean_d13C_exp2_M4 Mean_d13C_exp3_M4 Mean_d13C_exp4_M4 Mean_d13C_exp5_M4 ];

% %
temp= [22.7 28.4 30.8 32.3 33.3];

figure;
hold on
plot(temp,Mean_d13C_M1_2P, 'ko', ...
    temp, Mean_d13C_M4_2P,'ro'); 
hold off
xlabel('SST (^\circ C)');
ylabel(['\delta^{13}C - POC_{exp}(',char(8240),')'])
title('1 \times PO_4')
hleg=legend('Imposed model #1', 'Dynamic model #4'); 
box on
print('-depsc', 'd13C_POCexp_1xPO4');



%% 2xPO4
% Model 1
exp1_M1 = '0410_11';
exp2_M1 = '0410_12';
exp3_M1 = '0410_13';
exp4_M1 = '0410_14';
exp5_M1 = '0410_15';

d13CPOC_exp1_M1 = load(fullfile('PLOTS/d13C_POCexp/Model1',exp1_M1),'ascii');
d13CPOC_exp2_M1 = load(fullfile('PLOTS/d13C_POCexp/Model1',exp2_M1),'ascii');
d13CPOC_exp3_M1 = load(fullfile('PLOTS/d13C_POCexp/Model1',exp3_M1),'ascii');
d13CPOC_exp4_M1 = load(fullfile('PLOTS/d13C_POCexp/Model1',exp4_M1),'ascii');
d13CPOC_exp5_M1 = load(fullfile('PLOTS/d13C_POCexp/Model1',exp5_M1),'ascii');

Mean_d13C_exp1_M1 = mean(d13CPOC_exp1_M1(:,5));
Mean_d13C_exp2_M1 = mean(d13CPOC_exp2_M1(:,5));
Mean_d13C_exp3_M1 = mean(d13CPOC_exp3_M1(:,5));
Mean_d13C_exp4_M1 = mean(d13CPOC_exp4_M1(:,5));
Mean_d13C_exp5_M1 = mean(d13CPOC_exp5_M1(:,5));
Mean_d13C_M1_2P = [Mean_d13C_exp1_M1 Mean_d13C_exp2_M1 Mean_d13C_exp3_M1 Mean_d13C_exp4_M1 Mean_d13C_exp5_M1 ];

%% Model 4
exp1_M4 = '0310_211';
exp2_M4 = '0310_212';
exp3_M4 = '0310_213';
exp4_M4 = '0310_214';
exp5_M4 = '0310_215';

d13CPOC_exp1_M4 = load(fullfile('PLOTS/d13C_POCexp/Model4',exp1_M4),'ascii');
d13CPOC_exp2_M4 = load(fullfile('PLOTS/d13C_POCexp/Model4',exp2_M4),'ascii');
d13CPOC_exp3_M4 = load(fullfile('PLOTS/d13C_POCexp/Model4',exp3_M4),'ascii');
d13CPOC_exp4_M4 = load(fullfile('PLOTS/d13C_POCexp/Model4',exp4_M4),'ascii');
d13CPOC_exp5_M4 = load(fullfile('PLOTS/d13C_POCexp/Model4',exp5_M4),'ascii');

Mean_d13C_exp1_M4 = mean(d13CPOC_exp1_M4(:,5));
Mean_d13C_exp2_M4 = mean(d13CPOC_exp2_M4(:,5));
Mean_d13C_exp3_M4 = mean(d13CPOC_exp3_M4(:,5));
Mean_d13C_exp4_M4 = mean(d13CPOC_exp4_M4(:,5));
Mean_d13C_exp5_M4 = mean(d13CPOC_exp5_M4(:,5));
Mean_d13C_M4_2P = [Mean_d13C_exp1_M4 Mean_d13C_exp2_M4 Mean_d13C_exp3_M4 Mean_d13C_exp4_M4 Mean_d13C_exp5_M4 ];

% %
temp= [22.7 28.4 30.8 32.3 33.3];

figure;
hold on
plot(temp,Mean_d13C_M1_2P, 'ko', ...
    temp, Mean_d13C_M4_2P,'ro'); 
hold off
xlabel('SST (^\circ C)');
ylabel(['\delta^{13}C - POC_{exp}(',char(8240),')'])
title('2 \times PO_4')
hleg=legend('Imposed model #1', 'Dynamic model #4'); 
box on
print('-depsc', 'd13C_POCexp_2xPO4');


if(false)
    %% Model #1
    % 1x PO4
    exp1_M1 = '0410_01_config_p0251b.1.0CO2_1.0PO4Fe.SPIN_nosulf';
    exp2_M1 = '0410_02_config_p0251b.5.0CO2_1.0PO4Fe.SPIN_nosulf';
    exp3_M1 = '0410_03_config_p0251b.10.0CO2_1.0PO4Fe.SPIN_nosulf';
    exp4_M1 = '0410_04_config_p0251b.15.0CO2_1.0PO4Fe.SPIN_nosulf';
    exp1_5 = '0410_05_config_p0251b.20.0CO2_1.0PO4Fe.SPIN_nosulf';
    % plot d13C in POCexp
    plot_fields_biogem_2d(exp1_M1,'','bio_export_POC_13C','',9999.5,-1,15,'',1,-32,-20,10,'Sites_East_Tethys.dat','','')
    plot_fields_biogem_2d(exp2_M1,'','bio_export_POC_13C','',9999.5,-1,15,'',1,-32,-20,10,'Sites_East_Tethys.dat','','')
    plot_fields_biogem_2d(exp3_M1,'','bio_export_POC_13C','',9999.5,-1,15,'',1,-32,-20,10,'Sites_East_Tethys.dat','','')
    plot_fields_biogem_2d(exp4_M1,'','bio_export_POC_13C','',9999.5,-1,15,'',1,-32,-20,10,'Sites_East_Tethys.dat','','')
    plot_fields_biogem_2d(exp1_5,'','bio_export_POC_13C','',9999.5,-1,15,'',1,-32,-20,10,'Sites_East_Tethys.dat','','')
    
    % 1.5x PO4
    exp1_M1 = '0410_06_config_p0251b.1.0CO2_1.5PO4Fe.SPIN_nosulf';
    exp2_M1 = '0410_07_config_p0251b.5.0CO2_1.5PO4Fe.SPIN_nosulf';
    exp3_M1 = '0410_08_config_p0251b.10.0CO2_1.5PO4Fe.SPIN_nosulf';
    exp4_M1 = '0410_09_config_p0251b.15.0CO2_1.5PO4Fe.SPIN_nosulf';
    exp1_5 = '0410_10_config_p0251b.20.0CO2_1.5PO4Fe.SPIN_nosulf';
    % plot d13C in POCexp
    plot_fields_biogem_2d(exp1_M1,'','bio_export_POC_13C','',9999.5,-1,15,'',1,-32,-20,10,'Sites_East_Tethys.dat','','')
    plot_fields_biogem_2d(exp2_M1,'','bio_export_POC_13C','',9999.5,-1,15,'',1,-32,-20,10,'Sites_East_Tethys.dat','','')
    plot_fields_biogem_2d(exp3_M1,'','bio_export_POC_13C','',9999.5,-1,15,'',1,-32,-20,10,'Sites_East_Tethys.dat','','')
    plot_fields_biogem_2d(exp4_M1,'','bio_export_POC_13C','',9999.5,-1,15,'',1,-32,-20,10,'Sites_East_Tethys.dat','','')
    plot_fields_biogem_2d(exp1_5,'','bio_export_POC_13C','',9999.5,-1,15,'',1,-32,-20,10,'Sites_East_Tethys.dat','','')
    
    % 2.0x PO4
    exp1_M1 = '0410_11_config_p0251b.1.0CO2_2.0PO4Fe.SPIN_nosulf';
    exp2_M1 = '0410_12_config_p0251b.5.0CO2_2.0PO4Fe.SPIN_nosulf';
    exp3_M1 = '0410_13_config_p0251b.10.0CO2_2.0PO4Fe.SPIN_nosulf';
    exp4_M1 = '0410_14_config_p0251b.15.0CO2_2.0PO4Fe.SPIN_nosulf';
    exp1_5 = '0410_15_config_p0251b.20.0CO2_2.0PO4Fe.SPIN_nosulf';
    % plot d13C in POCexp
    plot_fields_biogem_2d(exp1_M1,'','bio_export_POC_13C','',9999.5,-1,15,'',1,-32,-20,10,'Sites_East_Tethys.dat','','')
    plot_fields_biogem_2d(exp2_M1,'','bio_export_POC_13C','',9999.5,-1,15,'',1,-32,-20,10,'Sites_East_Tethys.dat','','')
    plot_fields_biogem_2d(exp3_M1,'','bio_export_POC_13C','',9999.5,-1,15,'',1,-32,-20,10,'Sites_East_Tethys.dat','','')
    plot_fields_biogem_2d(exp4_M1,'','bio_export_POC_13C','',9999.5,-1,15,'',1,-32,-20,10,'Sites_East_Tethys.dat','','')
    plot_fields_biogem_2d(exp1_5,'','bio_export_POC_13C','',9999.5,-1,15,'',1,-32,-20,10,'Sites_East_Tethys.dat','','')

%% Model #4
% 1.0xPO4
exp1_M1 = '0310_201_config_p0251b.1.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink_sulfE6';
exp2_M1 = '0310_202_config_p0251b.5.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink_sulfE6';
exp3_M1 = '0310_203_config_p0251b.10.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink_sulfE6';
exp4_M1 = '0310_204_config_p0251b.15.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink_sulfE6';
exp1_5 = '0310_205_config_p0251b.20.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink_sulfE6';

% plot d13C in POCexp
plot_fields_biogem_2d(exp1_M1,'','bio_export_POC_13C','',9999.5,-1,15,'',1,-32,-20,10,'Sites_East_Tethys.dat','','')
plot_fields_biogem_2d(exp2_M1,'','bio_export_POC_13C','',9999.5,-1,15,'',1,-32,-20,10,'Sites_East_Tethys.dat','','')
plot_fields_biogem_2d(exp3_M1,'','bio_export_POC_13C','',9999.5,-1,15,'',1,-32,-20,10,'Sites_East_Tethys.dat','','')
plot_fields_biogem_2d(exp4_M1,'','bio_export_POC_13C','',9999.5,-1,15,'',1,-32,-20,10,'Sites_East_Tethys.dat','','')
plot_fields_biogem_2d(exp1_5,'','bio_export_POC_13C','',9999.5,-1,15,'',1,-32,-20,10,'Sites_East_Tethys.dat','','')


% 1.5x PO4
exp1_M1 = '0310_206_config_p0251b.1.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep80m_sink_sulfE6';
exp2_M1 = '0310_207_config_p0251b.5.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep80m_sink_sulfE6';
exp3_M1 = '0310_208_config_p0251b.10.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep80m_sink_sulfE6';
exp4_M1 = '0310_209_config_p0251b.15.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep80m_sink_sulfE6';
exp1_5 = '0310_210_config_p0251b.20.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep80m_sink_sulfE6';
% plot d13C in POCexp
plot_fields_biogem_2d(exp1_M1,'','bio_export_POC_13C','',9999.5,-1,15,'',1,-32,-20,10,'Sites_East_Tethys.dat','','')
plot_fields_biogem_2d(exp2_M1,'','bio_export_POC_13C','',9999.5,-1,15,'',1,-32,-20,10,'Sites_East_Tethys.dat','','')
plot_fields_biogem_2d(exp3_M1,'','bio_export_POC_13C','',9999.5,-1,15,'',1,-32,-20,10,'Sites_East_Tethys.dat','','')
plot_fields_biogem_2d(exp4_M1,'','bio_export_POC_13C','',9999.5,-1,15,'',1,-32,-20,10,'Sites_East_Tethys.dat','','')
plot_fields_biogem_2d(exp1_5,'','bio_export_POC_13C','',9999.5,-1,15,'',1,-32,-20,10,'Sites_East_Tethys.dat','','')

% % 2.0x PO4
exp1_M1 = '0310_211_config_p0251b.1.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink_sulfE6';
exp2_M1 = '0310_212_config_p0251b.5.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink_sulfE6';
exp3_M1 = '0310_213_config_p0251b.10.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink_sulfE6';
exp4_M1 = '0310_214_config_p0251b.15.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink_sulfE6';
exp1_5 = '0310_215_config_p0251b.20.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink_sulfE6';
% plot d13C in POCexp
plot_fields_biogem_2d(exp1_M1,'','bio_export_POC_13C','',9999.5,-1,15,'',1,-32,-20,10,'Sites_East_Tethys.dat','','')
plot_fields_biogem_2d(exp2_M1,'','bio_export_POC_13C','',9999.5,-1,15,'',1,-32,-20,10,'Sites_East_Tethys.dat','','')
plot_fields_biogem_2d(exp3_M1,'','bio_export_POC_13C','',9999.5,-1,15,'',1,-32,-20,10,'Sites_East_Tethys.dat','','')
plot_fields_biogem_2d(exp4_M1,'','bio_export_POC_13C','',9999.5,-1,15,'',1,-32,-20,10,'Sites_East_Tethys.dat','','')
plot_fields_biogem_2d(exp1_5,'','bio_export_POC_13C','',9999.5,-1,15,'',1,-32,-20,10,'Sites_East_Tethys.dat','','')


    
    %% Model #3
    % 1xPO4
    FOLDER = 'model3/';
    exp1_M1 = '0310_101_config_p0251b.1.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp1_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp1_M1))
    exp2_M1 = '0310_102_config_p0251b.5.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp2_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp2_M1))
    exp3_M1 = '0310_103_config_p0251b.10.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp3_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp3_M1))
    exp4_M1 = '0310_104_config_p0251b.15.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp4_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp4_M1))
    exp1_5 = '0310_105_config_p0251b.20.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp1_5),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp1_5))
    
    % plot profiles in one
    %
    FOLDER = 'd13Cprofiles/';
    Dom_plot_5_d13C_Profiles(strcat('PLOTS/',FOLDER,exp1_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp2_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp3_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp4_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp1_5,'.PROFILE.200507.res'), strcat('PLOTS/',FOLDER,'Model3_1.0xPO4_d13C_EastTethys_1000m'))
    
    % 1.5xPO4
    FOLDER = 'model3/';
    exp1_M1 = '0310_106_config_p0251b.1.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep80m_sink';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp1_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp1_M1))
    exp2_M1 = '0310_107_config_p0251b.5.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep80m_sink';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp2_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp2_M1))
    exp3_M1 = '0310_108_config_p0251b.10.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep80m_sink';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp3_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp3_M1))
    exp4_M1 = '0310_109_config_p0251b.15.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep80m_sink';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp4_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp4_M1))
    exp1_5 = '0310_110_config_p0251b.20.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep80m_sink';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp1_5),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp1_5))
    
    % plot profiles in one
    %
    FOLDER = 'd13Cprofiles/';
    Dom_plot_5_d13C_Profiles(strcat('PLOTS/',FOLDER,exp1_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp2_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp3_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp4_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp1_5,'.PROFILE.200507.res'), strcat('PLOTS/',FOLDER,'Model3_1.5xPO4_d13C_EastTethys_1000m'))
    
    
    % 2.0xPO4
    FOLDER = 'model3/';
    exp1_M1 = '0310_111_config_p0251b.1.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp1_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp1_M1))
    exp2_M1 = '0310_112_config_p0251b.5.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp2_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp2_M1))
    exp3_M1 = '0310_113_config_p0251b.10.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp3_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp3_M1))
    exp4_M1 = '0310_114_config_p0251b.15.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp4_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp4_M1))
    exp1_5 = '0310_115_config_p0251b.20.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp1_5),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp1_5))
    
    % plot profiles in one
    %
    FOLDER = 'd13Cprofiles/';
    Dom_plot_5_d13C_Profiles(strcat('PLOTS/',FOLDER,exp1_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp2_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp3_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp4_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp1_5,'.PROFILE.200507.res'), strcat('PLOTS/',FOLDER,'Model3_2.0xPO4_d13C_EastTethys_1000m'))
    
    
    
    
    %% Model #2
    % 1.0 x PO4
    FOLDER = 'model2/';
    exp1_M1 = '0310_01_config_p0251b.1.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp1_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp1_M1))
    exp2_M1 = '0310_02_config_p0251b.5.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp2_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp2_M1))
    exp3_M1 = '0310_03_config_p0251b.10.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp3_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp3_M1))
    exp4_M1 = '0310_04_config_p0251b.15.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp4_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp4_M1))
    exp1_5 = '0310_05_config_p0251b.20.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp1_5),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp1_5))
    
    % plot profiles in one
    %
    FOLDER = 'd13Cprofiles/';
    Dom_plot_5_d13C_Profiles(strcat('PLOTS/',FOLDER,exp1_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp2_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp3_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp4_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp1_5,'.PROFILE.200507.res'), strcat('PLOTS/',FOLDER,'Model2_1.0xPO4_d13C_EastTethys_1000m'))
    
    
    % 1.5 x PO4
    FOLDER = 'model2/';
    exp1_M1 = '0310_06_config_p0251b.1.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp1_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp1_M1))
    exp2_M1 = '0310_07_config_p0251b.5.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp2_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp2_M1))
    exp3_M1 = '0310_08_config_p0251b.10.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp3_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp3_M1))
    exp4_M1 = '0310_09_config_p0251b.15.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp4_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp4_M1))
    exp1_5 = '0310_10_config_p0251b.20.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp1_5),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp1_5))
    
    % plot profiles in one
    %
    FOLDER = 'd13Cprofiles/';
    Dom_plot_5_d13C_Profiles(strcat('PLOTS/',FOLDER,exp1_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp2_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp3_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp4_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp1_5,'.PROFILE.200507.res'), strcat('PLOTS/',FOLDER,'Model2_1.5xPO4_d13C_EastTethys_1000m'))
    
    
    % 2.0 x PO4
    FOLDER = 'model2/';
    exp1_M1 = '0310_11_config_p0251b.1.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp1_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp1_M1))
    exp2_M1 = '0310_12_config_p0251b.5.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp2_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp2_M1))
    exp3_M1 = '0310_13_config_p0251b.10.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp3_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp3_M1))
    exp4_M1 = '0310_14_config_p0251b.15.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp4_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp4_M1))
    exp1_5 = '0310_15_config_p0251b.20.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp1_5),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp1_5))
    
    % plot profiles in one
    %
    FOLDER = 'd13Cprofiles/';
    Dom_plot_5_d13C_Profiles(strcat('PLOTS/',FOLDER,exp1_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp2_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp3_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp4_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp1_5,'.PROFILE.200507.res'), strcat('PLOTS/',FOLDER,'Model2_2.0xPO4_d13C_EastTethys_1000m'))
    
    
    
    %% Model #1
    % 1x PO4
    FOLDER = 'model1/';
    exp1_M1 = '0410_01_config_p0251b.1.0CO2_1.0PO4Fe.SPIN_nosulf';
    exp2_M1 = '0410_02_config_p0251b.5.0CO2_1.0PO4Fe.SPIN_nosulf';
    exp3_M1 = '0410_03_config_p0251b.10.0CO2_1.0PO4Fe.SPIN_nosulf';
    exp4_M1 = '0410_04_config_p0251b.15.0CO2_1.0PO4Fe.SPIN_nosulf';
    exp1_5 = '0410_05_config_p0251b.20.0CO2_1.0PO4Fe.SPIN_nosulf';
    
    plot_fields_biogem_3d_i(strcat(FOLDER,exp1_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp1_M1))
    plot_fields_biogem_3d_i(strcat(FOLDER,exp2_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp2_M1))
    plot_fields_biogem_3d_i(strcat(FOLDER,exp3_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp3_M1))
    plot_fields_biogem_3d_i(strcat(FOLDER,exp4_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp4_M1))
    plot_fields_biogem_3d_i(strcat(FOLDER,exp1_5),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp1_5))
    
    % plot profiles in one
    FOLDER = 'd13Cprofiles/';
    Dom_plot_5_d13C_Profiles(strcat('PLOTS/',FOLDER,exp1_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp2_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp3_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp4_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp1_5,'.PROFILE.200507.res'), strcat('PLOTS/',FOLDER,'Model1_1.0xPO4_d13C_EastTethys_1000m'))
    
    % 1.5x PO4
    FOLDER = 'model1/';
    exp1_M1 = '0410_06_config_p0251b.1.0CO2_1.5PO4Fe.SPIN_nosulf';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp1_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp1_M1))
    exp2_M1 = '0410_07_config_p0251b.5.0CO2_1.5PO4Fe.SPIN_nosulf';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp2_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp2_M1))
    exp3_M1 = '0410_08_config_p0251b.10.0CO2_1.5PO4Fe.SPIN_nosulf';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp3_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp3_M1))
    exp4_M1 = '0410_09_config_p0251b.15.0CO2_1.5PO4Fe.SPIN_nosulf';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp4_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp4_M1))
    exp1_5 = '0410_10_config_p0251b.20.0CO2_1.5PO4Fe.SPIN_nosulf';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp1_5),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp1_5))
    
    % plot profiles in one
    
    FOLDER = 'd13Cprofiles/';
    Dom_plot_5_d13C_Profiles(strcat('PLOTS/',FOLDER,exp1_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp2_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp3_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp4_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp1_5,'.PROFILE.200507.res'), strcat('PLOTS/',FOLDER,'Model1_1.5xPO4_d13C_EastTethys_1000m'))
    
    
    % 2.0x PO4
    FOLDER = 'model1/';
    exp1_M1 = '0410_11_config_p0251b.1.0CO2_2.0PO4Fe.SPIN_nosulf';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp1_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp1_M1))
    exp2_M1 = '0410_12_config_p0251b.5.0CO2_2.0PO4Fe.SPIN_nosulf';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp2_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp2_M1))
    exp3_M1 = '0410_13_config_p0251b.10.0CO2_2.0PO4Fe.SPIN_nosulf';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp3_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp3_M1))
    exp4_M1 = '0410_14_config_p0251b.15.0CO2_2.0PO4Fe.SPIN_nosulf';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp4_M1),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp4_M1))
    exp1_5 = '0410_15_config_p0251b.20.0CO2_2.0PO4Fe.SPIN_nosulf';
    plot_fields_biogem_3d_i(strcat(FOLDER,exp1_5),'','ocn_DIC_13C','',9999.5,-1,1,'0_endPermian_grid_mask_EastTethys_paleotemp.csv',1.0,-5.0,2.0,10,'','',strcat('PLOTS/d13Cprofiles/',exp1_5))
    
    % plot profiles in one
    FOLDER = 'd13Cprofiles/';
    Dom_plot_5_d13C_Profiles(strcat('PLOTS/',FOLDER,exp1_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp2_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp3_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp4_M1,'.PROFILE.200507.res'),strcat('PLOTS/',FOLDER,exp1_5,'.PROFILE.200507.res'), strcat('PLOTS/',FOLDER,'Model1_2.0xPO4_d13C_EastTethys_1000m'))
    
    
end
