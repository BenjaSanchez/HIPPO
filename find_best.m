%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% find_best
% Find all solutions with no identification problems.
%
% Benjamín J. Sánchez
% Last Update: 2014-11-19
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [best_group cmp_group] = find_best(it)

if nargin == 0
    load('it.mat');
end

best_group = [];
cmp_group  = [];
for i = 1:length(it.codes)
    CC     = it.codes{i,2}.CC;
    Mc     = it.codes{i,2}.Mc;
    Ms     = it.codes{i,2}.Ms;
    J_SSm  = it.codes{i,2}.J_SSm;
    AICc   = it.codes{i,2}.AICc;
    kfixed = it.codes{i,2}.kfixed;
    assignin('base','kfixed',kfixed);
    if sum(decision(CC,Mc,Ms)) == 0 && max(max(Ms)) < 10
        kf = zeros(size(kfixed));
        kn = zeros(size(kfixed));
        for j = 1:length(kfixed)
            if ~isnan(kfixed(j))
                kf(j) = 1;
                kn(j) = j;
            end
        end
        best_group = [best_group;i];
        cmp_group  = [cmp_group;kn J_SSm AICc sum(CC)/sum(kf)];
    end
end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%