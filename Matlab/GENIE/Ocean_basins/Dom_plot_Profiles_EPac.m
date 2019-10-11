function[]=Dom_plot_Profiles_EPac()


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% EPac
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% PRE

% load H2S data
No_Sulf_H2S = load(fullfile('.', 'cgenie_output','0_PLOTS','2509_plots','PROFILES','BASINS','EPac', '2509_08_p0093k.2P4pCO2_With_OMEN_No_sulf_k2_1e-5_anoxic.y9999.5.ocn_H2S.mask_OAE2_EPac_1910.csv.PROFILE.171021.res'));
SulfE5_H2S = load(fullfile('.', 'cgenie_output','0_PLOTS','2509_plots','PROFILES','BASINS','EPac', '2909_04_p0093k.2P4pCO2_With_OMEN_withSulf_10E+5_sulf_k2_1e-5_anoxic.y9999.5.ocn_H2S.mask_OAE2_EPac_1910.csv.PROFILE.171021.res'));
SulfE6_H2S =  load(fullfile('.', 'cgenie_output','0_PLOTS','2509_plots','PROFILES','BASINS','EPac', '2909_05_p0093k.2P4pCO2_With_OMEN_withSulf_10E+6_sulf_k2_1e-5_anoxic.y9999.5.ocn_H2S.mask_OAE2_EPac_1910.csv.PROFILE.171021.res'));
SulfE7_H2S = load(fullfile('.', 'cgenie_output','0_PLOTS','2509_plots','PROFILES','BASINS','EPac', '2909_06_p0093k.2P4pCO2_With_OMEN_withSulf_O2ana_sulf_k2_1e-5_anoxic.y9999.5.ocn_H2S.mask_OAE2_EPac_1910.csv.PROFILE.171021.res'));

% load POC data
No_Sulf_POC = load(fullfile('.', 'cgenie_output','0_PLOTS','2509_plots','PROFILES','BASINS','EPac', '2509_08_p0093k.2P4pCO2_With_OMEN_No_sulf_k2_1e-5_anoxic.y9999.5.bio_fpart_POC.mask_OAE2_EPac_1910.csv.PROFILE.171021.res'));
Sulf_E5_POC = load(fullfile('.', 'cgenie_output','0_PLOTS','2509_plots','PROFILES','BASINS','EPac', '2909_04_p0093k.2P4pCO2_With_OMEN_withSulf_10E+5_sulf_k2_1e-5_anoxic.y9999.5.bio_fpart_POC.mask_OAE2_EPac_1910.csv.PROFILE.171021.res'));
Sulf_E6_POC =  load(fullfile('.', 'cgenie_output','0_PLOTS','2509_plots','PROFILES','BASINS','EPac', '2909_05_p0093k.2P4pCO2_With_OMEN_withSulf_10E+6_sulf_k2_1e-5_anoxic.y9999.5.bio_fpart_POC.mask_OAE2_EPac_1910.csv.PROFILE.171021.res'));
Sulf_E7_POC = load(fullfile('.', 'cgenie_output','0_PLOTS','2509_plots','PROFILES','BASINS','EPac', '2909_06_p0093k.2P4pCO2_With_OMEN_withSulf_O2ana_sulf_k2_1e-5_anoxic.y9999.5.bio_fpart_POC.mask_OAE2_EPac_1910.csv.PROFILE.171021.res'));

% load POM_S data
No_Sulf_POM_S = load(fullfile('.', 'cgenie_output','0_PLOTS','2509_plots','PROFILES','BASINS','EPac', '2509_08_p0093k.2P4pCO2_With_OMEN_No_sulf_k2_1e-5_anoxic.y9999.5.bio_fpart_POM_S.mask_OAE2_EPac_1910.csv.PROFILE.171021.res'));
Sulf_E5_POM_S = load(fullfile('.', 'cgenie_output','0_PLOTS','2509_plots','PROFILES','BASINS','EPac', '2909_04_p0093k.2P4pCO2_With_OMEN_withSulf_10E+5_sulf_k2_1e-5_anoxic.y9999.5.bio_fpart_POM_S.mask_OAE2_EPac_1910.csv.PROFILE.171021.res'));
Sulf_E6_POM_S = load(fullfile('.', 'cgenie_output','0_PLOTS','2509_plots','PROFILES','BASINS','EPac', '2909_05_p0093k.2P4pCO2_With_OMEN_withSulf_10E+6_sulf_k2_1e-5_anoxic.y9999.5.bio_fpart_POM_S.mask_OAE2_EPac_1910.csv.PROFILE.171021.res'));
Sulf_E7_POM_S = load(fullfile('.', 'cgenie_output','0_PLOTS','2509_plots','PROFILES','BASINS','EPac', '2909_06_p0093k.2P4pCO2_With_OMEN_withSulf_O2ana_sulf_k2_1e-5_anoxic.y9999.5.bio_fpart_POM_S.mask_OAE2_EPac_1910.csv.PROFILE.171021.res'));


