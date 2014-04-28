function [out, wzero] = singleSignTest( F )
%SINGLESIGNTEST( F )   Heuristic check to see if F changes sign.
% 
%   SINGLESIGNTEST( F ) returns 1 if the values of F on a tensor grid are of the
%   same sign.
%
%   [OUT, WZERO] = SINGLESIGNTEST( F ), returns WZERO = 1 if a zero has been
%   found. 
%
%   The algorithm works by sampling F on a tensor-grid and checking if
%   those values are of the same sign. This command is mainly for internal use
%   in CHEBFUN2 commands.
%
% See also ABS, SQRT, LOG. 

% Copyright 2013 by The University of Oxford and The Chebfun Developers. 
% See http://www.chebfun.org/ for Chebfun information.

out = false;                  % Assume false

X = chebpolyval2(F);          % Evaluate on a grid use FFTs. 
X = X(:);

if ( all( X >=0 ))            % If all values are nonnegative 
    out = true;  
elseif ( all( X <= 0))        % If all values are not positive
    out = true; 
end

wzero = any( X == 0 );        % Any exact zeros on the grid?

end