function [] = plot_fields_biogem_3d_k_v100716(PATH,EXP1,EXP2,PT1,PT2,PVAR1,PVAR2,MASK,PK,CSCALE,CMIN,CMAX,CN,PTIT,PDATA)
% plot_fields_biogem_3d_k_v100716
%
%   ***********************************************************************
%   *** biogem k-SECTION (LON-LAT) DIFFERENCE PLOTTING ********************
%   ***********************************************************************
%
%   plot_fields_biogem_3d_k_v100716(PATH,EXP1,EXP2,PT1,PT2,PVAR1,PVAR2,MASK,PK,CSCALE,CMIN,CMAX,CN,PTIT,PDATA)
%   plots a k-section through the BIOGEM 3-D netCDF data file;
%   'fields_biogem_3d.nc'
%   Additional difference plotting capabilities (experiment or time-slice).
%   Also water column integral capabilities.
%
%   plot_fields_biogem_3d_k_v100716(PATH,EXP1,EXP2,PT1,PT2,PVAR1,PVAR2,MASK,PK,CSCALE,CMIN,CMAX,CN,PTIT,PDATA)
%   takes 14 arguments:
%   PATH .... is the relative path to the experiments
%             THIS PARAMETER MUST BE PASSED AS A STRING:
%             -> e.g., 'genie_output'
%   EXP1 .... is the (first) experiment name
%             THIS PARAMETER MUST BE PASSED AS A STRING:
%             -> e.g., 'preindustrial_spinup'
%   EXP2 .... is the experiment name of 2nd, optional, netCDF file
%             THIS PARAMETER MUST BE PASSED AS A STRING:
%             -> e.g., 'historical_transient'
%             -> leave EXP2 blank, i.e., '', for no second netCDF
%             file
%   PT1 ..... is the year of the 1st time-slice
%             -> all valid time-slice years will be listed if an invalid
%                year is entered
%   PT2 ..... is the year of the 2nd, optional, time-slice
%             -> set PT2 to -1 for no second time-slice
%   PVAR1 ... id the name of 1st variable to be plotted
%             -> all valid valiable names will be listed if an invalid name
%                is entered
%             THIS PARAMETER MUST BE PASSED AS A STRING;
%             -> e.g., 'ocn_PO4'
%   PVAR2 ... id the name of 2nd, optional, variable
%   MASK .... is the filename containing the mask
%             -> the mask file must live in working directory
%                (i.e., the same directory as the .m file)
%             THIS PARAMETER MUST BE PASSED AS A STRING
%             -> leave MASK blank, i.e., '', for no mask
%   PK ...... is the level in the ocean model to be plotted (the 'k' slice)
%             -> a zero will result in a water column integral being
%             plotted
%   CSCALE .. is the scale factor for the plot
%             -> e.g., to plot micro molar (umol kg-1), enter; 1e-6
%             -> the plot is auto-scaled if a value of zero (0.0) is entered
%   CMIN .... is the minimum scale value
%   CMAX .... is the maxumum scale value
%   CN ...... is the number of (contor) intervals between minimum and maximum
%             scale values
%   PTIT .... is the string for the alternative plot title
%             THIS PARAMETER MUST BE PASSED AS A STRING:
%             -> e.g., 'distribution of bottom-water phosphate concentrations'
%             -> if an empty (i.e., '') value is passed to this parameter
%                then a title is automaticaly generated
%   PDATA ... is the filename containing the an overlay data set,
%             which must be formatted as seperated columns of:
%             lon, lat, value
%             -> the full filename must be give, including any extensions
%             THIS PARAMETER MUST BE PASSED AS A STRING
%             -> leave PDATA blank, i.e., '', for no overlay data
%
%   EXAMPLE;
%           plot_fields_biogem_3d_k_v100716('genie_output','experiment_1','',1994.5,-1,'ocn_PO4','','',8,1e-6,0,2,20,'PO_{4}','')
%           will plot the time-slice cenetered on a time of 1994.5,
%           of PO4 concentrations at the ocean surface (k = 8),
%           between 0 and 2 umol kg-1 in 20 contour intervals
%           and with a title of 'PO4'
%           experiment is called 'experiment_1'
%           and lives in the 'genie_output' subdirectory#
%  plot_fields_biogem_3d_k_v100716('../cgenie.muffin_output','_NT_','',999.5,-1,'ocn_H2S','','',15,1e-6,0,100,10,'','')
%
%   Edit the 'm' file to change other user settings;
%           lon_offset = -0;       % LONGITUDE OFFSET
%           lon_min = -260;        % STARTING LONGITUDE FOR X-AXIS
%           delta_lon = 60;        % INCREMENT OF LONGITUDE ON X-AXIS
%           contour_plot = 'n';    % OVERLAY CONTOL PLOT?
%           contour_mod = 1;       % NUMBER OF COLOR INTERVALS PER CONTOR
%           contour_mod_label = 5; % NUMBER OF LABELED CONTOURS PER CONTOUR
%           contour_label = 'n';   % LABEL CONTOURS?
%           contour_noneg = 'n';   % RESTRICT DATA PLOTTED TO > 0.0?
%           plot_log10 = 'n';      % PLOT LOG10 OF THE DATA
%           dscrsz = 0.60;         % FRACTIONAL FIGURE WINDOW SIZE
%           overlay_size = 50.0;   % SIZE OF OVERLAY DATA POINTS 
%
%   ***********************************************************************
%   *** HISTORY ***********************************************************
%   ***********************************************************************
%
%   10/06/19: xxx
%   10/07/01: Passed reference data stats to plot_taylordiag
%   10/07/05: cosmetic changes ...
%   10/07/05: name changed: allstats -> calc_allstats
%   10/07/06: adjustments to use calc_find_ij_v100706 (in place of find_ij)
%   10/07/06: sorted out confusion between (lon,lat) of the data and (j,i) of the model grid ...
%   10/07/06: added stats save
%   10/07/08: filtered overlay data to avoid plotting on land!
%   10/07/16: added option for inputting (i,j) data
%
%   ***********************************************************************

