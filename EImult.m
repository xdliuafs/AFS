function f=EImult(M,N)

%  Find the conjunction of two EI elements
%  Syntax
%  f=EImult(M,N)
%  Description
%  f=EImult(M,N) returns a matrix which represents the conjunction of two EI elements M, N .And the result is reduced by reduceEI
%  Examples
%  M=[0,1,2,3,3,4; 0,0,3,2,5,4; 0,1,1,6,7,4; 0,0,0,2,4,5]¡¯
%  M=
%     	0	0	0	0
%     	1	0	1	0
%     	2	3	1	0
%     	3	2	6	2
%     	3	5	7	4
%     	4	4	4	5
%  N=[0,0,2,2,3,4; 0,1,4,5,6,4; 0,0,0,7,6,6]¡¯
%  N=
%     	0	0	0
%     	0	1	0
%     	2	4	0
%     	2	5	7
%     	3	6	6
%     	4	4	6
%  f=EImult(M,N)
%  f=
%     	0	0	0	0	0
%     	0	0	0	2	1
%     	2	1	1	4	2
%     	3	2	4	5	4
%     	4	3	6	6	5
%     	5	4	7	7	6
%  Where matrix f represents the EI element m2m3m4m5 +m1m2m3m4+m1m4m6m7+m2m4m5m6m7 + m1m2m4m5m6,
%  which is the conjunction of two EI elements M, N according to formula (2).  

Bool_M=tran_bool(M);
Bool_N=tran_bool(N);

Bool_M=reduceEI_bool(Bool_M);
Bool_N=reduceEI_bool(Bool_N);

Bool_Msize=size(Bool_M);
Bool_Nsize=size(Bool_N);

Bool_M=[Bool_M;zeros(max(Bool_Msize(1),Bool_Nsize(1))-Bool_Msize(1),Bool_Msize(2))];
Bool_N=[Bool_N;zeros(max(Bool_Nsize(1),Bool_Msize(1))-Bool_Nsize(1),Bool_Nsize(2))];

T=Bool_Msize(2)-Bool_Nsize(2);
Logicor=[];
if  T>0
    for i=1:Bool_Nsize(2)
        RepNi=repmat(Bool_N(:,i),1,Bool_Msize(2));
        Logicor=[Logicor,or(RepNi,Bool_M)];
        Logicor=reduceEI_bool(Logicor);
    end
else
    for i=1:Bool_Msize(2)
        RepMi=repmat(Bool_M(:,i),1,Bool_Nsize(2));
        Logicor=[Logicor,or(RepMi,Bool_N)];
        Logicor=reduceEI_bool(Logicor);
    end
end
f=tran_EI_mat(Logicor);
return
