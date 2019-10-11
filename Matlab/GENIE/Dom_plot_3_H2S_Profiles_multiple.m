

%% delta 13C

% no sulfurization
% create single profiles

% 1xPO4
% 100m
plot_fields_biogem_3d_i('e_folding/1807_13_SULF_efold_config_p0251b.1.0PO4Fe.SPIN_nosulf_efold100','','ocn_DIC_13C','',19999.5,-1,1,'0_endPermian_grid_mask_EastPanth.csv',1.0,-5.0,2.0,10,'','','PLOTS/delta13C/1xPO4_elength100_d13C_EastPanth')
plot_fields_biogem_3d_i('e_folding/1807_13_SULF_efold_config_p0251b.1.0PO4Fe.SPIN_nosulf_efold100','','ocn_DIC_13C','',19999.5,-1,1,'0_endPermian_grid_mask_Tethys.csv',1.0,-5.0,2.0,10,'','','PLOTS/delta13C/1xPO4_elength100_d13C_Tethys')
% 200m
plot_fields_biogem_3d_i('e_folding/1203_07_SULF_efold_config_p0251b.1.0PO4Fe.SPIN_nosulf_efold200','','ocn_DIC_13C','',19999.5,-1,1,'0_endPermian_grid_mask_EastPanth.csv',1.0,-5.0,2.0,10,'','','PLOTS/delta13C/1xPO4_elength200_d13C_EastPanth')
plot_fields_biogem_3d_i('e_folding/1203_07_SULF_efold_config_p0251b.1.0PO4Fe.SPIN_nosulf_efold200','','ocn_DIC_13C','',19999.5,-1,1,'0_endPermian_grid_mask_Tethys.csv',1.0,-5.0,2.0,10,'','','PLOTS/delta13C/1xPO4_elength200_d13C_Tethys')
% 300m
plot_fields_biogem_3d_i('e_folding/1807_01_SULF_efold_config_p0251b.1.0PO4Fe.SPIN_nosulf_efold300','','ocn_DIC_13C','',19999.5,-1,1,'0_endPermian_grid_mask_EastPanth.csv',1.0,-5.0,2.0,10,'','','PLOTS/delta13C/1xPO4_elength300_d13C_EastPanth')
plot_fields_biogem_3d_i('e_folding/1807_01_SULF_efold_config_p0251b.1.0PO4Fe.SPIN_nosulf_efold300','','ocn_DIC_13C','',19999.5,-1,1,'0_endPermian_grid_mask_Tethys.csv',1.0,-5.0,2.0,10,'','','PLOTS/delta13C/1xPO4_elength300_d13C_Tethys')

% plot profiles in one
Dom_plot_3_H2S_Profiles('PLOTS/delta13C/1xPO4_elength100_d13C_EastPanth.PROFILE.190918.res','PLOTS/delta13C/1xPO4_elength200_d13C_EastPanth.PROFILE.190918.res','PLOTS/delta13C/1xPO4_elength300_d13C_EastPanth.PROFILE.190918.res','./PLOTS/delta13C/1xPO4_EastPanth_d13C_profiles_100200300')
Dom_plot_3_H2S_Profiles('PLOTS/delta13C/1xPO4_elength100_d13C_Tethys.PROFILE.190918.res','PLOTS/delta13C/1xPO4_elength200_d13C_Tethys.PROFILE.190918.res','PLOTS/delta13C/1xPO4_elength300_d13C_Tethys.PROFILE.190918.res','./PLOTS/delta13C/1xPO4_Tethys_d13C_profiles_100200300')


