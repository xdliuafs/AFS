function N=compactEII(M)

% Compact an EII element
% ===Syntax===
% N=compactEII(M) 
% ===Description===
% N=compactEII(M) returns a matrix N, which represents an EII element in EXM equal to 
% what is represented by M. The numbers of rows of N are the least of all matrices 
% which represent the same EII element as M.
% ===Examples===
% M=[0,1,2,3,3,4,0,3,3,4; 0,0,3,2,5,4,0,0,2,5; 0,1,1,6,7,4,0,1,4,7; 0,0,0,2,4,5,0,1,2,5]¡¯
% M=
%   	0	0	0	0
%   	1	0	1	0
%   	2	3	1	0
%   	3	2	6	2
%   	3	5	7	4
%   	4	4	4	5
%   	0	0	0	0
%   	3	0	1	1
%   	3	2	4	2
%   	4	5	7	5
% N=compactEII(M)
% N=
%   	0	0	0	0
%   	1	2	1	0
%   	2	3	4	2
%   	3	4	6	4
%   	4	5	7	5
%   	0	0	0	0
%   	0	0	1	1
%   	3	2	4	2
%   	4	5	7	5
% Where matrix N represents the EII element
% {x3, x4}{m1, m2, m3, m4}+{x2, x5}{m2, m3, m4, m5}+{x1, x4, x7}{m1, m4, m6, m7}+{x1, x2, x5}{m2, m4, m5}.

Msize=size(M);
k=0;

for i=1:Msize(1)
    if (sum(M(i,:))~=0)
        break
    end
    k=k+1;
end

if k==0
    error('the first row of input matrix must be zeros.')
end

Mat=M(k:end,:);
EI_Num=find(sum(Mat,2)==0);

if size(EI_Num,1)==1
    error('the concept represented by input matrix must be a EII element.')
end

EI_Elem=Mat(1:EI_Num(2)-1,:);
Simple=Mat(EI_Num(2):end,:);  
N=[compactEI(EI_Elem);compactEI(Simple)];
return