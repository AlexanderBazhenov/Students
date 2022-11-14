## Copyright (C) 2022 aspire
## Author: aspire <aspire@ASPIRE-ПК>
## Created: 2022-01-05

% Test data
% x1 = infsup(1,3), x2=infsup(2, 4)
% x1 = infsup(1,2), x2=infsup(3, 4)
% X = [infsup(9,10), infsup(10,11), infsup(11,12)]

function [out] = jaccardKRSet(X)
[x1cap, x2cap]=wedgeSet(X);
[x1cup, x2cup]=veeSet(X);
out=(x2cap-x1cap)/abs(x1cup-x2cup);
end
