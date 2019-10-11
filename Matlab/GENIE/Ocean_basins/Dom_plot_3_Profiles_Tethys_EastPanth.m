
cc = jet(3);


%% pH profiles
% load H2S data Tethys
No_Sulf_100 = load(fullfile('.', '1309_pH_profiles/1903_01_2xPO4_efold100_pH_EastPanth.PROFILE.190913.res'));
No_Sulf_200 = load(fullfile('.', '1309_pH_profiles/1203_19_2xPO4_efold200_pH_EastPanth.PROFILE.190913.res'));
No_Sulf_300 = load(fullfile('.', '1309_pH_profiles/1903_06_2xPO4_efold300_pH_EastPanth.PROFILE.190913.res'));

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
hold on;
box on
% no sulf
plot(No_Sulf_100(:,2),-No_Sulf_100(:,1)/1000,'color',cc(1,:));
plot(No_Sulf_200(:,2),-No_Sulf_200(:,1)/1000,'color',cc(2,:));
plot(No_Sulf_300(:,2),-No_Sulf_300(:,1)/1000,'color',cc(3,:));

scatter(No_Sulf_300(:,2),-No_Sulf_300(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
scatter(No_Sulf_200(:,2),-No_Sulf_200(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
scatter(No_Sulf_100(:,2),-No_Sulf_100(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)

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


% xlim([0 100])
%ylim([-5.0 0.0])%xlabel(strrep(dataid_1,'_','-'));
% xlabel({'H_2S (\mumol kg^{-1})'});
xlabel({'pH'});
%xlabel('POC flux (mol m^{-2}yr^{-1}) ');
ylabel('Depth (km)');
hleg=legend('100m', '200m', '300m'); 
set(hleg,'FontSize',12);
set(hleg,'Location','SouthEast');

print('-depsc', './1309_pH_profiles/2xPO4_EastPanth_pH_profiles_100200300');