% \/\/\/ USER SETTINGS \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/ %
lon_offset = 0; %was -40;      % LONGITUDE OFFSET
lon_min = -180; %0; %-260;           % STARTING LONGITUDE FOR X-AXIS
delta_lon = 90;         % INCREMENT OF LONGITUDE ON X-AXIS
contour_plot = 'n';     % OVERLAY CONTOL PLOT?
contour_mod = 2;        % NUMBER OF COLOR INTERVALS PER CONTOR
contour_mod_label = 4; % NUMBER OF LABELED CONTOURS PER CONTOUR
contour_label = 'y';    % LABEL CONTOURS?
contour_noneg = 'n';    % RESTRICT DATA PLOTTED TO > 0.0?
plot_log10 = 'n';       % PLOT LOG10 OF THE DATA
plot_colorbar = 'n';
dscrsz = 0.60;          % FRACTIONAL FIGURE WINDOW SIZE
overlay_size = 75.0;    % SIZE OF OVERLAY DATA POINTS 
data_offset = 0.0;      % data offset (273.15 for K -> C)
data_ij = 'n';         % DATA as (i,j)?
% /\/\/\ USER SETTINGS /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ %

% *** INITIALIZE PARAMETERS & VARIABLES ********************************* %
%
% *********************************************************************** %
% 
% close open windows
% NOTE: don't clear variable space here ...
%close all;
% set axes
lat_min = -090;
lat_max = +090;
lon_max = lon_min+360;
% set passed parameters
path = PATH;
exp_1 = EXP1;
exp_2 = EXP2;
timesliceid_1 = PT1;
timesliceid_2 = PT2;
dataid_1 = PVAR1;
dataid_2 = PVAR2;
kplot = PK;
data_scale = CSCALE;
con_min = CMIN;
con_max = CMAX;
con_n = CN;
graph_title = PTIT;
maskid = MASK;
overlaydataid = PDATA;
% set default data scaling
if data_scale == 0.0
    data_scale = 1.0;
    clear con_min;
    clear con_max;
    con_n = 10;
end
% define grey color
color_g = [0.75 0.75 0.75];

% *** INITIALIZE ARRAYS ************************************************* %
%
% *********************************************************************** %
%
xm = [];
ym = [];
zm = [];
lonm = [];
lone = [];
lonw = [];
latm = [];
latn = [];
lats = [];
laym = [];
layt = [];
layb = [];
rawdata=[];
data_1=[];
data_2=[];
% additional
rawdata=[];
zm_count = [];

% *** OPEN netCDF DATA & LOAD (OPTIONAL) MASK FILE ********************** %
%
% *********************************************************************** %
%
% open netCDF file
ncid_1=netcdf.open([path '/' exp_1 '/biogem/fields_biogem_3d.nc'],'nowrite');
% read netCDf information
[ndims,nvars,ngatts,unlimdimid] = netcdf.inq(ncid_1);
% load mask data
% NOTE: flip in j-direction to make consistent with netCDF grid
maskfile = maskid;
if ~isempty(maskid)
    mask = load(maskfile,'-ascii');
    mask = flipdim(mask,1);
end

% *** SET UP GRID ******************************************************* %
%
% *********************************************************************** %
%
% load grid data
varid  = netcdf.inqVarID(ncid_1,'grid_level');
grid_k1 = netcdf.getVar(ncid_1,varid);
% flip array around diagonal to give (j,i) array orientation
grid_k1 = grid_k1';
% calculate grid dimensions
varid  = netcdf.inqVarID(ncid_1,'lat');
[dimname, dimlen] = netcdf.inqDim(ncid_1,varid);
jmax = dimlen;
varid  = netcdf.inqVarID(ncid_1,'lon');
[dimname, dimlen] = netcdf.inqDim(ncid_1,varid);
imax = dimlen;
varid  = netcdf.inqVarID(ncid_1,'zt');
[dimname, dimlen] = netcdf.inqDim(ncid_1,varid);
kmax = dimlen;
% load remaining grid information
varid  = netcdf.inqVarID(ncid_1,'zt');
grid_zt = netcdf.getVar(ncid_1,varid);
grid_zt = flipud(grid_zt);
varid  = netcdf.inqVarID(ncid_1,'zt_edges');
grid_zt_edges = netcdf.getVar(ncid_1,varid);
grid_zt_edges = flipud(grid_zt_edges);
% calculate topography
for i = 1:imax,
    for j = 1:jmax,
        if grid_k1(j,i) <= kmax
            topo(j,i) = -grid_zt_edges(grid_k1(j,i));
        else
            topo(j,i) = 0.0;
        end
        if kplot > 0
            laym(j,i) = -grid_zt(kplot);
            layb(j,i) = -grid_zt_edges(kplot);
            layt(j,i) = -grid_zt_edges(kplot+1);
        else
            laym(j,i) = 0.0;
            layb(j,i) = -grid_zt_edges(1);
            layb(j,i) = -grid_zt_edges(kmax);
        end
    end
end
if ~isempty(maskid)
    topo = mask.*topo;
end
% load and calculate remaining grid information
varid  = netcdf.inqVarID(ncid_1,'lat');
grid_lat = netcdf.getVar(ncid_1,varid);
varid  = netcdf.inqVarID(ncid_1,'lon');
grid_lon = netcdf.getVar(ncid_1,varid) + lon_offset;
[lonm latm] = meshgrid(grid_lon,grid_lat);
varid  = netcdf.inqVarID(ncid_1,'lat_edges');
grid_lat_edges = netcdf.getVar(ncid_1,varid);
varid  = netcdf.inqVarID(ncid_1,'lon_edges');
grid_lon_edges = netcdf.getVar(ncid_1,varid) + lon_offset;
[lonw lats] = meshgrid(grid_lon_edges(1:imax),grid_lat_edges(1:jmax));
[lone latn] = meshgrid(grid_lon_edges(2:imax+1),grid_lat_edges(2:jmax+1));
% calculate cell masses
% NOTE: assume equal area grid, normalized area
data_M = zeros(kmax,jmax,imax);
for k = 1:kmax,
    data_M(k,:,:) = 1027.649*1.0*(grid_zt_edges(k) - grid_zt_edges(k+1));
end
% Non-uniform grid
lat_max = sin(pi*lat_max/180.0);
lat_min = sin(pi*lat_min/180.0);
latn = sin(pi*latn/180.0);
lats = sin(pi*lats/180.0);
%i=1 longitude grid origin
grid_lon_origin = grid_lon_edges(1);

