function [] = plot_time_series_subplots_1SPIN_2Exps(PEXP_SPIN, PEXP1_OPEN, PEXP2_OPEN, PNAME_SPIN, PNAME_OPEN1, PNAME_OPEN2, FILENAME)
% plot time-series
%clear all;

% plot mean (true) or total (false)
plot_mean = true;

% set SPIN experiment years
years_SPIN = 200000;
years_SPIN_plot = 100000;


% set experiment 

exp_SPIN = ['./cgenie_output/' PEXP_SPIN];   
exp_1_OPEN = ['./cgenie_output/' PEXP1_OPEN];   
exp_2_OPEN = ['./cgenie_output/' PEXP2_OPEN];

% %%%% load other data

%% overturning
REF_misc_opsi_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_misc_opsi.res'),'ascii');
REF_misc_opsi_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_misc_opsi.res'),'ascii');
REF_misc_opsi_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_misc_opsi.res'),'ascii');


REF_sed_O2_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_O2.res'),'ascii');
REF_sed_O2_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_O2.res'),'ascii');
REF_sed_O2_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_O2.res'),'ascii');

REF_sed_SO4_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_SO4.res'),'ascii');
REF_sed_SO4_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_SO4.res'),'ascii');
REF_sed_SO4_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_SO4.res'),'ascii');

REF_sed_H2S_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_H2S.res'),'ascii');
REF_sed_H2S_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_H2S.res'),'ascii');
REF_sed_H2S_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_H2S.res'),'ascii');

REF_sed_PO4_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_PO4.res'),'ascii');
REF_sed_PO4_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_PO4.res'),'ascii');
REF_sed_PO4_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_PO4.res'),'ascii');

REF_sed_ALK_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_ALK.res'),'ascii');
REF_sed_ALK_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_ALK.res'),'ascii');
REF_sed_ALK_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_ALK.res'),'ascii');

REF_sed_DIC_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_DIC.res'),'ascii');
REF_sed_DIC_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_DIC.res'),'ascii');
REF_sed_DIC_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_DIC.res'),'ascii');

REF_sed_DIC_13C_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_DIC_13C.res'),'ascii');
REF_sed_DIC_13C_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_DIC_13C.res'),'ascii');
REF_sed_DIC_13C_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_DIC_13C.res'),'ascii');

REF_sed_pCO2_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_atm_pCO2.res'),'ascii');
REF_sed_pCO2_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_atm_pCO2.res'),'ascii');
REF_sed_pCO2_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_atm_pCO2.res'),'ascii');

REF_sed_pO2_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_atm_pO2.res'),'ascii');
REF_sed_pO2_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_atm_pO2.res'),'ascii');
REF_sed_pO2_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_atm_pO2.res'),'ascii');

% atm temp:
REF_atm_tmp_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_atm_temp.res'),'ascii');
REF_atm_tmp_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_atm_temp.res'),'ascii');
REF_atm_tmp_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_atm_temp.res'),'ascii');

% ocn temp:
REF_ocn_tmp_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_ocn_temp.res'),'ascii');
REF_ocn_tmp_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_ocn_temp.res'),'ascii');
REF_ocn_tmp_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_ocn_temp.res'),'ascii');

% POC export flux
REF_fexport_POC_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_fexport_POC.res'),'ascii');
REF_fexport_POC_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_fexport_POC.res'),'ascii');
REF_fexport_POC_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_fexport_POC.res'),'ascii');

% CaCO3 ocean - sediment
REF_focnsed_CaCO3_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_focnsed_CaCO3.res'),'ascii');
REF_focnsed_CaCO3_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_focnsed_CaCO3.res'),'ascii');
REF_focnsed_CaCO3_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_focnsed_CaCO3.res'),'ascii');

% mean CaCO3 wt%
REF_mean_CaCO3_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_sed_CaCO3.res'),'ascii');
REF_mean_CaCO3_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_sed_CaCO3.res'),'ascii');
REF_mean_CaCO3_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_sed_CaCO3.res'),'ascii');

