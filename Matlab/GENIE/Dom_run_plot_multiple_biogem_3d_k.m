function Dom_run_plot_multiple_biogem_3d_k(PVAR1, PT1, PIK,PMASK,PCSCALE,PCMIN,PCMAX,PCN,PDATA,POPT,PNAME_CONTOUR, FOLDER)

%% load experiment names in folder 
% dinfo = dir('./configs/1_double_exp/');
dinfo = dir(FOLDER);
names_cell = {dinfo.name};
exps = names_cell(3:end);


%% plot H2S concentration and save mean concentration of all experiments in .mat-file (cell concentrations for all experiments are saved in .mat files within plot_fields_biogem_3d_k)
for i=1:length(exps)
    Mean_H2S_Doubleexp_k15(i) = plot_fields_biogem_3d_k_mean_conc(exps{1,i},'',PVAR1,'',PT1,-1,PIK,PMASK,PCSCALE,PCMIN,PCMAX,PCN,PDATA,POPT,'');
    %    plot_fields_biogem_3d_k(exps(i),'',PVAR1,'',PT1,-1,PIK,PMASK,PCSCALE,PCMIN,PCMAX,PCN,PDATA,POPT,PNAME)
end
save([PNAME_CONTOUR, '.mat'],'Mean_H2S_Doubleexp_k15')


%% plot contours

%% data end-Permian 1.0 - 3.0 PO4
PO4 = [1.0:0.5:3.0];
CO2 = [1 5 10 15 20];

% reshape and transpose, so PO4 is lines and CO2 is columns
H2S_photic_data = reshape(Mean_H2S_Doubleexp_k15, 5,5)';
%     H2S_emission = xlsread('~/Documents/GitHub/Sulfurization_EndPermian/Experiment_end-Permian.xlsx','1009_efold200','C21:G26');

set(0,'defaultAxesFontSize',16)

figure;
hold on
[C,h] = contourf(CO2,PO4,H2S_photic_data);
clabel(C,h,'FontSize',16);
%    clabel(C,h,'LineStyle','--')
%    clabel(C,h,'FontSize',15,'Color','r')
%    clabel(C,h,'FontWeight','bold')
%    h.LineWidth = 2;
box on
hold off
%    set(gca,'YTick',[-5:0])
txt = '(x) photic zone H_2S';
text(0.03,0.92,txt,'FontSize',22,'Units','normalized', 'FontWeight', 'bold')
xlabel ({'CO_2 (\times modern)'}); %;'(\mumol cm^{-2}yr^{-1})'})
%    ylabel('e-folding depth (m)')
ylabel('Ocean PO_4 \times modern')
print('-depsc', PNAME_CONTOUR);


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