if(true)

set(0,'defaultLineLineWidth', 2)
set(0,'DefaultAxesFontSize',20)

%%%% Pre - Atlantik

figure
plot(No_Sulf_H2S(:,2),-No_Sulf_H2S(:,1)/1000,'k', SulfE5_H2S(:,2),-SulfE5_H2S(:,1)/1000,'b',SulfE6_H2S(:,2),-SulfE6_H2S(:,1)/1000,'g',SulfE7_H2S(:,2),-SulfE7_H2S(:,1)/1000,'r'); % Dominik: plot here different profiles (line)
hold on;
scatter(SulfE5_H2S(:,2),-SulfE5_H2S(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
scatter(SulfE6_H2S(:,2),-SulfE6_H2S(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
scatter(SulfE7_H2S(:,2),-SulfE7_H2S(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
scatter(No_Sulf_H2S(:,2),-No_Sulf_H2S(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)

xlim([0 300])
ylim([-5.0 0.0])%xlabel(strrep(dataid_1,'_','-'));
xlabel('H_2S (\mumol kg^{-1}) ');
%xlabel('POC flux (mol m^{-2}yr^{-1}) ');
ylabel('Depth (km)');

print('-depsc', '0_Impact_Profiles_H2S_EPac');

figure
plot(No_Sulf_POC(:,2),-No_Sulf_POC(:,1)/1000,'k',Sulf_E5_POC(:,2),-Sulf_E5_POC(:,1)/1000,'b',Sulf_E6_POC(:,2),-Sulf_E6_POC(:,1)/1000,'g',Sulf_E7_POC(:,2),-Sulf_E7_POC(:,1)/1000,'r'); % Dominik: plot here different profiles (line)
hold on;
scatter(No_Sulf_POC(:,2),-No_Sulf_POC(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
scatter(Sulf_E5_POC(:,2),-Sulf_E5_POC(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
scatter(Sulf_E6_POC(:,2),-Sulf_E6_POC(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
scatter(Sulf_E7_POC(:,2),-Sulf_E7_POC(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)

xlim([0 4.0])
ylim([-5.0 0.0])%xlabel(strrep(dataid_1,'_','-'));
xlabel('POC flux (mol m^{-2}yr^{-1}) ');
ylabel('Depth (km)');

print('-depsc', '0_Sulf_Impact_Profiles_POC_EPac');



figure
plot(No_Sulf_POM_S(:,2),-No_Sulf_POM_S(:,1)/1000,'k',Sulf_E5_POM_S(:,2),-Sulf_E5_POM_S(:,1)/1000,'b',Sulf_E6_POM_S(:,2),-Sulf_E6_POM_S(:,1)/1000,'g',Sulf_E7_POM_S(:,2),-Sulf_E7_POM_S(:,1)/1000,'r'); % Dominik: plot here different profiles (line)
hold on;
scatter(No_Sulf_POM_S(:,2),-No_Sulf_POM_S(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
scatter(Sulf_E5_POM_S(:,2),-Sulf_E5_POM_S(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
scatter(Sulf_E6_POM_S(:,2),-Sulf_E6_POM_S(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
scatter(Sulf_E7_POM_S(:,2),-Sulf_E7_POM_S(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)

xlim([0 1.0])
ylim([-5.0 0.0])%xlabel(strrep(dataid_1,'_','-'));
xlabel('sulf. POC flux (mol m^{-2}yr^{-1}) ');
ylabel('Depth (km)');

print('-depsc', '0_Sulf_Impact_Profiles_POM_S_EPac');

figure
plot(No_Sulf_POM_S(:,2)./No_Sulf_POC(:,2),-No_Sulf_POM_S(:,1)/1000,'k',Sulf_E5_POM_S(:,2)./Sulf_E5_POC(:,2),-Sulf_E5_POM_S(:,1)/1000,'b',Sulf_E6_POM_S(:,2)./Sulf_E6_POC(:,2),-Sulf_E6_POM_S(:,1)/1000,'g',Sulf_E7_POM_S(:,2)./Sulf_E7_POC(:,2),-Sulf_E7_POM_S(:,1)/1000,'r'); % Dominik: plot here different profiles (line)
hold on;
scatter(No_Sulf_POM_S(:,2)./No_Sulf_POC(:,2),-No_Sulf_POM_S(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
scatter(Sulf_E5_POM_S(:,2)./Sulf_E5_POC(:,2),-Sulf_E5_POM_S(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
scatter(Sulf_E6_POM_S(:,2)./Sulf_E6_POC(:,2),-Sulf_E6_POM_S(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
scatter(Sulf_E7_POM_S(:,2)./Sulf_E7_POC(:,2),-Sulf_E7_POM_S(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)

xlim([0 1.0])
ylim([-5.0 0.0])%xlabel(strrep(dataid_1,'_','-'));
xlabel('Frac sulf. POC flux (%) ');
ylabel('Depth (km)');

print('-depsc', '0_Sulf_Impact_Profiles_FRAC_POM_S_EPac');

% %%%% Peak - Atlantik
% figure
% plot(Conservative_O2_PEAK(:,2),-Conservative_O2_PEAK(:,1)/1000,'r', Reflective_O2_PEAK(:,2),-Reflective_O2_PEAK(:,1)/1000,'k',OMEN_noPO4_O2_PEAK(:,2),-OMEN_noPO4_O2_PEAK(:,1)/1000,'b',OMEN_withPO4_O2_PEAK(:,2),-OMEN_withPO4_O2_PEAK(:,1)/1000,'g'); % Dominik: plot here different profiles (line)
% hold on;
% scatter(Reflective_O2_PEAK(:,2),-Reflective_O2_PEAK(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
% scatter(OMEN_noPO4_O2_PEAK(:,2),-OMEN_noPO4_O2_PEAK(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
% scatter(OMEN_withPO4_O2_PEAK(:,2),-OMEN_withPO4_O2_PEAK(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
% scatter(Conservative_O2_PEAK(:,2),-Conservative_O2_PEAK(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
% 
% xlim([0 250])
% ylim([-5.0 0.0])%xlabel(strrep(dataid_1,'_','-'));
% xlabel('O_2 (\mumol kg^{-1}) ');
% %xlabel('POC flux (mol m^{-2}yr^{-1}) ');
% ylabel('Depth (km)');
% 
% print('-depsc', '0_Impact_Profiles_O2_PEAK_EPac_new');
% 
% 
% figure
% plot(Conservative_H2S_PEAK(:,2),-Conservative_H2S_PEAK(:,1)/1000,'r', Reflective_H2S_PEAK(:,2),-Reflective_H2S_PEAK(:,1)/1000,'k',OMEN_noPO4_H2S_PEAK(:,2),-OMEN_noPO4_H2S_PEAK(:,1)/1000,'b',OMEN_withPO4_H2S_PEAK(:,2),-OMEN_withPO4_H2S_PEAK(:,1)/1000,'g'); % Dominik: plot here different profiles (line)
% hold on;
% scatter(Reflective_H2S_PEAK(:,2),-Reflective_H2S_PEAK(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
% scatter(OMEN_noPO4_H2S_PEAK(:,2),-OMEN_noPO4_H2S_PEAK(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
% scatter(OMEN_withPO4_H2S_PEAK(:,2),-OMEN_withPO4_H2S_PEAK(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
% scatter(Conservative_H2S_PEAK(:,2),-Conservative_H2S_PEAK(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
% 
% xlim([0 300])
% ylim([-5.0 0.0])%xlabel(strrep(dataid_1,'_','-'));
% xlabel('H_2S (\mumol kg^{-1}) ');
% %xlabel('POC flux (mol m^{-2}yr^{-1}) ');
% ylabel('Depth (km)');
% 
% print('-depsc', '0_Impact_Profiles_H2S_PEAK_EPac_new');
% 
% figure
% plot(Conservative_PO4_PEAK(:,2),-Conservative_PO4_PEAK(:,1)/1000,'r', Reflective_PO4_PEAK(:,2),-Reflective_PO4_PEAK(:,1)/1000,'k',OMEN_noPO4_PO4_PEAK(:,2),-OMEN_noPO4_PO4_PEAK(:,1)/1000,'b',OMEN_withPO4_PO4_PEAK(:,2),-OMEN_withPO4_PO4_PEAK(:,1)/1000,'g'); % Dominik: plot here different profiles (line)
% hold on;
% scatter(Reflective_PO4_PEAK(:,2),-Reflective_PO4_PEAK(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
% scatter(OMEN_noPO4_PO4_PEAK(:,2),-OMEN_noPO4_PO4_PEAK(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
% scatter(OMEN_withPO4_PO4_PEAK(:,2),-OMEN_withPO4_PO4_PEAK(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
% scatter(Conservative_PO4_PEAK(:,2),-Conservative_PO4_PEAK(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
% 
% xlim([0 10])
% ylim([-5.0 0.0])%xlabel(strrep(dataid_1,'_','-'));
% xlabel('PO_4 (\mumol kg^{-1}) ');
% %xlabel('POC flux (mol m^{-2}yr^{-1}) ');
% ylabel('Depth (km)');
% 
% print('-depsc', '0_Impact_Profiles_PO4_PEAK_EPac');


% figure
% plot(No_Sulf_POC(:,2),-No_Sulf_POC(:,1)/1000,'k',Sulf_E5_POC(:,2),-Sulf_E5_POC(:,1)/1000,'b',Sulf_E6_POC(:,2),-Sulf_E6_POC(:,1)/1000,'g',Sulf_E7_POC(:,2),-Sulf_E7_POC(:,1)/1000,'r'); % Dominik: plot here different profiles (line)
% hold on;
% scatter(No_Sulf_POC(:,2),-No_Sulf_POC(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
% scatter(Sulf_E5_POC(:,2),-Sulf_E5_POC(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
% scatter(Sulf_E6_POC(:,2),-Sulf_E6_POC(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
% scatter(Sulf_E7_POC(:,2),-Sulf_E7_POC(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
% 
% xlim([0 4.0])
% ylim([-5.0 0.0])%xlabel(strrep(dataid_1,'_','-'));
% xlabel('POC flux (mol m^{-2}yr^{-1}) ');
% ylabel('Depth (km)');
% 
% print('-depsc', '0_Sulf_Impact_Profiles_POC');
% 
% 
% 
% figure
% plot(No_Sulf_POM_S(:,2),-No_Sulf_POM_S(:,1)/1000,'k',Sulf_E5_POM_S(:,2),-Sulf_E5_POM_S(:,1)/1000,'b',Sulf_E6_POM_S(:,2),-Sulf_E6_POM_S(:,1)/1000,'g',Sulf_E7_POM_S(:,2),-Sulf_E7_POM_S(:,1)/1000,'r'); % Dominik: plot here different profiles (line)
% hold on;
% scatter(No_Sulf_POM_S(:,2),-No_Sulf_POM_S(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
% scatter(Sulf_E5_POM_S(:,2),-Sulf_E5_POM_S(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
% scatter(Sulf_E6_POM_S(:,2),-Sulf_E6_POM_S(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
% scatter(Sulf_E7_POM_S(:,2),-Sulf_E7_POM_S(:,1)/1000,30,'k'); % Dominik: plot here different profiles (circles)
% 
% xlim([0 0.3])
% ylim([-5.0 0.0])%xlabel(strrep(dataid_1,'_','-'));
% xlabel('sulf. POC flux (mol m^{-2}yr^{-1}) ');
% ylabel('Depth (km)');
% 
% print('-depsc', '0_Sulf_Impact_Profiles_POM_S');

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ALL IN ONE FIGURE
if(false)
set(0,'defaultLineLineWidth', 2)
set(0,'DefaultAxesFontSize',10)

figure

subplot(2,2,1)
plot(No_Sulf_POC(:,2),-No_Sulf_POC(:,1)/1000,'k',Sulf_E5_POC(:,2),-Sulf_E5_POC(:,1)/1000,'b',Sulf_E6_POC(:,2),-Sulf_E6_POC(:,1)/1000,'g',Sulf_E7_POC(:,2),-Sulf_E7_POC(:,1)/1000,'r'); % Dominik: plot here different profiles (line)
hold on;
scatter(No_Sulf_POC(:,2),-No_Sulf_POC(:,1)/1000,25,'k'); % Dominik: plot here different profiles (circles)
scatter(Sulf_E5_POC(:,2),-Sulf_E5_POC(:,1)/1000,25,'k'); % Dominik: plot here different profiles (circles)
scatter(Sulf_E6_POC(:,2),-Sulf_E6_POC(:,1)/1000,25,'k'); % Dominik: plot here different profiles (circles)
scatter(Sulf_E7_POC(:,2),-Sulf_E7_POC(:,1)/1000,25,'k'); % Dominik: plot here different profiles (circles)

xlim([0 4.0])
ylim([-5.0 0.0])%xlabel(strrep(dataid_1,'_','-'));
xlabel('POC flux (mol m^{-2}yr^{-1}) ');
ylabel('Depth (km)');

subplot(2,2,2)
plot(No_Sulf_POM_S(:,2),-No_Sulf_POM_S(:,1)/1000,'k',Sulf_E5_POM_S(:,2),-Sulf_E5_POM_S(:,1)/1000,'b',Sulf_E6_POM_S(:,2),-Sulf_E6_POM_S(:,1)/1000,'g',Sulf_E7_POM_S(:,2),-Sulf_E7_POM_S(:,1)/1000,'r'); % Dominik: plot here different profiles (line)
hold on;
scatter(No_Sulf_POM_S(:,2),-No_Sulf_POM_S(:,1)/1000,25,'k'); % Dominik: plot here different profiles (circles)
scatter(Sulf_E5_POM_S(:,2),-Sulf_E5_POM_S(:,1)/1000,25,'k'); % Dominik: plot here different profiles (circles)
scatter(Sulf_E6_POM_S(:,2),-Sulf_E6_POM_S(:,1)/1000,25,'k'); % Dominik: plot here different profiles (circles)
scatter(Sulf_E7_POM_S(:,2),-Sulf_E7_POM_S(:,1)/1000,25,'k'); % Dominik: plot here different profiles (circles)

xlim([0 0.4])
ylim([-5.0 0.0])%xlabel(strrep(dataid_1,'_','-'));
xlabel('sulf. POC flux (mol m^{-2}yr^{-1}) ');
ylabel('Depth (km)');


subplot(2,2,3)
plot(No_Sulf_O2(:,2),-No_Sulf_O2(:,1)/1000,'k',Sulf_E5_O2(:,2),-Sulf_E5_O2(:,1)/1000,'b',Sulf_E6_O2(:,2),-Sulf_E6_O2(:,1)/1000,'g',Sulf_E7_O2(:,2),-Sulf_E7_O2(:,1)/1000,'r'); % Dominik: plot here different profiles (line)
hold on;
scatter(No_Sulf_O2(:,2),-No_Sulf_O2(:,1)/1000,25,'k'); % Dominik: plot here different profiles (circles)
scatter(Sulf_E5_O2(:,2),-Sulf_E5_O2(:,1)/1000,25,'k'); % Dominik: plot here different profiles (circles)
scatter(Sulf_E6_O2(:,2),-Sulf_E6_O2(:,1)/1000,25,'k'); % Dominik: plot here different profiles (circles)
scatter(Sulf_E7_O2(:,2),-Sulf_E7_O2(:,1)/1000,25,'k'); % Dominik: plot here different profiles (circles)

xlim([0 200])
ylim([-5.0 0.0])%xlabel(strrep(dataid_1,'_','-'));
xlabel('O_2 (\mumol kg^{-1}) ');
%xlabel('POC flux (mol m^{-2}yr^{-1}) ');
ylabel('Depth (km)');


subplot(2,2,4)
plot(No_Sulf_H2S(:,2),-No_Sulf_H2S(:,1)/1000,'k',Sulf_E5_H2S(:,2),-Sulf_E5_H2S(:,1)/1000,'b',Sulf_E6_H2S(:,2),-Sulf_E6_H2S(:,1)/1000,'g',Sulf_E7_H2S(:,2),-Sulf_E7_H2S(:,1)/1000,'r'); % Dominik: plot here different profiles (line)
hold on;
scatter(No_Sulf_H2S(:,2),-No_Sulf_H2S(:,1)/1000,25,'k'); % Dominik: plot here different profiles (circles)
scatter(Sulf_E5_H2S(:,2),-Sulf_E5_H2S(:,1)/1000,25,'k'); % Dominik: plot here different profiles (circles)
scatter(Sulf_E6_H2S(:,2),-Sulf_E6_H2S(:,1)/1000,25,'k'); % Dominik: plot here different profiles (circles)
scatter(Sulf_E7_H2S(:,2),-Sulf_E7_H2S(:,1)/1000,25,'k'); % Dominik: plot here different profiles (circles)

xlim([0 100])
ylim([-5.0 0.0])%xlabel(strrep(dataid_1,'_','-'));
xlabel('H_2S (\mumol kg^{-1}) ');
%xlabel('POC flux (mol m^{-2}yr^{-1}) ');
ylabel('Depth (km)');

print('-depsc', '0_Sulf_Impact_Profiles_ALL_COMBINED');
end

%%%%%%%%%%%% ALL FIGURES SEPERATE

