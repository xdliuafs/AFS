function f=EIIsum(M,N)

%  Find the disjunction of two EII elements
%  ===Syntax===
%  f=EIIsum(M,N)
%  ===Description===
%  f=EIIsum(M,N) returns a matrix which represents the disjunction of two EII elements M,N. And the result is reduced by reduceEII.
%  ===Examples===
%  M=[0 1 2 3 4 0 4; 0 2 3 4 5 0 5]¡¯
%  M=
%     	0	0
%     	1	0
%     	2	2
%     	3	3
%     	0	0
%     	0	4
%     	4	5
%     	3	3
%  N=[0 1 2 3 0 0 3 4; 0 0 2 3 0 3 4 5; 0 0 1 3 0 3 4 7]¡¯
%  N=
%     	0	0	0
%     	1	0	0
%     	2	2	1
%     	3	3	3
%     	0	0	0
%     	0	3	3
%     	3	4	4
%     	4	5	7
%  f=EIIsum(M,N)
%  f=
%     	0	0
%     	2	1
%     	3	3
%     	0	0
%     	3	3
%     	4	4
%     	5	7
%  Where matrix f represents the EII element {x3, x4, x5}{m2, m3}+{x3, x4, x7}{m1, m3},
%  which is disjunction of two EII elements M,N according to the formula (7). 

M=reduceEII(M);
N=reduceEII(N);

M_EI_Num=find(sum(M,2)==0);
N_EI_Num=find(sum(N,2)==0);

M_EI_Elem=M(1:M_EI_Num(2)-1,:);
N_EI_Elem=N(1:N_EI_Num(2)-1,:);
M_Simple=M(M_EI_Num(2):end,:);
N_Simple=N(N_EI_Num(2):end,:);

M_EI_Elem_Size=size(M_EI_Elem);
N_EI_Elem_Size=size(N_EI_Elem);
M_Simple_Size=size(M_Simple);
N_Simple_Size=size(N_Simple);

EI_Elem=[[zeros(max(M_EI_Elem_Size(1),N_EI_Elem_Size(1))-M_EI_Elem_Size(1),M_EI_Elem_Size(2));M_EI_Elem],[zeros(max(M_EI_Elem_Size(1),N_EI_Elem_Size(1))-N_EI_Elem_Size(1),N_EI_Elem_Size(2));N_EI_Elem]];
Simple=[[zeros(max(M_Simple_Size(1),N_Simple_Size(1))-M_Simple_Size(1),M_Simple_Size(2));M_Simple],[zeros(max(M_Simple_Size(1),N_Simple_Size(1))-N_Simple_Size(1),N_Simple_Size(2));N_Simple]];
f=reduceEII([EI_Elem;Simple]);
return