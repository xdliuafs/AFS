function f=EIcomult(M,N)

%  Find the conjunction of two E#I elements
%  Syntax
%  f=EIcomult(M, N)
%  Description
%  f=EIcomult(M, N) returns a matrix which is the conjunction of two E#I elements M, N .And the result is reduced by reducecoEI.
%  Examples
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
%  f=EIcomult(M,N)
%  f=
%      0	0	0	0
%      2	1	0	0
%      3	4	4	6
%      4	6	5	7
%  Where matrix f represents the E#I element x2x3x4+x1x4x6+x4x5+x6x7, 
%  which is the conjunction of two E#I elements M, N according to Definition 7 and formula (14). 

Bool_M=tran_bool(M);
Bool_N=tran_bool(N);

Bool_M=reduceEIco_bool(Bool_M);
Bool_N=reduceEIco_bool(Bool_N);

Bool_Msize=size(Bool_M);
Bool_Nsize=size(Bool_N);

Bool_M=[Bool_M;zeros(max(Bool_Msize(1),Bool_Nsize(1))-Bool_Msize(1),Bool_Msize(2))];
Bool_N=[Bool_N;zeros(max(Bool_Nsize(1),Bool_Msize(1))-Bool_Nsize(1),Bool_Nsize(2))];

T=Bool_Msize(2)-Bool_Nsize(2);
Logicor=[];
if  T>0
    for i=1:Bool_Nsize(2)
        RepNi=repmat(Bool_N(:,i),1,Bool_Msize(2));
        Logicor=[Logicor,and(RepNi,Bool_M)];
        Logicor=reduceEIco_bool(Logicor);
    end
else
    for i=1:Bool_Msize(2)
        RepMi=repmat(Bool_M(:,i),1,Bool_Nsize(2));
        Logicor=[Logicor,and(RepMi,Bool_N)];
        Logicor=reduceEIco_bool(Logicor);
    end
end
f=tran_EI_mat(Logicor);   
return
