function f=less_EI(M,N)

%  Judge if an EI element is less than the other
%  ===Syntax===
%  f=less_EI(M,N)
%  ===Description===
%  f=less_EI(M,N) returns a Boolean value to judge if an EI element represented by M
%  is less than the one represented by N. If M is less, f=1, otherwise f=0.
%  ===Examples===
%  M=[0 1 4 7; 0 2 5 5]¡¯
%  M=
%      0	0
%      1	2
%      4	5
%      7	5
%  N=[0 0 1 4; 0 2 5 5]¡¯
%  N=
%      0	0
%      0	2
%      1	5
%      4	5
%  f=less_EI(M,N)
%  f=1

Bool_M=tran_bool(M);
Bool_N=tran_bool(N);

Bool_M=reduceEI_bool(Bool_M);
Bool_N=reduceEI_bool(Bool_N);

Bool_Msize=size(Bool_M);
Bool_Nsize=size(Bool_N);

Size_Row=max(Bool_Msize(1),Bool_Nsize(1));
Bool_M=[Bool_M;zeros(Size_Row-Bool_Msize(1),Bool_Msize(2))];
Bool_N=[Bool_N;zeros(Size_Row-Bool_Nsize(1),Bool_Nsize(2))];

for i=1:Bool_Msize(2)
    Tran=repmat(Bool_M(:,i),1,Bool_Nsize(2));
    if (sum(Tran>=Bool_N,1)==Size_Row)==0
        f=0;
        break
    else
        f=1;
        continue
    end
end
return