% % 2xPO4
% % 100m
% plot_fields_biogem_3d_i('1903_01_SULF_efold_config_p0251b.2.0PO4Fe.SPIN_nosulf_efold100','','ocn_DIC_13C','',19999.5,-1,1,'0_endPermian_grid_mask_EastPanth.csv',1.0,-5.0,2.0,10,'','','PLOTS/delta13C/2xPO4_elength100_d13C_EastPanth')
% plot_fields_biogem_3d_i('1903_01_SULF_efold_config_p0251b.2.0PO4Fe.SPIN_nosulf_efold100','','ocn_DIC_13C','',19999.5,-1,1,'0_endPermian_grid_mask_Tethys.csv',1.0,-5.0,2.0,10,'','','PLOTS/delta13C/2xPO4_elength100_d13C_Tethys')
% % 200m
% plot_fields_biogem_3d_i('1203_19_SULF_efold_config_p0251b.2.0PO4Fe.SPIN_nosulf_efold200','','ocn_DIC_13C','',19999.5,-1,1,'0_endPermian_grid_mask_EastPanth.csv',1.0,-5.0,2.0,10,'','','PLOTS/delta13C/2xPO4_elength200_d13C_EastPanth')
% plot_fields_biogem_3d_i('1203_19_SULF_efold_config_p0251b.2.0PO4Fe.SPIN_nosulf_efold200','','ocn_DIC_13C','',19999.5,-1,1,'0_endPermian_grid_mask_Tethys.csv',1.0,-5.0,2.0,10,'','','PLOTS/delta13C/2xPO4_elength200_d13C_Tethys')
% % 300m
% plot_fields_biogem_3d_i('1903_06_SULF_efold_config_p0251b.2.0PO4Fe.SPIN_nosulf_efold300','','ocn_DIC_13C','',19999.5,-1,1,'0_endPermian_grid_mask_EastPanth.csv',1.0,-5.0,2.0,10,'','','PLOTS/delta13C/2xPO4_elength300_d13C_EastPanth')
% plot_fields_biogem_3d_i('1903_06_SULF_efold_config_p0251b.2.0PO4Fe.SPIN_nosulf_efold300','','ocn_DIC_13C','',19999.5,-1,1,'0_endPermian_grid_mask_Tethys.csv',1.0,-5.0,2.0,10,'','','PLOTS/delta13C/2xPO4_elength300_d13C_Tethys')
% 
% % plot profiles in one
% Dom_plot_3_H2S_Profiles('PLOTS/delta13C/2xPO4_elength100_d13C_EastPanth.PROFILE.190918.res','PLOTS/delta13C/2xPO4_elength200_d13C_EastPanth.PROFILE.190918.res','PLOTS/delta13C/2xPO4_elength300_d13C_EastPanth.PROFILE.190918.res','./PLOTS/delta13C/2xPO4_EastPanth_d13C_profiles_100200300')
% Dom_plot_3_H2S_Profiles('PLOTS/delta13C/2xPO4_elength100_d13C_Tethys.PROFILE.190918.res','PLOTS/delta13C/2xPO4_elength200_d13C_Tethys.PROFILE.190918.res','PLOTS/delta13C/2xPO4_elength300_d13C_Tethys.PROFILE.190918.res','./PLOTS/delta13C/2xPO4_Tethys_d13C_profiles_100200300')

