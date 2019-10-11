function plot_ksulf_vs_results_contour_NEW1012_3to7_revised()
%%%%%%%
% !!!! USE ksulf = 0 as result for ksulf = 3
    % load data

    set(0,'defaultAxesFontSize',16)
    
    all_figs = false; % false: just plot H2S emission
    
%    data_all=xlsread('../POC_burial.xlsx','Geology_data','B102:K137'); % Data for 1st submission

%% data end-Permian 1.0 - 2.0 PO4
	PO4 = [1.0:0.2:2.0];
	ksulf = [3 4 5 6 7];
%    data_all=xlsread('../Experiment_end-Permian.xlsx','Exps1902+1903','B29:L58');

%    O2_data = xlsread('../Experiment_end-Permian.xlsx','Exps1902+1903','C65:G70');
%    H2S_data = xlsread('../Experiment_end-Permian.xlsx','Exps1902+1903','C76:G81');
%    POC_exp_data = xlsread('../Experiment_end-Permian.xlsx','Exps1902+1903','C86:G91');
%    POC_rain_data = xlsread('../Experiment_end-Permian.xlsx','Exps1902+1903','C96:G101');
%    POC_burial_data = xlsread('../Experiment_end-Permian.xlsx','Exps1902+1903','C106:G111'); 
    H2S_emission_data = xlsread('~/Documents/GitHub/Sulfurization_EndPermian/Experiment_end-Permian.xlsx','1009_efold200','C21:GP26');
    
%% data end-Permian 1.0 - 2.0 PO4 - 
%  	PO4 = [1.0:1.0:5.0];
%  	ksulf = [3 4 5 6 7];
%     data_all=xlsread('../Experiment_end-Permian.xlsx','Exps1902+1903_highPO4','B29:L53');
% 
%     O2_data = xlsread('../Experiment_end-Permian.xlsx','Exps1902+1903_highPO4','C65:G69');
%     H2S_data = xlsread('../Experiment_end-Permian.xlsx','Exps1902+1903_highPO4','C76:G80');
%     POC_exp_data = xlsread('../Experiment_end-Permian.xlsx','Exps1902+1903_highPO4','C86:G90');
%     POC_rain_data = xlsread('../Experiment_end-Permian.xlsx','Exps1902+1903_highPO4','C96:G100');
%     POC_burial_data = xlsread('../Experiment_end-Permian.xlsx','Exps1902+1903_highPO4','C106:G110'); 
%     H2S_emission_data = xlsread('../Experiment_end-Permian.xlsx','Exps1902+1903_highPO4','C116:G120');
    
%% data end-Permian 1.0 x PO4, e-folding depth = 60, 200, 590m
%  	PO4 = [60, 100, 200, 300, 400, 500, 590];
%  	ksulf = [3 4 5 6 7];
%     % data_all=xlsread('../Experiment_end-Permian.xlsx','Exps1203_efold','B29:L53');
% 
%     O2_data = xlsread('../Experiment_end-Permian.xlsx','Exps1203_efold','C45:G51');
%     H2S_data = xlsread('../Experiment_end-Permian.xlsx','Exps1203_efold','C55:G61');
%     POC_exp_data = xlsread('../Experiment_end-Permian.xlsx','Exps1203_efold','C65:G71');
%     POC_rain_data = xlsread('../Experiment_end-Permian.xlsx','Exps1203_efold','C75:G81');
%     POC_burial_data = xlsread('../Experiment_end-Permian.xlsx','Exps1203_efold','C85:G91'); 
%     H2S_emission_data = xlsread('../Experiment_end-Permian.xlsx','Exps1203_efold','C95:G101');
%   

    %% data end-Permian 2.0 x PO4, e-folding depth = 60, 100, 200, 300, 400, 500, 590m
%  	PO4 = [60, 100, 200, 300, 400, 500, 590];
%  	ksulf = [3 4 5 6 7];
%     % data_all=xlsread('../Experiment_end-Permian.xlsx','Exps1203_efold','B29:L53');
% 
%     O2_data = xlsread('../Experiment_end-Permian.xlsx','Exps1203_efold','C161:G167');
%     H2S_data = xlsread('../Experiment_end-Permian.xlsx','Exps1203_efold','C171:G177');
%     POC_exp_data = xlsread('../Experiment_end-Permian.xlsx','Exps1203_efold','C181:G187');
%     POC_rain_data = xlsread('../Experiment_end-Permian.xlsx','Exps1203_efold','C191:G197');
%     POC_burial_data = xlsread('../Experiment_end-Permian.xlsx','Exps1203_efold','C201:G207'); 
%     H2S_emission_data = xlsread('../Experiment_end-Permian.xlsx','Exps1203_efold','C211:G217');
% %     
   

    
    figure;
    hold on
    [C,h] = contourf(ksulf,PO4,H2S_emission_data);
%    clabel(C,h,'LineStyle','--')
    clabel(C,h,'FontSize',16);
%    clabel(C,h,'FontSize',15,'Color','r')
%    clabel(C,h,'FontWeight','bold')
%    clabel(C,h)
%    colorbar(); 
%    h.LineWidth = 2;
    box on
    hold off
%    set(gca,'YTick',[-5:0])
    txt = '(c) H_2S emission';
    text(0.03,0.92,txt,'FontSize',22,'Units','normalized', 'FontWeight', 'bold')
    xlabel ({'ksulf (10^x)'}); %;'(\mumol cm^{-2}yr^{-1})'})
%    ylabel('e-folding depth (m)')    
    ylabel('Ocean PO_4 \times modern')    
    print('-depsc', '1009_H2SEmission_3to7_efold200');

  
