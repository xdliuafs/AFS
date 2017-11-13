function N=reduceEI_bool(M)

%  Reduce a element in EM represented by a Boolean matrix.
%  Syntax
%  N=reduceEI_bool(M)
%  Description
%  N=reduceEI_bool(M) returns the Boolean matrix N£¬which is the most simple form of the element in EM represented by M. 
%  Examples
%  M= [1 1 1 1 0 0 0; 0 1 1 1 1 0 0; 1 0 0 1 0 1 1; 0 1 0 1 1 0 0]¡¯
%  M=
%      1	0	1	0
%      1	1	0	1
%      1	1	0	0
%      1	1	1	1
%      0	1	0	1
%      0	0	1	0
%      0	0	1	0
%  N=reduceEI_bool(N)
%  N=
%      0	1	1
%      1	1	0
%      0	1	0
%      1	1	1
%      1	0	0
%      0	0	1
%      0	0	1
%  Where matrix N represents an EI element m2m4m5+m1m2m3m4+m1m4m6m7.

Bool_Msize=size(M);
[Sum_Sort,Sum_Index]=sort(sum(M,1));

if Sum_Sort(1)==0
    N=0;
else
    M=M(:,Sum_Index); 
    Reserve_EI=[];
    if Bool_Msize(2)==1
       N=M;
    else
        for i=1:Bool_Msize(1,2)
            if M(:,i)==0
                continue
            else
            Reserve_EI=[Reserve_EI,M(:,i)];
            Nnz_Element=find(M(:,i)~=0);
            Nnz_Sum=sum(M(Nnz_Element,:),1);
            Judge_EI=Nnz_Sum==Sum_Sort(i);
            Del_EI=find(Judge_EI==1);
            M(:,Del_EI)=0;    
            end
        end
        N=Reserve_EI;
    end
end
return
