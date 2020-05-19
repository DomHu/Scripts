function Dom_run_plot_multiple_biogem_3d_k_depthmax(FOLDER)
% run from genie-matlab and have config names saved in folder genie-matlab/configs/XXX
% Example call:
% Dom_run_plot_multiple_biogem_3d_k('ocn_H2S',19999.5,15,'',1e-6,0,100,20,'','','0410_Double_exp_H2S_k15', './configs/1_double_exp/')

%% load experiment names in folder 
% dinfo = dir('./configs/1_double_exp/');
dinfo = dir(['cgenie_output/' FOLDER]);
names_cell = {dinfo.name};
exps = strcat(names_cell(3:end));


%% plot H2S concentration and save mean concentration of all experiments in .mat-file (cell concentrations for all experiments are saved in .mat files within plot_fields_biogem_3d_k)
for i=1:length(exps)
    i
    % plot Maximum value between 80 - 1000m
%    plot_fields_biogem_3d_k_depthmax(strcat(FOLDER,exps{1,i}),'','ocn_H2S','',9999.5,-1,0,'',1e-6,0,200,20,'Observations_WC_Euxini_EndPermian_adjusted_8columns','','',false, false)
    % plot Depth of Maximum value between 80 - 1000m
    plot_fields_biogem_3d_k_depthmax(strcat(FOLDER,exps{1,i}),'','ocn_H2S','',9999.5,-1,0,'',1,10,15,5,'','','',true, false)
    % plot Histogram of data Frq distribution of values between 80 - 1000m
%    plot_fields_biogem_3d_k_depthmax(strcat(FOLDER,exps{1,i}),'','ocn_H2S','',9999.5,-1,0,'',1e-6,0,110,11,'','','',false, true)

end