% 
% % 3xPO4
% % 100m
% plot_fields_biogem_3d_i('e_folding/1807_17_SULF_efold_config_p0251b.3.0PO4Fe.SPIN_nosulf_efold100','','ocn_DIC_13C','',19999.5,-1,1,'0_endPermian_grid_mask_EastPanth.csv',1.0,-5.0,2.0,10,'','','PLOTS/delta13C/3xPO4_elength100_d13C_EastPanth')
% plot_fields_biogem_3d_i('e_folding/1807_17_SULF_efold_config_p0251b.3.0PO4Fe.SPIN_nosulf_efold100','','ocn_DIC_13C','',19999.5,-1,1,'0_endPermian_grid_mask_Tethys.csv',1.0,-5.0,2.0,10,'','','PLOTS/delta13C/3xPO4_elength100_d13C_Tethys')
% % 200m
% plot_fields_biogem_3d_i('e_folding/1707_01_SULF_config_p0251b.3.0PO4Fe.SPIN_nosulf_efold200','','ocn_DIC_13C','',19999.5,-1,1,'0_endPermian_grid_mask_EastPanth.csv',1.0,-5.0,2.0,10,'','','PLOTS/delta13C/3xPO4_elength200_d13C_EastPanth')
% plot_fields_biogem_3d_i('e_folding/1707_01_SULF_config_p0251b.3.0PO4Fe.SPIN_nosulf_efold200','','ocn_DIC_13C','',19999.5,-1,1,'0_endPermian_grid_mask_Tethys.csv',1.0,-5.0,2.0,10,'','','PLOTS/delta13C/3xPO4_elength200_d13C_Tethys')
% % 300m
% plot_fields_biogem_3d_i('e_folding/1807_09_SULF_efold_config_p0251b.3.0PO4Fe.SPIN_nosulf_efold300','','ocn_DIC_13C','',19999.5,-1,1,'0_endPermian_grid_mask_EastPanth.csv',1.0,-5.0,2.0,10,'','','PLOTS/delta13C/3xPO4_elength300_d13C_EastPanth')
% plot_fields_biogem_3d_i('e_folding/1807_09_SULF_efold_config_p0251b.3.0PO4Fe.SPIN_nosulf_efold300','','ocn_DIC_13C','',19999.5,-1,1,'0_endPermian_grid_mask_Tethys.csv',1.0,-5.0,2.0,10,'','','PLOTS/delta13C/3xPO4_elength300_d13C_Tethys')
% 
% % plot profiles in one
% Dom_plot_3_H2S_Profiles('PLOTS/delta13C/3xPO4_elength100_d13C_EastPanth.PROFILE.190918.res','PLOTS/delta13C/3xPO4_elength200_d13C_EastPanth.PROFILE.190918.res','PLOTS/delta13C/3xPO4_elength300_d13C_EastPanth.PROFILE.190918.res','./PLOTS/delta13C/3xPO4_EastPanth_d13C_profiles_100200300')
% Dom_plot_3_H2S_Profiles('PLOTS/delta13C/3xPO4_elength100_d13C_Tethys.PROFILE.190918.res','PLOTS/delta13C/3xPO4_elength200_d13C_Tethys.PROFILE.190918.res','PLOTS/delta13C/3xPO4_elength300_d13C_Tethys.PROFILE.190918.res','./PLOTS/delta13C/3xPO4_Tethys_d13C_profiles_100200300')



%% 3xPO4 with sulfurization
if(false)
% 100m
% create single profiles
% ksulf=5
plot_fields_biogem_3d_i('e_folding/1807_18_SULF_efold_config_p0251b.3.0PO4Fe.SPIN_ksulf_E5_efold100','','ocn_H2S','',19999.5,-1,1,'0_endPermian_grid_mask_EastPanth.csv',1e-6,0,100,10,'','','./2307_PLOTS_H2Sprofiles/3xPO4_elength100_H2S_EastPanth_ksulf_5')
plot_fields_biogem_3d_i('e_folding/1807_18_SULF_efold_config_p0251b.3.0PO4Fe.SPIN_ksulf_E5_efold100','','ocn_H2S','',19999.5,-1,1,'0_endPermian_grid_mask_Tethys.csv',1e-6,0,100,10,'','','./2307_PLOTS_H2Sprofiles/3xPO4_elength100_H2S_Tethys_ksulf_5')
% ksulf=6
plot_fields_biogem_3d_i('e_folding/1807_19_SULF_efold_config_p0251b.3.0PO4Fe.SPIN_ksulf_E6_efold100','','ocn_H2S','',19999.5,-1,1,'0_endPermian_grid_mask_EastPanth.csv',1e-6,0,100,10,'','','./2307_PLOTS_H2Sprofiles/3xPO4_elength100_H2S_EastPanth_ksulf_6')
plot_fields_biogem_3d_i('e_folding/1807_19_SULF_efold_config_p0251b.3.0PO4Fe.SPIN_ksulf_E6_efold100','','ocn_H2S','',19999.5,-1,1,'0_endPermian_grid_mask_Tethys.csv',1e-6,0,100,10,'','','./2307_PLOTS_H2Sprofiles/3xPO4_elength100_H2S_Tethys_ksulf_6')
% ksulf=7
plot_fields_biogem_3d_i('e_folding/1807_20_SULF_efold_config_p0251b.3.0PO4Fe.SPIN_ksulf_E7_efold100','','ocn_H2S','',19999.5,-1,1,'0_endPermian_grid_mask_EastPanth.csv',1e-6,0,100,10,'','','./2307_PLOTS_H2Sprofiles/3xPO4_elength100_H2S_EastPanth_ksulf_7')
plot_fields_biogem_3d_i('e_folding/1807_20_SULF_efold_config_p0251b.3.0PO4Fe.SPIN_ksulf_E7_efold100','','ocn_H2S','',19999.5,-1,1,'0_endPermian_grid_mask_Tethys.csv',1e-6,0,100,10,'','','./2307_PLOTS_H2Sprofiles/3xPO4_elength100_H2S_Tethys_ksulf_7')


