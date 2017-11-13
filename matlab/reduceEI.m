function N=reduceEI(M)

%  Reduce an EI element represented by an integer matrix
%  ===Syntax===
%  N=reduceEI(M)
%  ===Description===
%  N=reduceEI(M) returns the matrix N£¬which represents the most simple EI element 
%  in EM equal to what is represented by M. The result is sorted in ascending order.
%  ===Examples===
%  M=[0,1,2,3,3,4; 0,0,3,2,5,4; 0,1,1,6, 7,4; 0,0,0,2,4,5]¡¯
%  M=
%      0	0	0	0
%      1	0	1	0
%      2	3	1	0
%      3	2	6	2
%      3	5	7	4
%      4	4	4	5
%  Where matrix M represents the EI element m1m2m3m3m4+m3m2m5m4+m1m1m6m7m4+m2m4m5.
%  N=reduceEI(M)
%  N=
%      0	0	0
%      0	1	1
%      2	2	4
%      4	3	6
%      5	4	7
%  Where matrix N represents the EI element m2m4m5+m1m2m3m4+m1m4m6m7
%  According to Definitions1,the EI elements represented by M and N are
%  equivalent.

if any(M(1,:))
    error('the first row of input matrix must be zeros.')
end

M=compactEI(M);
M=tran_bool(M);
Reserve_EI=reduceEI_bool(M);
N=tran_EI_mat(Reserve_EI);
return
