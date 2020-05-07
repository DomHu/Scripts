function [STATM] = Dom_plot_5_d13C_Profiles(PEXP1,PEXP2,PEXP3,PEXP4,PEXP5,PNAME)

cc = jet(5);


%% H2S profiles
Exp1 = load(fullfile('.', PEXP1));
Exp2 = load(fullfile('.', PEXP2));
Exp3 = load(fullfile('.', PEXP3));
Exp4 = load(fullfile('.', PEXP4));
Exp5 = load(fullfile('.', PEXP5));

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
plot(Exp1(:,2),-Exp1(:,1)/1000,'color',cc(1,:));
plot(Exp2(:,2),-Exp2(:,1)/1000,'color',cc(2,:));
plot(Exp3(:,2),-Exp3(:,1)/1000,'color',cc(3,:));
plot(Exp4(:,2),-Exp4(:,1)/1000,'color',cc(4,:));
plot(Exp5(:,2),-Exp5(:,1)/1000,'color',cc(5,:));

scatter(Exp5(:,2),-Exp5(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
scatter(Exp4(:,2),-Exp4(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
scatter(Exp3(:,2),-Exp3(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
scatter(Exp2(:,2),-Exp2(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
scatter(Exp1(:,2),-Exp1(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)

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

xlim([-5.0 2.0])
ylim([-1.0 0.0])
% xlim([0.0 200.0])
%ylim([-5.0 0.0])%xlabel(strrep(dataid_1,'_','-'));
%xlabel({'\delta^{13}C ()'});
xlabel(['\delta^{13}C (',char(8240),')'])
% xlabel({'O_2 (\mumol kg^{-1})'});
%xlabel({'H_2S (\mumol kg^{-1})'});
%xlabel('POC flux (mol m^{-2}yr^{-1}) ');
ylabel('Depth (km)');
% hleg=legend('1 x CO2', '5 x CO2', '10 x CO2', '15 x CO2', '20 x CO2'); 
% hleg=legend('Pre-extinction', 'Start-extinction', 'Peak-extinction', 'Peak-extinction warm'); 
% set(hleg,'FontSize',12);
% set(hleg,'Location','SouthEast');

%print('-depsc', './2307_PLOTS_H2Sprofiles/2307_1xPO4_Tethys_H2S_profiles_60200300');
print('-depsc', [PNAME '.eps']);