% Dom_plot_3_H2S_Profiles('2307_PLOTS_H2Sprofiles/3xPO4_elength100_H2S_EastPanth_nosulf.PROFILE.190723.res','2307_PLOTS_H2Sprofiles/3xPO4_elength200_H2S_EastPanth_nosulf.PROFILE.190723.res','2307_PLOTS_H2Sprofiles/3xPO4_elength300_H2S_EastPanth_nosulf.PROFILE.190723.res','./2307_PLOTS_H2Sprofiles/2307_3xPO4_EastPanth_H2S_profiles_60200300')
% Dom_plot_3_H2S_Profiles('2307_PLOTS_H2Sprofiles/3xPO4_elength100_H2S_Tethys_nosulf.PROFILE.190723.res','2307_PLOTS_H2Sprofiles/3xPO4_elength200_H2S_Tethys_nosulf.PROFILE.190723.res','2307_PLOTS_H2Sprofiles/3xPO4_elength300_H2S_Tethys_nosulf.PROFILE.190723.res','./2307_PLOTS_H2Sprofiles/2307_3xPO4_Tethys_H2S_profiles_60200300')


% 200m
% create single profiles
% ksulf=5
plot_fields_biogem_3d_i('e_folding/1707_02_SULF_config_p0251b.3.0PO4Fe.SPIN_nosulf_efold200_sulfE5','','ocn_H2S','',19999.5,-1,1,'0_endPermian_grid_mask_EastPanth.csv',1e-6,0,100,10,'','','./2307_PLOTS_H2Sprofiles/3xPO4_elength200_H2S_EastPanth_ksulf_5')
plot_fields_biogem_3d_i('e_folding/1707_02_SULF_config_p0251b.3.0PO4Fe.SPIN_nosulf_efold200_sulfE5','','ocn_H2S','',19999.5,-1,1,'0_endPermian_grid_mask_Tethys.csv',1e-6,0,100,10,'','','./2307_PLOTS_H2Sprofiles/3xPO4_elength200_H2S_Tethys_ksulf_5')
% ksulf=6
plot_fields_biogem_3d_i('e_folding/1707_03_SULF_config_p0251b.3.0PO4Fe.SPIN_nosulf_efold200_sulfE6','','ocn_H2S','',19999.5,-1,1,'0_endPermian_grid_mask_EastPanth.csv',1e-6,0,100,10,'','','./2307_PLOTS_H2Sprofiles/3xPO4_elength200_H2S_EastPanth_ksulf_6')
plot_fields_biogem_3d_i('e_folding/1707_03_SULF_config_p0251b.3.0PO4Fe.SPIN_nosulf_efold200_sulfE6','','ocn_H2S','',19999.5,-1,1,'0_endPermian_grid_mask_Tethys.csv',1e-6,0,100,10,'','','./2307_PLOTS_H2Sprofiles/3xPO4_elength200_H2S_Tethys_ksulf_6')
% ksulf=7
plot_fields_biogem_3d_i('e_folding/1707_04_SULF_config_p0251b.3.0PO4Fe.SPIN_nosulf_efold200_sulfE7','','ocn_H2S','',19999.5,-1,1,'0_endPermian_grid_mask_EastPanth.csv',1e-6,0,100,10,'','','./2307_PLOTS_H2Sprofiles/3xPO4_elength200_H2S_EastPanth_ksulf_7')
plot_fields_biogem_3d_i('e_folding/1707_04_SULF_config_p0251b.3.0PO4Fe.SPIN_nosulf_efold200_sulfE7','','ocn_H2S','',19999.5,-1,1,'0_endPermian_grid_mask_Tethys.csv',1e-6,0,100,10,'','','./2307_PLOTS_H2Sprofiles/3xPO4_elength200_H2S_Tethys_ksulf_7')