% calculate cell volumes
% NOTE: assume equal area grid, normalized area
data_V = zeros(kmax,jmax,imax);
for i = 1:imax,
  for j = 1:jmax,
    for k = 1:kmax,
    data_V(k,:,:) = (grid_zt_edges(k) - grid_zt_edges(k+1))*(grid_lat_edges(j) - grid_lat_edges(j+1))*(grid_lon_edges(i) - grid_lon_edges(i+1));
    end
  end
end

% *** SET PRIMARY GRIDDED DATASET *************************************** %
%
% *********************************************************************** %
%
% check that the year exists
varid  = netcdf.inqVarID(ncid_1,'time');
timeslices = netcdf.getVar(ncid_1,varid);
[dimname, dimlen] = netcdf.inqDim(ncid_1,varid);
clear time;
while exist('time','var') == 0
    for n = 1:dimlen,
        if double(int32(100*timeslices(n)))/100 == timesliceid_1
            time = timesliceid_1;
            tid = n;
        end
    end
    if exist('time','var') == 0
        disp('   > WARNING: Year must be one of the following;');
        format long g;
        double(int32(100*timeslices(:)))/100
        format;
        timesliceid_1 = input('   > Time-slice year: ');
    end
end
% check that the variable name exists
varid = [];
while isempty(varid)
    for n = 0:nvars-1,
        [varname,xtype,dimids,natts] = netcdf.inqVar(ncid_1,n);
        if strcmp(varname,dataid_1)
            varid = n;
        end
    end
    if isempty(varid)
        disp('   > WARNING: Variable name must be one of the following;');
        for n = 0:nvars-1,
            [varname,xtype,dimids,natts] = netcdf.inqVar(ncid_1,n);
            varname
        end
        dataid = input('   > Variable name: ','s');
    end
end
% load data
% flip array around diagonal to give (j,i) array orientation
[varname,xtype,dimids,natts] = netcdf.inqVar(ncid_1,varid);
%Fanny - convert N* into DINxs, -2.91;
% convert temperature into C, -272.15;
rawdata = netcdf.getVar(ncid_1,varid);
%Fanny - remove negative values
rawdata(rawdata < 0) = 0;

if length(dimids) == 4
    rawdata(1:imax,1:jmax,1:kmax) = rawdata(1:imax,1:jmax,1:kmax,tid);
    for n = 1:kmax,
        data_1(kmax - n + 1,1:jmax,1:imax) = rawdata(1:imax,1:jmax,n)';
    end
elseif length(dimids) == 3
    rawdata(1:imax,1:jmax,1:kmax) = rawdata(1:imax,1:jmax,1:kmax);
    for n = 1:kmax,
        data_1(kmax - n + 1,1:jmax,1:imax) = rawdata(1:imax,1:jmax,n)';
    end
elseif length(dimids) == 2
    rawdata(1:imax,1:jmax) = rawdata(1:imax,1:jmax);
    data_1(1:jmax,1:imax) = rawdata(1:imax,1:jmax)';
else
    data_1(:,:,:) = NaN;
end

% *** SET ALTERNATIVE GRIDDED DATASET *********************************** %
%
% *********************************************************************** %
%
% *** ALT EXPERIMENT **************************************************** %
% open new netCDF file if necessary, else reuse 1st netCDF dataset
if ~isempty(exp_2)
    % open netCDF file
    ncid_2 = netcdf.open([path '/' exp_2 '/biogem/fields_biogem_3d.nc'],'nowrite');
    % read netCDf information
    [ndims,nvars,ngatts,unlimdimid] = netcdf.inq(ncid_2);
else
    ncid_2 = ncid_1;
end
% *** ALT TIME-SLICE **************************************************** %
if timesliceid_2 > 0.0
    % check that the year exists
    varid  = netcdf.inqVarID(ncid_2,'time');
    timeslices = netcdf.getVar(ncid_2,varid);
    [dimname, dimlen] = netcdf.inqDim(ncid_2,varid);
    clear time;
    while exist('time','var') == 0
        for n = 1:dimlen,
            if double(int32(100*timeslices(n)))/100 == timesliceid_2
                time = timesliceid_2;
                tid = n;
            end
        end
        if exist('time','var') == 0
            disp('   > WARNING: Year must be one of the following;');
            format long g;
            double(int32(100*timeslices(:)))/100
            format;
            timesliceid_2 = input('   > Time-slice year: ');
        end
    end
end
% *** ALT DATA FIELD **************************************************** %
if ~isempty(dataid_2)
    % check that the variable name exists
    varid = [];
    while isempty(varid)
        for n = 0:nvars-1,
            [varname,xtype,dimids,natts] = netcdf.inqVar(ncid_2,n);
            if strcmp(varname,dataid_2)
                varid = n;
            end
        end
        if isempty(varid)
            disp('   > WARNING: Variable name must be one of the following;');
            for n = 0:nvars-1,
                [varname,xtype,dimids,natts] = netcdf.inqVar(ncid_2,n);
                varname
            end
            dataid = input('   > Variable name: ','s');
        end
    end
end
% *** SET DATA ********************************************************** %
if (~isempty(exp_2)) || (timesliceid_2 > 0.0) || (~isempty(dataid_2))
    % load data
    [varname,xtype,dimids,natts] = netcdf.inqVar(ncid_2,varid);
    rawdata = netcdf.getVar(ncid_2,varid);
%Fanny - remove negative values
rawdata(rawdata < 0) = 0;

    if length(dimids) == 4
        rawdata(1:imax,1:jmax,1:kmax) = rawdata(1:imax,1:jmax,1:kmax,tid);
        for n = 1:kmax,
            data_2(kmax - n + 1,1:jmax,1:imax) = rawdata(1:imax,1:jmax,n)';
        end
    elseif length(dimids) == 3
        rawdata(1:imax,1:jmax,1:kmax) = rawdata(1:imax,1:jmax,1:kmax);
        for n = 1:kmax,
            data_2(kmax - n + 1,1:jmax,1:imax) = rawdata(1:imax,1:jmax,n)';
        end
    elseif length(dimids) == 2
        rawdata(1:imax,1:jmax) = rawdata(1:imax,1:jmax);
        data_2(1:jmax,1:imax) = rawdata(1:imax,1:jmax)';
    else
        data_2(:,:,:) = NaN;
    end
