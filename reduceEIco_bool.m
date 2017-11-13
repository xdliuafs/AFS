function N=reduceEIco_bool(M)

%  Reduce an E#I element represented by a Boolean matrix
%  ===Syntax===
%  N=reduceEIco_bool(M)
%  ===Description===
%  N=reduceEIco_bool(M) returns the Boolean matrix N£¬which represents the most simple E#I element in E#X represented by Boolean matrix M. 
%  ===Examples===
%  M= [1 1 1 1 0 0 0; 0 1 1 1 1 0 0; 1 0 0 1 0 1 1; 0 1 0 1 1 0 0]¡¯
%  M=
%      1	0	1	0
%      1	1	0	1
%      1	1	0	0
%      1	1	1	1
%      0	1	0	1
%      0	0	1	0
%      0	0	1	0
%  N=reduceEIco_bool(N)
%  N=
%      1	0	1
%      1	1	0
%      1	1	0
%      1	1	1
%      0	1	0
%      0	0	1
%      0	0	1
%  Where matrices M,N represent the same E#I element x1x2x3x4+x2x3x4x5+x1x4x6x7.


Bool_Msize=size(M);
[Sum_Sort,Sum_Index]=sort(sum(M,1),'descend');
M=M(:,Sum_Index) ;
Reserve_EI=[];
if Bool_Msize(2)==1
   N=M;
else
    for i=1:Bool_Msize(1,2)
        if M(:,i)==0
            continue
        else
        Reserve_EI=[Reserve_EI,M(:,i)];
        Zero_Element=find(M(:,i)==0);
        Zero_Sum=sum(M(Zero_Element,:),1);
        Judge_EI=Zero_Sum==0;
        Del_EI=find(Judge_EI==1);
        M(:,Del_EI)=0;    
        end
    end
    N=Reserve_EI;
end
return
