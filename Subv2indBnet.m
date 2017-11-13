function index = Subv2indBnet(siz,sub)
%SUBV2IND   Linear index from subscript vector.
% SUBV2IND(SIZ,SUB) returns an equivalent single index corresponding to a
% subscript vector for an array of size SIZ.
% If SUB is a matrix, with subscript vectors as rows, then the result is a 
% column vector.
%
% This is the opposite of IND2SUBV, so that
%   SUBV2IND(SIZ,IND2SUBV(SIZ,IND)) == IND.
%begin my comments
%  ind2subv([2,2],subv2ind([2 2],[1 2 1 2;2 1 1 2 ]'))=[1 2 1 2;2 1 1 2 ]'
%  subv2ind([2,2],ind2subv([2,2],subv2ind([2 2],[1 2 1 2;2 1 1 2 ]')))
% =subv2ind([2 2],[1 2 1 2;2 1 1 2 ]')
%end my comments
% See also IND2SUBV, SUB2IND.

%index = subv2indTest(siz,sub);
prev_cum_size = [1 cumprod(siz(1:end-1))];
 % cumprod([i1,i2,...,ik])=[i1,i1*i2,...,i1*i2*...ik]
%index = (sub-1)*prev_cum_size' + 1;
index = sub*prev_cum_size' - sum(prev_cum_size) + 1;
% sub=[sub1,sub2,...,subl], l=length(siz). size=[i1,i2,...,il]
% index =
% sub1+i1*sub2+...+i1*i2*...i(l-1)*subl-(1+i1+i1*i2+...+i1*i2*...i(l-1))+1

