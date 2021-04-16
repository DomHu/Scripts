%%%%%%%% Calculate anoxia pourcentage %%%%%%%%
function[Globalanox,BWanox,GlobalH2S,BWH2S ]=calculate_anoxia(PEXP1, PANOXIA, PTIME)
% PANOXIA = true to calcuylate anoxia;  FALSE = to calculate Euxinia
% Example call:
% calculate_anoxia('./cgenie_output/0804_02_fkl_ep21_1C1P1O_allFeedb_forc_atm_Fdet18g_200k', true, 199999.5)

% INITIALIZE PARAMETERS & VARIABLES
%exp_1 = '../EXAMPLE2.DOM_p0093k.PO4Fe.SPIN_1P2CO2_0205'
%exp_1 = './cgenie_output/2509_08_p0093k.2P4pCO2_With_OMEN_No_sulf_k2_1e-5_anoxic'
%exp_1 = ['./cgenie_output/' PEXP1]
Globalanox = 0.0;
BWanox = 0.0;
GlobalH2S = 0.0;
BWH2S = 0.0;

exp_1 = PEXP1;
timesliceid_1 = PTIME;
if(PANOXIA)
    dataid_1 = 'ocn_O2';
    dataid_2 = 'ocn_ben_O2';
    anoxthr = 5e-6; % euxina: 10e-6; anoxia: 5e-6
else
    dataid_1 = 'ocn_H2S';
    dataid_2 = 'ocn_ben_H2S';
    anoxthr = 10e-6; % euxina: 10e-6; anoxia: 5e-6

end

lat_min = -090;
lat_max = +090;
lon_min = -180;%0; %-260;%        % STARTING LONGITUDE FOR X-AXIS
lon_max = lon_min+360;

%%% open netCDF file
ncid_1=netcdf.open([exp_1 '/biogem/fields_biogem_3d.nc'],'nowrite');
ncid_2=netcdf.open([exp_1 '/biogem/fields_biogem_2d.nc'],'nowrite');
% read netCDf information
[ndims,nvars,ngatts,unlimdimid] = netcdf.inq(ncid_1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SET UP GRID
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
    end
end
% load and calculate remaining grid information
varid  = netcdf.inqVarID(ncid_1,'lat');
grid_lat = netcdf.getVar(ncid_1,varid);
varid  = netcdf.inqVarID(ncid_1,'lon');
grid_lon = netcdf.getVar(ncid_1,varid);
[latm laym] = meshgrid(grid_lat,-grid_zt);
varid  = netcdf.inqVarID(ncid_1,'lat_edges');
grid_lat_edges = netcdf.getVar(ncid_1,varid);
varid  = netcdf.inqVarID(ncid_1,'lon_edges');
grid_lon_edges = netcdf.getVar(ncid_1,varid);
[lats layb] = meshgrid(grid_lat_edges(1:jmax),-grid_zt_edges(1:kmax));
[latn layt] = meshgrid(grid_lat_edges(2:jmax+1),-grid_zt_edges(2:kmax+1));
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

% LOAD DATA
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
        dataid_1 = input('   > Variable name: ','s');
    end
end
% load data
% flip array around diagonal to give (j,i) array orientation
[varname,xtype,dimids,natts] = netcdf.inqVar(ncid_1,varid);
rawdata = netcdf.getVar(ncid_1,varid);
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

% read netCDf information
[ndims,nvars,ngatts,unlimdimid] = netcdf.inq(ncid_2);


% *** SET UP GRID FOR SEAFLOOR ****************************************** %
%
% *********************************************************************** %
%
% load grid data
varid  = netcdf.inqVarID(ncid_2,'grid_level');
grid_k1(:,:) = netcdf.getVar(ncid_2,varid);
% flip array around diagonal to give (j,i) array orientation
grid_k1 = grid_k1';
% load and calculate remaining grid information
% calculate grid dimensions
varid  = netcdf.inqVarID(ncid_2,'lat');
[dimname, dimlen] = netcdf.inqDim(ncid_2,varid);
jmax = dimlen;
grid_lat = netcdf.getVar(ncid_2,varid);
varid  = netcdf.inqVarID(ncid_2,'lon');
[dimname, dimlen] = netcdf.inqDim(ncid_2,varid);
imax = dimlen;
grid_lon = netcdf.getVar(ncid_2,varid);
[lonm latm] = meshgrid(grid_lon,grid_lat);
varid  = netcdf.inqVarID(ncid_2,'lat_edges');
grid_lat_edges = netcdf.getVar(ncid_2,varid);
varid  = netcdf.inqVarID(ncid_2,'lon_edges');
grid_lon_edges = netcdf.getVar(ncid_2,varid);
[lonw lats] = meshgrid(grid_lon_edges(1:imax),grid_lat_edges(1:jmax));
[lone latn] = meshgrid(grid_lon_edges(2:imax+1),grid_lat_edges(2:jmax+1));
% Non-uniform grid
lat_max = sin(pi*lat_max/180.0);
lat_min = sin(pi*lat_min/180.0);
latn = sin(pi*latn/180.0);
lats = sin(pi*lats/180.0);
%initialize dummy topography
topo = zeros(jmax,imax);
layb = zeros(jmax,imax);
%i=1 longitude grid origin
grid_lon_origin = grid_lon_edges(1);

% *** SET PRIMARY GRIDDED DATASET *************************************** %
%
% *********************************************************************** %
%
% check that the year exists
varid  = netcdf.inqVarID(ncid_2,'time');
timeslices = netcdf.getVar(ncid_2,varid);
[dimname, dimlen] = netcdf.inqDim(ncid_2,varid);
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
        dataid_2 = input('   > Variable name: ','s');
    end
end
% load data
% flip array around diagonal to give (j,i) array orientation
[varname,xtype,dimids,natts] = netcdf.inqVar(ncid_2,varid);
rawdata = netcdf.getVar(ncid_2,varid);
if length(dimids) == 3
    rawdata(1:imax,1:jmax) = rawdata(1:imax,1:jmax,tid);
    data_2(1:jmax,1:imax) = rawdata(1:imax,1:jmax)';
elseif length(dimids) == 2
    rawdata(1:imax,1:jmax) = rawdata(1:imax,1:jmax);
    data_2(1:jmax,1:imax) = rawdata(1:imax,1:jmax)';
else
    data_2(:,:) = NaN;
end

% calculate anoxia percentage
clear anoxid
data_1(data_1<=-0.9E19 | data_1>= 0.9E36)=NaN;
data_1(data_1<0)=0;
%data_1(data_1<0 | data_1>= 0.9E36)=NaN;
oceanid = find(data_1>=0);
anoxid = find(data_1<=anoxthr & data_1>=0);
% Dom
if(PANOXIA)
Globalanox = sum(data_V(anoxid))/sum(data_V(oceanid))*100
else
    GlobalH2S = 100- sum(data_V(anoxid))/sum(data_V(oceanid))*100
end
clear anoxid
data_2(data_2<=-0.9E19 | data_2>= 0.9E36)=NaN;
data_2(data_2<0)=0;
%data_2(data_2<0 | data_2>= 0.9E36)=NaN;
oceanid = find(data_2>=0);
anoxid = find(data_2<=anoxthr & data_2>=0);
% BWanoxwrong = sum(anoxid)/sum(oceanid)*100
if(PANOXIA)
BWanox = size(anoxid,1)/size(oceanid,1)*100 % SX: added
else
BWH2S = 100-sum(anoxid)/sum(oceanid)*100
end
netcdf.close(ncid_1);
netcdf.close(ncid_2);
