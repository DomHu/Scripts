cc = jet(8);

%% O2 profiles
if(true)
% load H2S data
No_Sulf_60 = load(fullfile('.', 'O2-endPermGlobal_elength60.PROFILE.190717.res'));
No_Sulf_100 = load(fullfile('.', 'O2-endPermGlobal_elength100.PROFILE.190717.res'));
No_Sulf_200 = load(fullfile('.', 'O2-endPermGlobal_elength200.PROFILE.190717.res'));
No_Sulf_300 = load(fullfile('.', 'O2-endPermGlobal_elength300.PROFILE.190717.res'));
No_Sulf_400 = load(fullfile('.', 'O2-endPermGlobal_elength400.PROFILE.190717.res'));
No_Sulf_500 = load(fullfile('.', 'O2-endPermGlobal_elength500.PROFILE.190717.res'));
No_Sulf_590 = load(fullfile('.', 'O2-endPermGlobal_elength590.PROFILE.190717.res'));
No_Sulf_590_OAE = load(fullfile('.', 'O2-OAE2GlobalREF.PROFILE.190717.res'));

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

%%%% Pre - Atlantik

figure
box on
hold on;
% no sulf
plot(No_Sulf_60(:,2),-No_Sulf_60(:,1)/1000,'color',cc(1,:));
plot(No_Sulf_100(:,2),-No_Sulf_100(:,1)/1000,'color',cc(2,:));
plot(No_Sulf_200(:,2),-No_Sulf_200(:,1)/1000,'color',cc(3,:));
plot(No_Sulf_300(:,2),-No_Sulf_300(:,1)/1000,'color',cc(4,:));
plot(No_Sulf_400(:,2),-No_Sulf_400(:,1)/1000,'color',cc(5,:));
plot(No_Sulf_500(:,2),-No_Sulf_500(:,1)/1000,'color',cc(6,:));
plot(No_Sulf_590(:,2),-No_Sulf_590(:,1)/1000,'color',cc(7,:)); % Dominik: plot here different profiles (line)
plot(No_Sulf_590_OAE(:,2),-No_Sulf_590_OAE(:,1)/1000,'k--'); % Dominik: plot here different profiles (line)

scatter(No_Sulf_590_OAE(:,2),-No_Sulf_590_OAE(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
scatter(No_Sulf_590(:,2),-No_Sulf_590(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
scatter(No_Sulf_500(:,2),-No_Sulf_500(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
scatter(No_Sulf_400(:,2),-No_Sulf_400(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
scatter(No_Sulf_300(:,2),-No_Sulf_300(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
scatter(No_Sulf_200(:,2),-No_Sulf_200(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
scatter(No_Sulf_100(:,2),-No_Sulf_100(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
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


xlim([0 250])
%ylim([-5.0 0.0])%xlabel(strrep(dataid_1,'_','-'));
xlabel({'O_2 (\mumol kg^{-1})'});
%xlabel('POC flux (mol m^{-2}yr^{-1}) ');
ylabel('Depth (km)');
hleg=legend('60m', '100m', '200m', '300m', '400m', '500m', '590m', '590m (OAE2)'); 
set(hleg,'FontSize',12);
set(hleg,'Location','SouthWest');

print('-depsc', '1607_O2_profiles_no_sulf_wOAE2');
end

%% H2S profiles
if(true)
% load H2S data
No_Sulf_60 = load(fullfile('.', '2PO4_nosulf_60efold.PROFILE.190326.res'));
No_Sulf_100 = load(fullfile('.', '2PO4_nosulf_100efold.PROFILE.190327.res'));
No_Sulf_200 = load(fullfile('.', '2PO4_nosulf_200efold.PROFILE.190327.res'));
No_Sulf_300 = load(fullfile('.', '2PO4_nosulf_300efold.PROFILE.190327.res'));
No_Sulf_400 = load(fullfile('.', '2PO4_nosulf_400efold.PROFILE.190327.res'));
No_Sulf_500 = load(fullfile('.', '2PO4_nosulf_500efold.PROFILE.190327.res'));
No_Sulf_590 = load(fullfile('.', '2PO4_nosulf_590efold.PROFILE.190326.res'));
No_Sulf_590_OAE = load(fullfile('.', 'OAE2 Global REF.PROFILE.190716.res'));

% With sulf
SulfE7_60 = load(fullfile('.', '2PO4_sulfE5_60efold.PROFILE.190327.res'));
SulfE7_100 = load(fullfile('.', '2PO4_sulfE5_100efold.PROFILE.190327.res'));
SulfE7_200 = load(fullfile('.', '2PO4_sulfE5_200efold.PROFILE.190327.res'));
SulfE7_300 = load(fullfile('.', '2PO4_sulfE5_300efold.PROFILE.190327.res'));
SulfE7_400 = load(fullfile('.', '2PO4_sulfE5_400efold.PROFILE.190327.res'));
SulfE7_500 = load(fullfile('.', '2PO4_sulfE5_500efold.PROFILE.190327.res'));
SulfE7_590 = load(fullfile('.', '2PO4_sulfE5_590efold.PROFILE.190327.res'));

set(0,'defaultLineLineWidth', 2)
set(0,'DefaultAxesFontSize',20)

%%%% Pre - Atlantik

figure
box on
hold on;
% no sulf
plot(No_Sulf_60(:,2),-No_Sulf_60(:,1)/1000,'color',cc(1,:));
plot(No_Sulf_100(:,2),-No_Sulf_100(:,1)/1000,'color',cc(2,:));
plot(No_Sulf_200(:,2),-No_Sulf_200(:,1)/1000,'color',cc(3,:));
plot(No_Sulf_300(:,2),-No_Sulf_300(:,1)/1000,'color',cc(4,:));
plot(No_Sulf_400(:,2),-No_Sulf_400(:,1)/1000,'color',cc(5,:));
plot(No_Sulf_500(:,2),-No_Sulf_500(:,1)/1000,'color',cc(6,:));
plot(No_Sulf_590(:,2),-No_Sulf_590(:,1)/1000,'color',cc(7,:)); % Dominik: plot here different profiles (line)
plot(No_Sulf_590_OAE(:,2),-No_Sulf_590_OAE(:,1)/1000,'k--'); % Dominik: plot here different profiles (line)

scatter(No_Sulf_590_OAE(:,2),-No_Sulf_590_OAE(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
scatter(No_Sulf_590(:,2),-No_Sulf_590(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
scatter(No_Sulf_500(:,2),-No_Sulf_500(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
scatter(No_Sulf_400(:,2),-No_Sulf_400(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
scatter(No_Sulf_300(:,2),-No_Sulf_300(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
scatter(No_Sulf_200(:,2),-No_Sulf_200(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
scatter(No_Sulf_100(:,2),-No_Sulf_100(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
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


xlim([0 80])
%ylim([-5.0 0.0])%xlabel(strrep(dataid_1,'_','-'));
xlabel({'H_2S (\mumol kg^{-1})'});
%xlabel('POC flux (mol m^{-2}yr^{-1}) ');
ylabel('Depth (km)');
hleg=legend('60m', '100m', '200m', '300m', '400m', '500m', '590m', '590m (OAE2)'); 
set(hleg,'FontSize',12);
set(hleg,'Location','SouthWest');

print('-depsc', '1607_H2S_profiles_no_sulf_wOAE2');
end