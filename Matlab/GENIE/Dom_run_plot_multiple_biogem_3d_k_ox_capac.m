function Dom_run_plot_multiple_biogem_3d_k_ox_capac(PNAME_CONTOUR, TEXTFIG, FOLDER, normalize)
% run from genie-matlab and have config names saved in folder genie-matlab/configs/XXX
% Example call:
% Dom_run_plot_multiple_biogem_3d_k('ocn_H2S',19999.5,15,'',1e-6,0,100,20,'','','0410_Double_exp_H2S_k15', './configs/1_double_exp/')
run_GENIE_ana = ~normalize;      % wan to run plot_fields_biogem_3d_k??
run_GENIE_ana = false;

if(run_GENIE_ana)
%% load experiment names in folder 
% dinfo = dir('./configs/1_double_exp/');
dinfo = dir(['cgenie_output/' FOLDER]);
names_cell = {dinfo.name};
exps = strcat(FOLDER, names_cell(3:end));


%% plot H2S concentration and save mean concentration of all experiments in .mat-file (cell concentrations for all experiments are saved in .mat files within plot_fields_biogem_3d_k)
for i=1:length(exps)
    i
    Ox_Capac_400m(i) = plot_fields_biogem_3d_k_ox_capac(exps{1,i},exps{1,i},'ocn_O2','ocn_H2S',9999.5,9999.5,0,'',1,-250,250,20,'','',PNAME_CONTOUR);
    %    plot_fields_biogem_3d_k(exps(i),'',PVAR1,'',PT1,-1,PIK,PMASK,PCSCALE,PCMIN,PCMAX,PCN,PDATA,POPT,PNAME)
end
save([strcat('./PLOTS/',PNAME_CONTOUR), '.mat'],'Ox_Capac_400m')
end

%% plot contours

%% data end-Permian 1.0 - 3.0 PO4
PO4 = [1.0:0.5:3.0];
CO2 = [1 5 10 15 20];
CO2 = [22.7 28.4 30.8 32.3 33.3];
% load Double-exponential to normalize everything to 1xPO4, 1xCO2

if(~run_GENIE_ana)  % load the existing matrix if didn't run the GENIE ana
    % load default value from Double-exp run to normalize results against
%    load('PLOTS/7_tmp_dep_80m_sink_sulfE6_90-580m_Ox_cap.mat');
%    load('PLOTS/6_tmp_dep_80m_sink_90-580m_Ox_cap.mat');
%    load('PLOTS/2_tmp_dep_default_90-580m_Ox_cap.mat');
    load('PLOTS/1_Double_exp_90-580m_ox_cap.mat');
    Double_exp_default = Ox_Capac_400m(1,1);
    % load results from runs I want to plot
%    load([strcat('./PLOTS/',PNAME_CONTOUR), '.mat']);
%     H2S_emission = xlsread('~/Documents/GitHub/Sulfurization_EndPermian/Experiment_end-Permian.xlsx','1009_efold200','C21:G26');
if(normalize)
    Ox_Capac_400m=Ox_Capac_400m./Double_exp_default;
end
end

% reshape and transpose, so PO4 is lines and CO2 is columns
Ox_Capac_matrix = reshape(Ox_Capac_400m, 5,5)';

set(0,'defaultAxesFontSize',16)
figure;
hold on
caxis([-80000,100000])
[C,h] = contourf(CO2,PO4,Ox_Capac_matrix,[-80000:20000:100000]);
clabel(C,h,'FontSize',16);
%    clabel(C,h,'LineStyle','--')
%    clabel(C,h,'FontSize',15,'Color','r')
%    clabel(C,h,'FontWeight','bold')
%    h.LineWidth = 2;
box on
hold off
%    set(gca,'YTick',[-5:0])
txt = TEXTFIG;
text(0.03,0.92,txt,'FontSize',22,'Units','normalized', 'FontWeight', 'bold')
% xlabel ({'CO_2 (\times modern)'}); %;'(\mumol cm^{-2}yr^{-1})'})
xlabel ({'East Tethys SST'}); %;'(\mumol cm^{-2}yr^{-1})'})
%    ylabel('e-folding depth (m)')
ylabel('Ocean PO_4 \times modern')
if(normalize)
  print('-depsc', strcat('./PLOTS/',PNAME_CONTOUR,'_normalize'));
  
else
print('-depsc', strcat('./PLOTS/',PNAME_CONTOUR));
end

end



% exps = {'0310_00_config_p0251b.1.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep_125sink';
%     '0310_01_config_p0251b.1.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep'; ...
%     '0310_02_config_p0251b.5.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep'; ...
% '0310_03_config_p0251b.10.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep';
% '0310_04_config_p0251b.15.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep';
% '0310_05_config_p0251b.20.0CO2_1.0PO4Fe.SPIN_nosulf_Tmpdep';
% '0310_06_config_p0251b.1.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep';
% '0310_07_config_p0251b.5.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep';
% '0310_08_config_p0251b.10.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep';
% '0310_09_config_p0251b.15.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep';
% '0310_10_config_p0251b.20.0CO2_1.5PO4Fe.SPIN_nosulf_Tmpdep';
% '0310_11_config_p0251b.1.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep';
% '0310_12_config_p0251b.5.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep';
% '0310_13_config_p0251b.10.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep';
% '0310_14_config_p0251b.15.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep';
% '0310_15_config_p0251b.20.0CO2_2.0PO4Fe.SPIN_nosulf_Tmpdep';
% '0310_16_config_p0251b.1.0CO2_2.5PO4Fe.SPIN_nosulf_Tmpdep';
% '0310_17_config_p0251b.5.0CO2_2.5PO4Fe.SPIN_nosulf_Tmpdep';
% '0310_18_config_p0251b.10.0CO2_2.5PO4Fe.SPIN_nosulf_Tmpdep';
% '0310_19_config_p0251b.15.0CO2_2.5PO4Fe.SPIN_nosulf_Tmpdep';
% '0310_20_config_p0251b.20.0CO2_2.5PO4Fe.SPIN_nosulf_Tmpdep';
% '0310_21_config_p0251b.1.0CO2_3.0PO4Fe.SPIN_nosulf_Tmpdep';
% '0310_22_config_p0251b.5.0CO2_3.0PO4Fe.SPIN_nosulf_Tmpdep';
% '0310_23_config_p0251b.10.0CO2_3.0PO4Fe.SPIN_nosulf_Tmpdep';
% '0310_24_config_p0251b.15.0CO2_3.0PO4Fe.SPIN_nosulf_Tmpdep';
% '0310_25_config_p0251b.20.0CO2_3.0PO4Fe.SPIN_nosulf_Tmpdep'};