else
    data_2(:,:,:) = 0.0;
end

% *** FILTER & PROCESS RAW DATA ***************************************** %
%
% *********************************************************************** %
%
xm = lonm;
ym = latm;
%fanny
data = data_1 - 16*data_2;
data = data - data_offset;
%tmp_DIN = data_1 + data_2; tmp_DIN(tmp_DIN<=0)=NaN;
%data = data_1./tmp_DIN *100; 
%data_2(data_2==0) = NaN;
%data = (data_1./data_2);
%data_1(data_1<=0) = NaN;
%data = (data_1-data_2)./data_1*100;

%Fanny- estimate global N*
tmp_N=data_1; tmp_N(tmp_N>=0.9E36) = NaN;
tmp_P=data_2; tmp_P(tmp_P==0) = NaN; tmp_P(tmp_P>=0.9E36) = NaN;
tmp = tmp_N./tmp_P; 
tmp = tmp.*data_V; 
oceanid = find(tmp>=0 & tmp~=NaN); NP = sum(tmp(oceanid))/sum(data_V(oceanid))
tmp_surf=tmp(15:16,:,:); data_V_surf=data_V(15:16,:,:); oceanid = find(tmp_surf>=0 & tmp_surf~=NaN); NP_surface = sum(tmp_surf(oceanid))/sum(data_V_surf(oceanid))
tmp_deep=tmp(1:13,:,:); data_V_deep=data_V(1:13,:,:); oceanid = find(tmp_deep>=0 & tmp_deep~=NaN); NP_deep = sum(tmp_deep(oceanid))/sum(data_V_deep(oceanid))

if kplot > 0
    % process single depth layer
    zm(:,:) = data(kplot,:,:);
    for i = 1:imax,
        for j = 1:jmax,
            if topo(j,i) > layb(j,i)
                zm(j,i) = NaN;
            elseif (zm(j,i) < -1.0E6) || (zm(j,i) > 1.0E30)
                zm(j,i) = NaN;
            else
                if plot_log10 == 'y'
                    if (zm(j,i) > 0.0)
                        zm(j,i) = log10(zm(j,i)/data_scale);
                    else
                        if contour_noneg == 'y'
                            zm(j,i) = 0.0;
                        else
                            zm(j,i) = NaN;
                        end
                    end
                else
                    zm(j,i) = zm(j,i)/data_scale;
                end
            end
        end
    end
else
    % create water column integral
    zm = zeros(jmax,imax);
    zm_count = zeros(jmax,imax);
    for j = 1:jmax,
        for i = 1:imax,
            if topo(j,i) == 0.0
                zm(j,i) = NaN;
            else
                for k = 1:kmax,
                    if ((data(k,j,i) > -1.0E6) && (data(k,j,i) < 0.9E36))
                        zm(j,i) = zm(j,i) + data_M(k,j,i)*data(k,j,i);
                        zm_count(j,i) = zm_count(j,i) + 1;
                    end
                end
                if (zm_count(j,i) > 0)
                    if plot_log10 == 'y'
                        if (zm(j,i) > 0.0)
                            zm(j,i) = log10(zm(j,i)/data_scale);
                        else
                            if contour_noneg == 'y'
                                zm(j,i) = 0.0;
                            else
                                zm(j,i) = NaN;
                            end
                        end
                    else
                        zm(j,i) = zm(j,i)/data_scale;
                    end
                else
                    zm(j,i) = NaN;
                end
            end
        end
    end
end

% *** EXTEND LON GRID (WRAP-AROUND) ************************************* %
%
% *********************************************************************** %
%
% extend gridded data in +/- longitude
lon_start = min(min(lonw));
i_start = round((lon_min-(lon_start-360.0))/(360.0/jmax)) + 1;
xm_ex = [xm - 360.0 xm + 000.0 xm + 360.0];
ym_ex = [ym + 000.0 ym + 000.0 ym + 000.0];
zm_ex = [zm zm zm];
topo_ex = [topo - 360.0 topo + 000.0 topo + 360.0];
lonm_ex = [lonm - 360.0 lonm + 000.0 lonm + 360.0];
lone_ex = [lone - 360.0 lone + 000.0 lone + 360.0];
lonw_ex = [lonw - 360.0 lonw + 000.0 lonw + 360.0];
layb_ex = [layb - 360.0 layb + 000.0 layb + 360.0];
xm = xm_ex(:,i_start:i_start+imax-1);
ym = ym_ex(:,i_start:i_start+imax-1);
zm = zm_ex(:,i_start:i_start+imax-1);
topo = topo_ex(:,i_start:i_start+imax-1);
lonm = lonm_ex(:,i_start:i_start+imax-1);
lone = lone_ex(:,i_start:i_start+imax-1);
lonw = lonw_ex(:,i_start:i_start+imax-1);
layb = layb_ex(:,i_start:i_start+imax-1);

% *** SET OVERLAY DATA ************************************************** %
%
% *********************************************************************** %
%
if ~isempty(overlaydataid)
    % load overlay datafile
    overlaydatafile = overlaydataid;
    if ~isempty(overlaydataid)
        overlaydata_raw = load(overlaydatafile,'-ascii');
        if (data_ij == 'n')
        else
            overlaydata_raw(:,1) = lon_min + 360.0*(overlaydata_raw(:,1) - 0.5)/jmax;
            overlaydata_raw(:,2) = 180.0*asin(2.0*(overlaydata_raw(:,2) - 0.5)/jmax - 1.0)/pi;
        end
        overlaydata(:,:) = overlaydata_raw(:,:);
        overlaydata(:,2) = sin(pi*overlaydata_raw(:,2)/180.0);
    end
    overlaydata_size = size(overlaydata_raw(:,:));
    nmax=overlaydata_size(1);
    % force discrete data to lie with longitude plotting axis
    % (lon_min to lon_min + 360)
    for n = 1:nmax,
        if (overlaydata(n,1) < lon_min)
            overlaydata(n,1) = overlaydata(n,1) + 360.0;
        end
        if (overlaydata(n,1) > (lon_min + 360.0))
            overlaydata(n,1) = overlaydata(n,1) - 360.0;
        end
    end
