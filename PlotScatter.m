% Created: 2022-09-01

function retval = PlotScatter (X, colorspecial)
%
% colorspecial = [0 0 1]; colorspecial = OxfordBlue
% set(h, 'color', OxfordBlue )
%
retval = 0
nums = 1:length(X)
%
%figure
hold on
h=errorbar (nums , mid(X), rad(X),".b");
box('off')
set (h, 'linewidth', 2);
set(h, 'color', colorspecial )
## set(h, 'color', RoyalMail )
## set(h, 'color', Pantone )
xlim( [1-1 length(X)+1] )
ylim( [ min(inf(X))-1 max(sup(X))+1 ] )
%axis('equal')
set(gca, 'fontsize', 14);
set(gca, 'linewidth', 1);
%
retval = 1
endfunction
