% 2022-08-31
% dirroot = 'D:\Data\ST\2022\T\kinterval-0.0.1'
clear all
close all
dirroot = 'D:\Data\ST\2022\T\'
dirroot ='D:\Users\aspire\Dropbox\ST\2022\T'
dirroot ='e:\Users\Public\Documents\ST\2022\T\'
% ki
cd(dirroot), pwd

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% interval
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pkg load interval

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Xini = [ infsup(1,2) infsup(3,4) infsup(2,3)  infsup(1,3) infsup(2,4) infsup(1,4)]

X = Xini
I = infsup(min(inf(X)), max(sup(X)))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Kaucher %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dirki= strcat(dirroot, 'kinterval-0.0.1')
addpath(dirki)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Kaucher %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
J = ki(max(inf(X)), min(sup(X)))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Colors_special
% Scattering Diagram
retval = PlotScatter (X, OxfordBlue)
%
retval = PlotJ (X)
%
retval = PlotTicks (X)
%
Data_str = 'DataIni'
Type_str = 'ScatteringDiagram'
%
figure_name_out=strcat(Data_str,Type_str, '.png')
print('-dpng', '-r300', figure_name_out), pwd
% /Scattering Diagram
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Status Diagram
Y = []
XY= [X Y]
[RelResXY, HighLevXY] = InfluencePlotXYtot (X, Y)

