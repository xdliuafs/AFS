function N=tran_EI_mat(M)

%  Transform the Boolean value representations of the elements in EM into integer representations 
%  ===Syntax===
%  N=tran_EI_mat(M)
%  ===Description===
%  N=tran_EI_mat(M) returns an integer matrix ,which represents the same EI element as Boolean matrix M.
%  ===Examples===
%  M=[1 1 1 1 0 0 0; 0 1 1 1 1 0 0; 1 0 0 1 0 1 1; 0 1 0 1 1 0 0]¡¯
%  M=
%      1	0	1	0
%      1	1	0	1
%      1	1	0	0
%      1	1	1	1
%      0	1	0	1
%      0	0	1	0
%      0	0	1	0
%  N=tran_EI_mat(M)
%  N=
%      0	0	0	0
%      1	2	1	0
%      2	3	4	2
%      3	4	6	4
%      4	5	7	5
%  Where matrices M,N represent the same EI element m1m2m3m4+m2m3m4m5+m1m4m6m7+m2m4m5.

Set_M=1:size(M,1);
Repmat_Set_M=repmat(Set_M',1,size(M,2));
N=[zeros(1,size(M,2));Repmat_Set_M.*M];
N=compactEI(N);
return