%% input to calculate POC burial:
REF_focnsed_POC_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_focnsed_POC.res'),'ascii');
REF_focnsed_POC_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_focnsed_POC.res'),'ascii');
REF_focnsed_POC_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_focnsed_POC.res'),'ascii');


REF_fsedocn_DIC_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_fsedocn_DIC.res'),'ascii');
REF_fsedocn_DIC_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_fsedocn_DIC.res'),'ascii');
REF_fsedocn_DIC_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_fsedocn_DIC.res'),'ascii');


REF_fsedocn_Ca_exp1 = load(fullfile(exp_SPIN,'/biogem/biogem_series_fsedocn_Ca.res'),'ascii');
REF_fsedocn_Ca_exp2 = load(fullfile(exp_1_OPEN,'/biogem/biogem_series_fsedocn_Ca.res'),'ascii');
REF_fsedocn_Ca_exp3 = load(fullfile(exp_2_OPEN,'/biogem/biogem_series_fsedocn_Ca.res'),'ascii');

% calculate POC burial & convert from mol/yr to PgC/yr  (i.e. *12/10^15): 
REF_POC_burial_exp1 = REF_focnsed_POC_exp1;
REF_POC_burial_exp2 = REF_focnsed_POC_exp2;
REF_POC_burial_exp3 = REF_focnsed_POC_exp3;

REF_POC_burial_exp1(:,2) = (REF_focnsed_POC_exp1(:,2) - (REF_fsedocn_DIC_exp1(:,2)-REF_fsedocn_Ca_exp1(:,2))).*12.*1e-15;
REF_POC_burial_exp2(:,2) = (REF_focnsed_POC_exp2(:,2) - (REF_fsedocn_DIC_exp2(:,2)-REF_fsedocn_Ca_exp2(:,2))).*12.*1e-15;
REF_POC_burial_exp3(:,2) = (REF_focnsed_POC_exp3(:,2) - (REF_fsedocn_DIC_exp3(:,2)-REF_fsedocn_Ca_exp3(:,2))).*12.*1e-15;

% calculate C-burial in CaCO3 & convert from mol/yr to PgC/yr  (i.e. *12/10^15):
REF_CaCO3_burial_exp1 = REF_focnsed_CaCO3_exp1;
REF_CaCO3_burial_exp2 = REF_focnsed_CaCO3_exp2;
REF_CaCO3_burial_exp3 = REF_focnsed_CaCO3_exp3;

REF_CaCO3_burial_exp1(:,2) = (REF_focnsed_CaCO3_exp1(:,2)-REF_fsedocn_Ca_exp1(:,2)).*12.*1e-15;
REF_CaCO3_burial_exp2(:,2) = (REF_focnsed_CaCO3_exp2(:,2)-REF_fsedocn_Ca_exp2(:,2)).*12.*1e-15;
REF_CaCO3_burial_exp3(:,2) = (REF_focnsed_CaCO3_exp3(:,2)-REF_fsedocn_Ca_exp3(:,2)).*12.*1e-15;


% calculate length up experiments
time_exps = REF_misc_opsi_exp2(end,1);
xaxis_lim = years_SPIN + time_exps;


%% split in three figures:
if(true)
set(0,'defaultLineLineWidth', 2)
set(0,'DefaultAxesFontSize',10)

%%
fig1=figure;
grid on
hold on

% atm temp.
subplot(3, 2, 1)
plot(REF_atm_tmp_exp1(:,1),REF_atm_tmp_exp1(:,2),'k', ...
    REF_atm_tmp_exp2(:,1)+years_SPIN,REF_atm_tmp_exp2(:,2),'k--',  ...
    REF_atm_tmp_exp3(:,1)+years_SPIN,REF_atm_tmp_exp3(:,2),'r:'); 
