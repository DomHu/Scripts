function [] = make_basic_diac(PEXP, PTIME, PEXPNAME, PSPIN, PSPINNAME, WithPOCBurial)

% PEXP:  the experiment name, i.e. folder in cgenie_output
% PTIME: which model year to plot
% PEXPNAME: Name of the experiment
% optional if plot timeseries of previous SPIN:
% PSPIN: the SPIN-experiment
% PSPINNAME: Name of the SPIN-experimt
% WithPOCBurial: True/false if OMEN is used

% Example call: make_basic_diac('0204_07_fkl_ep21_1CO2_1PO4_1.0O2_CaCO3_OMEN_allFeedb_forc_atm_Fdet18g', 99999.5, '0204-07 modern BC all Feedb Fdet=18g', '', '', true)

DUM_EXP = PEXP;
DUM_T = PTIME;

%% plot fields
addpath('EXAMPLES/')   % add path to example analysis, e.g. for plot_fields_settings
addpath('/home/domhu/Documents/MATLAB/')   % for make_cmap.m

%% plot time-series
if false
    if isempty(PSPIN)   % plot only timeseries of main experiment
        plot_time_series_subplots_1SPIN(DUM_EXP, PEXPNAME)
    else
        plot_time_series_subplots_1SPIN_1Exp(PSPIN, DUM_EXP, PSPINNAME, PEXPNAME)
    end
end

if(true)
    if(true)
        if false
        % *** PHYSICS *********************************************************** %
        %
        %topo
        plot_fields_biogem_2d(DUM_EXP,'','grid_topo','',DUM_T,-1,16,'',-1.0,-5000.0,0.0,20,'','plot_fields_settings_GRID',['04_' DUM_EXP '.GRIDocn']);
        plot_fields_sedgem_2d(DUM_EXP,'','grid_topo','',0.0,0.0,0,'',1.0,-5000.0,0.0,20,'','plot_fields_settings_GRID',['05_' DUM_EXP '.GRIDsed'])
        % seaice
        plot_fields_biogem_2d(DUM_EXP,'','phys_seaice','',DUM_T,-1,16,'',1.0,0.0,100.0,20,'','plot_fields_settings_MISC',['06_' DUM_EXP '.SEAICE']);
        % PSI - Barotropic streamfunction, defined as the depth‐integrated volume transport
        plot_fields_biogem_2d(DUM_EXP,'','atm_temp','',DUM_T,-1,16,'',1.0,0.0,30.0,30,'','plot_fields_settings_PSI',['07_' DUM_EXP '.PSI']);
        % % temp
        % plot_fields_biogem_3d_k(DUM_EXP,'','ocn_temp','',DUM_T,-1,16,'',1.0,0.0,30.0,15,'','plot_fields_settings_temp',[DUM_EXP '.SST']);
        % % currents (+ speed)
        % plot_fields_biogem_3d_k(DUM_EXP,'','ocn_temp','',DUM_T,-1,16,'',1.0,0.0,0.1,20,'','plot_fields_settings_UV',[DUM_EXP '.uv']);
        % currents (+ temp)
        plot_fields_biogem_3d_k(DUM_EXP,'','ocn_temp','',DUM_T,-1,16,'',1.0,0.0,30.0,15,'','plot_fields_settings_UV_temp',['08_' DUM_EXP '.uv_temp']);
        % OPSI
        plot_fields_biogem_3d_i(DUM_EXP,'','ocn_temp','',DUM_T,-1,0,'',1.0,0.0,30.0,30,'','plot_fields_settings_OPSI',['09_' DUM_EXP '.OPSI']);
        % OPSI (+ temp)
        plot_fields_biogem_3d_i(DUM_EXP,'','ocn_temp','',DUM_T,-1,0,'',1.0,0.0,30.0,15,'','plot_fields_settings_OPSI_temp',['10_' DUM_EXP '.OPSI_temp']);
        % *** Oxygen -- horizontal ********************************************* %
        %
        % sur [O2]
