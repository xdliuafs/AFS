function f=equal_EIco(M,N)

%  Judge the equivalence of two E#I elements
%  ===Syntax===
%  f=equal_EIco(M, N)
%  ===Description===
%  f=equal_EIco(M, N) returns a Boolean value to judge the equivalence of 
%  two E#I elements represented by matrices M,N. If the two E#I elements are equivalent, f=1, otherwise f=0.
%  ===Examples===
%  M=[0 1 4 7; 0 0 1 4; 0 2 5 5]¡¯
%  M=
%      0	0	0
%      1	0	2
%      4	1	5
%      7	4	5
%  N=[0 1 4 7; 0 2 5 5]¡¯ 
%  N=
%      0	0
%      1	2
%      4	5
%      7	5
%  f=equal_EIco(M,N)
%  f=1

if less_EIco(M,N)==1&less_EIco(N,M)==1
    f=1;
else
    f=0;
end
return