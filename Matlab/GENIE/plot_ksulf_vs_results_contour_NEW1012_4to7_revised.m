function plot_ksulf_vs_results_contour_NEW1012_4to7_revised()

    % load data

    set(0,'defaultAxesFontSize',16)
    

	PO4 = [1.0:0.2:2.0];
	ksulf = [4 5 6 7];
    
%    data_all=xlsread('../POC_burial.xlsx','Geology_data','B102:K137'); % Data for 1st submission
    data_all=xlsread('../Experiment_end-Permian.xlsx','Exps1902+2202','B29:L58');
 

    O2_data = xlsread('../Experiment_end-Permian.xlsx','Exps1902+2202','D65:G70');
    H2S_data = xlsread('../Experiment_end-Permian.xlsx','Exps1902+2202','D76:G81');

    POC_exp_data = xlsread('../Experiment_end-Permian.xlsx','Exps1902+2202','D86:G91');
    POC_rain_data = xlsread('../Experiment_end-Permian.xlsx','Exps1902+2202','D96:G101');
    POC_burial_data = xlsread('../Experiment_end-Permian.xlsx','Exps1902+2202','D106:G111');
    
    H2S_emission_data = xlsread('../Experiment_end-Permian.xlsx','Exps1902+2202','D116:G121');
    
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
    ylabel('Ocean PO_4 \times modern')    
    print('-depsc', '1_1902_MeanO2_4to7');
    
    
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
    ylabel('Ocean PO_4 \times modern')    
    print('-depsc', '2_1902_MeanH2S_4to7');

    
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
    ylabel('Ocean PO_4 \times modern')    
    print('-depsc', '3_1902_H2SEmission_4to7');

       
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
    ylabel('Ocean PO_4 \times modern')    
    print('-depsc', '4_1902_POC_exp_4to7');

    
    
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
    ylabel('Ocean PO_4 \times modern')    
    print('-depsc', '5_1902_POC_rain_4to7');    
     
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
    ylabel('Ocean PO_4 \times modern')    
    print('-depsc', '6_1012_POC_burial_4to7');

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
    ylabel('Ocean PO_4 \times modern')    
    print('-depsc', '7_1012_POC_fraction_preserved_4to7');