%        plot_fields_biogem_3d_k(DUM_EXP,'','ocn_O2','',DUM_T,-1,16,'',1.0E-6,0.0,300.0,30,'','plot_fields_settings_GEO',['11_' DUM_EXP '.SURo2']);
        % 80 m -> k~15, 450 m -> k~1, 3200 m -< k~3
        plot_fields_biogem_3d_k(DUM_EXP,'','ocn_O2','',DUM_T,-1,15,'',1.0E-6,0.0,300.0,6,'','plot_fields_settings_GEO',['11_' DUM_EXP '.SUBSURo2']);
        %plot_fields_biogem_3d_k(DUM_EXP,'','ocn_O2','',DUM_T,-1,12,'',1.0E-6,0.0,300.0,30,'','plot_fields_settings_GEO',[DUM_EXP '.0450o2']);
        %plot_fields_biogem_3d_k(DUM_EXP,'','ocn_O2','',DUM_T,-1,3,'',1.0E-6,0.0,300.0,30,'','plot_fields_settings_GEO',[DUM_EXP '.3200o2']);
        % ocean floor [O2]
        plot_fields_biogem_3d_k(DUM_EXP,'','ocn_O2','',DUM_T,-1,-1,'',1.0E-6,0.0,300.0,10,'','plot_fields_settings_GEO_BWO2',['12_' DUM_EXP '.BOTo2']);
        %
        % *** Oxygen -- vertical *********************************************** %
        plot_fields_biogem_3d_i(DUM_EXP,'','ocn_O2','',DUM_T,-1,0,'',1.0E-6,0.0,300.0,6,'','plot_fields_settings_GEO',['13_' DUM_EXP '.ZONALo2']);
        %
        % *********************************************************************** %
        
       
        
        % *** BIOGEOCHEMSITRY *************************************************** %
        %
        % ocean pH
        plot_fields_biogem_3d_k(DUM_EXP,'','misc_pH','',DUM_T,-1,16,'',1.0,6.6,8.0,14,'','plot_fields_settings_GEO_BWO2',['14_' DUM_EXP '.SURpH']);
%        plot_fields_biogem_3d_k(DUM_EXP,'','misc_pH','',DUM_T,-1,15,'',1.0,6.0,8.0,14,'','plot_fields_settings_GEO_BWO2',['14_' DUM_EXP '.SUBSURpH']);

        % sur [PO4]
        % plot_fields_biogem_3d_k(DUM_EXP,'','ocn_PO4','',DUM_T,-1,16,'',1.0E-6,0.0,1.0,20,'','plot_fields_settings_BIO',['15_' DUM_EXP '.SURpo4']);
        % [PO4] - vertical
        plot_fields_biogem_3d_i(DUM_EXP,'','ocn_PO4','',DUM_T,-1,0,'',1.0E-6,0.0,10.0,20,'','plot_fields_settings_BIO',['15_' DUM_EXP '.ZONALpo4']);
        end
        
        % omega calcite
      	plot_fields_biogem_3d_k(DUM_EXP,'','carb_ohm_cal','',DUM_T,-1,16,'',1.0,1,3.0,10,'','plot_fields_settings_Omega',[DUM_EXP '.SUR_omegacal']);
      	plot_fields_biogem_3d_k(DUM_EXP,'','carb_ohm_cal','',DUM_T,-1,15,'',1.0,1,3.0,10,'','plot_fields_settings_Omega',[DUM_EXP '.SUBSUR_omegacal']);

        % omega aragonite
      	plot_fields_biogem_3d_k(DUM_EXP,'','carb_ohm_arg','',DUM_T,-1,16,'',1.0,1,3.0,10,'','plot_fields_settings_Omega',[DUM_EXP '.SUR_omegaarg']);
      	plot_fields_biogem_3d_k(DUM_EXP,'','carb_ohm_arg','',DUM_T,-1,15,'',1.0,1,3.0,10,'','plot_fields_settings_Omega',[DUM_EXP '.SUBSUR_omegaarg']);

        % subsur [H2S] 80 m -> k~15, 450 m -> k~1, 3200 m -< k~3
        plot_fields_biogem_3d_k(DUM_EXP,'','ocn_H2S','',DUM_T,-1,15,'',1.0E-6,0.0,200.0,20,'','plot_fields_settings_BIO',['16_' DUM_EXP '.0080h2s']);
        % plot_fields_biogem_3d_k(DUM_EXP,'','ocn_H2S','',DUM_T,-1,12,'',1.0E-6,0.0,100.0,20,'','plot_fields_settings_BIO',['17_' DUM_EXP '.0450h2s']);
        % plot_fields_biogem_3d_k(DUM_EXP,'','ocn_H2S','',DUM_T,-1,3,'',1.0E-6,0.0,100.0,20,'','plot_fields_settings_BIO',['18_' DUM_EXP '.3200h2s']);
        % ocean floor [H2S]
        plot_fields_biogem_3d_k(DUM_EXP,'','ocn_H2S','',DUM_T,-1,-1,'',1.0E-6,0.0,100.0,20,'','plot_fields_settings_BIO',['17_' DUM_EXP '.BOTh2s']);
        % [H2S] -- vertical
        plot_fields_biogem_3d_i(DUM_EXP,'','ocn_H2S','',DUM_T,-1,0,'',1.0E-6,0.0,100.0,20,'','plot_fields_settings_BIO',['18_' DUM_EXP '.ZONALh2s']);
        
    end
    % POC export production [mol m-2 yr-1]
    plot_fields_biogem_2d(DUM_EXP,'','bio_fdexport_POC','',DUM_T,-1,16,'',1.0,0.0,10.0,20,'','plot_fields_settings_BIOflux',['20_' DUM_EXP '.POCexp']);
    % POC rain [mol m-2 yr-1]
    plot_fields_biogem_3d_k(DUM_EXP,'','bio_fpart_POC','',DUM_T,-1,-1,'',1.0,0.0,1.0,20,'','plot_fields_settings_BIOflux',['21_' DUM_EXP '.POCrainBIO']);
