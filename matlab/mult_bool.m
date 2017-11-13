function f=mult_bool(M,N,Logic_Ind)

%  Conjunction two Boolean matrices
%  ===Syntax===
%  f=mult_bool(M, N, Logic_Ind)
%  ===Description===
%  f=mult_bool(M, N, Logic_Ind) returns a matrix which is the conjunction of two Boolean matrices M, N. 
%  When the last argument: Logic_Ind=1, matrices M, N represent EI elements and the conjunction is obtained
%  according to formula (2); Logic_Ind=2, matrices M, N represent E#I elements and the conjunction is obtained 
%  according to formula (14).The result is not reduced.
%  ===Examples===
%  M=[1 1 1 1 0 0 0; 0 1 1 1 1 0 0; 1 0 0 1 0 1 1]¡¯
%  M=
%      1	0	1
%      1	1	0
%      1	1	0
%      1	1	1
%      0	1	0
%      0	0	1
%      0	0	1
%  N=[0 1 1 1 0 0; 1 0 0 1 1 1]¡¯
%  N=
%      0	1
%      1	0
%      1	0
%      1	1
%      0	1
%      0	1
%  f=mult_bool(M, N, 1)
%  f=
%      1	0	1	1	1	1
%      1	1	1	1	1	0
%      1	1	1	1	1	0
%      1	1	1	1	1	1
%      0	1	0	1	1	1
%      0	0	1	1	1	1
%      0	0	1	0	0	1

Msize=size(M);
Nsize=size(N);

M=[M;zeros(max(Msize(1),Nsize(1))-Msize(1),Msize(2))];
N=[N;zeros(max(Msize(1),Nsize(1))-Nsize(1),Nsize(2))];

T=Msize(2)-Nsize(2);
Logic=[];
if Logic_Ind==1
    if  T>=0
        for i=1:Nsize(2)
            RepNi=repmat(N(:,i),1,Msize(2));
            Logic=[Logic,or(RepNi,M)];
        end
    else
        for i=1:Msize(2)
            RepMi=repmat(M(:,i),1,Nsize(2));
            Logic=[Logic,or(RepMi,N)];
        end
    end
elseif Logic_Ind==2
    if  T>0
        for i=1:Nsize(2)
            RepNi=repmat(N(:,i),1,Msize(2));
            Logic=[Logic,and(RepNi,M)];
        end
    else
        for i=1:Msize(2)
            RepMi=repmat(M(:,i),1,Nsize(2));
            Logic=[Logic,and(RepMi,N)];
        end
    end
end
f=Logic;
return