end

% *** SET OUTPUT FILESTRING ********************************************* %
% create an output filestring for data and plot saving
% NOTE: only incorporate a single 'dataid' string for simplicity
% *********************************************************************** %
%
if ~isempty(maskid)
    if ~isempty(exp_2)
        filename = [exp_1, '_MINUS_' exp_2, 'y', '.', num2str(timesliceid_1), '.', dataid_1, '.', maskid];
        if timesliceid_2 > 0.0
            filename = [exp_1, '_MINUS_' exp_2, '.', 'y', num2str(timesliceid_1), '_MINUS_', 'y', num2str(timesliceid_2), '.', dataid_1, '.', maskid];
        end
    elseif timesliceid_2 > 0.0
        filename = [exp_1, '.', 'y', num2str(timesliceid_1), '_MINUS_', 'y', num2str(timesliceid_2), '.', dataid_1, '.', maskid];
    else
        filename = [exp_1, '.', 'y', num2str(timesliceid_1), '.', dataid_1, '.', maskid];
    end
else
    if ~isempty(exp_2)
        filename = [exp_1, '_MINUS_' exp_2, '.', 'y', num2str(timesliceid_1), '.', dataid_1, '.', 'k', num2str(kplot)];
        if timesliceid_2 > 0.0
            filename = [exp_1, '_MINUS_' exp_2, '.', 'y', num2str(timesliceid_1), '_MINUS_', 'y', num2str(timesliceid_2), '.', dataid_1, '.', 'k', num2str(kplot)];
        end
    elseif timesliceid_2 > 0.0
        filename = [exp_1, '.', 'y', num2str(timesliceid_1), '_MINUS_', 'y', num2str(timesliceid_2), '.', dataid_1, '.', 'k', num2str(kplot)];
    else
        filename = [exp_1, '.', 'y', num2str(timesliceid_1), '.', dataid_1, '.', 'k', num2str(kplot)];
    end
end

% *** TAYLOR DIAGRAM **************************************************** %
% calculate stats needed for Taylor Diagram (and plot it!)
% *********************************************************************** %
%
% *** 3D (GRIDDED) DATA ************************************************* %
if (~isempty(dataid_2))
    % transform data sets in vectors
    if kplot > 0
        data_vector_1 = reshape(data_1(kplot,:,:),imax*jmax,1);
        data_vector_2 = reshape(data_2(kplot,:,:),imax*jmax,1);
    else
        data_vector_1 = reshape(data_1(:,:,:),imax*jmax*kmax,1);
        data_vector_2 = reshape(data_2(:,:,:),imax*jmax*kmax,1);
    end
    % filter data
    data_vector_1(find(data_vector_1(:) < -1.0E6)) = NaN;
    data_vector_1(find(data_vector_1(:) > 0.9E36)) = NaN;
    data_vector_2(find(data_vector_2(:) < -1.0E6)) = NaN;
    data_vector_2(find(data_vector_2(:) > 0.9E36)) = NaN;
    % calculate stats
    % NOTE: STATM = allstats(Cr,Cf)
    % 	    STATM(1,:) => Mean
    % 	    STATM(2,:) => Standard Deviation (scaled by N)
    % 	    STATM(3,:) => Centered Root Mean Square Difference (scaled by N)
    % 	    STATM(4,:) => Correlation
    %       STATM(5,:) => N
    STATM = calc_allstats(data_vector_1,data_vector_2);
    % plot Taylor diagrams
    figure;
    plot_taylor(STATM(2,2),STATM(2,1),STATM(4,2),2,'model',filename,1.5);
%    print('-f1','-depsc2','-painters', [filename, '_Taylor.eps']);
    figure;
    taylordiag_vargout = plot_taylordiag(STATM(2,1:2),STATM(3,1:2),STATM(4,1:2));
%    print('-depsc2', [filename, '_TaylorDiagram.eps']);
end
%
% *** DISCRETE DATA ***************************************************** %
% NOTE: no scale transformatoin has been appplied
%       to either gridded or % overlay data
% NOTE: valid only for data on a single depth level
if ~isempty(overlaydataid)
    if kplot > 0
        % set overlay data vector
        data_vector_1 = overlaydata_raw(:,3);
        % determine equivalent gridded dataset values
        % first: convert (lat,lon) overlay data to (i,j)
        % NOTE: function 'calc_find_ij_v100706' takes input in order: (lon,lat)
        %       i.e., the same as the raw overlay data, which is (lon,lat) (i.e., (i,j)) format
        % NOTE: !!! gridded data is (j,i) !!!
        overlaydata_ij(:,:) = overlaydata_raw(:,:);
        overlaydata_ij(:,1:2) = 0;
        for n = 1:nmax,
            overlaydata_ij(n,1:2) = calc_find_ij(overlaydata_raw(n,1),overlaydata_raw(n,2),grid_lon_origin,imax,jmax);
            if topo(overlaydata_ij(n,2),overlaydata_ij(n,1)) > layb(overlaydata_ij(n,2),overlaydata_ij(n,1))
                overlaydata(n,:) = NaN;
                overlaydata(n,:) = NaN;
                data_vector_1(n) = NaN;
            end
        end
        % now: populate the gridded dataset vector with values corresponding to
        % the overlay data locations
        % NOTE: !!! data is (j,i) !!! (=> swap i and j)
        for n = 1:nmax,
            data_vector_2(n) = data(kplot,overlaydata_ij(n,2),overlaydata_ij(n,1));
        end
        % filter data
        data_vector_2(find(data_vector_2(:) < -1.0E6)) = NaN;
        data_vector_2(find(data_vector_2(:) > 0.9E36)) = NaN;
        % calculate stats
        STATM = calc_allstats(data_vector_1,data_vector_2);
        % plot Taylor diagrams
%        figure;
%        plot_taylor(STATM(2,2),STATM(2,1),STATM(4,2),2,'model',filename,1.5);
%        print('-f1','-depsc2','-painters', [filename, '_Taylor.eps']);
%        figure;
%        taylordiag_vargout = plot_taylordiag(STATM(2,1:2),STATM(3,1:2),STATM(4,1:2));
%        print('-depsc2', [filename, '_TaylorDiagram.eps']);
    end
