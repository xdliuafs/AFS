function f=equal_EI(M,N)

%  Judge the equivalence of two EI elements
%  ===Syntax===
%  f=equal_EI(M,N)
%  ===Description===
%  f=equal_EI(M,N) returns a Boolean value to judge the equivalence of
%  two EI elements represented by matrices M,N. If the two EI elements are equivalent, f=1, otherwise f=0.
%  ===Examples===
%  M=[0 1 4 7; 0 0 1 4; 0 2 5 5]¡¯
%  M=
%      0	0	0
%      1	0	2
%      4	1	5
%      7	4	5
%  N=[0 0 1 4; 0 2 5 5]¡¯
%  N=
%      0	0
%      0	2
%      1	5
%      4	5
%  f=equal_EI(M,N)
%  f=1

if less_EI(M,N)==1&less_EI(N,M)==1
    f=1;
else
    f=0;
end
return