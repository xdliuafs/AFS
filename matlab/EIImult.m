function f=EIImult(M,N)
%  Find the conjunction of two EII elements
%  Syntax
%  f=EIImult(M,N)
%  Description
%  f=EIImult(M,N) returns a matrix which is the conjunction of two EII elements M, N .And the result is reduced by reduceEII.
%  Examples
%  M=[0 1 2 3 4 0 4; 0 2 3 4 5 0 5]¡¯
%  M=
%      0	0
%      1	2
%      2	3
%      3	4
%      4	5
%      0	0
%      4	5
%  N=[0 1 2 3 0 0 3 4; 0 0 2 3 0 3 4 5; 0 0 1 3 0 3 4 7]¡¯
%  N=
%      0	0	0
%      1	0	0
%      2	2	1
%      3	3	3
%      0	0	0
%      0	3	3
%      3	4	4
%      4	5	7
%  f=EIImult(M,N)
%  f=
%      0	0
%      1	2
%      2	3
%      3	4
%      4	5
%      0	0
%      4	5
%  Where matrix f represents the EII element {x4}{m1, m2, m3, m4}+{x5}{m2, m3, m4, m5},
%  which is conjunction of two EII elements M,N according to formula (8).

M=reduceEII(M);
N=reduceEII(N);

M_EI_Num=find(sum(M,2)==0);
N_EI_Num=find(sum(N,2)==0);

M_EI_Elem=M(1:M_EI_Num(2)-1,:);
M_Simple=M(M_EI_Num(2):end,:);
N_EI_Elem=N(1:N_EI_Num(2)-1,:);
N_Simple=N(N_EI_Num(2):end,:);

Bool_M_EI_Elem=tran_bool(M_EI_Elem);
Bool_N_EI_Elem=tran_bool(N_EI_Elem);
Bool_M_Simple=tran_bool(M_Simple);
Bool_N_Simple=tran_bool(N_Simple);

Logic_Elem=mult_bool(Bool_M_EI_Elem,Bool_N_EI_Elem,1);
Logic_Simple=mult_bool(Bool_M_Simple,Bool_N_Simple,2);
f=reduceEII([tran_EI_mat(Logic_Elem);tran_EI_mat(Logic_Simple)]);  
return
