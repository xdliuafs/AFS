function N=compactEI(M)

%  Compact an EI element.
%  ===Syntax===
%  N=compactEI(M) 
%  ===Description===
%  N=compactEI(M) returns a matrix N, which represents an EI element in EM equal to 
%  what is represented by M. The numbers of rows of N are the least of all matrices
%  which represent the same EI element as M. Each column of N is sorted in ascending order.
%  N=compactEI(M) returns a matrix N, which represents an EI element in EM equal to what is 
%  represented by M. The numbers of rows of N are the least of all matrices which represent 
%  the same EI element as M. Each column of N is sorted in ascending order.
%  ===Examples===
%   M=[0,1,2,3,3,4,0,3,3,4; 0,0,3,2,5,4,0,0,2,5; 0,1,1,6,7,4,0,1,4,7; 0,0,0,2,4,5,0,1,2,5]¡¯
%   M=
%   	0	0	0	0
%       1	0	1	0
%       2	3	1	0
%       3	2	6	2
%       3	5	7	4
%       4	4	4	5
%       0	0	0	0
%       3	0	1	1
%       3	2	4	2
%       4	5	7	5
%  N=compactEII(M)
%  N=
%   	0	0	0	0
%   	1	2	1	0
%   	2	3	4	2
%   	3	4	6	4
%   	4	5	7	5
%   	0	0	0	0
%   	0	0	1	1
%   	3	2	4	2
%   	4	5	7	5
%  Where matrix N represents the EII element 
%  {x3, x4}{m1, m2, m3, m4}+{x2, x5}{m2, m3, m4, m5}+{x1, x4, x7}{m1, m4, m6, m7}+{x1, x2, x5}{m2, m4, m5}.

if any(M(1,:))
    error('the first row of input matrix must be zeros.')
end

Msize=size(M);
M=sort(M);
Max_Num_Column=0;

for i=1:Msize(1,2)
    Comp=unique(M(:,i));
    Csize=nnz(Comp);
    Max_Num_Column=max(Max_Num_Column,Csize(1));
    M(:,i)=[zeros((Msize(1,1)-Csize(1,1)),1);Comp(2:end)];
end

N=M((Msize(1)-Max_Num_Column):end,:);
return
