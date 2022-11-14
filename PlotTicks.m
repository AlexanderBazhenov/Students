% Created: 2022-09-01

function retval = PlotTicks (X)
% Plot ticks labels for array of interval
retval = 0
%
xticklabels([])
yticklabels([])
xticksarray = 1:numel(X)
xticks(xticksarray)
yticksarray = ceil(min(inf(X))):ceil(max(sup(X)))
yticks(yticksarray)
xticklabels(xticksarray)
yticklabels(yticksarray)
%
retval = 1
endfunction
