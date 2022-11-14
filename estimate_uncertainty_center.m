function [oskorbin_center, k] = estimate_uncertainty_center(intervals)
  n = numel(intervals);
  y = mid(intervals);
  e = rad(intervals);
  A = [ones(n,1), -e; -ones(n,1), -e];
  b = [y; -y];  
  c = [0 1];
  lb = [-Inf 0];
  ub = [Inf Inf];  
  ctype(1:2*n) = 'U'; 
  vartype(1:2) = 'C';
  sense = 1;
  [beta, fval, exitcode] = glpk (c, A, b, lb, ub, ctype, vartype, sense);
  if exitcode < 0
      return
  end   
  oskorbin_center = beta(1);
  k = beta(2);
end