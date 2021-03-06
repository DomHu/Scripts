function Dom_plot_ANOXIA_contours_from_mat(PNAME_CONTOUR, Global)

% run from genie-matlab and have config names saved in folder genie-matlab/configs/XXX

% Global true: yes; false: bottom water

% Example call:
% Dom_plot_ANOXIA_contours_from_mat('7_tmp_dep_80m_sink_sulfE6_ANOXIA', false)



%% plot contours

%% data end-Permian 1.0 - 3.0 PO4
PO4 = [1.0:0.5:3.0];
CO2 = [1 5 10 15 20];
CO2 = [22.7 28.4 30.8 32.3 33.3];

% load percentages of global and bottom water anoxia: variables are
% Globalanox and BWanox
load([strcat('./PLOTS/',PNAME_CONTOUR), '.mat']);
    
% select either Global anoxia values or bottom water anoxia &
% reshape and transpose, so PO4 is lines and CO2 is columns
if(Global)
    Anoxia_matrix = reshape(Globalanox, 5,5)';
    txt = 'Global anoxia';
else
    Anoxia_matrix = reshape(BWanox, 5,5)';
    txt = 'Bottom water anoxia';
end

% 4 representative cGENIE experiments
cGENIE = [22.7 1; 28.4 1.5; 30.8 2.0; 33.3 2.0];
str = {'1','2','3','4'};
cGENIE_text = cGENIE;
cGENIE_text(:,2) = cGENIE_text(:,2)+0.07;
cGENIE_text(end,1)=32.8;

set(0,'defaultAxesFontSize',16)
figure;
hold on
caxis([0,80])
[C,h] = contourf(CO2,PO4,Anoxia_matrix,[0:10:80]);
plot(cGENIE(:,1), cGENIE(:,2),'d','color','r','markerfacecolor','r','markersize',12)
text(cGENIE_text(:,1),cGENIE_text(:,2),str,'Color','red','FontSize',20)
clabel(C,h,'FontSize',16);
ylim([1.0 2.5])
%    clabel(C,h,'LineStyle','--')
%    clabel(C,h,'FontSize',15,'Color','r')
%    clabel(C,h,'FontWeight','bold')
%    h.LineWidth = 2;
box on
hold off
% text(0.03,0.92,txt,'FontSize',22,'Units','normalized', 'FontWeight', 'bold')
xlabel ({'East Tethys SST'}); %;'(\mumol cm^{-2}yr^{-1})'})
%    ylabel('e-folding depth (m)')
ylabel('Ocean PO_4 \times modern')
if(Global)
  print('-depsc', strcat('./PLOTS/',PNAME_CONTOUR,'_GlobalAnoxia_ylim2'));
  
else
print('-depsc', strcat('./PLOTS/',PNAME_CONTOUR,'_BWAnoxia_ylim25_1605'));
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