%Dom_plot_3_H2S_Profiles('2307_PLOTS_H2Sprofiles/3xPO4_elength100_H2S_EastPanth_nosulf.PROFILE.190723.res','2307_PLOTS_H2Sprofiles/3xPO4_elength200_H2S_EastPanth_nosulf.PROFILE.190723.res','2307_PLOTS_H2Sprofiles/3xPO4_elength300_H2S_EastPanth_nosulf.PROFILE.190723.res','./2307_PLOTS_H2Sprofiles/2307_3xPO4_EastPanth_H2S_profiles_60200300')
%Dom_plot_3_H2S_Profiles('2307_PLOTS_H2Sprofiles/3xPO4_elength100_H2S_Tethys_nosulf.PROFILE.190723.res','2307_PLOTS_H2Sprofiles/3xPO4_elength200_H2S_Tethys_nosulf.PROFILE.190723.res','2307_PLOTS_H2Sprofiles/3xPO4_elength300_H2S_Tethys_nosulf.PROFILE.190723.res','./2307_PLOTS_H2Sprofiles/2307_3xPO4_Tethys_H2S_profiles_60200300')


% 300m
% create single profiles
% ksulf=5
plot_fields_biogem_3d_i('e_folding/1807_10_SULF_efold_config_p0251b.3.0PO4Fe.SPIN_ksulf_E5_efold300','','ocn_H2S','',19999.5,-1,1,'0_endPermian_grid_mask_EastPanth.csv',1e-6,0,100,10,'','','./2307_PLOTS_H2Sprofiles/3xPO4_elength300_H2S_EastPanth_ksulf_5')
plot_fields_biogem_3d_i('e_folding/1807_10_SULF_efold_config_p0251b.3.0PO4Fe.SPIN_ksulf_E5_efold300','','ocn_H2S','',19999.5,-1,1,'0_endPermian_grid_mask_Tethys.csv',1e-6,0,100,10,'','','./2307_PLOTS_H2Sprofiles/3xPO4_elength300_H2S_Tethys_ksulf_5')
% ksulf=6
plot_fields_biogem_3d_i('e_folding/1807_11_SULF_efold_config_p0251b.3.0PO4Fe.SPIN_ksulf_E6_efold300','','ocn_H2S','',19999.5,-1,1,'0_endPermian_grid_mask_EastPanth.csv',1e-6,0,100,10,'','','./2307_PLOTS_H2Sprofiles/3xPO4_elength300_H2S_EastPanth_ksulf_6')
plot_fields_biogem_3d_i('e_folding/1807_11_SULF_efold_config_p0251b.3.0PO4Fe.SPIN_ksulf_E6_efold300','','ocn_H2S','',19999.5,-1,1,'0_endPermian_grid_mask_Tethys.csv',1e-6,0,100,10,'','','./2307_PLOTS_H2Sprofiles/3xPO4_elength300_H2S_Tethys_ksulf_6')
% ksulf=7
plot_fields_biogem_3d_i('e_folding/1807_12_SULF_efold_config_p0251b.3.0PO4Fe.SPIN_ksulf_E7_efold300','','ocn_H2S','',19999.5,-1,1,'0_endPermian_grid_mask_EastPanth.csv',1e-6,0,100,10,'','','./2307_PLOTS_H2Sprofiles/3xPO4_elength300_H2S_EastPanth_ksulf_7')
plot_fields_biogem_3d_i('e_folding/1807_12_SULF_efold_config_p0251b.3.0PO4Fe.SPIN_ksulf_E7_efold300','','ocn_H2S','',19999.5,-1,1,'0_endPermian_grid_mask_Tethys.csv',1e-6,0,100,10,'','','./2307_PLOTS_H2Sprofiles/3xPO4_elength300_H2S_Tethys_ksulf_7')

% Dom_plot_3_H2S_Profiles('2307_PLOTS_H2Sprofiles/3xPO4_elength100_H2S_EastPanth_nosulf.PROFILE.190723.res','2307_PLOTS_H2Sprofiles/3xPO4_elength200_H2S_EastPanth_nosulf.PROFILE.190723.res','2307_PLOTS_H2Sprofiles/3xPO4_elength300_H2S_EastPanth_nosulf.PROFILE.190723.res','./2307_PLOTS_H2Sprofiles/2307_3xPO4_EastPanth_H2S_profiles_60200300')
% Dom_plot_3_H2S_Profiles('2307_PLOTS_H2Sprofiles/3xPO4_elength100_H2S_Tethys_nosulf.PROFILE.190723.res','2307_PLOTS_H2Sprofiles/3xPO4_elength200_H2S_Tethys_nosulf.PROFILE.190723.res','2307_PLOTS_H2Sprofiles/3xPO4_elength300_H2S_Tethys_nosulf.PROFILE.190723.res','./2307_PLOTS_H2Sprofiles/2307_3xPO4_Tethys_H2S_profiles_60200300')

