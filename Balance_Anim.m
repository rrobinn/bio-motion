clearvars -except allOut
sessions = unique(allOut(:,9));
balance_allOut = [];

%allOut_mat = allOut(:, 1:8);
%allOut_mat = cell2mat(allOut_mat);
for s = 1:size(sessions,1)
    logic = strcmp(sessions{s}, allOut(:,9));
    
    %% 1. select session data 
    session_dat = allOut(logic, 1:8); 
    session_dat = cell2mat(session_dat); 
    
    thisParticOut = [];
    %% Select data for whole movie, part 1, or part 2
    for p = [0:2] 
        temp = session_dat(session_dat(:,2)==p, :); %
        temp(:,9) = temp(:,7) + temp(:,8); % add column that has total fix
        %% 1. exclude videos, or video segments with % fix <= .2
        % calculate percent fix for inclusion/exclusion (cant use flags bc
        % of part 1, part 2 isseu)
        totalFrames = sum(temp(:, 4:8),2);
        totalFixP = temp(:,9) ./ totalFrames;
        include1 = totalFixP >= .2; 
        temp(:,10) = include1; % column for include based on fix 
        temp(:,11) = temp(:,10); % column for including based on balance - if excluded for % fix, by default also excluded for balancing
        %% 2. exclude videos, or video segments that are unbalanced with lowest fix 
        % filter data that survive after filtering for % total fix 
        dat1 = temp(include1, :);
        odd = mod(dat1(:,1),2);
        if sum(odd) == sum(~odd) % already balanced
            thisParticOut = vertcat(thisParticOut, [temp]); 
        else
            odd = logical(odd);
            odd_dat = dat1(odd, :);
            even_dat = dat1(~odd, :);
            % If 2 even, 0 odd, balanceDiff=NEG 2. Need to remove 2 (e.g.
            % abs(balanceDiff) from even.
            % If 2 odd, 0 even, balanceDiff=POS 2. Need to remove 2 (e.g.
            % abs(balanceDiff) from odd. 
            balanceDiff = sum(odd) - sum(~odd); 
            if balanceDiff > 0 % more odd data
                odd_dat = sortrows(odd_dat, 9); % sort from least to most data
                odd_dat(1:abs(balanceDiff), 11) = 0;
            else % more even data
               even_dat = sortrows(even_dat, 9); % sort from least to most data
               even_dat(1:abs(balanceDiff), 11) = 0;
            end
          dat2 = [even_dat; odd_dat];
          % add back in data that were excluded for % fix
          temp = temp(~include1, :);
          temp(:,11) = 0; % If excluded for % fix, automatically excluded for balancing 
          
          
        thisParticOut = vertcat(thisParticOut, [dat2; temp]);
        end % end balance loop 
    end % end movie part loop
    thisParticOut = num2cell(thisParticOut);
    thisParticOut(:, 12) = repmat({sessions{s}}, size(thisParticOut,1),1);
    
    balance_allOut = vertcat(balance_allOut, thisParticOut); 
end

%% save data 
save('/Users/sifre002/Box/sifre002/7_MatFiles/04_BioMotion/fixTallys_balanced.mat', 'balance_allOut');

dataHeader = {'mov', 'part','include', 'saccCount', 'missingCount','blinkCount','fp1Count', 'fp2Count', 'allCount', 'includeDatacount', 'includeBalance', 'matlabID'};
 mytable = cell2table(balance_allOut, 'VariableNames', dataHeader);
 
writetable(mytable, '/Users/sifre002/Box/sifre002/9_ExcelSpreadsheets/05_BioMotion/Summary_dat/20191108_Balanced_dat.xlsx');
