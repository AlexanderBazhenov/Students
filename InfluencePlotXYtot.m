% Created: 2022-07-21
function [RelResXY, HighLevXY] = InfluencePlotXYtot (X, Y)
% 2022-07-21
XY = [X' Y'];
[minXY, maxXY] = wedgeSet(XY);
midXY = ( maxXY + minXY ) / 2;
radXY = ( maxXY - minXY ) / 2;
% Metrics
for ii=1:length(XY)
  datanow = XY(ii);
  RelResXY(ii) = ( mid(datanow ) -  midXY ) / rad(datanow );
end
for ii=1:length(XY)
  datanow = XY(ii);
  HighLevXY(ii) = radXY  / rad(datanow );
end


% /Metrics
endfunction
