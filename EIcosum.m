function f=EIcosum(M,N)

%  Find the disjunction of two E#I elements
%  Syntax
%  f=EIcosum(M, N)
%  Description
%  f=EIcosum(M, N) returns a matrix which represents the disjunction of two E#I elements M,N. And the result is reduced by reduceEIco
%  Examples
%  M=[0,1,2,3,3,4; 0,0,3,2,5,4; 0,1,1,6, 7,4; 0,0,0,2,4,5]¡¯
%  M=
%      0	0	0	0
%      1	0	1	0
%      2	3	1	0
%      3	2	6	2
%      3	5	7	4
%      4	4	4	5
%  N=[0,0,2,2,3,4; 0,1,4,5,6,4; 0,0,0,7,6,6]¡¯
%  N=
%      0	0	0
%      0	1	0
%      2	4	0
%      2	5	7
%      3	6	6
%      4	4	6
%  f=EIcosum(M,N)
%  f=
%      0	0	0	0
%      1	2	1	1
%      2	3	4	4
%      3	4	6	5
%      4	5	7	6
%  Where matrix f represents the E#I element x1x2x3x4+x2x3x4x5+x1x4x6x7+x1x4x5x6 ,
%  which is the disjunction of two E#I elements M, N according to Definition7 and formula (13) .  

f=reduceEIco([[zeros(max(size(M,1),size(N,1))-size(M,1),size(M,2));M],[zeros(max(size(M,1),size(N,1))-size(N,1),size(N,2));N]]);
return