Dom_plot_3x4_H2S_Profiles('./2307_PLOTS_H2Sprofiles/3xPO4_elength100_H2S_Tethys_nosulf.PROFILE.190723.res','./2307_PLOTS_H2Sprofiles/3xPO4_elength200_H2S_Tethys_nosulf.PROFILE.190723.res','2307_PLOTS_H2Sprofiles/3xPO4_elength300_H2S_Tethys_nosulf.PROFILE.190723.res','2307_PLOTS_H2Sprofiles/3xPO4_elength100_H2S_Tethys_ksulf_5.PROFILE.190725.res','2307_PLOTS_H2Sprofiles/3xPO4_elength200_H2S_Tethys_ksulf_5.PROFILE.190725.res','2307_PLOTS_H2Sprofiles/3xPO4_elength300_H2S_Tethys_ksulf_5.PROFILE.190725.res','2307_PLOTS_H2Sprofiles/3xPO4_elength100_H2S_Tethys_ksulf_6.PROFILE.190725.res','2307_PLOTS_H2Sprofiles/3xPO4_elength200_H2S_Tethys_ksulf_6.PROFILE.190725.res','2307_PLOTS_H2Sprofiles/3xPO4_elength300_H2S_Tethys_ksulf_6.PROFILE.190725.res','2307_PLOTS_H2Sprofiles/3xPO4_elength100_H2S_Tethys_ksulf_7.PROFILE.190725.res','2307_PLOTS_H2Sprofiles/3xPO4_elength200_H2S_Tethys_ksulf_7.PROFILE.190725.res','2307_PLOTS_H2Sprofiles/3xPO4_elength300_H2S_Tethys_ksulf_7.PROFILE.190725.res','./2307_PLOTS_H2Sprofiles/2507_3xPO4_Tethys_H2s_wsulf_100200300')
Dom_plot_3x4_H2S_Profiles('./2307_PLOTS_H2Sprofiles/3xPO4_elength100_H2S_EastPanth_nosulf.PROFILE.190723.res','./2307_PLOTS_H2Sprofiles/3xPO4_elength200_H2S_EastPanth_nosulf.PROFILE.190723.res','2307_PLOTS_H2Sprofiles/3xPO4_elength300_H2S_EastPanth_nosulf.PROFILE.190723.res','2307_PLOTS_H2Sprofiles/3xPO4_elength100_H2S_EastPanth_ksulf_5.PROFILE.190725.res','2307_PLOTS_H2Sprofiles/3xPO4_elength200_H2S_EastPanth_ksulf_5.PROFILE.190725.res','2307_PLOTS_H2Sprofiles/3xPO4_elength300_H2S_EastPanth_ksulf_5.PROFILE.190725.res','2307_PLOTS_H2Sprofiles/3xPO4_elength100_H2S_EastPanth_ksulf_6.PROFILE.190725.res','2307_PLOTS_H2Sprofiles/3xPO4_elength200_H2S_EastPanth_ksulf_6.PROFILE.190725.res','2307_PLOTS_H2Sprofiles/3xPO4_elength300_H2S_EastPanth_ksulf_6.PROFILE.190725.res','2307_PLOTS_H2Sprofiles/3xPO4_elength100_H2S_EastPanth_ksulf_7.PROFILE.190725.res','2307_PLOTS_H2Sprofiles/3xPO4_elength200_H2S_EastPanth_ksulf_7.PROFILE.190725.res','2307_PLOTS_H2Sprofiles/3xPO4_elength300_H2S_EastPanth_ksulf_7.PROFILE.190725.res','./2307_PLOTS_H2Sprofiles/2507_3xPO4_EastPanth_H2s_wsulf_100200300')
end