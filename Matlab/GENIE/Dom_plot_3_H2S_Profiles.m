function [STATM] = Dom_plot_3_H2S_Profiles(PEXP1,PEXP2,PEXP3,PNAME)

cc = jet(3);


%% H2S profiles
% load H2S data Tethys
% No_Sulf_60 = load(fullfile('.', '2307_PLOTS_H2Sprofiles/1xPO4_elength60_H2S_Tethys_nosulf.PROFILE.190723.res'));
% No_Sulf_200 = load(fullfile('.', '2307_PLOTS_H2Sprofiles/1xPO4_elength200_H2S_Tethys_nosulf.PROFILE.190723.res'));
% No_Sulf_300 = load(fullfile('.', '2307_PLOTS_H2Sprofiles/1xPO4_elength300_H2S_Tethys_nosulf.PROFILE.190723.res'));
No_Sulf_60 = load(fullfile('.', PEXP1));
No_Sulf_200 = load(fullfile('.', PEXP2));
No_Sulf_300 = load(fullfile('.', PEXP3));

% % With sulf
% SulfE7_60 = load(fullfile('.', '2PO4_sulfE5_60efold.PROFILE.190327.res'));
% SulfE7_100 = load(fullfile('.', '2PO4_sulfE5_100efold.PROFILE.190327.res'));
% SulfE7_200 = load(fullfile('.', '2PO4_sulfE5_200efold.PROFILE.190327.res'));
% SulfE7_300 = load(fullfile('.', '2PO4_sulfE5_300efold.PROFILE.190327.res'));
% SulfE7_400 = load(fullfile('.', '2PO4_sulfE5_400efold.PROFILE.190327.res'));
% SulfE7_500 = load(fullfile('.', '2PO4_sulfE5_500efold.PROFILE.190327.res'));
% SulfE7_590 = load(fullfile('.', '2PO4_sulfE5_590efold.PROFILE.190327.res'));

set(0,'defaultLineLineWidth', 2)
set(0,'DefaultAxesFontSize',20)

figure
box on;
hold on;
% no sulf
plot(No_Sulf_60(:,2),-No_Sulf_60(:,1)/1000,'color',cc(1,:));
plot(No_Sulf_200(:,2),-No_Sulf_200(:,1)/1000,'color',cc(2,:));
plot(No_Sulf_300(:,2),-No_Sulf_300(:,1)/1000,'color',cc(3,:));

scatter(No_Sulf_300(:,2),-No_Sulf_300(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
scatter(No_Sulf_200(:,2),-No_Sulf_200(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
scatter(No_Sulf_60(:,2),-No_Sulf_60(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)

% % with sulf
% plot(SulfE7_60(:,2),-SulfE7_60(:,1)/1000,'--','color',cc(1,:));
% plot(SulfE7_100(:,2),-SulfE7_100(:,1)/1000,'--','color',cc(2,:));
% plot(SulfE7_200(:,2),-SulfE7_200(:,1)/1000,'--','color',cc(3,:));
% plot(SulfE7_300(:,2),-SulfE7_300(:,1)/1000,'--','color',cc(4,:));
% plot(SulfE7_400(:,2),-SulfE7_400(:,1)/1000,'--','color',cc(5,:));
% plot(SulfE7_500(:,2),-SulfE7_500(:,1)/1000,'--','color',cc(6,:));
% plot(SulfE7_590(:,2),-SulfE7_590(:,1)/1000,'--','color',cc(7,:)); % Dominik: plot here different profiles (line)
% 
% scatter(SulfE7_590(:,2),-SulfE7_590(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
% scatter(SulfE7_500(:,2),-SulfE7_500(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
% scatter(SulfE7_400(:,2),-SulfE7_400(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
% scatter(SulfE7_300(:,2),-SulfE7_300(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
% scatter(SulfE7_200(:,2),-SulfE7_200(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
% scatter(SulfE7_100(:,2),-SulfE7_100(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
% scatter(SulfE7_60(:,2),-SulfE7_60(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)

% xlim([-5.0 2.0])
 xlim([0.0 60.0])
%ylim([-5.0 0.0])%xlabel(strrep(dataid_1,'_','-'));
%xlabel({'\delta^{13}C ()'});
% xlabel(['\delta^{13}C (',char(8240),')'])
% xlabel({'O_2 (\mumol kg^{-1})'});
xlabel({'H_2S (\mumol kg^{-1})'});
%xlabel('POC flux (mol m^{-2}yr^{-1}) ');
ylabel('Depth (km)');
% hleg=legend('60m', '200m', '300m'); 
hleg=legend('ksulf = 0', 'ksulf = E5 old', 'ksulf = E5 new'); 
set(hleg,'FontSize',12);
set(hleg,'Location','SouthEast');

%print('-depsc', './2307_PLOTS_H2Sprofiles/2307_1xPO4_Tethys_H2S_profiles_60200300');
print('-depsc', PNAME);
