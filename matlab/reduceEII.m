function N=reduceEII(M)

%  Reduce an EII element 
%  Syntax
%  N=reduceEII(M) 
%  Description
%  N=reduceEII(M) returns the matrix N£¬which is the most simple form of the EII element represented by M.
%  Examples
%  M=[0,1,2,3,3,4,0,3,3,4; 0,0,3,2,5,4,0,0,2,5; 0,1,1,6,7,4,0,1,4,7; 0,0,0,2,4,5,0,1,2,5]¡¯
%  M=
%      0	0	0	0
%      1	0	1	0
%      2	3	1	0
%      3	2	6	2
%      3	5	7	4
%      4	4	4	5
%      0	0	0	0
%      3	0	1	1
%      3	2	4	2
%      4	5	7	5
%  N=reduceEII(M)
%  N=
%      0	0	0
%      0	1	1
%      2	2	4
%      4	3	6
%      5	4	7
%      0	0	0
%      1	0	1
%      2	3	4
%      5	4	7
%  Where matrices M,N represent the same EII element {x1, x2, x5}{m2, m4, m5}+{x3, x4}{m1, m2, m3, m4}+{x1, x4, x7}{m1, m4, m6, m7}.
%  According to Definitions 5, the EII elements represented by M and N are equivalent.

if any(M(1,:))
    error('the first row of input matrix must be zeros.')
end

M=compactEII(M);

if size(M,2)==1
    N=M;
else
    Num_EI_Elem=find(sum(M,2)==0);
    Bool_EI_Elem=tran_bool(M(1:Num_EI_Elem(2)-1,:));
    Bool_EI_Elem_Size=size(Bool_EI_Elem);
    [Sum_Sort,Sum_Index]=sort(sum(Bool_EI_Elem,1));
    if Sum_Sort(1)==0
        N=M(:,Sum_Index(1));
    else
        Bool_EI_Elem=Bool_EI_Elem(:,Sum_Index); 
        Simple=M(Num_EI_Elem(2):end,Sum_Index);
        Reserve_EI=[];
        Reduced_Simple=[];
        for i=1:Bool_EI_Elem_Size(1,2)
            if (Bool_EI_Elem(:,i)==0)
                continue
            else
            Reserve_EI=[Reserve_EI,Bool_EI_Elem(:,i)];
            Reduced_Simple=[Reduced_Simple,Simple(:,i)];
            Nnz_Element=find(Bool_EI_Elem(:,i)~=0);
            Nnz_Sum=sum(Bool_EI_Elem(Nnz_Element,:),1);
            Judge_EI=Nnz_Sum==Sum_Sort(i);
            Del_EI=find(Judge_EI==1);
            Bool_EI_Elem(:,Del_EI)=0;    
            end
        end
        N=[tran_EI_mat(Reserve_EI);Reduced_Simple];
    end
end
return