%     % POC rain - plotted from sedgem  [mol cm-2 yr-1 --> mol m-2 yr-1]
%     plot_fields_sedgem_2d(DUM_EXP,'','fsed_POC','',0.0,0.0,0,'',1.0E-4,0.0,1.0,20,'','plot_fields_settings_BIOflux',['21_' DUM_EXP '.POCrainSED'])
    
    if(WithPOCBurial)
        % POC burial flux [mol cm-2 yr-1]
        plot_fields_sedgem_2d(DUM_EXP,'','fburial_POC','',0.0,0.0,0,'',1.0E-6,0.0,1.0,20,'','plot_fields_settings_POCburial',['22_' DUM_EXP '.POCburial_Norm'])
        plot_fields_sedgem_2d(DUM_EXP,'','fburial_POC','',0.0,0.0,0,'',1.0E-6,0.0,40.0,20,'','plot_fields_settings_POCburial',['22_' DUM_EXP '.POCburial_MAX'])
        % POP burial flux [mol cm-2 yr-1]
        plot_fields_sedgem_2d(DUM_EXP,'','fburial_POP','',0.0,0.0,0,'',1.0E-9,0.0,10.0,20,'','plot_fields_settings_POPburial',['22_' DUM_EXP '.POPburial'])
        

        if(false)
            % plot Burial Efficiency:
            plot_fields_sedgem_2d_BE_useBIOG(DUM_EXP,DUM_EXP,'fburial_POC','fsed_POC',0.0,0.0,0,'',1,0.0,50.0,20,'','plot_fields_settings_POC_BE',['23_' DUM_EXP '.POC_BE50_useBIOG'])
%         plot_fields_sedgem_2d_BE_useBIOG(DUM_EXP,DUM_EXP,'fburial_POC','fsed_POC',0.0,0.0,0,'',1,0.0,90.0,20,'','plot_fields_settings_POC_BE',['23_' DUM_EXP '.POC_BE90_useBIOG'])
        end
    end
    if(true)
        % surface sediment CaCO3 (wt%)
        plot_fields_sedgem_2d(DUM_EXP,'','sed_CaCO3','',0.0,0.0,0,'',1.0,0.0,100.0,20,'','plot_fields_settings_CaCO3',['24_' DUM_EXP '.CaCO3wtpc'])
        
        % *** BIOGEOCHEM -- vertical ******************************************** %
        % [d13C]
        plot_fields_biogem_3d_i(DUM_EXP,'','ocn_DIC_13C','',DUM_T,-1,0,'',1.0,-2.0,2.0,20,'','plot_fields_settings_ANOM',['26_' DUM_EXP '.ZONALh2s']);
        
        
        % *********************************************************************** %
        % *********************************************************************** %
        %%%    plot all depth slices for O2, PO4 and H2S - without colorbar, title and stamp
        %%%    combine them later into one plot. For this
        % in folder k_levels
        %       1.  ./convertAllEPStoPdf.sh
        %       2.  pdfnup 14*.pdf --nup 4x4 --outfile 14_2811_205_O2_DepthSlices.ps
        %       2.  pdfnup 16*.pdf --nup 4x4 --outfile 16_2811_205_PO4_DepthSlices.ps
        %       3.  pdfnup 19*.pdf --nup 4x4 --outfile 19_2811_205_H2S_DepthSlices.ps
        %       4.  copy the 3 combined files to the folder with the files above so
        %       the get included in the summary pdf
        
        for(k_layer=1:16)
            Depth_layer = 17-k_layer;   % save plots as depth-layer, i.e. 1 = surace, 2 = 1st subsurface layer, 16 + deepest layer
            % O2
            plot_fields_biogem_3d_k_raw(DUM_EXP,'','ocn_O2','',DUM_T,-1,k_layer,'',1.0E-6,0.0,300.0,30,'','plot_fields_settings_GEO',['14_' DUM_EXP '.o2_DEPTHlayer' num2str(Depth_layer,'%02.f') ]);
            % PO4
            plot_fields_biogem_3d_k_raw(DUM_EXP,'','ocn_PO4','',DUM_T,-1,k_layer,'',1.0E-6,0.0,10.0,20,'','plot_fields_settings_BIO',['16_' DUM_EXP '.po4_DEPTHlayer' num2str(Depth_layer,'%02.f') ]);
            % H2S
            plot_fields_biogem_3d_k_raw(DUM_EXP,'','ocn_H2S','',DUM_T,-1,k_layer,'',1.0E-6,0.0,100.0,20,'','plot_fields_settings_BIO',['19_' DUM_EXP '.h2s_DEPTHlayer' num2str(Depth_layer,'%02.f') ]);
            
        end
    end
    
    close all;
    %% Combine all pdfs with: gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dSAFER -sOutputFile=2811_205_frac_0.64_extended.pdf *.ps  //
    % and rotate the second page via:
    % qpdf 1903_01_ModernBC.pdf 1903_01_ModernBC_out.pdf --rotate=-90:2
end