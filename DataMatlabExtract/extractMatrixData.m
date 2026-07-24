%% Load Brüel & Kjær PULSE frequency responses
% Creates H_grid(freq,row,col)

clear
close all
clc

%% ------------------------------------------------------------------------
% SETTINGS
% -------------------------------------------------------------------------

%dataFolder = fullfile('..','Results','CenterPosition','FrequencyResponses');
%dataFolder = fullfile('..','Results','FarCenterPosition','FrequencyResponses');
dataFolder = fullfile('..','Results','RightCornerPosition','FrequencyResponses');

baseName = 'Frequency Response H1(Signal %d,Signal 1) - Input.txt';

firstSignal = 5;
lastSignal  = 64;

nRows = 6;
nCols = 10;
numMics = nRows*nCols;

headerLines = 78;

%% ------------------------------------------------------------------------
% PREALLOCATE
% -------------------------------------------------------------------------

freq = [];
H_raw = [];

fprintf('Loading %d microphone files...\n\n',numMics);

%% ------------------------------------------------------------------------
% READ FILES
% -------------------------------------------------------------------------

for sig = firstSignal:lastSignal

    filename = fullfile(dataFolder,sprintf(baseName,sig));

    fprintf('Reading Signal %d...\n',sig);

    fid = fopen(filename,'r');

    if fid==-1
        error('Cannot open %s',filename)
    end

    %---------------------------------------------------------------
    % Skip header
    %---------------------------------------------------------------

    for k = 1:headerLines
        fgetl(fid);
    end

    %---------------------------------------------------------------
    % Read numerical data
    %---------------------------------------------------------------

    A = zeros(6401,4);

    row = 1;

    while ~feof(fid)

        line = fgetl(fid);

        if isempty(line)
            continue
        end

        % decimal comma -> decimal point
        line = strrep(line,',','.');

        vals = sscanf(line,'%f %f %f %f');

        if numel(vals)==4

            A(row,:) = vals.';
            row = row+1;

        end

    end

    fclose(fid);

    % Remove unused rows if any
    A = A(1:row-1,:);

    %---------------------------------------------------------------
    % Check first file
    %---------------------------------------------------------------

    if isempty(freq)

        fprintf('\n');

        fprintf('Loaded %d frequency points\n',size(A,1));

        freq = A(:,2);

        H_raw = zeros(length(freq),numMics);

    end

    mic = sig-firstSignal+1;

    H_raw(:,mic) = A(:,3) + 1i*A(:,4);

end

%% ------------------------------------------------------------------------
% BUILD PHYSICAL GRID
% -------------------------------------------------------------------------

H_grid = zeros(length(freq),nRows,nCols);

idx = 1;

for col = nCols:-1:1

    for row = nRows:-1:1

        H_grid(:,row,col) = H_raw(:,idx);

        idx = idx+1;

    end

end

H = reshape(H_grid,length(freq),[]);

%% ------------------------------------------------------------------------
% SAVE
% -------------------------------------------------------------------------

save('mic_array_data_RightCorner.mat',...
    'freq','H','H_raw','H_grid','nRows','nCols','-v7.3');

fprintf('\n=====================================\n');
fprintf('Frequency points : %d\n',length(freq));
fprintf('Frequency range  : %.1f - %.1f Hz\n',freq(1),freq(end));
fprintf('Grid             : %d x %d\n',nRows,nCols);
fprintf('=====================================\n');




%Pressure Graph For Checking the Matrix fill order
% [~,idxf] = min(abs(freq-1000));
% 
% figure
% imagesc(abs(squeeze(H_grid(idxf,:,:))))
% axis equal
% colorbar
% title('Measured pressure magnitude')
% xlabel('Column')
% ylabel('Row')