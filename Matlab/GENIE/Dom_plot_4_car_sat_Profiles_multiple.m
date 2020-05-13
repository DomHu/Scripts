function [STATM] = Dom_plot_4_car_sat_Profiles_multiple(PMASK, run_plot_fcts)

% create single profiles
% run_plot_fcts  calculate the prifiles?

% run_plot_fcts = true;

%% delta 13C
% Model #4
FOLDER = 'model4/'; 
exp1 = '0310_201_config_p0251b.1.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink_sulfE6';
exp2 = '0310_207_config_p0251b.5.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep80m_sink_sulfE6';
exp3 = '0310_213_config_p0251b.10.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink_sulfE6';
exp4 = '0310_215_config_p0251b.20.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink_sulfE6';
if(run_plot_fcts)
plot_fields_biogem_3d_i(strcat(FOLDER,exp1),'','carb_ohm_cal','',9999.5,-1,1,PMASK,1.0,0.0,2.0,10,'','',strcat('PLOTS/carbonate_sat_profiles/',exp1))
plot_fields_biogem_3d_i(strcat(FOLDER,exp2),'','carb_ohm_cal','',9999.5,-1,1,PMASK,1.0,0.0,2.0,10,'','',strcat('PLOTS/carbonate_sat_profiles/',exp2))
plot_fields_biogem_3d_i(strcat(FOLDER,exp3),'','carb_ohm_cal','',9999.5,-1,1,PMASK,1.0,0.0,2.0,10,'','',strcat('PLOTS/carbonate_sat_profiles/',exp3))
plot_fields_biogem_3d_i(strcat(FOLDER,exp4),'','carb_ohm_cal','',9999.5,-1,1,PMASK,1.0,0.0,2.0,10,'','',strcat('PLOTS/carbonate_sat_profiles/',exp4))
end
% plot profiles in one
FOLDER = 'carbonate_sat_profiles/';
Dom_plot_4_carb_sat_Profiles(strcat('PLOTS/',FOLDER,exp1,'.PROFILE.200513.res'),strcat('PLOTS/',FOLDER,exp2,'.PROFILE.200513.res'),strcat('PLOTS/',FOLDER,exp3,'.PROFILE.200513.res'),strcat('PLOTS/',FOLDER,exp4,'.PROFILE.200513.res'),strcat('PLOTS/',FOLDER,'Model4_calcite_sat_EastEastPantha_S_1000m_TEST'))

if(false)
% Model #3
FOLDER = 'model3/';
exp1 = '0310_101_config_p0251b.1.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink';
exp2 = '0310_107_config_p0251b.5.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep80m_sink';
exp3 = '0310_113_config_p0251b.10.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink';
exp4 = '0310_115_config_p0251b.20.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep80m_sink';
if(run_plot_fcts)
plot_fields_biogem_3d_i(strcat(FOLDER,exp1),'','carb_ohm_cal','',9999.5,-1,1,PMASK,1.0,0.0,2.0,10,'','',strcat('PLOTS/carbonate_sat_profiles/',exp1))
plot_fields_biogem_3d_i(strcat(FOLDER,exp2),'','carb_ohm_cal','',9999.5,-1,1,PMASK,1.0,0.0,2.0,10,'','',strcat('PLOTS/carbonate_sat_profiles/',exp2))
plot_fields_biogem_3d_i(strcat(FOLDER,exp3),'','carb_ohm_cal','',9999.5,-1,1,PMASK,1.0,0.0,2.0,10,'','',strcat('PLOTS/carbonate_sat_profiles/',exp3))
plot_fields_biogem_3d_i(strcat(FOLDER,exp4),'','carb_ohm_cal','',9999.5,-1,1,PMASK,1.0,0.0,2.0,10,'','',strcat('PLOTS/carbonate_sat_profiles/',exp4))
end
% plot profiles in one
%
FOLDER = 'carbonate_sat_profiles/';
Dom_plot_4_carb_sat_Profiles(strcat('PLOTS/',FOLDER,exp1,'.PROFILE.200513.res'),strcat('PLOTS/',FOLDER,exp2,'.PROFILE.200513.res'),strcat('PLOTS/',FOLDER,exp3,'.PROFILE.200513.res'),strcat('PLOTS/',FOLDER,exp4,'.PROFILE.200513.res'),strcat('PLOTS/',FOLDER,'Model3_calcite_sat_EastEastPantha_S_1000m'))