ylabel({'Mean air'; 'temp (°C)'});
    xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
% ylim([0 20]);

% atm. CO2
subplot(3, 2, 2)
plot(REF_sed_pCO2_exp1(:,1),REF_sed_pCO2_exp1(:,3)*1e+6,'k', ...
    REF_sed_pCO2_exp2(:,1)+years_SPIN,REF_sed_pCO2_exp2(:,3)*1e+6,'k--',  ...
    REF_sed_pCO2_exp3(:,1)+years_SPIN,REF_sed_pCO2_exp3(:,3)*1e+6,'r:'); 
ylabel({'pCO2'; '(ppm)'});
    xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
% ylim([1000 1200])


% global min overturning (Sv)
subplot(3, 2, 3)
plot(REF_misc_opsi_exp1(:,1),REF_misc_opsi_exp1(:,2),'k', ...
    REF_misc_opsi_exp2(:,1)+years_SPIN,REF_misc_opsi_exp2(:,2),'k--',  ...
    REF_misc_opsi_exp3(:,1)+years_SPIN,REF_misc_opsi_exp3(:,2),'r:'); 
ylabel({'global min'; 'overturn (Sv)'});
    xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
% ylim([-45 -40])

% atm. O2
subplot(3, 2, 4)
plot(REF_sed_pO2_exp1(:,1),REF_sed_pO2_exp1(:,3),'k', ...
    REF_sed_pO2_exp2(:,1)+years_SPIN,REF_sed_pO2_exp2(:,3),'k--',  ...
    REF_sed_pO2_exp3(:,1)+years_SPIN,REF_sed_pO2_exp3(:,3),'r:'); 
%xlabel('years ');
ylabel({'pO2'; '(atm)'});
    xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
% ylim([0.2 0.22])


% PO4
subplot(3,2,5)
if(plot_mean) % mean (mol/kg)
    plot(REF_sed_PO4_exp1(:,1),REF_sed_PO4_exp1(:,3)*1e+6,'k', ...
         REF_sed_PO4_exp2(:,1)+years_SPIN,REF_sed_PO4_exp2(:,3)*1e+6,'k--',  ...
         REF_sed_PO4_exp3(:,1)+years_SPIN,REF_sed_PO4_exp3(:,3)*1e+6,'r:'); 
         ylabel({'PO_4'; '(\mumol kg^{-1})'});
%        ylabel('(\mumol kg^{-1})');
else % total (mol)
    plot(REF_sed_PO4_exp1(:,1),REF_sed_PO4_exp1(:,2),'k',...
        REF_sed_PO4_exp2(:,1)+years_SPIN,REF_sed_PO4_exp2(:,2),'k--', ...
        REF_sed_PO4_exp3(:,1)+years_SPIN,REF_sed_PO4_exp3(:,2),'r:')
    ylabel('PO_4 (mol)');
end
% set(gca,'xticklabel',{[]})
    xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
hleg=legend(PNAME_SPIN, ...
    PNAME_OPEN1, ...
    PNAME_OPEN2); 
set(hleg,'FontSize',8);
set(hleg,'Location','SouthWest');

subplot(3,2, 6)
plot(REF_sed_DIC_13C_exp1(:,1),REF_sed_DIC_13C_exp1(:,3),'k',  ...
    REF_sed_DIC_13C_exp2(:,1)+years_SPIN,REF_sed_DIC_13C_exp2(:,3),'k--',  ...
    REF_sed_DIC_13C_exp3(:,1)+years_SPIN,REF_sed_DIC_13C_exp3(:,3),'r:'); 
%xlabel('years ');
ylabel({'global DIC 13C'; 'permil'});
    xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 


if(plot_mean)  % mean (mol/kg)
    print(fig1, '-depsc', ['PLOTS/' FILENAME '_1BC_wSPIN']);
else
    print(fig1, '-depsc', ['PLOTS/' FILENAME '_1BC_total']);
end