end
% *** SAVE STATS DATA *************************************************** %
%if (~isempty(dataid_2) | ~isempty(overlaydataid))
%    fid = fopen([filename '_STATS' '.dat'], 'wt');
%    fprintf(fid, 'Stats summary: reference data');
%    fprintf(fid, '\n');
%    fprintf(fid, 'Mean                                               : %8.6e \n', STATM(1,1));
%    fprintf(fid, 'Standard Deviation (scaled by N)                   : %8.6e \n', STATM(2,1));
%    fprintf(fid, 'Centered Root Mean Square Difference (scaled by N) : %8.6e \n', STATM(3,1));
%    fprintf(fid, 'Correlation                                        : %8.6e \n', STATM(4,1));
%    fprintf(fid, '\n');
%    fprintf(fid, 'Stats summary: model data');
%    fprintf(fid, '\n');
%    fprintf(fid, 'Mean                                               : %8.6e \n', STATM(1,2));
%    fprintf(fid, 'Standard Deviation (scaled by N)                   : %8.6e \n', STATM(2,2));
%    fprintf(fid, 'Centered Root Mean Square Difference (scaled by N) : %8.6e \n', STATM(3,2));
%    fprintf(fid, 'Correlation                                        : %8.6e \n', STATM(4,2));
%    fclose(fid);
%end

% *** SET PLOT SCALE **************************************************** %
%
% *********************************************************************** %
%
% set minimum contour value
if exist('con_min','var') == 0
    con_min = min(min(zm));
end
% set maximum contour value
if exist('con_max','var') == 0
    con_max = max(max(zm));
end
% ensure min and max are not identical ...
if con_min == con_max
    if con_max == 0.0
        con_max = 1.0;
    else
        con_min = (1.00/1.01)*con_min;
        con_max = (1.01)*con_max;
    end
end
% if min > max, then reverse min and max
if con_min > con_max
    con_min_TEMP = con_min;
    con_max_TEMP = con_max;
    con_min = con_max_TEMP;
    con_max = con_min_TEMP;
end

% *** PLOT MAIN FIGURE ************************************************** %
%
% *********************************************************************** %
%
% *** CONFIGURE AND CREATE PLOTTING WINDOW ****************************** %
% create figure
scrsz = get(0,'ScreenSize');
figure('Position',[((1 - dscrsz)/2)*dscrsz*scrsz(3) (1 - dscrsz)*dscrsz*scrsz(4) dscrsz*scrsz(3) 0.60*dscrsz*scrsz(4)])
clf;
% define plotting regions
fh(1) = axes('Position',[0 0 1 1],'Visible','off');
fh(2) = axes('Position',[0.10 0.05 0.65 0.90]);
fh(3) = axes('Position',[0.80 0.15 0.20 0.70],'Visible','off');
% define colormap
cmap = colormap(jet((2*(con_n+1))+1));
%cmap = colormap(hot((2*(con_n+1))+1));
%fanny
%cmap = colormap(CmapBlue);
%
% *** CREATE MAIN PLOT ************************************************** %
% 
set(gcf,'CurrentAxes',fh(2));
hold on;
% set color and lat/lon axes and labels
caxis([con_min-(con_max-con_min)/con_n con_max]);
set(gca,'PlotBoxAspectRatio',[1.0 0.5 1.0]);
axis([lon_min lon_max lat_min lat_max]);
set(gca,'TickDir','out');
set(gca,'XLabel',text('String','Longitude','FontSize',14),'XTick',[lon_min:delta_lon:lon_max],'FontSize',14);
set(gca,'YLabel',text('String','Latitude','FontSize',14),'YTick',[-1 -0.866 -0.5 0 0.5 0.866 1], 'YTickLabel',{'';'-60';'-30';'0';'30';'60';''},'FontSize',14);
%set(gca,'yticklabel',[],'yticklabel',[]) 
box on
%if ~isempty(graph_title)
%    title(graph_title,'FontSize',12);
%else
%    title(['Data: ',strrep(dataid_1,'_',' '),' / Level (k) = ', num2str(kplot)],'FontSize',12);
%end
% draw filled rectangles
for i = 1:imax,
    for j = 1:jmax,
        if topo(j,i) > layb(j,i)
            h = patch([lonw(j,i) lonw(j,i) lone(j,i) lone(j,i)],[lats(j,i) latn(j,i) latn(j,i) lats(j,i)],color_g);
            set(h,'EdgeColor',color_g);
        else
            if (isnan(zm(j,i)))
                h = patch([lonw(j,i) lonw(j,i) lone(j,i) lone(j,i)],[lats(j,i) latn(j,i) latn(j,i) lats(j,i)],[1 1 1]);
                set(h,'EdgeColor',[1 1 1]);
            else
                col = round((1/2)+con_n*(zm(j,i)-con_min)/(con_max-con_min));
                if col < 1
                    col = 1;
                elseif col > con_n
                    col = 2*(con_n+1)+1;
                else
                    col = 2*col+1;
                end
                h = patch([lonw(j,i) lonw(j,i) lone(j,i) lone(j,i)],[lats(j,i) latn(j,i) latn(j,i) lats(j,i)],cmap(col,:));
                set(h,'EdgeColor',cmap(col,:));
            end
        end
    end
end
% draw continental outline
for j = 1:jmax,
    for i = 1:imax-1,
        if topo(j,i) > layb(j,i)
            if topo(j,i+1) <= layb(j,i+1)
                h = plot([lone(j,i) lone(j,i)],[lats(j,i) latn(j,i)],'k-');
                set(h,'LineWidth',1.0);
            end
        end
    end
    for i = 2:imax,
        if topo(j,i) > layb(j,i)
            if topo(j,i-1) <= layb(j,i-1)
                h = plot([lonw(j,i) lonw(j,i)],[lats(j,i) latn(j,i)],'k-');
                set(h,'LineWidth',1.0);
            end
        end
    end
