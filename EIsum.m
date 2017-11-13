function f=EIsum(M,N)

%  Find the disjunction of two EI elements
%  ===Syntax===
%  f=EIsum(M,N)
%  ===Description===
%  f=EIsum(M,N) returns a matrix which represents the disjunction of two EI elements M, N. And the result is reduced by reduceEI.
%  ===Examples===
%  M=[0,1,2,3,3,4; 0,0,3,2,5,4; 0,1,1,6,7,4; 0,0,0,2,4,5]¡¯
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
%  f=EIsum(M,N)
%  f=
%      0	0	0	0
%      0	0	0	1
%      0	2	2	4
%      6	4	3	5
%      7	5	4	6
%  Where matrix f represents the EI element m6m7+m2m4m5 +m2m3m4 + m1m4m5m6, 
%  which is the disjunction of two EI elements M, N according to formula (1).

Msize=size(M);
Nsize=size(N);
f=reduceEI([[zeros(max(Msize(1),Nsize(1))-Msize(1),Msize(2));M],[zeros(max(Msize(1),Nsize(1))-Nsize(1),Nsize(2));N]]);
return