%%
fig2=figure;
grid on
hold on

% global POC export flux (PgC yr-1) 
subplot(3, 2, 1)
plot(REF_fexport_POC_exp1(:,1),REF_fexport_POC_exp1(:,2)*12*1e-15,'k', ...
    REF_fexport_POC_exp2(:,1)+years_SPIN,REF_fexport_POC_exp2(:,2)*12*1e-15,'k--',  ...
    REF_fexport_POC_exp3(:,1)+years_SPIN,REF_fexport_POC_exp3(:,2)*12*1e-15,'r:'); 
ylabel({'global POC'; 'export (PgC yr-1)'});
    xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 


% mean CaCO3 wt%
subplot(3,2, 2)
plot(REF_mean_CaCO3_exp1(:,1),REF_mean_CaCO3_exp1(:,2),'k', ...
    REF_mean_CaCO3_exp2(:,1)+years_SPIN,REF_mean_CaCO3_exp2(:,2),'k--', ...
    REF_mean_CaCO3_exp3(:,1)+years_SPIN,REF_mean_CaCO3_exp3(:,2),'r:');
ylabel({'Mean CaCO_3'; '(wt%)'});
    xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 


% POC depositional flux
subplot(3, 2, 3)
    plot(REF_focnsed_POC_exp1(:,1),REF_focnsed_POC_exp1(:,2)*12*1e-15,'k', ...
         REF_focnsed_POC_exp2(:,1)+years_SPIN,REF_focnsed_POC_exp2(:,2)*12*1e-15,'k--', ...
         REF_focnsed_POC_exp3(:,1)+years_SPIN,REF_focnsed_POC_exp3(:,2)*12*1e-15,'r:'); 
        ylabel({'POC deposition'; '(PgC yr^{-1})'});

    xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 


% focnsed_CaCO3
subplot(3,2, 4)
    plot(REF_focnsed_CaCO3_exp1(:,1),REF_focnsed_CaCO3_exp1(:,2)*12*1e-15,'k', ...
         REF_focnsed_CaCO3_exp2(:,1)+years_SPIN,REF_focnsed_CaCO3_exp2(:,2)*12*1e-15,'k--', ...
         REF_focnsed_CaCO3_exp3(:,1)+years_SPIN,REF_focnsed_CaCO3_exp3(:,2)*12*1e-15,'r:'); 
        ylabel({'CaCO3 deposition'; '(PgC yr^{-1})'});

    xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 

% POC burial 
subplot(3,2, 5)
plot(REF_POC_burial_exp1(:,1),REF_POC_burial_exp1(:,2),'k', ...
    REF_POC_burial_exp2(:,1)+years_SPIN,REF_POC_burial_exp2(:,2),'k--', ...
    REF_POC_burial_exp3(:,1)+years_SPIN,REF_POC_burial_exp3(:,2),'r:');
ylabel({'OM burial'; '(PgC yr^{-1})'});
    xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
% ylim([0.0 2.5])


% C burial in CaCO3
subplot(3,2, 6)
plot(REF_CaCO3_burial_exp1(:,1),REF_CaCO3_burial_exp1(:,2),'k', ...
    REF_CaCO3_burial_exp2(:,1)+years_SPIN,REF_CaCO3_burial_exp2(:,2),'k--', ...
    REF_CaCO3_burial_exp3(:,1)+years_SPIN,REF_CaCO3_burial_exp3(:,2),'r:');
ylabel({'CaCO3 burial'; '(PgC yr^{-1})'});
    xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
% ylim([0.0 2.5])
if(plot_mean)  % mean (mol/kg)
    print(fig2, '-depsc', ['PLOTS/' FILENAME '_2Ccycle']);
else
    print(fig2, '-depsc', ['PLOTS/' FILENAME '_2Ccycle_Total']);
end


%%
fig3=figure;
grid on
hold on

