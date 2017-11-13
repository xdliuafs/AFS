function N=reduceEIco(M)

%  Reduce an E#I element represented by an integer matrix
%  ===Syntax===
%  N=reduceEIco(M)
%  ===Description===
%  N=reduceEIco(M) returns the matrix N£¬which represents the most simple E#I element in E#X represented by M. The result is sorted in ascending order.
%  ====Examples===
%  M=[0,1,2,3,3,4; 0,0,3,2,5,4; 0,1,1,6, 7,4; 0,0,0,2,4,5]¡¯
%  M=
%      0	0	0	0
%      1	0	1	0
%      2	3	1	0
%      3	2	6	2
%      3	5	7	4
%      4	4	4	5
%  N=reduceEIco(M)
%  N=
%      0	0	0
%      1	2	1
%      2	3	4
%      3	4	6
%      4	5	7
%  Where matrices M, N represent the same E#I element x1x2x3x4+x2x3x4x5+x1x4x6x7.
%  According to Definitions7 and Proposition2, the E#I elements represented
%  by M and N are equivalent.

if any(M(1,:))
    error('the first row of input matrix must be zeros.')
end
M=compactEI(M);
M=tran_bool(M);
Reserve_EI=reduceEIco_bool(M);
N=tran_EI_mat(Reserve_EI);
return
