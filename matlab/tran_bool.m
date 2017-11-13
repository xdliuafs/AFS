function N=tran_bool(M)

%  Transform the integer representations of the Elements in EM into Boolean value representation.
%  ===Syntax===
%  N=tran_bool(M)
%  ===Description===
%  N=tran_bool(M) returns the Boolean matrix N, which represents the same EI element as the integer matrix M.
%  ===Examples===
%  M=[0,1,2,3,3,4; 0,0,3,2,5,4; 0,1,1,6,7,4; 0,0,0,2,4,5]¡¯
%  M=
%      0	0	0	0
%      1	0	1	0
%      2	3	1	0
%      3	2	6	2
%      3	5	7	4
%      4	4	4	5
%  N=tran_bool(M)
%  N=
%      1	0	1	0
%      1	1	0	1
%      1	1	0	0
%      1	1	1	1
%      0	1	0	1
%      0	0	1	0
%      0	0	1	0
%  Where matrices M, N represent the same EI element m1m2m3m4+m2m3m4m5+m1m4m6m7+m2m4m5.

Num_Row=max(max(M));
Msize=size(M);
Receive=zeros(Num_Row,Msize(2));

for i=1:size(M,2)
     No_Zero_Row=find(M(:,i)~=0);
     No_Zero_Elem=M(No_Zero_Row,i);
     Receive(No_Zero_Elem ,i)=1;
end

N=Receive;
return