subplot(3,2,1)
if(plot_mean) % mean (mol/kg)
    plot(REF_sed_O2_exp1(:,1),REF_sed_O2_exp1(:,3)*1e+6,'k', ...
         REF_sed_O2_exp2(:,1)+years_SPIN,REF_sed_O2_exp2(:,3)*1e+6,'k--', ...
         REF_sed_O2_exp3(:,1)+years_SPIN,REF_sed_O2_exp3(:,3)*1e+6,'r:'); 
        ylabel({'O_2'; '(\mumol kg^{-1})'});
%        ylabel('(\mumol kg^{-1})');
else
    % total (mol)
    plot(REF_sed_O2_exp1(:,1),REF_sed_O2_exp1(:,2),'k', ...
         REF_sed_O2_exp2(:,1)+years_SPIN,REF_sed_O2_exp2(:,2),'k--', ...
         REF_sed_O2_exp3(:,1)+years_SPIN,REF_sed_O2_exp3(:,2),'r:')
     ylabel('O_2 (mol)');
end
% set(gca,'xticklabel',{[]})
    xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
% % ylim([0 50])
% set(gca,'Ytick',0:10:50)
% set(gca,'YtickLabel',{'0','10','20','30','40','50'})
%% set(gca,'Ytick',[0 25 50])
%% set(gca,'YtickLabel',{'0','25','50'})
txt = '(e)';
text(0.03,0.15,txt,'FontSize',12,'Units','normalized') 

subplot(3,2,2)
if(plot_mean)  % mean (mol/kg)
	plot(REF_sed_SO4_exp1(:,1),REF_sed_SO4_exp1(:,3)*1e+6,'k', ...
         REF_sed_SO4_exp2(:,1)+years_SPIN,REF_sed_SO4_exp2(:,3)*1e+6,'k--', ...
         REF_sed_SO4_exp3(:,1)+years_SPIN,REF_sed_SO4_exp3(:,3)*1e+6,'r:'); 
         ylabel({'SO_4'; '(\mumol kg^{-1})'});
%        ylabel('(\mumol kg^{-1})');
else    % total (mol)
    plot(REF_sed_SO4_exp1(:,1),REF_sed_SO4_exp1(:,2),'k',...
        REF_sed_SO4_exp2(:,1)+years_SPIN,REF_sed_SO4_exp2(:,2),'k--',...
        REF_sed_SO4_exp3(:,1)+years_SPIN,REF_sed_SO4_exp3(:,2),'r:')
    ylabel('SO_4 (mol)');
end
% set(gca,'xticklabel',{[]})
    xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
% % ylim([28800 29200])
% set(gca,'Ytick',28800:100:29200)
% set(gca,'YtickLabel',{'28800','','29000','','29200'})
% % set(gca,'Ytick',[28800 29000 29200])
% % set(gca,'YtickLabel',{'28800','29000','29200'})
txt = '(f)';
text(0.03,0.15,txt,'FontSize',12,'Units','normalized') 

subplot(3,2,3)
if(plot_mean) % mean (mol/kg)
	plot(REF_sed_H2S_exp1(:,1),REF_sed_H2S_exp1(:,3)*1e+6,'k', ...
         REF_sed_H2S_exp2(:,1)+years_SPIN,REF_sed_H2S_exp2(:,3)*1e+6,'k--',  ...
         REF_sed_H2S_exp3(:,1)+years_SPIN,REF_sed_H2S_exp3(:,3)*1e+6,'r:');
         ylabel({'H_2S'; '(\mumol kg^{-1})'});
%        ylabel('(\mumol kg^{-1})');
else % total (mol)
    plot(REF_sed_H2S_exp1(:,1),REF_sed_H2S_exp1(:,2),'k',...
        REF_sed_H2S_exp2(:,1)+years_SPIN,REF_sed_H2S_exp2(:,2),'k--', ...
        REF_sed_H2S_exp3(:,1)+years_SPIN,REF_sed_H2S_exp3(:,2),'r:')
    ylabel('H_2S (mol)');
