% Created: 2022-09-01

function retval = PlotJ (X)
% Plot min inclusion
retval = 0
% Plot J
J = ki(max(inf(X)), min(sup(X)))
%
xxlim=xlim
xx = [ xxlim(1) xxlim(2) ]
yy = [ inf(J) inf(J) ]
hinf = plot(xx, yy, '--k')
yy = [ sup(J) sup(J) ]
hsup = plot(xx, yy, '--k')
set(hinf, 'linewidth', 1)
set(hsup, 'linewidth', 1)
%
retval = 1
endfunction