end
for i = 1:imax,
    for j = 1:jmax-1,
        if topo(j,i) > layb(j,i)
            if topo(j+1,i) <= layb(j+1,i)
                h = plot([lonw(j,i) lone(j,i)],[latn(j,i) latn(j,i)],'k-');
                set(h,'LineWidth',1.0);
            end
        end
    end
    for j = 2:jmax,
        if topo(j,i) > layb(j,i)
            if topo(j-1,i) <= layb(j-1,i)
                h = plot([lonw(j,i) lone(j,i)],[lats(j,i) lats(j,i)],'k-');
                set(h,'LineWidth',1.0);
            end
        end
    end
end
% plot contours
if contour_plot == 'y'
    v = [con_min:(con_max-con_min)/(con_n/contour_mod):con_max];
    [C,h] = contour(xm_ex,sin(pi*ym_ex/180.0),zm_ex,v,'k-');
    set(h,'LineWidth',0.25);
    v = [con_min:(con_max-con_min)/(con_n/contour_mod_label):con_max];
    [C,h] = contour(xm_ex,sin(pi*ym_ex/180.0),zm_ex,v,'k');
    set(h,'LineWidth',1.0);
    if plot_log10 == 'y'
        %%%%%%%%
    elseif contour_label == 'y'
        clabel(C,h);
    end
end

%Fanny - contour O2/H2S
%[C,h] = contour(xm_ex,sin(pi*ym_ex/180.0),zm_ex,[10 10],'w--');
%set(h,'LineWidth',1.5);
%[C,h] = contour(xm_ex,sin(pi*ym_ex/180.0),zm_ex,[0 0],'k-.');
%set(h,'LineWidth',1.5);

set(gcf,'PaperOrientation','landscape')
%set(gcf,'PaperPosition',[0.2 0.2 10.3 7.8])


% plot overlay data
if ~isempty(overlaydataid)
%fanny
colormap(gray)
clear temp;
temp=overlaydata; A=find(temp(:,3)<0); temp(A)=NaN; temp(:,3)=temp(:,3)-0.5; 
A=find(temp(:,4)~=1); temp1=temp; temp1(A)=NaN;
scatter(temp1(:,1),temp1(:,2),4,temp1(:,3)/data_scale,'^','Filled','Sizedata',overlay_size,'MarkerEdgeColor','k');
A=find(temp(:,4)==1); temp1=temp; temp1(A)=NaN;
scatter(temp1(:,1),temp1(:,2),4,temp1(:,3)/data_scale,'v','Filled','Sizedata',overlay_size,'MarkerEdgeColor','k');
clear temp A, temp=overlaydata; A=find(temp(:,3)>=0); temp(A)=NaN; 
A=find(temp(:,4)~=1); temp1=temp; temp1(A)=NaN;
scatter(temp1(:,1),temp1(:,2),4,temp1(:,3)/data_scale,'x','Sizedata',overlay_size,'LineWidth',2,'MarkerEdgeColor','k');
A=find(temp(:,4)==1); temp1=temp; temp1(A)=NaN;
scatter(temp1(:,1),temp1(:,2),4,temp1(:,3)/data_scale,'+','Sizedata',overlay_size,'LineWidth',2,'MarkerEdgeColor','k');
%fanny - calcul of 'confidence' in the model-data comparison
clear model temp A B
model = zm;
%euxinia
A=find(model<=0); B=find(model>0); model(A)=-1; model(B)=1;
temp=overlaydata; S=size(temp); 
A=find(temp==0); temp(A)=1;
score=0; nb=0; total=0;
A=find(isnan(model)==1); Xm=xm; Xm(A)=NaN; Ym=ym; Ym(A)=NaN;
for i=1:S(1)
[Xi,Yi]=find(min(min(abs(temp(i,1)-Xm))+ min(abs(temp(i,2)-sin(pi*Ym/180.0))))==abs(temp(i,1)-Xm)+ abs(temp(i,2)-sin(pi*Ym/180.0)));
X=min(Xi); Y=min(Yi);
%true model value
  if ((model(X,Y)==1 & temp(i,3)==1) | (model(X,Y)==-1 & temp(i,3)==-1))
    score=score+1;
    nb=nb+1;
    total=total+1;
  elseif ((model(X,Y)==1 & temp(i,3)==0.5) | (model(X,Y)==-1 & temp(i,3)==-0.5))
    score=score+0.5;
    nb=nb+0.5;
    total=total+1;
%false model value
  elseif ((model(X,Y)==1 & temp(i,3)==-1) | (model(X,Y)==-1 & temp(i,3)==1))
    score=score-1;
    nb=nb+1;
    total=total+1;
   'false',i
  elseif ((model(X,Y)==1 & temp(i,3)==-0.5) | (model(X,Y)==-1 & temp(i,3)==0.5))
    score=score-0.5;
    nb=nb+0.5;
    total=total+1;
   'false',i
   else
   'not included', i
  end
%for X=Xi-1:2:Xi+1
%for Y=Yi-1:2:Yi+1
%true model value
%  if ((model(Y,X)==1 & temp(i,3)==1) | (model(Y,X)==-1 & temp(i,3)==-1)) 
%    score=score+0.25;
%    nb=nb+0.25;
%  elseif ((model(Y,X)==1 & temp(i,3)==0.5) | (model(Y,X)==-1 & temp(i,3)==-0.5))
%    score=score+0.125;
%    nb=nb+0.125;
%false model value
%  elseif ((model(Y,X)==1 & temp(i,3)==-1) | (model(Y,X)==-1 & temp(i,3)==1))
%    score=score-0.25;
%    nb=nb+0.25;
%  elseif ((model(Y,X)==1 & temp(i,3)==-0.5) | (model(Y,X)==-1 & temp(i,3)==0.5))
%    score=score-0.125;
%    nb=nb+0.125;
%  end
%end 
%end

end
S(1),total, nb
Confidence = (score/nb+1)/2
end