end
% set(gca,'xticklabel',{[]})
    xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
% % ylim([0 50])
% set(gca,'Ytick',0:10:50)
% set(gca,'YtickLabel',{'0','10','20','30','40','50'})
% % set(gca,'Ytick',[0 25 50])
% % set(gca,'YtickLabel',{'0','25','50'})
txt = '(g)';
text(0.03,0.15,txt,'FontSize',12,'Units','normalized') 


% benthic O2
subplot(3, 2, 4)
    plot(REF_sed_O2_exp1(:,1),REF_sed_O2_exp1(:,5)*1e+6,'k', ...
         REF_sed_O2_exp2(:,1)+years_SPIN,REF_sed_O2_exp2(:,5)*1e+6,'k--', ...
         REF_sed_O2_exp3(:,1)+years_SPIN,REF_sed_O2_exp3(:,5)*1e+6,'r:'); 
     ylabel({'ben. O_2'; '(\mumol kg^{-1})'});
    xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 
% set(gca,'Ytick',10:1:30)
% set(gca,'YtickLabel',{'10', '', '','','','15','','','','','20','','','','','25','','','','','30'})
% set(gca,'xticklabel',{[]})
txt = '(c)';
text(0.03,0.15,txt,'FontSize',12,'Units','normalized')



subplot(3,2,5)
if(plot_mean)  % mean (mol/kg)
    plot(REF_sed_ALK_exp1(:,1),REF_sed_ALK_exp1(:,3)*1e+6,'k', ...
         REF_sed_ALK_exp2(:,1)+years_SPIN,REF_sed_ALK_exp2(:,3)*1e+6,'k--',  ...
         REF_sed_ALK_exp3(:,1)+years_SPIN,REF_sed_ALK_exp3(:,3)*1e+6,'r:'); 
         ylabel({'ALK'; '(\mumol kg^{-1})'});
%       ylabel('(\mumol kg^{-1})');
else
	plot(REF_sed_ALK_exp1(:,1),REF_sed_ALK_exp1(:,2),'k',...
        REF_sed_ALK_exp2(:,1)+years_SPIN,REF_sed_ALK_exp2(:,2),'k--',...
        REF_sed_ALK_exp3(:,1)+years_SPIN,REF_sed_ALK_exp3(:,2),'r:')
     ylabel('ALK (mol)');
end
% xlabel('Time since end of spin-up (ka)');
xlabel('Time');
    xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 

subplot(3,2,6)
if(plot_mean)  % mean (mol/kg)
    plot(REF_sed_DIC_exp1(:,1),REF_sed_DIC_exp1(:,3)*1e+6,'k', ...
         REF_sed_DIC_exp2(:,1)+years_SPIN,REF_sed_DIC_exp2(:,3)*1e+6,'k--',  ...
         REF_sed_DIC_exp3(:,1)+years_SPIN,REF_sed_DIC_exp3(:,3)*1e+6,'r:'); 
         ylabel({'DIC'; '(\mumol kg^{-1})'});
%        ylabel('(\mumol kg^{-1})');
else
	plot(REF_sed_DIC_exp1(:,1),REF_sed_DIC_exp1(:,2),'k',...
        REF_sed_DIC_exp2(:,1)+years_SPIN,REF_sed_DIC_exp2(:,2),'k--', ...
        REF_sed_DIC_exp3(:,1)+years_SPIN,REF_sed_DIC_exp3(:,2),'r:')
    ylabel('DIC (mol)');
end
% xlabel('Time since end of spin-up (ka)');
xlabel('Time');
    xlim([years_SPIN-years_SPIN_plot xaxis_lim]) 

if(plot_mean)  % mean (mol/kg)
    print(fig3,'-depsc', ['PLOTS/' FILENAME '_3Biochem']);
else
    print(fig3, '-depsc', ['PLOTS/' FILENAME '_3Biochem']);
end

end



