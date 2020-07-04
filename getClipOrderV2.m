function [longClip] = getClipOrderV2(shortClip)

% Functoin takes an ANIM-short clip, and returns the long clip that it
% shows up FIRST for 

% Check that input is an ANIM long short
assert(logical(length(intersect(shortClip, [82:93,354:363])==1)), 'error: getShortClips: Input is not an ANIM-short clip');


orderOfLongClips(:,1) = 424:433;

if shortClip >= 354 & shortClip <= 363
% One dyad of short clips for each long clip.
    orderOfShortClips = {354, 356; 355,357; 360, 362; 361,363; 362,358; 363, 359; 356, 360; 357, 361; 358, 354; 359,355};
           longClip = zeros(2,1);  
else
   orderOfShortClips =  {82,86; ...
                         83, 87; ...
                         90,92; ...
                         91, 93; ...
                         92, 88;...
                         93, 89;...
                         86, 90;...
                         87, 91;...
                         88, 82;...
                         89, 83};
     longClip = zeros(2,1); 
       
end

       
for o = 1:2
    IdxToSearch = find(cell2mat(orderOfShortClips(:,o))==shortClip); %Find which long-clip this short clip is the first or second movie (depending on o)
    lClip = orderOfLongClips(IdxToSearch); 
    longClip(o) = lClip;

end

end