% Model #2
FOLDER = 'model2/';
exp1 = '0310_01_config_p0251b.1.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep';
exp2 = '0310_07_config_p0251b.5.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep';
exp3 = '0310_13_config_p0251b.10.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep';
exp4 = '0310_15_config_p0251b.20.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep';
if(run_plot_fcts)
plot_fields_biogem_3d_i(strcat(FOLDER,exp1),'','carb_ohm_cal','',9999.5,-1,1,PMASK,1.0,0.0,2.0,10,'','',strcat('PLOTS/carbonate_sat_profiles/',exp1))
plot_fields_biogem_3d_i(strcat(FOLDER,exp2),'','carb_ohm_cal','',9999.5,-1,1,PMASK,1.0,0.0,2.0,10,'','',strcat('PLOTS/carbonate_sat_profiles/',exp2))
plot_fields_biogem_3d_i(strcat(FOLDER,exp3),'','carb_ohm_cal','',9999.5,-1,1,PMASK,1.0,0.0,2.0,10,'','',strcat('PLOTS/carbonate_sat_profiles/',exp3))
plot_fields_biogem_3d_i(strcat(FOLDER,exp4),'','carb_ohm_cal','',9999.5,-1,1,PMASK,1.0,0.0,2.0,10,'','',strcat('PLOTS/carbonate_sat_profiles/',exp4))
end
% plot profiles in one
%
FOLDER = 'carbonate_sat_profiles/';
Dom_plot_4_carb_sat_Profiles(strcat('PLOTS/',FOLDER,exp1,'.PROFILE.200513.res'),strcat('PLOTS/',FOLDER,exp2,'.PROFILE.200513.res'),strcat('PLOTS/',FOLDER,exp3,'.PROFILE.200513.res'),strcat('PLOTS/',FOLDER,exp4,'.PROFILE.200513.res'),strcat('PLOTS/',FOLDER,'Model2_calcite_sat_EastEastPantha_S_1000m'))


% Model #1
FOLDER = 'model1/';
exp1 = '0410_01_config_p0251b.1.0CO2_1.0PO4Fe.SPIN_nosulf';
exp2 = '0410_07_config_p0251b.5.0CO2_1.5PO4Fe.SPIN_nosulf';
exp3 = '0410_13_config_p0251b.10.0CO2_2.0PO4Fe.SPIN_nosulf';
exp4 = '0410_15_config_p0251b.20.0CO2_2.0PO4Fe.SPIN_nosulf';
if(run_plot_fcts)
plot_fields_biogem_3d_i(strcat(FOLDER,exp1),'','carb_ohm_cal','',9999.5,-1,1,PMASK,1.0,0.0,2.0,10,'','',strcat('PLOTS/carbonate_sat_profiles/',exp1))
plot_fields_biogem_3d_i(strcat(FOLDER,exp2),'','carb_ohm_cal','',9999.5,-1,1,PMASK,1.0,0.0,2.0,10,'','',strcat('PLOTS/carbonate_sat_profiles/',exp2))
plot_fields_biogem_3d_i(strcat(FOLDER,exp3),'','carb_ohm_cal','',9999.5,-1,1,PMASK,1.0,0.0,2.0,10,'','',strcat('PLOTS/carbonate_sat_profiles/',exp3))
plot_fields_biogem_3d_i(strcat(FOLDER,exp4),'','carb_ohm_cal','',9999.5,-1,1,PMASK,1.0,0.0,2.0,10,'','',strcat('PLOTS/carbonate_sat_profiles/',exp4))
end
% plot profiles in one
%
FOLDER = 'carbonate_sat_profiles/';
Dom_plot_4_carb_sat_Profiles(strcat('PLOTS/',FOLDER,exp1,'.PROFILE.200513.res'),strcat('PLOTS/',FOLDER,exp2,'.PROFILE.200513.res'),strcat('PLOTS/',FOLDER,exp3,'.PROFILE.200513.res'),strcat('PLOTS/',FOLDER,exp4,'.PROFILE.200513.res'),strcat('PLOTS/',FOLDER,'Model1_calcite_sat_EastEastPantha_S_1000m'))
end

end