if(all_figs)
    figure;
    hold on
    [C,h] = contourf(ksulf,PO4,O2_data);
%    clabel(C,h,'LineStyle','--')
    clabel(C,h,'FontSize',16);
%    clabel(C,h,'FontSize',15,'Color','r')
%    clabel(C,h,'FontWeight','bold')
%    clabel(C,h)
%    colorbar(); 
%    h.LineWidth = 2;
    box on
    hold off
%    set(gca,'YTick',[-5:0])
    txt = '(a) O_2';
    text(0.03,0.92,txt,'FontSize',22,'Units','normalized', 'FontWeight', 'bold')
    xlabel ({'ksulf (10^x)'}); %;'(\mumol cm^{-2}yr^{-1})'})
    ylabel('e-folding depth (m)')    
%    ylabel('Ocean PO_4 \times modern')    
    print('-depsc', '1_0104_MeanO2_3to7_1xPO4_efold');
    
    
    figure;
    hold on
    [C,h] = contourf(ksulf,PO4,H2S_data);
%    clabel(C,h,'LineStyle','--')
    clabel(C,h,'FontSize',16);
%    clabel(C,h,'FontSize',15,'Color','r')
%    clabel(C,h,'FontWeight','bold')
%    clabel(C,h)
%    colorbar(); 
%    h.LineWidth = 2;
    box on
    hold off
%    set(gca,'YTick',[-5:0])
    txt = '(b) H_2S';
    text(0.03,0.92,txt,'FontSize',22,'Units','normalized', 'FontWeight', 'bold')
    xlabel ({'ksulf (10^x)'}); %;'(\mumol cm^{-2}yr^{-1})'})
    ylabel('e-folding depth (m)')    
%    ylabel('Ocean PO_4 \times modern')    
    print('-depsc', '2_0104_MeanH2S_3to7_1xPO4_efold');

     
    figure;
    hold on
    [C,h] = contourf(ksulf,PO4,POC_exp_data);
%    clabel(C,h,'LineStyle','--')
    clabel(C,h,'FontSize',16);
%    clabel(C,h,'FontSize',15,'Color','r')
%    clabel(C,h,'FontWeight','bold')
%    clabel(C,h)
%    colorbar(); 
%    h.LineWidth = 2;
    box on
    hold off
%    set(gca,'YTick',[-5:0])
    txt = '(d) OM export';
    text(0.03,0.92,txt,'FontSize',22,'Units','normalized', 'FontWeight', 'bold')
    xlabel ({'ksulf (10^x)'}); %;'(\mumol cm^{-2}yr^{-1})'})
    ylabel('e-folding depth (m)')    
%    ylabel('Ocean PO_4 \times modern')    
    print('-depsc', '4_0104_POC_exp_3to7_1xPO4_efold');

    
    
    figure;
    hold on
    [C,h] = contourf(ksulf,PO4,POC_rain_data);
%    clabel(C,h,'LineStyle','--')
    clabel(C,h,'FontSize',16);
%    clabel(C,h,'FontSize',15,'Color','r')
%    clabel(C,h,'FontWeight','bold')
%    clabel(C,h)
%    colorbar(); 
%    h.LineWidth = 2;
    box on
    hold off
%    set(gca,'YTick',[-5:0])
    txt = '(e) OM rain';
    text(0.03,0.92,txt,'FontSize',22,'Units','normalized', 'FontWeight', 'bold')
    xlabel ({'ksulf (10^x)'}); %;'(\mumol cm^{-2}yr^{-1})'})
    ylabel('e-folding depth (m)')    
%    ylabel('Ocean PO_4 \times modern')    
    print('-depsc', '5_0104_POC_rain_3to7_1xPO4_efold');    
     
    figure;
    hold on
    [C,h] = contourf(ksulf,PO4,POC_burial_data);
%    clabel(C,h,'LineStyle','--')
    clabel(C,h,'FontSize',16);
%    clabel(C,h,'FontSize',15,'Color','r')
%    clabel(C,h,'FontWeight','bold')
%    clabel(C,h)
%    colorbar(); 
%    h.LineWidth = 2;
    box on
    hold off
%    set(gca,'YTick',[-5:0])
    txt = '(f) OM burial';
    text(0.03,0.92,txt,'FontSize',22,'Units','normalized', 'FontWeight', 'bold')
    xlabel ({'ksulf (10^x)'}); %;'(\mumol cm^{-2}yr^{-1})'})
    ylabel('e-folding depth (m)')    
%    ylabel('Ocean PO_4 \times modern')    
    print('-depsc', '6_0104_POC_burial_3to7_1xPO4_efold');

    %% Fraction preserved:
    figure;
    hold on
    [C,h] = contourf(ksulf,PO4,POC_burial_data./POC_rain_data);
%    clabel(C,h,'LineStyle','--')
    clabel(C,h,'FontSize',16);
%    clabel(C,h,'FontSize',15,'Color','r')
%    clabel(C,h,'FontWeight','bold')
%    clabel(C,h)
%    colorbar(); 
%    h.LineWidth = 2;
    box on
    hold off
%    set(gca,'YTick',[-5:0])
    txt = '(g) OM fraction preserved';
    text(0.03,0.92,txt,'FontSize',22,'Units','normalized', 'FontWeight', 'bold')
    xlabel ({'ksulf (10^x)'}); %;'(\mumol cm^{-2}yr^{-1})'})
    ylabel('e-folding depth (m)')    
%    ylabel('Ocean PO_4 \times modern')    
    print('-depsc', '7_1903POC_fraction_preserved_3to7_1xPO4_efold');

end