% draw plot border
h = plot([lon_min lon_max],[lat_min lat_min],'k-');
set(h,'LineWidth',1.0);
h = plot([lon_min lon_max],[lat_max lat_max],'k-');
set(h,'LineWidth',1.0);
h = plot([lon_min lon_min],[lat_min lat_max],'k-');
set(h,'LineWidth',1.0);
h = plot([lon_max lon_max],[lat_min lat_max],'k-');
set(h,'LineWidth',1.0);
%
hold off;
%
% *** CREATE COLOR BAR ************************************************** %
if plot_colorbar == 'y'
%
%Fanny
textsize =20;
set(gcf,'CurrentAxes',fh(3));
hold on;
%
set(gca,'XTick',[],'YTick',[]);
axis([0 1 0 con_n+2]);
% draw and label color bar rectangles
c = 1;
h = fill([0.1 0.2 0.3],[c-0.1 c-0.9 c-0.1],cmap(2*c-1,:));
if plot_log10 == 'y'
    str = ['below ',num2str(10^(con_min + (c-1)*(con_max-con_min)/con_n))];
else
    str = ['below ',num2str(con_min + (c-1)*(con_max-con_min)/con_n)];
end
textsize = 2+round(80/con_n);
if textsize > 10,
    textsize = 10;
end
text(0.40,c-0.5,str,'FontName','Arial','FontSize',textsize);
set(h,'LineWidth',0.5);
set(h,'EdgeColor','k');
for c = 2:con_n+1,
    h = fill([0.1 0.1 0.3 0.3],[c-0.9 c-0.1 c-0.1 c-0.9],cmap(2*c-1,:));
    if plot_log10 == 'y'
        str = [num2str(10^(con_min + (c-2)*(con_max-con_min)/con_n)),' - ',num2str(10^(con_min + (c-1)*(con_max-con_min)/con_n))];
    else
        str = [num2str(con_min + (c-2)*(con_max-con_min)/con_n),' - ',num2str(con_min + (c-1)*(con_max-con_min)/con_n)];
    end
    textsize = 2+round(80/con_n);
    if textsize > 10,
        textsize = 10;
    end
    text(0.40,c-0.5,str,'FontName','Arial','FontSize',textsize);
    set(h,'LineWidth',0.5);
    set(h,'EdgeColor','k');
end
c = con_n+2;
h = fill([0.1 0.2 0.3],[c-0.9 c-0.1 c-0.9],cmap(2*c-1,:));
if plot_log10 == 'y'
    str = ['above ',num2str(10^(con_min + (c-2)*(con_max-con_min)/con_n))];
else
    str = ['above ',num2str(con_min + (c-2)*(con_max-con_min)/con_n)];
end
textsize = 2+round(80/con_n);
if textsize > 10,
    textsize = 10;
end
text(0.40,c-0.5,str,'FontName','Arial','FontSize',textsize);
set(h,'LineWidth',0.5);
set(h,'EdgeColor','k');

hold off;
end
% *** PRINT PLOT ******************************************************** %
%
set(gcf,'CurrentAxes',fh(1));
%print('-dpsc2', [filename, '.ps']);
%print('-depsc2', [filename, '.eps']);
print('-dpng', [filename, '.png']);

% *** END *************************************************************** %
% close netCDF files
% *********************************************************************** %
%
netcdf.close(ncid_1);
if ~isempty(exp_2)
    netcdf.close(ncid_2);
end

clear all

% *********************************************************************** %
% *** OLD *************************************************************** %
% *********************************************************************** %

% % SAVE DIFFERENCE netCDF
%
% if (length(exp_2) > 0) | (timesliceid_2 > 0.0)
%     %
%     data = flipdim(data,1);
%     %
%     if length(exp_2) > 0
%         nc_name = [exp_1, '_MINUS_' exp_2, '.', num2str(timesliceid_1), '.nc'];
%         if timesliceid_2 > 0.0
%             nc_name = [exp_1, '_MINUS_' exp_2, '.', num2str(timesliceid_1), '_MINUS_', 'y', num2str(timesliceid_2), '.nc'];
%         end
%     elseif timesliceid_2 > 0.0
%         nc_name = [exp_1, '.', 'y', num2str(timesliceid_1), '_MINUS_', 'y', num2str(timesliceid_2), '.nc'];
%     end
%     % Create NetCDF file
%     nc = netcdf(nc_name, 'clobber');
%     % Global attributes
%     nc.description = ['Difference data: '];
%     nc.author = 'Andy Rigdwell';
%     nc.date = datestr(now);
%     % Define dimensions
%     nc('lat') = jmax;
%     nc('lat_edges') = jmax + 1;
%     nc('lon') = imax;
%     nc('lon_edges') = imax + 1;
%     nc('zt') = kmax;
%     nc('zt_edges') = kmax + 1;
%     nc('time') = 1;
%     % Define variables - grid
%     nc{'lat'} = {'lat'};
%     nc{'lat_edges'} = {'lat_edges'};
%     nc{'lon'} = {'lon'};
%     nc{'lon_edges'} = {'lon_edges'};
%     nc{'zt'} = {'zt'};
%     nc{'zt_edges'} = {'zt_edges'};
%     nc{'time'} = {'time'};
%     % Define variables - data
%     nc{'grid_level'} = {'lat', 'lon'};
%     nc{'grid_topo'} = {'lat', 'lon'};
%     nc{dataid} = {'time' 'zt', 'lat', 'lon'};
%     % Attributes - grid
%     nc{'lat'}.units = 'degrees';
%     nc{'lat_edges'}.units = 'degrees';
%     nc{'lon'}.units = 'degrees';
%     nc{'lon_edges'}.units = 'degrees';
%     nc{'zt'}.units = 'm';
%     nc{'zt_edges'}.units = 'm';
%     nc{'time'}.units = 'yr';
%     % Attributes - data
%     nc{'grid_level'}.units = '1';
%     nc{'grid_topo'}.units = '1';
%     nc{dataid}.units = 'n/a';
%     % Put - grid
%     nc{'lat'}(:) = grid_lat;
%     nc{'lat_edges'}(:) = grid_lat_edges;
%     nc{'lon'}(:) = grid_lon;
%     nc{'lon_edges'}(:) = grid_lon_edges;
%     nc{'zt'}(:) = zt;
%     nc{'zt_edges'}(:) = zt_edges;
%     nc{'time'}(:) = 0.0;
%     % Put - data
%     nc{'grid_level'}(:,:) = grid_level;
%     nc{'grid_topo'}(:,:) = grid_topo;
%     nc{dataid}(1,:,:,:) = data(:,:,:);
%     % Close the file
%     nc = close(nc);
% end
