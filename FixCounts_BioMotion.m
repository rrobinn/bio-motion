% This code reads in eye-tracking .mat files in a specified directory
% (`matFileDir`).  These inputs can be edited in the first few lines of
% the script.

%% constants
clear
clc
wdir = '/Users/sifre002/Documents/Code/bio-motion/';
matFileDir = '/Users/sifre002/Box/sifre002/7_MatFiles/04_BioMotion/partic_data/';

% CHECK THAT THIS IS CORRECT
% column 13 has the flags you need
% -3 = blink
% -2 = lost
% -1 = saccade
% 1 = upright
% 2 = inverted

% 1: clip num
% 2: include
% 3: PORx
% 4:PORy
% 5: PupD
% 6: recalib
% 7: Xshift
% 8: Yshift
% 9: Vel
% 10: Sacc
% 11: Lost
% 12: Blink
% 13: ROI value code (-3=blink, -2=lost, -1=sacc; 1=ROI 1, etc.)
% 14: scheme


%% Get start and stop indices of part 1 and part 2
cd(wdir);
[movs] = longAnimShortAnim();
long = movs(:,1);
short = movs(:,2:3);
indexDict = zeros(size(long,1)*2, 4);
count = 1;
for m = 1:size(long,1)
    longMov = long(m);
    for p = 1:2
        shortMov = short(m,p);
        ThisNumFrames = common_getstillsnumbers(shortMov);
        if p == 1
            startInd = 1;
            endInd = ThisNumFrames;
        else
            startInd = indexDict(count-1, 4) + 1; % part 1 end index + 1
            endInd = startInd + ThisNumFrames - 1;
        end
        indexDict(count,1) = longMov;
        indexDict(count,2) = p;
        indexDict(count,3) = startInd;
        indexDict(count,4) = endInd;
        count = count + 1;
    end
end


%% Get list of all files in matFileDir
myFiles = dir(matFileDir);
myFiles=myFiles(~[myFiles.isdir]); % .mat files are not in separate directories 

allOut = [];
errorLog={};
for p = 1:size(myFiles,1) % For each .mat file:
   
    % Load data
    file = myFiles(p).name;
    id=strsplit(file, '_');
    id = [id{1} '_' id{2}];
    disp([id '---' num2str(p) ' of ' num2str(length(myFiles)) ]);
    try
        load([matFileDir file]);
    catch ME % save error
        errorLog=vertcat(errorLog,[id '--' ME.identifier]);
        display(errorLog,[id '--' ME.identifier]);
        continue
    end
    currentClipList = eval([id(1:8) '_prefbin.MovieListAsPresented']);  %Get the list of clips as presented
    currentMatFile = eval([id(1:8) '_data']);
    
    [tf, loc] = ismember(currentClipList,long); % logical index into the ANIM clips
    anim_data = currentMatFile(tf,:); % Cell array of data for the ANIM clips this person has seen
    listOfClipsSeen = currentClipList(tf); % Cell array of list of the ANIM clips this person has sson
    
    if size(anim_data,1) > 0
        thisParticOut = [];
        for c = 1:size(anim_data, 1)
            mov_out = zeros(3, 8);
            % pull dat
            dat = anim_data{c,1};
            mov = dat(1,1);
            include = dat(1,2);
            eyeDat = dat(:,13);
            
            for part = [0:2]
                if part == 0
                    startInd = 1;
                    endInd = size(dat,1);
                else % get indices
                    startInd = indexDict(indexDict(:,1) == mov & indexDict(:,2) == part, 3);
                    endInd = indexDict(indexDict(:,1) == mov & indexDict(:,2) == part, 4);
                end
                tempEyeDat = eyeDat(startInd:endInd);
                % tally missing, blink, saccade, fp1, fp2
                blinkCount = sum(tempEyeDat == -3); 
                missingCount = sum(tempEyeDat == -2);
                saccCount = sum(tempEyeDat == -1); 
                fp1Count = sum(tempEyeDat == 1);
                fp2Count = sum(tempEyeDat == 2);
                
                mov_out(part+1, :) = [mov part include saccCount missingCount blinkCount fp1Count fp2Count];
            end
            thisParticOut = vertcat(thisParticOut, mov_out);
            
        end
        
    else
        disp(['no anim data for  ' id]);
        errorLog = vertcat(errorLog, ['no anim data for  ' id]);
        continue
    end
    thisParticOut = num2cell(thisParticOut);
    thisParticOut(:,9) = {id};
    allOut = vertcat(allOut, thisParticOut);
    
    % clear data from workspace
    id=strsplit(id, '_'); id=id{1}; % Part of ID without sess #
    toDelete={[id '_data'], [id '_prefbin'], [id '_recalibdata']};
    clear(toDelete{:}); 
end % end participant loop


%% save data
headers = {'mov', 'part', 'include', 'saccCount', 'missingCount', 'blinkCount', 'fp1Count', 'fp2Count', 'id'};
save('/Users/sifre002/Box/sifre002/7_MatFiles/04_BioMotion/fixTallys.mat', 'allOut', 'headers', 'errorLog');


clearvars -except allOut headers errorLog