figure
hold on
xxlim = [-1.5 1.5]
PLOT_Influence_Diagram_Empty_Double
% Samples
for ii = 1: length(XY)
h = plot(HighLevXY(ii), RelResXY(ii), 'ob');
text(HighLevXY(ii)+0.02, RelResXY(ii)-0.04, num2str(ii), 'Fontsize', 12);
end
%
set(gca, 'fontsize', 14);
set(gca, 'linewidth', 1);
%
Data_str = 'DataIni'
Type_str = 'StatusDiagram'
%
figure_name_out=strcat(Data_str,Type_str, '.png')
print('-dpng', '-r300', figure_name_out), pwd
% /Status Diagram
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Oskorbin regularization
[oskorbin_center, k] = estimate_uncertainty_center(XY')
Y = []
X = midrad(mid(X), k*rad(X))
XY= [X Y]
[RelResXY, HighLevXY] = InfluencePlotXYtot (X, Y)

figure
hold on
xxlim = [-1.5 1.5]
PLOT_Influence_Diagram_Empty_Double
% Samples
for ii = 1: length(XY)
h = plot(HighLevXY(ii), RelResXY(ii), 'ob');
text(HighLevXY(ii)+0.02, RelResXY(ii)-0.04, num2str(ii), 'Fontsize', 12);
end
%
set(gca, 'fontsize', 14);
set(gca, 'linewidth', 1);
%
Data_str = 'DataOskorbin'
Type_str = 'StatusDiagram'
%
figure_name_out=strcat(Data_str,Type_str, '.png')
print('-dpng', '-r300', figure_name_out), pwd
% /Oskorbin regularization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Oskorbin regularization x4
[oskorbin_center, k] = estimate_uncertainty_center(XY')
Y = []
X = midrad(mid(X), 4*k*rad(X))
XY= [X Y]
[RelResXY, HighLevXY] = InfluencePlotXYtot (X, Y)

figure
hold on
xxlim = [-1.5 1.5]
PLOT_Influence_Diagram_Empty_Double
% Samples
for ii = 1: length(XY)
h = plot(HighLevXY(ii), RelResXY(ii), 'ob');
text(HighLevXY(ii)+0.02, RelResXY(ii)-0.04, num2str(ii), 'Fontsize', 12);
end
%
set(gca, 'fontsize', 14);
set(gca, 'linewidth', 1);
%
Data_str = 'DataOskorbinx4'
Type_str = 'StatusDiagram'
%
figure_name_out=strcat(Data_str,Type_str, '.png')
print('-dpng', '-r300', figure_name_out), pwd
% /Oskorbin regularization x2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DATA Initial
figure
subplot(1,2,1)
retval = PlotScatter (X, OxfordBlue)
%
retval = PlotJ (X)
%
retval = PlotTicks (X)
%
subplot(1,2,2)
 [RelResXY, HighLevXY] = InfluencePlotXYtot (X, Y)
hold on
xxlim = [-1.5 1.5]
PLOT_Influence_Diagram_Empty_Double
% Samples
for ii = 1: length(XY)
h = plot(HighLevXY(ii), RelResXY(ii), 'ob');
text(HighLevXY(ii)+0.02, RelResXY(ii)-0.04, num2str(ii), 'Fontsize', 12);
end
%
set(gca, 'fontsize', 14);
set(gca, 'linewidth', 1);
%
Data_str = 'DataIni'
Type_str = 'ScatterStatusDiagram'
%
figure_name_out=strcat(Data_str,Type_str, '.png')
print('-dpng', '-r300', figure_name_out), pwd
% /DATA Initial
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[oskorbin_center, kOskorbin] = estimate_uncertainty_center(XY')

JK_array = []
%
for jj = 1:2
  X = midrad(mid(Xini), jj*kOskorbin*rad(Xini))
 JKnow = jaccardKRSet(X)
 JK_array = [JK_array, JKnow]
XY= [X Y]
figure
subplot(1,2,1)
retval = PlotScatter (X, OxfordBlue)
%
retval = PlotJ (X)
%
retval = PlotTicks (X)
%
subplot(1,2,2)
 [RelResXY, HighLevXY] = InfluencePlotXYtot (X, Y)
hold on
xxlim = [-1.5 1.5]
PLOT_Influence_Diagram_Empty_Double
% Samples
for ii = 1: length(XY)
h = plot(HighLevXY(ii), RelResXY(ii), 'ob');
text(HighLevXY(ii)+0.02, RelResXY(ii)-0.04, num2str(ii), 'Fontsize', 10);
end
%
set(gca, 'fontsize', 14);
set(gca, 'linewidth', 1);
%
Data_str = 'DataCorrected'
Type_str = 'ScatterStatusDiagram'
Param_str = strcat(' mult=', num2str(jj))
%
figure_name_out=strcat(Data_str,Type_str,Param_str, '.png')
print('-dpng', '-r300', figure_name_out), pwd
end

I = infsup(min(inf(X)), max(sup(X)))
J = ki(max(inf(X)), min(sup(X)))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Xeq = [ infsup(2,3) infsup(2,3) infsup(2,3)  infsup(2,3) infsup(2,3) infsup(2,3) ]

X=Xeq
I = infsup(min(inf(X)), max(sup(X)))
J = ki(max(inf(X)), min(sup(X)))
X = Xini
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DATA equal
figure
subplot(1,2,1)
retval = PlotScatter (X, OxfordBlue)
%
retval = PlotJ (X)
%
retval = PlotTicks (X)
%
subplot(1,2,2)
 [RelResXY, HighLevXY] = InfluencePlotXYtot (X, Y)
hold on
xxlim = [-1.5 1.5]
PLOT_Influence_Diagram_Empty_Double
% Samples
for ii = 1: length(XY)
h = plot(HighLevXY(ii), RelResXY(ii), 'ob');
%text(HighLevXY(ii)+0.02, RelResXY(ii)-0.04, num2str(ii), 'Fontsize', 12);
end
%
set(gca, 'fontsize', 14);
set(gca, 'linewidth', 1);
%
Data_str = 'DataEq'
Type_str = 'ScatterStatusDiagram'
%
figure_name_out=strcat(Data_str,Type_str, '.png')
print('-dpng', '-r300', figure_name_out), pwd
% /DATA equal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     All data diagramm
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Status Diagram
Y = []
X = Xini
XY= [X Y]
[RelResXY, HighLevXY] = InfluencePlotXYtot (X, Y)

figure
hold on
xxlim = [-1.5 1.5]
ylim( [-2.5 2.5])
PLOT_Influence_Diagram_Empty_Double2
yticklabels([])
xticksarray = [-1 0 1]
xticks(xticksarray)
yticksarray =  [-1 0 1]
yticks(yticksarray)
xticklabels(xticksarray)
yticklabels(yticksarray)
        xx= [-1.5 1.55]
        yy = [-2.5 -2.5]
        ll = plot(xx, yy, '-k')
        set(ll, 'linewidth', 1)
        xlim ([-1.5 1.52])
%
% Samples
for ii = 1: length(XY)
h = plot(HighLevXY(ii), RelResXY(ii), 'ob');
text(HighLevXY(ii)-0.06, RelResXY(ii)-0.04, num2str(ii), 'Fontsize', 12);
set(h, 'markersize', 5)
set(h, 'color', [1 0 0])
end

%
set(gca, 'fontsize', 14);
set(gca, 'linewidth', 1);
%
X = midrad(mid(Xini), 2*rad(Xini))
XY= [X Y]
[RelResXY, HighLevXY] = InfluencePlotXYtot (X, Y)
for ii = 1: length(XY)
h = plot(HighLevXY(ii), RelResXY(ii), 'ob');
text(HighLevXY(ii)-0.06, RelResXY(ii)-0.04, num2str(ii), 'Fontsize', 12);
set(h, 'markersize', 5)
set(h, 'color', [0 0 1])
end
%
X = midrad(mid(Xini), 4*rad(Xini))
XY= [X Y]
[RelResXY, HighLevXY] = InfluencePlotXYtot (X, Y)
for ii = 1: length(XY)
h = plot(HighLevXY(ii), RelResXY(ii), 'sb');
text(HighLevXY(ii)-0.06, RelResXY(ii)-0.04, num2str(ii), 'Fontsize', 12);
set(h, 'markersize', 5)
set(h, 'color', [0 0 1])
end
%
xx = 1
yy = 0
pp = plot(xx, yy, 'or')

Data_str = 'DataAll'
Type_str = 'StatusDiagram'
%
figure_name_out=strcat(Data_str,Type_str, '.png')
print('-dpng', '-r300', figure_name_out), pwd
% /Status Diagram
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    data stream
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Status Diagram
Y = []
X = Xini
Xini5=X(1:5)
XY= [Xini5 Y]
[ResIni, LevIni] = InfluencePlotXYtot (X, Y)

figure
%%%%%%%%%%%%%%%% Plot Ini %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hold on
xxlim = [-1.5 1.5]
ylim( [-2.5 2.5])
PLOT_Influence_Diagram_Empty_Double2
yticklabels([])
xticksarray = [-1 0 1]
xticks(xticksarray)
yticksarray =  [-1 0 1]
yticks(yticksarray)
xticklabels(xticksarray)
yticklabels(yticksarray)
        xx= [-1.5 1.55]
        yy = [-2.5 -2.5]
        ll = plot(xx, yy, '-k')
        set(ll, 'linewidth', 1)
        xlim ([-1.5 1.52])
%
% Samples
for ii = 1: length(XY)
h = plot(LevIni(ii), ResIni(ii), 'ob');
text(LevIni(ii)-0.06, ResIni(ii)-0.04, num2str(ii), 'Fontsize', 12);
set(h, 'markersize', 5)
set(h, 'color', [1 0 0])
end

%
set(gca, 'fontsize', 14);
set(gca, 'linewidth', 1);
%
%%%%%%%%%%%%%%%% Plot Ini %%%%%%%%%%%%%%%%%%%%%%%%%%%%%


for ww=1.5:0.25:4
Xnow = midrad(mid(Xini5), ww*rad(Xini5))
XY= [Xnow Y]
[RelResXYnow, HighLevXYnow] = InfluencePlotXYtot (Xnow, Y)
for ii = 1: length(XY)
h = plot(HighLevXYnow(ii), RelResXYnow(ii), 'ob');
%text(HighLevXY(ii)-0.06, RelResXY(ii)-0.04, num2str(ii), 'Fontsize', 12);
set(h, 'markersize', 5)
set(h, 'color', [0 0 1])
end
%
end
% last
Xnow = midrad(mid(Xini5), ww*rad(Xini5))
XY= [Xnow Y]
[RelResXYnow, HighLevXYnow] = InfluencePlotXYtot (Xnow, Y)
for ii = 1: length(XY)
h = plot(HighLevXYnow(ii), RelResXYnow(ii), 'ob');
text(HighLevXYnow(ii)+0.04, RelResXYnow(ii), num2str(ii), 'Fontsize', 12);
set(h, 'markersize', 5)
set(h, 'color', [0 0 1])
end
%
Data_str = 'DataAllStream'
Type_str = 'StatusDiagram'
%
figure_name_out=strcat(Data_str,Type_str, '.png')
print('-dpng', '-r300', figure_name_out), pwd
% /Status Diagram
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

